with 

source as (

    select 
        salesorderid,
        salesreasonid,
        modifieddate
        
    from {{ source('adw', 'sales_salesorderheadersalesreason') }}

),

renamed as (

    select
        cast(salesorderid as int) as order_fk,
        cast(salesreasonid as int) as reason_fk

    from source

)

select * from renamed