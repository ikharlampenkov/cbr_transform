{{ config(schema="_airbyte_rate", tags=["nested-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
select
    _airbyte_exchange_rate_hashid,
    {{ json_extract_scalar('digital_code', ['name'], ['name']) }} as {{ adapter.quote('name') }},
    {{ json_extract_scalar('digital_code', ['nominal'], ['nominal']) }} as nominal,
    {{ json_extract_scalar('digital_code', ['letter_code'], ['letter_code']) }} as letter_code,
    {{ json_extract_scalar('digital_code', ['digital_code'], ['digital_code']) }} as digital_code,
    _airbyte_emitted_at
from {{ ref('exchange_rate') }} as table_alias
where digital_code is not null
-- digital_code at exchange_rate/digital_code

