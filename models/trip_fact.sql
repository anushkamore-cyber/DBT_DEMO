WITH Bike as
(
    select
    RIDE_ID,
    RIDEABLE_TYPE,
    DATE(To_timestamp(Started_At)) as TRIP_DATE,
    start_statio_id as start_station_id,
    end_station_id,
    member_csual as member_casual, 
    timestampdiff(second,To_timestamp(Started_At)  ,  To_timestamp(ended_at )) as Trip_Duration_seconds
    from {{ source('demo', 'bike') }} 

    where RIDE_ID != 'ride_id'

    limit 10
)

select * from bike