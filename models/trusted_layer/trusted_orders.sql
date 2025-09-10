{{config(
    materialized='incremental',
    alias='trusted_orders',
    schema='first_schema',
    pre_hook=["truncate table if exists first_schema.trusted_orders"],
    post_hook=["insert into first_schema.audit_log (table_name, load_time) values ('trusted_orders', current_timestamp())"]
)}}

select * from {{ source('raw_first_schema', 'raw_orders') }}