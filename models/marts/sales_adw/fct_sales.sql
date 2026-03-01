with 
    sales as (
        select *
        from {{ ref('int_sales__join') }}
    )

    , dimensions as (
        select 
            order_details_sk,
            order_fk,
            product_fk,
            --specialoffer_fk,

            customer_fk,
            --territory_fk,
            sales_person_fk,
            credit_card_fk,
            address_fk,
            
            order_date,
            ship_date,

            order_status,

            order_qty,
            unit_price,
            order_qty * unit_price as gross_total,

            case when unit_price_discount > 0 then true 
                else false end as has_discount,
            unit_price_discount,
            unit_price * (1 - unit_price_discount) * order_qty as net_total,
            coalesce(unit_price, 0) * coalesce(unit_price_discount, 0) * coalesce(order_qty, 0) as order_discount,
            

            total_due,
            freight

        from sales
    )

select *
from dimensions