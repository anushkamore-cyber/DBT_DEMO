{% macro get_season(dt)%}

case
when MONTH(To_timestamp({{dt}})) in (12,1,2) 
then 'WINTER'
when MONTH(To_timestamp({{dt}})) in (3,4,5) 
then 'SPRING'
when MONTH(To_timestamp({{dt}})) in (6,7,8) 
then 'SUMMER'
else 'AUTUMN'
end

{% endmacro%}



{% macro get_daytype(dt)%}
case
when DayName(To_timestamp({{dt}})) in ('Sat','Sun') 
then 'WEEKEND'
else 'BUSINESSDAY'
END
{% endmacro%}