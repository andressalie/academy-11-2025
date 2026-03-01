with 

source as (

    select 
        stateprovinceid,
        territoryid,

        stateprovincecode,
        countryregioncode,
        name

    from {{ source('adw', 'person_stateprovince') }}

),

renamed as (

    select distinct
        cast(stateprovinceid as int) as state_pk,
        cast(countryregioncode as string) as country_fk,
        
        cast(name as string) as state_name
        
    from source
)

select * from renamed