- view: unsubscribe
  sql_table_name: fw.unsubscribe
  fields:

  - dimension: unsubscribe_id
    primary_key: true
    type: number
    sql: ${TABLE}.unsubscribe_id

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

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - unsubscribe_id
    - bu.bu_name
    - bu.bu_id
    - jobs.from_name
    - jobs.email_name
    - jobs.job_id