- view: email
  sql_table_name: email
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
    label: "Email Sent Filter"
    type: time
    timeframes: [date, hour_of_day]
    sql: ${TABLE}.sent_dt
    view_label: "Dates"
    
  - dimension_group: event_open
    type: time
    timeframes: [date, week, month, hour_of_day]
    sql: ${TABLE}.opens_dt
    view_label: "Dates"

  - dimension_group: event_click
    type: time
    timeframes: [date, week, month, hour_of_day]
    sql: ${TABLE}.clicks_dt
    view_label: "Dates"
    
  - dimension_group: event_complaint
    type: time
    timeframes: [date, week, month, hour_of_day]
    sql: ${TABLE}.complaints_dt
    view_label: "Dates"
    
  - dimension_group: event_unsubscribe
    type: time
    timeframes: [date, week, month, hour_of_day]
    sql: ${TABLE}.unsubscribe_dt
    view_label: "Dates"
    
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
  
  - dimension: opened_first_day
    type: yesno
    sql: CASE WHEN ${TABLE}.opens_dt < DATEADD(day,1,${TABLE}.sent_dt) THEN TRUE ELSE FALSE END
    hidden: true

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



#### Open Rate Changes ####
  - measure: total_sent_yesterday
    description: "Total emails sent for the last complete day"
    view_label: "Open Rate Daily Change"
    type: count
    filters:
      event_sent_date: '1 day ago'
  
  - measure: total_opened_yesterday
    description: "Total emails opened in the first 24 hrs for emails sent the last complete day"
    view_label: "Open Rate Daily Change"
    type: sum
    sql: CASE WHEN ${TABLE}.opens_dt IS NULL THEN 0 ELSE 1 END
    filters:
      event_sent_date: '1 day ago'
      opened_first_day: 'yes'
  
  - measure: open_rate_yesterday
    description: "= total emails opened / total emails sent"
    view_label: "Open Rate Daily Change"
    type: number
    sql: 1.0 * ${total_opened_yesterday}/NULLIF(${total_sent_yesterday},0)
    value_format: '0.00%'
  
  
  - measure: total_sent_previous_day
    description: "Total emails sent two days ago"
    view_label: "Open Rate Daily Change"
    type: count
    filters:
      event_sent_date: '2 days ago'
  
  - measure: total_opened_previous_day
    description: "Total emails opened in the first 24 hrs for emails sent two days ago"
    view_label: "Open Rate Daily Change"
    type: sum
    sql: CASE WHEN ${TABLE}.opens_dt IS NULL THEN 0 ELSE 1 END
    filters:
      event_sent_date: '2 days ago'
      opened_first_day: 'yes'
  
  - measure: open_rate_previous_day
    description: "= total emails opened / total emails sent"
    view_label: "Open Rate Daily Change"
    type: number
    sql: 1.0 * ${total_opened_previous_day}/NULLIF(${total_sent_previous_day},0)
    value_format: '0.00%'
    
  
  - measure: open_rate_change
    description: "= (yesterday's rate - previous day's rate) / previous day's rate)"
    view_label: "Open Rate Daily Change"
    type: number
    sql: (${open_rate_yesterday} - ${open_rate_previous_day}) / NULLIF(${open_rate_previous_day},0)
    value_format: '0.00%'


