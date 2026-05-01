select mg.name, count(aaz.artist_id)
from music_genre mg
join artist_and_zhanr aaz on mg.id = aaz.genre_id 
group by mg.name;

select count(*)
from track t 
join album a on t.album_id = a.id 
where a.release_year >= 2019 and a.release_year <= 2020;

select a.title, ROUND(AVG(t.duration ), 2)
from album a
join track t  on a.id = t.album_id  
group by a.title 
order by a.title;

SELECT name 
FROM artist 
WHERE name NOT IN (
    SELECT a.name 
    FROM artist a
    JOIN artist_and_album aa ON a.id = aa.artist_id
    JOIN album alb ON aa.album_id = alb.id
    WHERE alb.release_year = 2020
);

SELECT DISTINCT c.name
FROM collections c
JOIN collection_and_track cat ON c.id = cat.collection_id
JOIN track t ON cat.track_id = t.id
JOIN album alb ON t.album_id = alb.id
JOIN artist_and_album aa ON alb.id = aa.album_id
JOIN artist art ON aa.artist_id = art.id
WHERE art.name = 'Paco de Lucia';
