with date_dimension AS
(
select 

To_timestamp(started_at) as Started_At,

Date(To_timestamp(started_at)) as Date_Started_At,

HOUR(To_timestamp(started_at)) as Hour_Started_At,

{{ get_daytype('started_at')}} as DayType,

{{ get_season('started_at')}} as STATION_OF_YEAR,

from  {{ source('demo', 'bike') }} 
where started_at != 'started_at'

)

select * from date_dimension