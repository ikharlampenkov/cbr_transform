{{ config(schema="rate", tags=["top-level"]) }}
-- Final base SQL model
select
    {{ adapter.quote('date') }},
    {{ adapter.quote('value') }},
    digital_code,
    _airbyte_emitted_at,
    _airbyte_exchange_rate_hashid
from {{ ref('exchange_rate_ab3') }}
-- exchange_rate from {{ source('rate', '_airbyte_raw_exchange_rate') }}




