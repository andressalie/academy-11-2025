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
    from {{ ref('int_sales__join_reason') }}
)

, credit_card as (
    select *
    from {{ ref('int_sales__credit_card') }}
)

, customer as (
    select *
    from {{ ref('int_sales__join_customer') }}
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
    
    r.reason_name,
    r.reason_type,

    c.person_first_name,
    c.person_middle_name,
    c.person_last_name,
    c.store_name,

    cc.credit_card_type

    from sales s 
    left join product p on p.product_pk = s.product_fk
    left join dim_location l on s.address_fk = l.address_pk
    left join reason r on s.order_fk = r.order_fk
    left join customer c on s.customer_fk = c.customer_pk
    left join credit_card cc on s.credit_card_fk = cc.credit_card_pk
)

/*select 
    date_trunc('YEAR', order_date) order_year,
    sum(unit_price * order_qty) vendas_brutas,
    sum(total_due) total_due

from joined
--where reason_name = 'On Promotion'
group by 1*/

select
    date_trunc('YEAR', order_date) year_date
    , SUM(unit_price * order_qty) vendas_brutas
from sales
group by 1
