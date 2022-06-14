with 

source as (
    select * from {{ source('san_francisco_bike_share','bikeshare_station_info') }}
    limit 100
),

renamed as (
    select
        -- ids
        station_id,
        region_id,

        -- strings
        name as station_name,
        short_name as shortened_station_name,
        lat as station_latitude,
        lon as station_longitude,
        rental_methods,

        -- numerics
        capacity as station_docking_capacity,

        -- booleans
        has_kiosk
        
    from source
)

select * from renamed