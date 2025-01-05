{{ config(materialized='table') }}

select distinct
        {{ dbt_utils.generate_surrogate_key(["CustomerID", "Country"]) }}
        as customer_id,
        CustomerID as customer_id_real,
        country as country
    from {{ source("store_dataset", "transaction_data") }}
    where customerid is not null