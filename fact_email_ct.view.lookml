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
        , COUNT(clicks_dt) AS clicks_count
        , COUNT(unsubscribe_dt) AS unsubscribe_count
        , COUNT(complaints_dt) AS complaints_count
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
    
    - dimension: job_clicks_count
      type: number
      sql: ${TABLE}.clicks_count
    
    - dimension: job_unsubscribe_count
      type: number
      sql: ${TABLE}.unsubscribe_count
    
    - dimension: job_complaints_count
      type: number
      sql: ${TABLE}.complaints_count



    - measure: total_sent
      type: sum
      sql: ${job_sent_count}
    
    - measure: total_open
      type: sum
      sql: ${job_open_count}
    
    - measure: total_clicks
      type: sum
      sql: ${job_clicks_count}
    
    - measure: total_unsubscribe
      type: sum
      sql: ${job_unsubscribe_count}
    
    - measure: total_complaints
      type: sum
      sql: ${job_complaints_count}
    
    - measure: open_rate
      type: number
      sql: 1.0 * ${total_open}/NULLIF(${total_sent},0)
      value_format: '0.00%'
    
    - measure: clicks_rate
      type: number
      sql: 1.0 * ${total_clicks}/NULLIF(${total_open},0)
      value_format: '0.00%'
    
    - measure: unsubscribe_rate
      type: number
      sql: 1.0 * ${total_unsubscribe}/NULLIF(${total_sent},0)
      value_format: '0.00%'
    
    - measure: complaints_rate
      type: number
      sql: 1.0 * ${total_complaints}/NULLIF(${total_sent},0)
      value_format: '0.00%'

