{{ config(
    materialized='table'
) }}

with date_spine as (

    {{ dbt_utils.date_spine(
        datepart="day",
        start_date="cast('2015-01-01' as date)",
        end_date="cast('2030-12-31' as date)"
    ) }}

),

base as (

    select
        date_day as date

    from date_spine

),

final as (

    select
        cast(date_format(date, 'yyyyMMdd') as bigint) as date_sk,

        date,

        year(date) as year,
        month(date) as month,
        day(date) as day,

        date_format(date, 'yyyy-MM') as year_month,

        date_format(date, 'MMMM') as month_name,
        date_format(date, 'EEEE') as day_name,

        quarter(date) as quarter,
        weekofyear(date) as week_of_year,
        dayofweek(date) as day_of_week,

        case 
            when dayofweek(date) in (1,7) then true
            else false
        end as is_weekend,

        case 
            when date = current_date() then true
            else false
        end as is_today,

        case
            when year(date) = year(current_date())
             and month(date) = month(current_date())
            then true
            else false
        end as is_current_month

    from base

)


select * from final
