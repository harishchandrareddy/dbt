{{ config(materialized='table') }}

SELECT *
FROM {{ ref('dim_customers_scd') }}
WHERE is_current = TRUE
