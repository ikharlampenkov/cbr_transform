{{ config(schema="_airbyte_rate", tags=["nested-intermediate"]) }}
-- SQL model to build a hash column based on the values of this record
select
    *,
    {{ dbt_utils.surrogate_key([
        '_airbyte_exchange_rate_hashid',
        adapter.quote('name'),
        'nominal',
        'letter_code',
        'digital_code',
    ]) }} as _airbyte_digital_code_hashid
from {{ ref('exchange_rate_digital_code_ab2') }}
-- digital_code at exchange_rate/digital_code

