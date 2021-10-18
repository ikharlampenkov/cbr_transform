{{ config(schema="rate", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_exchange_rate_hashid,
    {{ adapter.quote('name') }},
    nominal,
    letter_code,
    digital_code,
    _airbyte_emitted_at,
    _airbyte_digital_code_hashid
from {{ ref('exchange_rate_digital_code_ab3') }}
-- digital_code at exchange_rate/digital_code from {{ ref('exchange_rate') }}
