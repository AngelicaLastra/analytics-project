with 

source as (
    select * from {{ source('san_francisco_bike_share','bikeshare_trips') }}
    limit 100
),

renamed as (
    select
        -- ids
        trip_id,
        start_station_id,
        end_station_id,
        bike_number as bike_id,

        -- strings
        start_station_name,
        end_station_name,
        zip_code as subscriber_home_zip_code,
        subscriber_type,
        c_subscription_type,
        member_gender,

        -- numerics
        duration_sec as trip_duration_seconds,
        member_birth_year,

        -- timestamps
        start_date as trip_started_at,
        end_date as trip_ended_at
        
    from source
)

select * from renamed