with

    product as (
        select *
        from {{ ref('stg_adw__product') }}
    )
    , subcategory as (
        select *
        from {{ ref('stg_adw__productsubcategory') }}
    )
    , category as (
        select *
        from {{ ref('stg_adw__productcategory') }}
    )
    
    , joined as (
        select
            p.product_pk,
            p.product_subcategory_fk,
            sc.product_category_fk,

            p.product_name,
            sc.product_subcategory_name,
            c.product_category_name

        from product p
        left join subcategory sc on p.product_subcategory_fk = sc.product_subcategory_pk
        left join category c on sc.product_category_fk = c.product_category_pk

    )

select * from joined