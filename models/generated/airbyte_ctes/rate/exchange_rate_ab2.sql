{{ config(schema="_airbyte_rate", tags=["top-level-intermediate"]) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
select
    cast({{ adapter.quote('date') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('date') }},
    cast({{ adapter.quote('value') }} as {{ dbt_utils.type_float() }}) as {{ adapter.quote('value') }},
    cast(digital_code as {{ type_json() }}) as digital_code,
    _airbyte_emitted_at
from {{ ref('exchange_rate_ab1') }}
-- exchange_rate

