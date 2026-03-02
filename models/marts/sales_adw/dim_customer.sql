with 

    customer as (
        select *
        from {{ ref('int_sales__join_customer') }}
    )

    , joined as (

        select 
            c.customer_pk,
            c.person_fk,
            c.store_fk,
            case
                when c.store_name is not null then c.store_name
                else concat_ws(' ',
                    c.person_first_name,
                    c.person_middle_name,
                    c.person_last_name
                ) end as customer_name,

            concat_ws(' ', c.person_first_name, c.person_middle_name, c.person_last_name) as full_person_name,
            c.store_name

        from customer c 
    )

    select *
    from joined