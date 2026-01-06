{{ config(materialized='view') }}

WITH source_data AS (

    SELECT *
    FROM {{ source('bakehouse', 'sales_customers') }}

)

SELECT
    customerID           AS customer_id,
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
    LOWER(gender)        AS gender
FROM source_data
