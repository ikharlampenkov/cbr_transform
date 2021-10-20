{{ config(schema="database", alias='exchange_rate', tags=["nested"]) }}
-- Final base SQL model
select
    DISTINCT
    (SELECT DISTINCT cl.digital_code FROM {{ ref('currencies_list') }} as cl
    WHERE cl.digital_code=cast({{ json_extract_scalar('er_ab3.digital_code', ['digital_code'], ['digital_code']) }} as {{ dbt_utils.type_string() }})) as digital_code_id,
    {{ adapter.quote('date') }},
    {{ adapter.quote('value') }}
from {{ ref('exchange_rate_ab3') }} as er_ab3
-- exchange_rate from {{ source('rate', '_airbyte_raw_exchange_rate') }}
