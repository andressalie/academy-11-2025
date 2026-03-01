with 

    customer as (
        select *
        from {{ ref('stg_adw__customer') }}
    )

    , store as (
        select *
        from {{ ref('stg_adw__store') }}
    )

    , person as (
        select *
        from {{ ref('stg_adw__person') }}
    )

    , joined as (

        select 
            c.customer_pk,
            c.person_fk,
            c.store_fk,
            case
                when s.store_name is not null then s.store_name
                else concat_ws(' ',
                    p.person_first_name,
                    p.person_middle_name,
                    p.person_last_name
                ) end as customer_name,

            concat_ws(' ', person_first_name, person_middle_name, person_last_name) as full_person_name,
            s.store_name



        from customer c 
        left join person p on c.person_fk = p.person_pk
        left join store s on c.store_fk = s.store_pk
    )

    select *
    from joined 