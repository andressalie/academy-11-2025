with 

source as (

    select 
        productid,
        name,
        /*productnumber,
        makeflag,
        finishedgoodsflag,
        color,
        safetystocklevel,
        reorderpoint,
        standardcost,
        listprice,
        size,
        sizeunitmeasurecode,
        weightunitmeasurecode,
        weight,
        daystomanufacture,
        productline,
        class,*/
        --style,
        productsubcategoryid
        /*productmodelid,
        sellstartdate,
        sellenddate,
        discontinueddate,
        rowguid,
        modifieddate*/
        
         from {{ source('adw', 'production_product') }}

),

renamed as (

    select
        cast(productid as int) as product_pk,
        
        cast(productsubcategoryid as int) as product_subcategory_fk,

        cast(name as string) as product_name
        
    from source

)

select * from renamed