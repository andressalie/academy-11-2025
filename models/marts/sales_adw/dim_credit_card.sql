with 

credit_card as (

    select *
    from {{ ref('int_sales__credit_card') }}
)

select *
from credit_card