with 

source as (

    select 
        businessentityid,
        name,
        salespersonid,
        demographics,
        rowguid,
        modifieddate

    from {{ source('adw', 'sales_store') }}

),

renamed as (

    select
        cast(businessentityid as int) as store_pk,
        cast(salespersonid as int) as salesperson_fk,

        cast(name as string) as store_name
        

    from source

)

select * from renamed