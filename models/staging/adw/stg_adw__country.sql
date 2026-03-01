with 

source as (

    select 
        territoryid,
        name
        
    from {{ source('adw', 'sales_salesterritory') }}

),

renamed as (

    select distinct
        cast(territoryid as int) as country_pk,
        cast(name as string) as country_name
        

    from source

)

select * from renamed