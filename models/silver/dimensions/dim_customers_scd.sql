{{ 
  config(
    materialized='incremental',
    unique_key='customer_id',
    incremental_strategy='merge'
  ) 
}}

WITH base AS (

    SELECT
        customer_id,
        first_name,
        last_name,
        email_address,
        phone_number,
        address,
        city,
        state,
        country,
        continent,
        postal_zip_code,
        gender,
        CURRENT_TIMESTAMP AS effective_from,
        NULL AS effective_to,
        TRUE AS is_current
    FROM {{ ref('stg_sales_customers') }}

)

SELECT *
FROM base
