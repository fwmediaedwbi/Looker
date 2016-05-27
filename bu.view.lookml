- view: bu
  sql_table_name: bu
  fields:

  - dimension: bu_id
    primary_key: true
    type: number
    sql: ${TABLE}.bu_id

  - dimension: bu_name
    type: string
    sql: ${TABLE}.bu_name

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - bu_id
    - bu_name
    - clicks.count
    - complaints.count
    - jobs.count
    - opens.count
    - sent.count
    - subscribed.count
    - unsubscribe.count