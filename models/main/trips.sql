with 

trips as (

    select * from {{ ref('stg_san_francisco_bike_share__bikeshare_trips') }}

),

final_trips_data as (

    select
        -- ids
        trip_id,
        start_station_id,
        end_station_id,
        bike_id,

        -- strings
        start_station_name,
        end_station_name,
        subscriber_type,

        -- numerics
        trip_duration_seconds,

        -- timestamps
        trip_started_at,
        trip_ended_at
        
    from trips
)

select * from final_trips_data