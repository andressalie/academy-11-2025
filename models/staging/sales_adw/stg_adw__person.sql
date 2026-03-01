with 

source as (

    select 
        businessentityid,
        firstname,
        middlename,
        lastname
        
    from {{ source('adw', 'person_person') }}

),

renamed as (

    select
        cast(businessentityid as int) as person_pk,
        cast(firstname as string) as person_first_name,
        cast(coalesce(middlename, '') as string) as person_middle_name,
        cast(lastname as string) as person_last_name

    from source

)

select * from renamed