{{config(
    materialized='incremental',
    alias='trusted_employee',
    schema='first_schema'
)}}
select * from {{ source('raw_first_schema', 'raw_employee') }}