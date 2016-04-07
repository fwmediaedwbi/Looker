- view: fact_email_ct

  derived_table:
    sql_trigger_value: SELECT FLOOR((EXTRACT(epoch from GETDATE()) - 60*60*9)/(60*60*24))
    distkey: job_id
    sortkeys: [sent_dt, bu_id, job_id]
    sql: |
      SELECT bu_id
        , job_id
        , DATE_TRUNC('d', sent_dt) as sent_dt
        , COUNT(sent_dt) AS sent_count
        , COUNT(opens_dt) AS open_count
        , COUNT(clicks_dt) AS click_count
        , COUNT(unsubscribe_dt) AS unsubscribe_count
        , COUNT(complaints_dt) AS complaint_count
      FROM fw.email
      GROUP BY 1, 2, 3

  fields:

    - dimension: bu_id
      type: number
      sql: ${TABLE}.bu_id
      hidden: true
    
    - dimension: job_id
      type: number
      sql: ${TABLE}.job_id
      hidden: true
    
    - dimension_group: sent
      type: time
      timeframes: [date, week, month, hour_of_day]
      sql: ${TABLE}.sent_dt
      hidden: true
    
    - dimension: job_sent_count
      type: number
      sql: ${TABLE}.sent_count
    
    - dimension: job_open_count
      type: number
      sql: ${TABLE}.open_count
    
    - dimension: job_click_count
      type: number
      sql: ${TABLE}.click_count
    
    - dimension: job_unsubscribe_count
      type: number
      sql: ${TABLE}.unsubscribe_count
    
    - dimension: job_complaint_count
      type: number
      sql: ${TABLE}.complaint_count



    - measure: total_sent
      type: sum
      sql: ${job_sent_count}
    
    - measure: total_opened
      type: sum
      sql: ${job_open_count}
    
    - measure: total_clicks
      type: sum
      sql: ${job_click_count}
    
    - measure: total_unsubscribed
      type: sum
      sql: ${job_unsubscribe_count}
    
    - measure: total_complaints
      type: sum
      sql: ${job_complaint_count}
    
    - measure: open_rate
      type: number
      sql: 1.0 * ${total_opened}/NULLIF(${total_sent},0)
      value_format: '0.00%'
    
    - measure: click_rate
      type: number
      sql: 1.0 * ${total_clicks}/NULLIF(${total_opened},0)
      value_format: '0.00%'
    
    - measure: unsubscribe_rate
      type: number
      sql: 1.0 * ${total_unsubscribed}/NULLIF(${total_sent},0)
      value_format: '0.00%'
    
    - measure: complaint_rate
      type: number
      sql: 1.0 * ${total_complaints}/NULLIF(${total_sent},0)
      value_format: '0.00%'

