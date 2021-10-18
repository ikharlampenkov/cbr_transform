{{ config(schema="_airbyte_rate", tags=["top-level-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
select
    {{ json_extract_scalar('_airbyte_data', ['date'], ['date']) }} as {{ adapter.quote('date') }},
    {{ json_extract_scalar('_airbyte_data', ['value'], ['value']) }} as {{ adapter.quote('value') }},
    {{ json_extract('table_alias', '_airbyte_data', ['digital_code'], ['digital_code']) }} as digital_code,
    _airbyte_emitted_at
from {{ source('rate', '_airbyte_raw_exchange_rate') }} as table_alias
-- exchange_rate

