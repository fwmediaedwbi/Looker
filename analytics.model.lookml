- connection: edwrpt

- include: "*.view.lookml"       # include all the views
- include: "*.dashboard.lookml"  # include all the dashboards


- explore: email
  persist_for: 12 hours
  joins:
    - join: jobs
      sql_on: |
        ${email.job_id} = ${jobs.job_id}
        AND ${email.bu_id} = ${jobs.bu_id}
      relationship: many_to_one
    
    - join: pdt_fact_user_sent
      view_label: "Cohort"
      sql_on: |
        ${email.bu_id} = ${pdt_fact_user_sent.bu_id}
        AND ${email.subscriber_id} = ${pdt_fact_user_sent.subscriber_id}
      relationship: many_to_one
    
    - join: bu
      sql_on: ${email.bu_id} = ${bu.bu_id}
      relationship: many_to_one
    
    - join: dim_date
      sql_on: ${email.event_sent_date} = ${dim_date.date_date}
      relationship: many_to_one
      view_label: "Dates"


- explore: pdt_fact_user_email_ct
  label: 'Email Facts'
  view_label: 'Email Counts'
  persist_for: 12 hours
  joins:
    - join: jobs
      sql_on: |
        ${pdt_fact_user_email_ct.job_id} = ${jobs.job_id}
        AND ${pdt_fact_user_email_ct.bu_id} = ${jobs.bu_id}
      relationship: many_to_one
    
    - join: bu
      sql_on: ${pdt_fact_user_email_ct.bu_id} = ${bu.bu_id}
      relationship: many_to_one
    
    - join: dim_date
      view_label: "Dates"
      sql_on: ${pdt_fact_user_email_ct.sent_date} = ${dim_date.date_date}
      relationship: many_to_one
    

# - explore: pdt_fact_user_sent
