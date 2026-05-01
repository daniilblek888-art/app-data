INSERT INTO artist (name) VALUES 
('Paco de Lucia'), 
('Zakk Wylde'), 
('Stevie Ray Vaughan'), 
('Gipsy Kings');

INSERT INTO music_genre (name) VALUES 
('Flamenco'), 
('Rock'), 
('Blues');

INSERT INTO artist_and_zhanr (artist_id, genre_id) VALUES 
((SELECT id FROM artist WHERE name = 'Paco de Lucia'), (SELECT id FROM music_genre WHERE name = 'Flamenco')),
((SELECT id FROM artist WHERE name = 'Zakk Wylde'), (SELECT id FROM music_genre WHERE name = 'Rock')),
((SELECT id FROM artist WHERE name = 'Stevie Ray Vaughan'), (SELECT id FROM music_genre WHERE name = 'Blues')),
((SELECT id FROM artist WHERE name = 'Gipsy Kings'), (SELECT id FROM music_genre WHERE name = 'Flamenco'));

INSERT INTO album (title, release_year) VALUES 
('Entre dos aguas', 1981), 
('Siroco', 1987), 
('Sonic Brew', 1999), 
('Texas Flood', 2020);

INSERT INTO artist_and_album (artist_id, album_id) VALUES 
((SELECT id FROM artist WHERE name = 'Paco de Lucia'), (SELECT id FROM album WHERE title = 'Entre dos aguas')),
((SELECT id FROM artist WHERE name = 'Paco de Lucia'), (SELECT id FROM album WHERE title = 'Siroco')),
((SELECT id FROM artist WHERE name = 'Zakk Wylde'), (SELECT id FROM album WHERE title = 'Sonic Brew')),
((SELECT id FROM artist WHERE name = 'Stevie Ray Vaughan'), (SELECT id FROM album WHERE title = 'Texas Flood'));

INSERT INTO track (title, duration, album_id) VALUES 
('My Way', 250, 1), 
('Track Two', 180, 1), 
('Solo', 300, 2), 
('Blues Song', 210, 4);

INSERT INTO collections (name, release_year) VALUES 
('Best of Guitar', 2021), 
('Rock Classics', 2022);

INSERT INTO collection_and_track (collection_id, track_id) VALUES 
(1, 1), 
(1, 3), 
(2, 4);