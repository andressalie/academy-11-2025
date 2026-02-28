with
    reason as (
        select * 
        from {{ ref('stg_adw__salesreason') }}
    )
    
    
    select
        reason_pk,
        reason_name,
        reason_type 
    from reason