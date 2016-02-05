
- view: facts_user_sent
  sql_trigger_value: SELECT current_date
  distkey: bu_id
  sortkeys: [bu_id,subscriber_id]
  derived_table:
    sql: |
            select 
              sent.subscriber_id
              , sent.bu_id
              , count(*) as sents
              , max(sent.event_dt) as most_recent_sent
              , count( case when sent.event_dt > (current_date - 7) then 1 else NULL end) as emails_sent_in_the_last_7_days
              , count( case when sent.event_dt > (current_date - 14) then 1 else NULL end) as emails_sent_in_the_last_14_days
              , count( case when sent.event_dt > (current_date - 30) then 1 else NULL end) as emails_sent_in_the_last_30_days
              , count( case when sent.event_dt > (current_date - 60) then 1 else NULL end) as emails_sent_in_the_last_60_days
              , count( case when sent.event_dt > (current_date - 90) then 1 else NULL end) as emails_sent_in_the_last_90_days
              
              , count ( distinct opens.job_id) as opens
              , max(opens.event_dt) as most_recent_open
              , count ( distinct case when opens.event_dt > (current_date - 7) then opens.job_id else NULL end) as emails_opened_in_the_last_7_days
              , count ( distinct case when opens.event_dt > (current_date - 14) then opens.job_id else NULL end) as emails_opened_in_the_last_14_days
              , count ( distinct case when opens.event_dt > (current_date - 30) then opens.job_id else NULL end) as emails_opened_in_the_last_30_days
              , count ( distinct case when opens.event_dt > (current_date - 60) then opens.job_id else NULL end) as emails_opened_in_the_last_60_days
              , count ( distinct case when opens.event_dt > (current_date - 90) then opens.job_id else NULL end) as emails_opened_in_the_last_90_days
              
              , count (distinct clicks.job_id) as clicks
              , max(clicks.event_dt) as most_recent_click
              , count ( distinct case when clicks.event_dt > (current_date - 7) then clicks.job_id else NULL end) as emails_clicked_in_the_last_7_days
              , count ( distinct case when clicks.event_dt > (current_date - 14) then clicks.job_id else NULL end) as emails_clicked_in_the_last_14_days
              , count ( distinct case when clicks.event_dt > (current_date - 30) then clicks.job_id else NULL end) as emails_clicked_in_the_last_30_days
              , count ( distinct case when clicks.event_dt > (current_date - 60) then clicks.job_id else NULL end) as emails_clicked_in_the_last_60_days
              , count ( distinct case when clicks.event_dt > (current_date - 90) then clicks.job_id else NULL end) as emails_clicked_in_the_last_90_days
              
              , avg( datediff( day,sent.event_dt, opens.event_dt)) as average_days_between_sent_and_open
              , avg( case when sent.event_dt > (current_date - 14) then datediff(day,sent.event_dt, opens.event_dt) else NULL end) as average_days_between_sent_and_open_in_last_14_days
              
            from sent
            join
              (
                select
                  subscriber_id
                  , bu_id
                  , job_id
                  , min(event_dt) as event_dt
                from
                  opens
                group by 
                  1,2,3
                ) opens
                  on sent.subscriber_id = opens.subscriber_id
                  and sent.bu_id = opens.bu_id
                  and sent.job_id = opens.job_id
            join
              (
                select
                  subscriber_id
                  , bu_id
                  , job_id
                  , min(event_dt) as event_dt
                from
                  clicks
                group by 
                  1,2,3
                ) clicks
                  on sent.subscriber_id = clicks.subscriber_id
                  and sent.bu_id = clicks.bu_id
                  and sent.job_id = clicks.job_id
                  
                  
            group by 1,2;

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

