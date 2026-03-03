with

    dim_location as (
        select *
        from {{ ref('int_sales__join_location') }}
    )

    select *
    from dim_location