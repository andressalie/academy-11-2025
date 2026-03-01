with 

source as (

    select 
        addressid,
        stateprovinceid,
        city

    from {{ source('adw', 'person_address') }}

),

renamed as (

    select distinct
        cast(addressid as int) as address_pk,
        cast(stateprovinceid as int) as state_fk,
        cast(city as string) as city_name

    from source

)

select * from renamed