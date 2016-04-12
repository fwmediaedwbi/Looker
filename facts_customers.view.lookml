- view: facts_customers


  derived_table:
    sql: |
      SELECT e.*, bu.bu_name
        , o.store
        , o.subtotal_sum
        , o.grand_total_sum
        , o.order_count
      FROM
        (SELECT subscriber_key AS customer_email
          , bu_id
          , COUNT(sent_dt) AS sent_count
          , COUNT(opens_dt) AS open_count
          , COUNT(clicks_dt) AS click_count
          , COUNT(unsubscribe_dt) AS unsubscribe_count
          , COUNT(complaints_dt) AS complaint_count
        FROM fw.email
        GROUP BY 1, 2) e
      
      LEFT JOIN fw.bu bu
      ON e.bu_id = bu.bu_id
      
      LEFT JOIN
        (SELECT customer_email
        , LEFT(store_name, CHARINDEX('.com', store_name)+3) AS store
        , SUM(subtotal) AS subtotal_sum
        , SUM(grand_total) AS grand_total_sum
        , COUNT(entity_id) as order_count
        FROM fwmagento.sales_flat_order
        GROUP BY 1, 2) o
      ON e.customer_email = o.customer_email;



  fields:

    - dimension: uid
      primary_key: true
      type: string
      sql: CONCAT(${TABLE}.customer_email,bu_id,store)
    
    - dimension: customer_email
      type: number
      sql: ${TABLE}.customer_email
    
    - dimension: bu_id
      type: number
      sql: ${TABLE}.bu_id
    
    - dimension: sent_count
      type: number
      sql: ${TABLE}.sent_count
    
    - dimension: open_count
      type: number
      sql: ${TABLE}.open_count
    
    - dimension: click_count
      type: number
      sql: ${TABLE}.click_count
    
    - dimension: unsubscribe_count
      type: number
      sql: ${TABLE}.unsubscribe_count
    
    - dimension: complaint_count
      type: number
      sql: ${TABLE}.complaint_count
    
    - dimension: bu_name
      type: number
      sql: ${TABLE}.bu_name
    
    - dimension: store
      type: number
      sql: ${TABLE}.store
    
    - dimension: subtotal_sum
      type: number
      sql: ${TABLE}.subtotal_sum
    
    - dimension: grand_total_sum
      type: number
      sql: ${TABLE}.grand_total_sum
    
    - dimension: order_count
      type: number
      sql: ${TABLE}.order_count
    
    - dimension: spend_tier
      type: tier
      tiers: [0,50,100,200,500,1000]
      style: integer
      sql: ${grand_total_sum}



    - measure: avg_sent_ct
      label: 'Average Sent Count'
      type: avg_distinct
      sql_distinct_key: ${customer_email}
      sql: ${sent_count}
    
    - measure: avg_open_ct
      label: 'Average Open Count'
      type: avg_distinct
      sql_distinct_key: ${customer_email}
      sql: ${open_count}
    
    - measure: avg_click_ct
      label: 'Average Click Count'
      type: avg_distinct
      sql_distinct_key: ${customer_email}
      sql: ${click_count}
    
    - measure: open_rate
      type: number
      sql: 1.0 * SUM(${open_count})/NULLIF(SUM(${sent_count}),0)
      value_format: '0.00%'
    
    - measure: click_rate
      type: number
      sql: 1.0 * SUM(${click_count})/NULLIF(SUM(${open_count}),0)
      value_format: '0.00%'








