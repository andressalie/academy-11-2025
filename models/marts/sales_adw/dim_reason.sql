with 
    reason as (
        select *
        from {{ ref('int_sales__join_reason') }}
    )

    select *
    from reason