{{config(
    materialized='incremental',
    alias='trusted_payment',
    schema='first_schema',
    pre_hook=["truncate table if exists first_schema.trusted_payment"],
    post_hook=["insert into first_schema.audit_log (table_name, load_time) values ('trusted_payment', current_timestamp())"]
)}}

select * from {{ source('raw_first_schema', 'raw_payments') }}