{{ config(schema="_airbyte_rate", tags=["nested-intermediate"]) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
select
    _airbyte_exchange_rate_hashid,
    cast({{ adapter.quote('name') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('name') }},
    cast(nominal as {{ dbt_utils.type_bigint() }}) as nominal,
    cast(letter_code as {{ dbt_utils.type_string() }}) as letter_code,
    cast(digital_code as {{ dbt_utils.type_string() }}) as digital_code,
    _airbyte_emitted_at
from {{ ref('exchange_rate_digital_code_ab1') }}
-- digital_code at exchange_rate/digital_code

