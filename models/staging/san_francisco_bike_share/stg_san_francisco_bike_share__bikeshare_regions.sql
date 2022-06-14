with 

source as (
    select * from {{ source('san_francisco_bike_share','bikeshare_regions') }}
    limit 100
),

renamed as (
    select
        -- ids
        region_id,

        -- strings
        name as region_name
        
    from source
)

select * from renamed