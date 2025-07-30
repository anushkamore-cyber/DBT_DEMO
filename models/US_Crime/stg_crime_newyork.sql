WITH Newyork_Crime as
(
select
*
from {{ source("US_CRIME", 'URBAN_CRIME_INCIDENT_LOG') }} 

where offense_category in ('Theft','Driving Under The Influence')
and city='New York'

)

select 
offense_category,
{{get_season('DATE')}} as SEASON,
{{get_daytype('DATE')}} as DAY_TYPE,
count(offense_category) as NUMBER_OFFENSE
from Newyork_Crime
group by offense_category,SEASON,DAY_TYPE
order by NUMBER_OFFENSE DESC