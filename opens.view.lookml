- view: opens
  sql_table_name: fw.opens
  fields:

  - dimension: uid
    type: number
    sql: CONCAT(${TABLE}.job_id,${TABLE}.subscriber_id)
    primary_key: true
    hidden: true

  - dimension: bu
    type: string
    sql: ${TABLE}.bu

  - dimension: bu_id
    type: number
    # hidden: true
    sql: ${TABLE}.bu_id

  - dimension: domain
    type: string
    sql: ${TABLE}.domain

  - dimension_group: event_dt
    label: 'Event'
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.event_dt

  - dimension: is_unique
    type: yesno
    sql: ${TABLE}.is_unique

  - dimension: job_id
    type: number
    # hidden: true
    sql: ${TABLE}.job_id

  - dimension: subscriber_id
    type: number
    sql: ${TABLE}.subscriber_id

  - dimension: subscriber_key
    type: string
    sql: ${TABLE}.subscriber_key

  - dimension: triggered_send_customer_key
    type: string
    sql: ${TABLE}.triggered_send_customer_key

  - dimension: triggered_send_definition_object_id
    type: string
    sql: ${TABLE}.triggered_send_definition_object_id

  - measure: count
    type: count
    drill_fields: [bu.bu_name, bu.bu_id, jobs.from_name, jobs.email_name, jobs.job_id]