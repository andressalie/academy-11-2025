with 

source as (

    select 
        salesreasonid,
        name,
        reasontype

    from {{ source('adw', 'sales_salesreason') }}

),

renamed as (

    select
        cast(salesreasonid as int) as reason_pk,
        cast(name as string) as reason_name,
        cast(reasontype as string) as reason_type

    from source

)

select * from renamed