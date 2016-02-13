- view: sent
  sql_table_name: fw.sent
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

  - dimension: job_id
    type: number
    # hidden: true
    sql: ${TABLE}.job_id

  - dimension: subscriber_id
    type: string
    sql: ${TABLE}.subscriber_id

  - dimension: subscriber_key
    type: string
    sql: ${TABLE}.subscriber_key

  - measure: count
    type: count
    drill_fields: [bu.bu_name, bu.bu_id, jobs.from_name, jobs.email_name, jobs.job_id]
    
  - measure: open_rate
    type: number
    sql: 1.0 * ${opens.count}/NULLIF(${count},0)
    value_format: '0.00%'
    description: "Count of opens over count of sents."
    
    
  - measure: click_rate
    type: number
    sql: 1.0 * ${clicks.count}/NULLIF(${opens.count},0)
    value_format: '0.00%'
    description: "Count of clicks over count of opens."
    