- view: jobs
  sql_table_name: fw.jobs
  fields:

  - dimension: job_id
    primary_key: true
    type: number
    sql: ${TABLE}.job_id

  - dimension: bu
    type: string
    sql: ${TABLE}.bu
    hidden: true

  - dimension: bu_id
    type: number
    hidden: true
    sql: ${TABLE}.bu_id

  - dimension: email_id
    type: number
    sql: ${TABLE}.email_id

  - dimension: email_name
    type: string
    sql: ${TABLE}.email_name

  - dimension: email_subject
    type: string
    sql: ${TABLE}.email_subject

  - dimension_group: event_dt
    label: 'Event'
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.event_dt
    hidden: true

  - dimension: event_id
    type: number
    sql: ${TABLE}.event_id
    hidden: true

  - dimension: from_email
    type: string
    sql: ${TABLE}.from_email

  - dimension: from_name
    type: string
    sql: ${TABLE}.from_name

  - dimension: send_type
    type: string
    sql: ${TABLE}.send_type


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - job_id
    - from_name
    - email_name
    - bu.bu_name
    - bu.bu_id
    - clicks.count
    - complaints.count
    - opens.count
    - sent.count
    - unsubscribe.count