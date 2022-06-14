with 

stations as (

    select * from {{ ref('int_station_info_joined') }}

),

final_station_data as (

    select
        -- ids
        station_id,
        
        -- strings
        station_name,
        region_name,

        -- numerics
        number_bikes_available,
        number_bikes_disabled,
        number_ebikes_availables,
        number_docks_available,
        number_docks_disabled,
        station_docking_capacity,

        -- booleans
        is_operational,
        is_renting_bikes,
        is_accepting_bike_returns,
        has_kiosk,
        has_credit_card_payment_enabled,
        has_key_fob_payment_enabled,
        has_high_disabled_bike_rate,

        -- timestamps
        last_reported_status_at
        
    from stations
)

select * from final_station_data

