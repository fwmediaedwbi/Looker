- connection: redshift

- include: "*.view.lookml"       # include all the views
- include: "*.dashboard.lookml"  # include all the dashboards


- explore: emails
  from: sent
  joins:
    - join: bu
      type: left_outer 
      sql_on: ${emails.bu_id} = ${bu.bu_id}
      relationship: many_to_one

    - join: jobs
      type: left_outer 
      sql_on: ${emails.job_id} = ${jobs.job_id}
      relationship: many_to_one
      
    - join: clicks
      type: left_outer
      sql_on: ${emails.job_id} = ${clicks.job_id} AND ${emails.subscriber_id} = ${clicks.subscriber_id}
      relationship: one_to_many
      
    - join: complaints
      type: left_outer
      sql_on: ${emails.job_id} = ${complaints.job_id} AND ${emails.subscriber_id} = ${complaints.subscriber_id}
      relationship: one_to_many
      
    - join: opens
      type: left_outer
      sql_on: ${emails.job_id} = ${opens.job_id} AND ${emails.subscriber_id} = ${opens.subscriber_id}
      relationship: one_to_many
      
#     - join: subscribed
#       type: left_outer
#       sql_on: ${} = ${}
#       relationship:
      
    - join: unsubscribe
      type: left_outer
      sql_on: ${emails.job_id} = ${unsubscribe.job_id} AND ${emails.subscriber_id} = ${unsubscribe.subscriber_id}
      relationship: one_to_many
      
#     - join: users
#       type: left_outer
#       sql_on: ${} = ${}
#       relationship:

- explore: facts_user_sent
      

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

