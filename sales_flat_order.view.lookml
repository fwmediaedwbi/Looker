- view: sales_flat_order
  sql_table_name: fwmagento.sales_flat_order
  fields:


  - dimension: order_id
    primary_key: true
    type: number
    sql: ${TABLE}.entity_id

  - dimension: adjustment_negative
    type: number
    sql: ${TABLE}.adjustment_negative
    value_format: '$#,##0.00'

  - dimension: adjustment_positive
    type: number
    sql: ${TABLE}.adjustment_positive
    hidden: true

  - dimension: applied_rule_ids
    type: string
    sql: ${TABLE}.applied_rule_ids

  - dimension: base_adjustment_negative
    type: number
    sql: ${TABLE}.base_adjustment_negative
    value_format: '$#,##0.00'

  - dimension: base_adjustment_positive
    type: number
    sql: ${TABLE}.base_adjustment_positive
    hidden: true

  - dimension: base_currency_code
    type: string
    sql: ${TABLE}.base_currency_code

  - dimension: base_customer_balance_amount
    type: number
    sql: ${TABLE}.base_customer_balance_amount
    hidden: true

  - dimension: base_discount_amount
    type: number
    sql: ${TABLE}.base_discount_amount
    value_format: '$#,##0.00'

  - dimension: base_discount_canceled
    type: number
    sql: ${TABLE}.base_discount_canceled
    value_format: '$#,##0.00'

  - dimension: base_discount_invoiced
    type: number
    sql: ${TABLE}.base_discount_invoiced
    value_format: '$#,##0.00'

  - dimension: base_discount_refunded
    type: number
    sql: ${TABLE}.base_discount_refunded
    value_format: '$#,##0.00'

  - dimension: base_gift_cards_amount
    type: number
    sql: ${TABLE}.base_gift_cards_amount
    value_format: '$#,##0.00'

  - dimension: base_gift_cards_invoiced
    type: number
    sql: ${TABLE}.base_gift_cards_invoiced
    value_format: '$#,##0.00'

  - dimension: base_gift_cards_refunded
    type: number
    sql: ${TABLE}.base_gift_cards_refunded
    value_format: '$#,##0.00'

  - dimension: base_grand_total
    type: number
    sql: ${TABLE}.base_grand_total
    value_format: '$#,##0.00'

  - dimension: base_hidden_tax_amount
    type: number
    sql: ${TABLE}.base_hidden_tax_amount
    hidden: true

  - dimension: base_hidden_tax_invoiced
    type: number
    sql: ${TABLE}.base_hidden_tax_invoiced
    hidden: true

  - dimension: base_hidden_tax_refunded
    type: number
    sql: ${TABLE}.base_hidden_tax_refunded
    hidden: true

  - dimension: base_reward_currency_amount
    type: number
    sql: ${TABLE}.base_reward_currency_amount
    hidden: true

  - dimension: base_shipping_amount
    type: number
    sql: ${TABLE}.base_shipping_amount
    value_format: '$#,##0.00'

  - dimension: base_shipping_canceled
    type: number
    sql: ${TABLE}.base_shipping_canceled
    value_format: '$#,##0.00'

  - dimension: base_shipping_discount_amount
    type: number
    sql: ${TABLE}.base_shipping_discount_amount
    value_format: '$#,##0.00'

  - dimension: base_shipping_hidden_tax_amnt
    type: number
    sql: ${TABLE}.base_shipping_hidden_tax_amnt
    hidden: true

  - dimension: base_shipping_incl_tax
    type: number
    sql: ${TABLE}.base_shipping_incl_tax
    value_format: '$#,##0.00'

  - dimension: base_shipping_invoiced
    type: number
    sql: ${TABLE}.base_shipping_invoiced
    value_format: '$#,##0.00'

  - dimension: base_shipping_refunded
    type: number
    sql: ${TABLE}.base_shipping_refunded
    value_format: '$#,##0.00'

  - dimension: base_shipping_tax_amount
    type: number
    sql: ${TABLE}.base_shipping_tax_amount
    hidden: true

  - dimension: base_shipping_tax_refunded
    type: number
    sql: ${TABLE}.base_shipping_tax_refunded
    hidden: true

  - dimension: base_subtotal
    type: number
    sql: ${TABLE}.base_subtotal
    value_format: '$#,##0.00'

  - dimension: base_subtotal_canceled
    type: number
    sql: ${TABLE}.base_subtotal_canceled
    value_format: '$#,##0.00'

  - dimension: base_subtotal_incl_tax
    type: number
    sql: ${TABLE}.base_subtotal_incl_tax
    value_format: '$#,##0.00'

  - dimension: base_subtotal_invoiced
    type: number
    sql: ${TABLE}.base_subtotal_invoiced
    value_format: '$#,##0.00'

  - dimension: base_subtotal_refunded
    type: number
    sql: ${TABLE}.base_subtotal_refunded
    value_format: '$#,##0.00'

  - dimension: base_tax_amount
    type: number
    sql: ${TABLE}.base_tax_amount
    value_format: '$#,##0.00'

  - dimension: base_tax_canceled
    type: number
    sql: ${TABLE}.base_tax_canceled

  - dimension: base_tax_invoiced
    type: number
    sql: ${TABLE}.base_tax_invoiced

  - dimension: base_tax_refunded
    type: number
    sql: ${TABLE}.base_tax_refunded

  - dimension: base_to_global_rate
    type: number
    sql: ${TABLE}.base_to_global_rate

  - dimension: base_to_order_rate
    type: number
    sql: ${TABLE}.base_to_order_rate

  - dimension: base_total_canceled
    type: number
    sql: ${TABLE}.base_total_canceled

  - dimension: base_total_due
    type: number
    sql: ${TABLE}.base_total_due

  - dimension: base_total_invoiced
    type: number
    sql: ${TABLE}.base_total_invoiced

  - dimension: base_total_invoiced_cost
    type: number
    sql: ${TABLE}.base_total_invoiced_cost

  - dimension: base_total_offline_refunded
    type: number
    sql: ${TABLE}.base_total_offline_refunded

  - dimension: base_total_online_refunded
    type: number
    sql: ${TABLE}.base_total_online_refunded

  - dimension: base_total_paid
    type: number
    value_format_name: id
    sql: ${TABLE}.base_total_paid

  - dimension: base_total_refunded
    type: number
    sql: ${TABLE}.base_total_refunded

  - dimension: billing_address_id
    type: number
    sql: ${TABLE}.billing_address_id

  - dimension: coupon_code
    type: string
    sql: ${TABLE}.coupon_code

  - dimension: coupon_rule_name
    type: string
    sql: ${TABLE}.coupon_rule_name

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_at

  - dimension: customer_balance_amount
    type: number
    sql: ${TABLE}.customer_balance_amount

  - dimension_group: customer_dob
    type: time
    timeframes: [date, month, year]
    sql: ${TABLE}.customer_dob

  - dimension: customer_email
    type: string
    sql: ${TABLE}.customer_email

  - dimension: customer_firstname
    type: string
    sql: ${TABLE}.customer_firstname

  - dimension: customer_gender
    type: number
    sql: ${TABLE}.customer_gender

  - dimension: customer_group_id
    type: number
    # hidden: true
    sql: ${TABLE}.customer_group_id

  - dimension: customer_id
    type: number
    sql: ${TABLE}.customer_id

  - dimension: customer_is_guest
    type: number
    sql: ${TABLE}.customer_is_guest

  - dimension: customer_lastname
    type: string
    sql: ${TABLE}.customer_lastname

  - dimension: customer_middlename
    type: string
    sql: ${TABLE}.customer_middlename

  - dimension: customer_note
    type: string
    sql: ${TABLE}.customer_note

  - dimension: customer_note_notify
    type: number
    sql: ${TABLE}.customer_note_notify

  - dimension: customer_prefix
    type: string
    sql: ${TABLE}.customer_prefix

  - dimension: customer_suffix
    type: string
    sql: ${TABLE}.customer_suffix

  - dimension: customer_taxvat
    type: string
    sql: ${TABLE}.customer_taxvat

  - dimension: discount_amount
    type: number
    sql: ${TABLE}.discount_amount

  - dimension: discount_canceled
    type: number
    sql: ${TABLE}.discount_canceled

  - dimension: discount_description
    type: string
    sql: ${TABLE}.discount_description

  - dimension: discount_invoiced
    type: number
    sql: ${TABLE}.discount_invoiced

  - dimension: discount_refunded
    type: number
    sql: ${TABLE}.discount_refunded

  - dimension: edit_increment
    type: number
    sql: ${TABLE}.edit_increment

  - dimension: email_sent
    type: number
    sql: ${TABLE}.email_sent

  - dimension: ext_order_id
    type: string
    sql: ${TABLE}.ext_order_id

  - dimension: gift_cards
    type: string
    sql: ${TABLE}.gift_cards

  - dimension: gift_cards_amount
    type: number
    sql: ${TABLE}.gift_cards_amount

  - dimension: gift_cards_invoiced
    type: number
    sql: ${TABLE}.gift_cards_invoiced

  - dimension: gift_cards_refunded
    type: number
    sql: ${TABLE}.gift_cards_refunded

  - dimension: global_currency_code
    type: string
    sql: ${TABLE}.global_currency_code

  - dimension: grand_total
    type: number
    sql: ${TABLE}.grand_total
    value_format: '$#,##0.00'

  - dimension: gw_base_price
    type: number
    sql: ${TABLE}.gw_base_price

  - dimension: gw_base_tax_amount
    type: number
    sql: ${TABLE}.gw_base_tax_amount

  - dimension: gw_card_base_price
    type: number
    sql: ${TABLE}.gw_card_base_price

  - dimension: gw_card_base_tax_amount
    type: number
    sql: ${TABLE}.gw_card_base_tax_amount

  - dimension: gw_card_price
    type: number
    sql: ${TABLE}.gw_card_price

  - dimension: gw_card_tax_amount
    type: number
    sql: ${TABLE}.gw_card_tax_amount

  - dimension: gw_items_base_price
    type: number
    sql: ${TABLE}.gw_items_base_price

  - dimension: gw_items_base_tax_amount
    type: number
    sql: ${TABLE}.gw_items_base_tax_amount

  - dimension: gw_items_price
    type: number
    sql: ${TABLE}.gw_items_price

  - dimension: gw_items_tax_amount
    type: number
    sql: ${TABLE}.gw_items_tax_amount

  - dimension: gw_price
    type: number
    sql: ${TABLE}.gw_price

  - dimension: gw_tax_amount
    type: number
    sql: ${TABLE}.gw_tax_amount

  - dimension: hidden_tax_amount
    type: number
    sql: ${TABLE}.hidden_tax_amount

  - dimension: hidden_tax_invoiced
    type: number
    sql: ${TABLE}.hidden_tax_invoiced

  - dimension: hidden_tax_refunded
    type: number
    sql: ${TABLE}.hidden_tax_refunded

  - dimension: hold_before_state
    type: string
    sql: ${TABLE}.hold_before_state

  - dimension: hold_before_status
    type: string
    sql: ${TABLE}.hold_before_status

  - dimension: increment_id
    type: string
    sql: ${TABLE}.increment_id

  - dimension: is_virtual
    type: number
    sql: ${TABLE}.is_virtual

  - dimension: order_currency_code
    type: string
    sql: ${TABLE}.order_currency_code

  - dimension: original_increment_id
    type: string
    sql: ${TABLE}.original_increment_id

  - dimension: paypal_ipn_customer_notified
    type: number
    sql: ${TABLE}.paypal_ipn_customer_notified
    hidden: true

  - dimension: protect_code
    type: string
    sql: ${TABLE}.protect_code

  - dimension: quote_id
    type: number
    sql: ${TABLE}.quote_id

  - dimension: relation_child_id
    type: string
    sql: ${TABLE}.relation_child_id

  - dimension: relation_child_real_id
    type: string
    sql: ${TABLE}.relation_child_real_id

  - dimension: relation_parent_id
    type: string
    sql: ${TABLE}.relation_parent_id

  - dimension: relation_parent_real_id
    type: string
    sql: ${TABLE}.relation_parent_real_id

  - dimension: remote_ip
    type: string
    sql: ${TABLE}.remote_ip

  - dimension: reward_currency_amount
    type: number
    sql: ${TABLE}.reward_currency_amount

  - dimension: reward_points_balance
    type: number
    sql: ${TABLE}.reward_points_balance

  - dimension: shipping_address_id
    type: number
    sql: ${TABLE}.shipping_address_id

  - dimension: shipping_amount
    type: number
    sql: ${TABLE}.shipping_amount
    value_format: '$#,##0.00'

  - dimension: shipping_canceled
    type: number
    sql: ${TABLE}.shipping_canceled

  - dimension: shipping_description
    type: string
    sql: ${TABLE}.shipping_description

  - dimension: shipping_discount_amount
    type: number
    sql: ${TABLE}.shipping_discount_amount

  - dimension: shipping_hidden_tax_amount
    type: number
    sql: ${TABLE}.shipping_hidden_tax_amount

  - dimension: shipping_incl_tax
    type: number
    sql: ${TABLE}.shipping_incl_tax

  - dimension: shipping_invoiced
    type: number
    sql: ${TABLE}.shipping_invoiced

  - dimension: shipping_method
    type: string
    sql: ${TABLE}.shipping_method

  - dimension: shipping_refunded
    type: number
    sql: ${TABLE}.shipping_refunded

  - dimension: shipping_tax_amount
    type: number
    sql: ${TABLE}.shipping_tax_amount

  - dimension: shipping_tax_refunded
    type: number
    sql: ${TABLE}.shipping_tax_refunded

  - dimension: state
    type: string
    sql: ${TABLE}.state

  - dimension: status
    type: string
    sql: ${TABLE}.status

  - dimension: store_currency_code
    type: string
    sql: ${TABLE}.store_currency_code

  - dimension: store_id
    type: number
    sql: ${TABLE}.store_id

  - dimension: store_name
    type: string
    sql: LEFT(${TABLE}.store_name, CHARINDEX('.com', ${TABLE}.store_name)+3)

  - dimension: store_to_base_rate
    type: number
    sql: ${TABLE}.store_to_base_rate

  - dimension: store_to_order_rate
    type: number
    sql: ${TABLE}.store_to_order_rate

  - dimension: subtotal
    type: number
    sql: ${TABLE}.subtotal
    value_format: '$#,##0.00'

  - dimension: subtotal_canceled
    type: number
    sql: ${TABLE}.subtotal_canceled

  - dimension: subtotal_incl_tax
    type: number
    sql: ${TABLE}.subtotal_incl_tax

  - dimension: subtotal_invoiced
    type: number
    sql: ${TABLE}.subtotal_invoiced

  - dimension: subtotal_refunded
    type: number
    sql: ${TABLE}.subtotal_refunded

  - dimension: tax_amount
    type: number
    sql: ${TABLE}.tax_amount
    value_format: '$#,##0.00'

  - dimension: tax_canceled
    type: number
    sql: ${TABLE}.tax_canceled

  - dimension: tax_invoiced
    type: number
    sql: ${TABLE}.tax_invoiced

  - dimension: tax_refunded
    type: number
    sql: ${TABLE}.tax_refunded

  - dimension: total_canceled
    type: number
    sql: ${TABLE}.total_canceled

  - dimension: total_due
    type: number
    sql: ${TABLE}.total_due

  - dimension: total_invoiced
    type: number
    sql: ${TABLE}.total_invoiced

  - dimension: total_item_count
    type: number
    sql: ${TABLE}.total_item_count

  - dimension: total_offline_refunded
    type: number
    sql: ${TABLE}.total_offline_refunded

  - dimension: total_online_refunded
    type: number
    sql: ${TABLE}.total_online_refunded

  - dimension: total_paid
    type: number
    sql: ${TABLE}.total_paid
    value_format: '$#,##0.00'

  - dimension: total_qty_ordered
    type: number
    sql: ${TABLE}.total_qty_ordered

  - dimension: total_refunded
    type: number
    sql: ${TABLE}.total_refunded

  - dimension_group: updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.updated_at

  - dimension: vistaorder_id
    type: string
    sql: ${TABLE}.vistaorder_id

  - dimension: vistaorder_status
    type: string
    sql: ${TABLE}.vistaorder_status

  - dimension: weight
    type: number
    sql: ${TABLE}.weight

  - dimension: x_forwarded_for
    type: string
    sql: ${TABLE}.x_forwarded_for



  - measure: count
    type: count
    drill_fields: detail*
  
  - measure: sum_of_grand_total
    type: sum
    sql: ${TABLE}.grand_total
    value_format: '$#,##0.00'
  
  - measure: sum_of_subtotal
    description: "Total before shipping and tax"
    type: sum
    sql: ${TABLE}.subtotal
    value_format: '$#,##0.00'

  - measure: avg_orders_per_cust
    label: "Average Order Count per Customer"
    type: number
    sql: COUNT(${TABLE}.entity_id)/COUNT(DISTINCT ${TABLE}.customer_email)
    value_format: '#,##0'
  
  - measure: avg_rev_per_cust
    label: "Average Revenue per Customer"
    type: number
    sql: SUM(${TABLE}.subtotal)/COUNT(DISTINCT ${TABLE}.customer_email)
    value_format: '$#,##0.00'


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - store_name
    - customer_firstname
    - customer_lastname
    - coupon_rule_name
    - customer_middlename
    - customer_group.customer_group_id

