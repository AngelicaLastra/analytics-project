with 

source as (
    select * from {{ source('san_francisco_bike_share','bikeshare_station_status') }}
    limit 100
),

renamed as (
    select
        -- ids
        station_id,

        -- numerics
        num_bikes_available as number_bikes_available,
        num_bikes_disabled as number_bikes_disabled,
        num_ebikes_available as number_ebikes_availables,
        num_docks_available as number_docks_available,
        num_docks_disabled as number_docks_disabled,

        -- booleans
        is_installed as is_operational,
        is_renting as is_renting_bikes,
        is_returning as is_accepting_bike_returns,

        -- timestamps
        timestamp_seconds(last_reported) as last_reported_status_at
        
    from source
)

select * from renamed