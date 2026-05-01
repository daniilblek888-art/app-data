SELECT title, duration
FROM track
ORDER BY duration DESC
LIMIT 1

select title, duration
from track
where duration >= 210

select name, release_year
from collections
where 2017 < release_year and release_year < 2021;

select name
from artist
where name not like '% %'

select title 
from track
where title ILIKE '%мой%' or title ILIKE '%my%';
