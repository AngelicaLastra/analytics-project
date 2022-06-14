with 

regions as (

    select * from {{ ref('stg_san_francisco_bike_share__bikeshare_regions') }}

),

station_status as (

    select * from {{ ref('stg_san_francisco_bike_share__bikeshare_station_status') }}

),

stations_info as (

    select * from {{ ref('stg_san_francisco_bike_share__bikeshare_station_info') }}

),

station_info_joined as (

    select
        station_status.station_id,
        station_status.number_bikes_available,
        station_status.number_bikes_disabled,
        station_status.number_ebikes_availables,
        station_status.number_docks_available,
        station_status.number_docks_disabled,
        station_status.is_operational,
        station_status.is_renting_bikes,
        station_status.is_accepting_bike_returns,
        station_status.last_reported_status_at,
        stations_info.station_name,
        stations_info.shortened_station_name,
        stations_info.rental_methods,
        stations_info.station_docking_capacity,
        stations_info.has_kiosk,
        regions.region_name,
        case when stations_info.rental_methods like '%creditcard%' then true else false end as has_credit_card_payment_enabled,
        case when stations_info.rental_methods like '%key%' then true else false end as has_key_fob_payment_enabled,
        case when (station_status.number_bikes_disabled /  stations_info.station_docking_capacity) > .5 
            then true else false end as has_high_disabled_bike_rate

    from station_status
    left join stations_info
        on station_status.station_id = stations_info.station_id
    left join regions
        on stations_info.region_id = regions.region_id
)

select * from station_info_joined