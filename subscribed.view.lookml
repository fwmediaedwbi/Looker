- view: subscribed
  sql_table_name: fw.subscribed
  fields:

  - dimension: bu_id
    type: int
    # hidden: true
    sql: ${TABLE}.bu_id

  - dimension: dw_user_id
    type: int
    sql: ${TABLE}.dw_user_id

  - dimension_group: event
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.event_date

  - dimension: subscribed
    type: yesno
    sql: ${TABLE}.subscribed

  - dimension: subscriber_id
    type: int
    sql: ${TABLE}.subscriber_id

  - measure: count
    type: count
    drill_fields: [bu.bu_name, bu.bu_id]

