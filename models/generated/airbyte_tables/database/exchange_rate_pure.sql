{{ config(schema="database", tags=["nested"]) }}
-- Final base SQL model
select
    {{ adapter.quote('date') }},
    {{ adapter.quote('value') }},
    (SELECT digital_code FROM {{ ref('currencies_list') }} WHERE digital_code={{ json_extract_scalar('digital_code', ['digital_code'], ['digital_code']) }}) as digital_code_id,
from {{ ref('exchange_rate_ab3') }}
-- exchange_rate from {{ source('rate', '_airbyte_raw_exchange_rate') }}
