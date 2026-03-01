with 

source as (

    select 
    salesorderid, 
    salesorderdetailid,
    productid,
    specialofferid,
    orderqty,
    unitprice,
    unitpricediscount
    
    from {{ source('adw', 'sales_salesorderdetail') }}

),

renamed as (

    select
        {{dbt_utils.generate_surrogate_key(['salesorderid','productid'])}} as order_details_sk,
        cast(salesorderid as int) as order_fk,
        cast(salesorderdetailid as int) as order_details_fk,
        cast(productid as int) as product_fk,
        cast(specialofferid as int) as specialoffer_fk,

        cast(orderqty as int) as order_qty,
        cast(unitprice as float) as unit_price,
        cast(unitpricediscount as float) as unit_price_discount
        

    from source

)

select * from renamed