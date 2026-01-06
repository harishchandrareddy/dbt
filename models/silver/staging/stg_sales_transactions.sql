{{ config(materialized='view') }}

WITH source_data AS (

    SELECT *
    FROM {{ source('bakehouse', 'sales_transactions') }}

)

SELECT
    transactionID        AS transaction_id,
    customerID           AS customer_id,
    franchiseID          AS franchise_id,
    CAST(dateTime AS TIMESTAMP) AS transaction_ts,
    product,
    quantity,
    unitPrice            AS unit_price,
    totalPrice           AS total_price,
    paymentMethod        AS payment_method,
    cardNumber           AS card_number
FROM source_data
