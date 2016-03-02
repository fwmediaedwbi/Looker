- view: email
  sql_table_name: fw.email
  fields:

### Table IDS
  - dimension: bu_id
    type: number
    hidden: true
    sql: ${TABLE}.bu_id
    
  - dimension: job_id
    type: number
    # hidden: true
    sql: ${TABLE}.job_id
    
  - dimension: subscriber_id
    type: number
    sql: ${TABLE}.subscriber_id
    
### Timestamps

  - dimension_group: event_sent
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.sent_dt
    
  - dimension_group: event_open
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.opens_dt

  - dimension_group: event_click
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.clicks_dt
    
  - dimension_group: event_complaint
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.complaints_dt
    
  - dimension_group: event_unsubscribe
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.unsubscribe_dt
    
### Other dimensions


  - dimension: email_domain
    type: string
    sql: ${TABLE}.email_domain

  - dimension: clicks_link_content
    type: string
    sql: ${TABLE}.clicks_link_content

  - dimension: clicks_customer_key
    type: string
    sql: ${TABLE}.clicks_triggered_send_customer_key

  - dimension: clicks_definition_object_id
    type: string
    sql: ${TABLE}.clicks_triggered_send_definition_object_id
    
  - dimension: subscriber_key
    type: string
    sql: ${TABLE}.subscriber_key
    
  - dimension: opens_customer_key
    type: string
    sql: ${TABLE}.opens_triggered_send_customer_key

  - dimension: opens_definition_object_id
    type: string
    sql: ${TABLE}.opens_triggered_send_definition_object_id

### DB relevant fields

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_at
    hidden: true

  - dimension_group: modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.modified_at
    hidden: true

### MEASURES

  - measure: sents
    type: count
    
  - measure: opens
    type: sum
    sql: CASE WHEN ${TABLE}.opens_dt IS NULL THEN 0 ELSE 1 END
    
  - measure: clicks
    type: sum
    sql: CASE WHEN ${TABLE}.clicks_dt IS NULL THEN 0 ELSE 1 END
    
  - measure: complaints
    type: sum
    sql: CASE WHEN ${TABLE}.complaints_dt IS NULL THEN 0 ELSE 1 END
    
  - measure: unsubscribes
    type: sum
    sql: CASE WHEN ${TABLE}.unsubscribe_dt IS NULL THEN 0 ELSE 1 END
    
  - measure: open_rate
    type: number
    sql: 1.0 * ${opens}/NULLIF(${sents},0)
    value_format: '0.00%'
    description: "Count of opens over count of sents."
    
  - measure: click_rate
    type: number
    sql: 1.0 * ${clicks}/NULLIF(${opens},0)
    value_format: '0.00%'
    description: "Count of clicks over count of opens."
    
  - measure: complain_rate
    type: number
    sql: 1.0 * ${complaints}/NULLIF(${sents},0)
    value_format: '0.00%'
    description: "Count of complaints over count of sents."
    
  - measure: unsubscribe_rate
    type: number
    sql: 1.0 * ${unsubscribes}/NULLIF(${sents},0)
    value_format: '0.00%'
    description: "Count of unsubscribes over count of sents."

