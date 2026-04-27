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

select name
from artist  
where id not in (
	select artist_id
	from album 
	where release_year = 2020
	);

select distinct c.name
from  collections c 
join collection_and_track cat on c.id = cat.collection_id 
join track t on cat.collection_id = t.id 
join album a on t.album_id = a.id 
join artist art on a.artist_id = art.id 
where art.name = 'Имя артиста';