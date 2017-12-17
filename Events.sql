select 
	events.ID as 'EventId',
	events.ShortName as 'Slug',
	translations.Name as 'Title',
	'gdakon' as 'ConferenceTrack',
	translations.Description as 'Abstract',
	translations.Description as 'Description',
	events.EndTime as 'ConferenceDay',
	events.EndTime as 'ConferenceDayName',
	events.StartTime as 'StartTime',
	events.EndTime as 'EndTime',
	DATEDIFF(MINUTE, events.StartTime, events.EndTime) as 'Duration',
	locations.ShortName as 'ConferenceRoom',
	organizers.Organizer as 'PanelHosts'
from Events as events
left outer join EventsTranslations as translations on translations.EventID = events.ID
left outer join EventOrganizers as organizers on organizers.EventID = events.ID
left outer join EventsLocations as locations on locations.ID = events.Location
where translations.Language = '86DE0A88-7DBA-49FD-8F82-AA7499E4E2AD';