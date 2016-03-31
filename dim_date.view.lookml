- view: dim_date
  sql_table_name: public.dim_date
  fields:

  - dimension: sent_day_name
    type: string
    sql: ${TABLE}.day_name

  - dimension: sent_day_of_month
    type: number
    sql: ${TABLE}.day_of_month

  - dimension: sent_day_of_week
    type: number
    sql: ${TABLE}.day_of_week

  - dimension: sent_day_of_year
    type: number
    sql: ${TABLE}.day_of_year

  - dimension: date
    label: "Sent"
    type: time
    timeframes: [date, week, month]
    sql: ${TABLE}.daydate

  - dimension: sent_month
    type: string
    sql: ${TABLE}.month

  - dimension: sent_month_of_year
    type: number
    sql: ${TABLE}.month_of_year

  - dimension: sent_quarter
    type: number
    sql: ${TABLE}.quarter

  - dimension: sent_quarter_name
    type: string
    sql: ${TABLE}.quarter_name

  - dimension: weekend_or_weekday
    type: string
    sql: ${TABLE}.weekend_or_weekday

  - dimension: sent_year
    type: number
    sql: ${TABLE}.year

  - dimension: sent_year_month
    type: string
    sql: ${TABLE}.year_month

  - dimension: sent_year_quarter
    type: string
    sql: ${TABLE}.year_quarter

  - dimension: yyyymmdd
    type: string
    sql: ${TABLE}.yyyymmdd
    
##############################################
########  DATES THAT ARE NOT SO USEFUL #######
##############################################
  
#   - dimension_group: week_first
#     type: time
#     timeframes: [date, week, month]
#     sql: ${TABLE}.week_first_date
#     hidden: true
# 
#   - dimension_group: week_last
#     type: time
#     timeframes: [date, week, month]
#     sql: ${TABLE}.week_last_date
#     hidden: true
#     
#   
#   - dimension_group: month_first
#     type: time
#     timeframes: [date, week, month]
#     sql: ${TABLE}.month_first_date
#     hidden: true
# 
#   - dimension_group: month_last
#     type: time
#     timeframes: [date, week, month]
#     sql: ${TABLE}.month_last_date
#     hidden: true
# 
# 
#   - dimension_group: quarter_first
#     type: time
#     timeframes: [date, week, month]
#     sql: ${TABLE}.quarter_first_date
#     hidden: true
# 
#   - dimension_group: quarter_last
#     type: time
#     timeframes: [date, week, month]
#     sql: ${TABLE}.quarter_last_date
#     hidden: true
# 
#   - dimension: full_date_name
#     type: string
#     sql: ${TABLE}.full_date_name
#     hidden: true
# 
