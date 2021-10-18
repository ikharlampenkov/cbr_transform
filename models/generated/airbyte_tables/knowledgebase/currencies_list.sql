{{ config(schema="knowledgebase", tags=["nested"]) }}
-- Final base SQL model
select
    digital_code,
    letter_code,
    nominal,
    {{ adapter.quote('name') }},
from {{ ref('exchange_rate_digital_code') }}
-- currencies_list at exchange_rate/digital_code from {{ ref('exchange_rate') }}

-- knowledgebase.currencies_list
