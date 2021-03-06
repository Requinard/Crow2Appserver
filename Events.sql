select 
	ROW_NUMBER() over( order by events.id)  as 'event_id',
	events.ShortName as 'slug',
	translations.Name as 'title',
	'gdakon' as 'conference_track',
	ISNULL(nullif(translations.Description, ''), 'No abstract was provided') as 'abstract',
	isnull(nullif(translations.Description, ''), 'No description was provided') as 'description',
	convert(varchar(25),cast(events.EndTime as date), 126) as 'conference_day',
	DATEPART("DW",events.EndTime) as 'conference_day_name',
	convert(varchar, events.StartTime, 108) as 'start_time',
	convert(varchar,events.EndTime, 108) as 'end_time',
	DATEDIFF(MINUTE, events.StartTime, events.EndTime) as 'duration',
	locations.ShortName as 'conference_room',
	organizers.Organizer as 'pannel_hosts'
from Events as events
left outer join EventsTranslations as translations on translations.EventID = events.ID
left outer join EventOrganizers as organizers on organizers.EventID = events.ID
left outer join EventsLocations as locations on locations.ID = events.Location
where translations.Language = '86DE0A88-7DBA-49FD-8F82-AA7499E4E2AD'
and events.ShortName != 'dancecompetition'
order by event_id;