- view: users
  sql_table_name: fw.users
  fields:

  - dimension: dw_user_id
    primary_key: true
    type: int
    sql: ${TABLE}.dw_user_id

  - dimension: email_address
    type: string
    sql: ${TABLE}.email_address

  - dimension: subscriber_id
    type: int
    sql: ${TABLE}.subscriber_id

  - measure: count
    type: count
    drill_fields: [dw_user_id]

