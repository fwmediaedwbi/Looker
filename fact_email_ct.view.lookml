- view: fact_email_ct

  derived_table:
    sql_trigger_value: SELECT FLOOR((EXTRACT(epoch from GETDATE()) - 60*60*9)/(60*60*24))
    distkey: job_id
    sortkeys: [sent_dt, bu_id, job_id]
    sql: |
      SELECT bu_id
        , job_id
        , MAX(sent_dt) as sent_dt
        , COUNT(sent_dt) AS sent_count
        , COUNT(opens_dt) AS open_count
        , COUNT(clicks_dt) AS clicks_count
        , COUNT(unsubscribe_dt) AS unsubscribe_count
        , COUNT(complaints_dt) AS complaints_count
      FROM fw.email
      GROUP BY bu_id, job_id

  fields:

    - dimension: bu_id
      type: number
      sql: ${TABLE}.bu_id
    
    - dimension: job_id
      type: number
      sql: ${TABLE}.job_id
    
    - dimension_group: sent
      type: time
      timeframes: [date, week, month, hour_of_day]
      sql: ${TABLE}.sent_dt
    
    - dimension: sent_count
      type: number
      sql: ${TABLE}.sent_count
    
    - dimension: open_count
      type: number
      sql: ${TABLE}.open_count
    
    - dimension: clicks_count
      type: number
      sql: ${TABLE}.clicks_count
    
    - dimension: unsubscribe_count
      type: number
      sql: ${TABLE}.unsubscribe_count
    
    - dimension: complaints_count
      type: number
      sql: ${TABLE}.complaints_count
    
