{{ config(schema="_airbyte_rate", tags=["top-level-intermediate"]) }}
-- SQL model to build a hash column based on the values of this record
select
    *,
    {{ dbt_utils.surrogate_key([
        adapter.quote('date'),
        adapter.quote('value'),
        'digital_code',
    ]) }} as _airbyte_exchange_rate_hashid
from {{ ref('exchange_rate_ab2') }}
-- exchange_rate

