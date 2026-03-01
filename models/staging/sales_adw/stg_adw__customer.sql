with 

source as (

    select 
        customerid,
        personid,
        storeid,
        territoryid
        
    from {{ source('adw', 'sales_customer') }}

),

renamed as (

    select
        cast(customerid as int) as customer_pk,
        cast(personid as int) as person_fk,
        cast(storeid as int) as store_fk,
        cast(territoryid as int) as territory_fk
        
    from source
)

select * from renamed