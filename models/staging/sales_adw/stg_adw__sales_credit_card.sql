with 

source as (

    select 
        creditcardid,
        cardtype

    from {{ source('adw', 'sales_creditcard') }}

),

renamed as (

    select
        cast(creditcardid as int) as credit_card_pk,
        cast(cardtype as string) as credit_card_type

    from source

)

select * from renamed