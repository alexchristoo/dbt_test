-- dim_product.sql
{{ config(materialized='table') }}
-- StockCode isn't unique, a product with the same id can have different and prices
-- Create the dimension table
SELECT DISTINCT
    {{ dbt_utils.generate_surrogate_key(['StockCode', 'Description', 'UnitPrice']) }} as product_id,
		StockCode AS stock_code,
    Description AS description,
    UnitPrice AS price
FROM {{ source("store_dataset", "transaction_data") }}
WHERE StockCode IS NOT NULL
AND UnitPrice > 0