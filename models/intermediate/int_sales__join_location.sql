with

    country as (
        select *
        from {{ ref('stg_adw__country') }}
    )

    , state as (
        select *
        from {{ ref('stg_adw__state') }} 
    )

    , city as (
        select *
        from {{ ref('stg_adw__city') }}
    )

    , joined as (
        select 
            s.country_fk,
            c.state_fk,
            c.address_pk,
            
            t.country_name,
            s.state_name,
            c.city_name


        from city c
        left join state s on c.state_fk = s.state_pk
        left join country t on s.country_fk = t.country_pk 
    )

    select *
    from joined