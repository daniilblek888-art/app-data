create table music_genre( 
id SERIAL primary key,
name VARCHAR(100) not null unique
);
	
create table artist(
id serial primary key,
name varchar(100) not null unique
);

create table collections(
id serial primary key,
name varchar(100) not null unique,
release_year integer
);

create table album(
id serial primary key,
title varchar(100),
release_year integer,
artist_id integer references artist(id)
);

create table track(
id serial primary key,
title varchar(100),
duration integer,
album_id integer references album(id)
);

create table artist_and_zhanr(
artist_id integer references artist(id),
genre_id integer references music_genre(id),
primary key (artist_id, genre_id)
);

create table artist_and_album(	
artist_id integer references artist(id),
album_id integer references album(id),
primary key (artist_id, album_id)
);

create table collection_and_track(	
track_id integer references track(id),
collection_id integer references collections(id),
primary key (collection_id, track_id)
);
--Ну я считаю имба получилась