with sales_detail as (
    select *

    from {{ ref('stg_adw__orderdetail') }}
)

, sales as (
    select *
    from {{ ref('stg_adw__orders') }}
)

select
    date_trunc('YEAR', s.order_date) year_date
    , SUM(d.unit_price * d.order_qty) vendas_brutas
from sales_detail d
left join sales s on d.order_fk = s.order_pk
group by 1