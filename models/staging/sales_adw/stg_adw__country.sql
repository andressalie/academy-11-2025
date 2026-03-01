with 

source as (

    select 
        countryregioncode,
        name
        
    from {{ source('adw', 'person_countryregion') }}

),

renamed as (

    select distinct
        cast(countryregioncode as string) as country_pk,
        cast(name as string) as country_name
        

    from source
    where countryregioncode is not null

)

select * from renamed