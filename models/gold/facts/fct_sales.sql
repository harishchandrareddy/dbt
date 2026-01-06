{{ config(materialized='incremental', unique_key='transaction_id') }}

SELECT
    t.transaction_id,
    t.transaction_ts,
    t.customer_id,
    t.franchise_id,
    t.product,
    t.quantity,
    t.unit_price,
    t.total_price
FROM {{ ref('stg_sales_transactions') }} t
LEFT JOIN {{ ref('dim_customers_scd') }} d
  ON t.customer_id = d.customer_id
 AND d.is_current = TRUE
