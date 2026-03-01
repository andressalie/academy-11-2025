with 
    header_reason as (
        select *
        from {{ ref('stg_adw__headersalesreason') }}
    )

    , reason as (
        select *
        from {{ ref('int_sales__reason') }}
    )

    , joined as (
        select 
            hr.order_fk,
            hr.reason_fk,
            r.reason_name,
            r.reason_type
        from header_reason hr
        left join reason r on hr.reason_fk = r.reason_pk
    )

    select *
    from joined