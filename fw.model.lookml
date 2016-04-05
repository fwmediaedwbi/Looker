- connection: redshift

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
      
    - join: facts_user_sent
      sql_on: |
        ${email.bu_id} = ${facts_user_sent.bu_id}
        AND ${email.subscriber_id} = ${facts_user_sent.subscriber_id}
      relationship: many_to_one
      
    - join: bu
      sql_on: ${email.bu_id} = ${bu.bu_id}
      relationship: many_to_one
      
    - join: dim_date
      sql_on: ${email.event_sent_date} = ${dim_date.date_date}
      relationship: many_to_one
      view_label: "Dates"



- explore: sales_flat_order_item
  view_label: 'Order Items'
  persist_for: 1 hour
  always_join: [sales_flat_order]
  joins:
    - join: sales_flat_order
      view_label: 'Orders'
      relationship: many_to_one
      sql_on: ${sales_flat_order_item.order_id} = ${sales_flat_order.order_id}
    
    - join: sales_flat_order_address_billing
      view_label: 'Billing Address'
      from: sales_flat_order_address
      relationship: many_to_one
      sql_on: ${sales_flat_order.billing_address_id} = ${sales_flat_order_address_billing.entity_id}
    
    - join: sales_flat_order_address_shipping
      view_label: 'Shipping Address'
      from: sales_flat_order_address
      relationship: many_to_one
      sql_on: ${sales_flat_order.shipping_address_id} = ${sales_flat_order_address_shipping.entity_id}
    




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



# - explore: users

