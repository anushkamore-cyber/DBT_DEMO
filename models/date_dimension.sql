with CTE AS
(
select 
To_timestamp(started_at) as Started_At,
Date(To_timestamp(started_at)) as Date_Started_At,
HOUR(To_timestamp(started_at)) as Hour_Started_At,
case
when DayName(To_timestamp(started_at)) in ('Sat','Sun') 
then 'WEEKEND'
else 'BUSINESSDAY'
END as DayType,

case
when MONTH(To_timestamp(started_at)) in (12,1,2) 
then 'WINTER'
when MONTH(To_timestamp(started_at)) in (3,4,5) 
then 'SPRING'
when MONTH(To_timestamp(started_at)) in (6,7,8) 
then 'SUMMER'
else 'AUTUMN'
END as STATION_OF_YEAR,




from  {{ source('demo', 'bike') }} 
where started_at != 'started_at'

)

select * from CTE