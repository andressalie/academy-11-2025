with 

source as (

    select 
        productsubcategoryid
        , productcategoryid
        , name
        --, rowguid
        --, modifieddate
    
    from {{ source('adw', 'production_productsubcategory') }}

),

renamed as (

    select
        cast(productsubcategoryid as int) as product_subcategory_pk
        , cast(productcategoryid as int) as product_category_fk
        , cast(name as string) as product_subcategory_name

    from source

)

select * from renamed