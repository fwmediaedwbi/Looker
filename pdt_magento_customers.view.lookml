# - view: pdt_magento_customers
# 
# # Table commented out because customer info is contined in the orders table.
# 
#   derived_table:
#     sql_trigger_value: SELECT DATE_PART('hour', GETDATE())
#     distkey: email
#     indexes: [customer_id]
#     sql: |
#         SELECT email
#           , v2.first_name
#           , v3.last_name
#           , c.entity_id AS customer_id
#           , c.website_id
#           , c.group_id
#           , c.store_id
#           , c.is_active
#           , c.created_at
#           , v1.website
# 
#           FROM fwmagento.customer_entity AS c
#           
#           LEFT OUTER JOIN (
#             SELECT entity_id, value AS website
#             FROM fwmagento.customer_entity_varchar
#             WHERE attribute_id = 5
#           )v1
#           ON c.entity_id = v1.entity_id
#           
#           LEFT OUTER JOIN (
#             SELECT entity_id, value AS first_name
#             FROM fwmagento.customer_entity_varchar
#             WHERE attribute_id = 9
#           )v2
#           ON c.entity_id = v2.entity_id
#           
#           LEFT OUTER JOIN (
#             SELECT entity_id, value AS last_name
#             FROM fwmagento.customer_entity_varchar
#             WHERE attribute_id = 13
#           )v3
#           ON c.entity_id = v3.entity_id
#         ;
# 
# 
#   fields:
#   - dimension: email
#     type: string
#     sql: ${TABLE}.email
#     
#   - dimension: first_name
#     type: string
#     sql: ${TABLE}.first_name
# 
#   - dimension: last_name
#     type: string
#     sql: ${TABLE}.last_name
#     
#   - dimension: full_name
#     type: string
#     sql: ${TABLE}.first_name + ' ' +${TABLE}.last_name
# 
#   - dimension: customer_id
#     type: number
#     sql: ${TABLE}.customer_id
# 
#   - dimension: website_id
#     type: number
#     hidden: true
#     sql: ${TABLE}.website_id
# 
#   - dimension: group_id
#     type: number
#     hidden: true
#     sql: ${TABLE}.group_id
# 
#   - dimension: store_id
#     type: number
#     hidden: true
#     sql: ${TABLE}.store_id
# 
#   - dimension: is_active
#     type: number
#     hidden: true
#     sql: ${TABLE}.is_active
# 
#   - dimension_group: created_at
#     type: time
#     hidden: true
#     timeframes: [time, date, week, month]
#     sql: ${TABLE}.created_at
# 
#   - dimension: website
#     type: string
#     hidden: true
#     sql: ${TABLE}.website
# 
# 
#   - measure: count
#     type: count
#     drill_fields: detail*
# 
