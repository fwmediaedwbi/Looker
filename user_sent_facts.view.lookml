- view: user_sent_facts
  derived_table:
    sql_trigger_value: select current_date
    distkey: bu_id
    sortkeys: [bu_id, subscriber_id]
    sql: |
      select 
        subscriber_id
        , bu_id
        , count(*) as sents
        , max(event_dt) as most_recent_sent
      from sent
      group by 1,2

  fields:
  - measure: count
    type: count
    drill_fields: detail*

  - dimension: subscriber_id
    type: string
    sql: ${TABLE}.subscriber_id

  - dimension: bu_id
    type: int
    sql: ${TABLE}.bu_id

  - dimension: sents
    type: int
    sql: ${TABLE}.sents

  - dimension_group: most_recent_sent
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.most_recent_sent

  sets:
    detail:
      - subscriber_id
      - bu_id
      - sents
      - most_recent_sent_time

