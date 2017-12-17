select 
	users.UniqueNumber as 'RegNo',
	users.UserName as 'Nickname',
	users.UserName as 'DisplayName',
	'' as 'WebsiteUrl',
	'' as 'Merchandise',
	'' as 'ShortDescription',
	'' as 'AboutTheArtist',
	'' as 'AboutTheArt',
	'' as 'ArtPreviewCaption'
from Dealers as dealers
left outer join Users as users on users.UserId= dealers.UserId;