with 

source as (

    select 
        productcategoryid
        , name
        --, rowguid
        --, modifieddate
    from {{ source('adw', 'production_productcategory') }}

),

renamed as (

    select
        cast(productcategoryid as int) product_category_pk
        , cast(name as string) product_category_name
        

    from source

)

select * from renamed