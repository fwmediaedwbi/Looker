- view: facts_user_sent
  derived_table:
    sql_trigger_value: SELECT current_date
    distkey: bu_id
    sortkeys: [bu_id,subscriber_id]

    sql: |
            select 
              subscriber_id
              , bu_id
              , count(*) as sents
              , max(sent_dt) as most_recent_sent
              , count( case when sent_dt > (current_date - 7) then 1 else NULL end) as emails_sent_in_the_last_7_days
              , count( case when sent_dt > (current_date - 14) then 1 else NULL end) as emails_sent_in_the_last_14_days
              , count( case when sent_dt > (current_date - 30) then 1 else NULL end) as emails_sent_in_the_last_30_days
              , count( case when sent_dt > (current_date - 60) then 1 else NULL end) as emails_sent_in_the_last_60_days
              , count( case when sent_dt > (current_date - 90) then 1 else NULL end) as emails_sent_in_the_last_90_days
              
              , sum ( case when opens_dt is NULL then 0 else 1 end) as opens
              , max (opens_dt) as most_recent_open
              , count ( case when opens_dt > (current_date - 7) then 1 else 0 end) as emails_opened_in_the_last_7_days
              , count ( case when opens_dt > (current_date - 14) then 1 else 0 end) as emails_opened_in_the_last_14_days
              , count ( case when opens_dt > (current_date - 30) then 1 else 0 end) as emails_opened_in_the_last_30_days
              , count ( case when opens_dt > (current_date - 60) then 1 else 0 end) as emails_opened_in_the_last_60_days
              , count ( case when opens_dt > (current_date - 90) then 1 else 0 end) as emails_opened_in_the_last_90_days
              
              , sum ( case when clicks_dt is NULL then 0 else 1 end) as clicks
              , max (clicks_dt) as most_recent_click
              , count ( case when clicks_dt > (current_date - 7) then 1 else NULL end) as emails_clicked_in_the_last_7_days
              , count ( case when clicks_dt > (current_date - 14) then 1 else NULL end) as emails_clicked_in_the_last_14_days
              , count ( case when clicks_dt > (current_date - 30) then 1 else NULL end) as emails_clicked_in_the_last_30_days
              , count ( case when clicks_dt > (current_date - 60) then 1 else NULL end) as emails_clicked_in_the_last_60_days
              , count ( case when clicks_dt > (current_date - 90) then 1 else NULL end) as emails_clicked_in_the_last_90_days
              
              , avg( datediff( day,sent_dt, opens_dt)) as average_days_between_sent_and_open
              , avg( case when sent_dt > (current_date - 14) then datediff(day,sent_dt, opens_dt) else NULL end) as average_days_between_sent_and_open_in_last_14_days
              
            from fw.email
            
            group by 1,2

  fields:
  - measure: count
    type: count
    drill_fields: detail*

  - dimension: subscriber_id
    type: string
    sql: ${TABLE}.subscriber_id

  - dimension: bu_id
    type: number
    sql: ${TABLE}.bu_id

  - dimension: sents
    type: number
    sql: ${TABLE}.sents

  - dimension_group: most_recent_sent
    type: time
    sql: ${TABLE}.most_recent_sent

  - dimension: "emails_sent_in_the_last_7_days"
    type: number
    sql: ${TABLE}.emails_sent_in_the_last_7_days
    
  - dimension: "emails_sent_in_the_last_14_days"
    type: number
    sql: ${TABLE}.emails_sent_in_the_last_14_days
    
  - dimension: emails_received_in_the_last_14_days
    view_label: "Cohort"
    sql: |
      CASE  WHEN ${emails_sent_in_the_last_14_days} <6 THEN "Less than 6"
            WHEN ${emails_sent_in_the_last_14_days} <15 THEN "Less than 15"
            WHEN ${emails_sent_in_the_last_14_days} <25 THEN "Less than 25"
            ELSE "Over 25" END

  - dimension: "emails_sent_in_the_last_30_days"
    type: number
    sql: ${TABLE}.emails_sent_in_the_last_30_days

  - dimension: "emails_sent_in_the_last_60_days"
    type: number
    sql: ${TABLE}.emails_sent_in_the_last_60_days

  - dimension: "emails_sent_in_the_last_90_days"
    type: number
    sql: ${TABLE}.emails_sent_in_the_last_90_days

  - dimension: opens
    type: number
    sql: ${TABLE}.opens

  - dimension_group: most_recent_open
    type: time
    sql: ${TABLE}.most_recent_open

  - dimension: "emails_opened_in_the_last_7_days"
    type: number
    sql: ${TABLE}.emails_opened_in_the_last_7_days

  - dimension: "emails_opened_in_the_last_14_days"
    type: number
    sql: ${TABLE}.emails_opened_in_the_last_14_days

  - dimension: "emails_opened_in_the_last_30_days"
    type: number
    sql: ${TABLE}.emails_opened_in_the_last_30_days

  - dimension: "emails_opened_in_the_last_60_days"
    type: number
    sql: ${TABLE}.emails_opened_in_the_last_60_days

  - dimension: "emails_opened_in_the_last_90_days"
    type: number
    sql: ${TABLE}.emails_opened_in_the_last_90_days

  - dimension: clicks
    type: number
    sql: ${TABLE}.clicks

  - dimension_group: most_recent_click
    type: time
    sql: ${TABLE}.most_recent_click

  - dimension: "emails_clicked_in_the_last_7_days"
    type: number
    sql: ${TABLE}.emails_clicked_in_the_last_7_days

  - dimension: "emails_clicked_in_the_last_14_days"
    type: number
    sql: ${TABLE}.emails_clicked_in_the_last_14_days

  - dimension: "emails_clicked_in_the_last_30_days"
    type: number
    sql: ${TABLE}.emails_clicked_in_the_last_30_days

  - dimension: "emails_clicked_in_the_last_60_days"
    type: number
    sql: ${TABLE}.emails_clicked_in_the_last_60_days

  - dimension: "emails_clicked_in_the_last_90_days"
    type: number
    sql: ${TABLE}.emails_clicked_in_the_last_90_days

  - dimension: average_days_between_sent_and_open
    type: number
    sql: ${TABLE}.average_days_between_sent_and_open

  - dimension: "average_days_between_sent_and_open_in_last_14_days"
    type: number
    sql: ${TABLE}.average_days_between_sent_and_open_in_last_14_days
    
  - measure: users
    type: count_distinct
    sql: subscriber_id||bu_id

  sets:
    detail:
      - subscriber_id
      - bu_id
      - sents
      - most_recent_sent_time
      - emails_sent_in_the_last_7_days
      - emails_sent_in_the_last_14_days
      - emails_sent_in_the_last_30_days
      - emails_sent_in_the_last_60_days
      - emails_sent_in_the_last_90_days
      - opens
      - most_recent_open_time
      - emails_opened_in_the_last_7_days
      - emails_opened_in_the_last_14_days
      - emails_opened_in_the_last_30_days
      - emails_opened_in_the_last_60_days
      - emails_opened_in_the_last_90_days
      - clicks
      - most_recent_click_time
      - emails_clicked_in_the_last_7_days
      - emails_clicked_in_the_last_14_days
      - emails_clicked_in_the_last_30_days
      - emails_clicked_in_the_last_60_days
      - emails_clicked_in_the_last_90_days
      - average_days_between_sent_and_open
      - average_days_between_sent_and_open_in_last_14_days

