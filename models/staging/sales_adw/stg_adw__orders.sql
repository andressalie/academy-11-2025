with
    source_orders as (
        select 
            salesorderid
            , customerid
            , territoryid
            , salespersonid
            , creditcardid

            , orderdate
            --, duedate
            , shipdate
            , status
            
            , freight
            , totaldue

        from {{ source('adw', 'sales_salesorderheader') }}
        --__source
    )

, renamed as (
    select 
        cast(salesorderid as int) as order_pk
        , cast(customerid as int) as customerid_fk
        , cast(territoryid as int) as territoryid_fk
        , cast(salespersonid as int) as salesorderid_fk
        , cast(creditcardid as int) as creditcardid_fk

        , cast(orderdate as date) as order_date
        , cast(shipdate as date) as ship_date

        , cast(status as int) as order_status
        , cast(totaldue as float) as total_due
        , cast(freight as float) as freight

    from source_orders
)

select *

from renamed