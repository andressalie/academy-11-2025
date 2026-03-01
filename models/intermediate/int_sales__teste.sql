with sales as (
    select *

    from {{ ref('int_sales__join') }}
)

, product as (
    select * 
    from {{ ref('int_sales__join_product') }}
)

, dim_location as (
    select *
    from {{ ref('int_sales__join_location') }}
)

, reason as (
    select *
    from {{ ref('int_sales__reason') }}
)

, joined as (
    select 
    s.*,
    p.product_name,
    p.product_subcategory_name,
    p.product_category_name,

    l.city_name,
    l.state_name,
    l.country_name,
    
    r.reason_name

    from sales s 
    left join product p on p.product_pk = s.product_fk
    left join dim_location l on s.address_fk = l.address_pk
    left join reason r on s.reason_fk = r.reason_pk
)

select *
from joined
--where reason_name = 'On Promotion'