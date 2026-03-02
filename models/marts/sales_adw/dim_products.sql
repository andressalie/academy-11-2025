with

    products as (
        select *
        from {{ ref('int_sales__join_product') }}
    )

    select *
    from products