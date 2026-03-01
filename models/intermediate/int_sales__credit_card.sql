with 

credit_card as (

    select *
    from {{ ref('stg_adw__sales_credit_card') }}
)

select *
from credit_card