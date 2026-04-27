INSERT INTO music_genre (name) VALUES ('Rock'), ('Pop'), ('Grunge');

INSERT INTO artist (name) VALUES ('Shaman'), ('Vlad'), ('Kobyak'), ('Macan one');

INSERT INTO album (title, release_year, artist_id) VALUES 
('my_love', 2020, 1), 
('remeber', 2017, 2), 
('habitat', 1997, 3);

INSERT INTO track (title, duration, album_id) VALUES 
('я_русский', 152, 1), 
('бмв_52', 230, 1), 
('lamba', 499, 2), 
('мвтушка_земля', 138, 2), 
('мой_брат', 493, 3), 
('my_vumaga', 489, 3);

INSERT INTO collections (name, release_year) VALUES 
('first', 1998), 
('second', 2001), 
('thired', 2019), 
('thierd', 2020);