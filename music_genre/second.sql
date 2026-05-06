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

--первый вариант выполнения задания "Название треков, которые содержат слово «мой» или «my».":
SELECT title 
FROM track
WHERE string_to_array(lower(title), ' ') && ARRAY['my', 'мой'];

--второй вариант выполнения заданя "Название треков, которые содержат слово «мой» или «my».":
SELECT title 
FROM track
WHERE title ~* '\y(my|мой)\y';