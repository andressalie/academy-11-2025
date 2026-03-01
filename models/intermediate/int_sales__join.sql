with
    -- import ctes
    order_details as (
        select *
        from {{ ref('stg_adw__orderdetail') }}
    )
    , orders as (
        select *
        from {{ ref('stg_adw__orders') }}
    )
    , header_reason as (
        select *
        from {{ ref('stg_adw__headersalesreason') }}
    )

    -- transformation
    , joined as (
        select
            od.order_details_sk,
            od.order_fk,
            od.product_fk,
            od.specialoffer_fk,

            o.customer_fk,
            o.territory_fk,
            o.sales_person_fk,
            o.credit_card_fk,
            o.address_fk,

            r.reason_fk,
            
            o.order_date,
            o.ship_date,

            o.order_status,

            od.order_qty,
            od.unit_price,
            od.unit_price_discount,
            o.total_due,
            o.freight

        from order_details od
        inner join orders o on od.order_fk = o.order_pk
        left join header_reason r on od.order_fk = r.order_fk
     )

select * from joined