- connection: redshift

- include: "*.view.lookml"       # include all the views
- include: "*.dashboard.lookml"  # include all the dashboards

      
- explore: email
  persist_for: 6 hours
  joins:
    - join: jobs
      sql_on: |
        ${email.job_id} = ${jobs.job_id}
        AND ${email.bu_id} = ${jobs.bu_id}
      relationship: many_to_one
      
    - join: facts_user_sent
      sql_on: |
        ${email.bu_id} = ${facts_user_sent.bu_id}
        AND ${email.subscriber_id} = ${facts_user_sent.subscriber_id}
      relationship: many_to_one
      
    - join: bu
      sql_on: ${email.bu_id} = ${bu.bu_id}
      relationship: many_to_one
    
      

### Redshift Admin ###
- explore: data_loads
  hidden: true

- explore: db_space
  label: 'DB Space'
  hidden: true

- explore: etl_errors
  label: 'ETL Errors'
  hidden: true

- explore: table_skew
  hidden: true

- explore: view_definitions
  from: pg_views
  hidden: true



### Below code is system generated 
### Sent, Open, CLick etc. should join to jobs on job_id... maybe make sent the base table as it will be the biggest. 
### Open, click, complaints and unsub should join to sent on job_id and subscriber_id
### Check if there are any one_to_many joins for opens. I know there could be some for clicks

# - explore: bu
# 
# - explore: clicks
#   joins:
#     - join: bu
#       type: left_outer 
#       sql_on: ${clicks.bu_id} = ${bu.bu_id}
#       relationship: many_to_one
# 
#     - join: jobs
#       type: left_outer 
#       sql_on: ${clicks.job_id} = ${jobs.job_id}
#       relationship: many_to_one
# 
# 
# - explore: complaints
#   joins:
#     - join: bu
#       type: left_outer 
#       sql_on: ${complaints.bu_id} = ${bu.bu_id}
#       relationship: many_to_one
# 
#     - join: jobs
#       type: left_outer 
#       sql_on: ${complaints.job_id} = ${jobs.job_id}
#       relationship: many_to_one
# 
# 
# - explore: jobs
#   joins:
#     - join: bu
#       type: left_outer 
#       sql_on: ${jobs.bu_id} = ${bu.bu_id}
#       relationship: many_to_one
# 
# 
# - explore: opens
#   joins:
#     - join: bu
#       type: left_outer 
#       sql_on: ${opens.bu_id} = ${bu.bu_id}
#       relationship: many_to_one
# 
#     - join: jobs
#       type: left_outer 
#       sql_on: ${opens.job_id} = ${jobs.job_id}
#       relationship: many_to_one
# 
# 
# - explore: sent
#   joins:
#     - join: bu
#       type: left_outer 
#       sql_on: ${sent.bu_id} = ${bu.bu_id}
#       relationship: many_to_one
# 
#     - join: jobs
#       type: left_outer 
#       sql_on: ${sent.job_id} = ${jobs.job_id}
#       relationship: many_to_one
# 
# 
# - explore: subscribed
#   joins:
#     - join: bu
#       type: left_outer 
#       sql_on: ${subscribed.bu_id} = ${bu.bu_id}
#       relationship: many_to_one
# 
# 
# - explore: unsubscribe
#   joins:
#     - join: bu
#       type: left_outer 
#       sql_on: ${unsubscribe.bu_id} = ${bu.bu_id}
#       relationship: many_to_one
# 
#     - join: jobs
#       type: left_outer 
#       sql_on: ${unsubscribe.job_id} = ${jobs.job_id}
#       relationship: many_to_one
# 
# 
# - explore: users

