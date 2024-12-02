-- Вставка данных в таблицу Genres
insert into Genres (name) values
('Rock'),
('Pop'),
('Jazz');

-- Вставка данных в таблицу Artists
insert into Artists (name) values
('Ed Sheeran'),
('Kamasi Washington'),
('Metallica'),
('Billie Eilish');

-- Вставка данных в таблицу Albums
insert into Albums (title, release_year) values
('Shivers', 2021),
('Fearless Movement', 2024),
('72 Seasons', 2023),
('Where is My Mind Tour', 2018);

-- Вставка данных в таблицу Tracks с продолжительностью в формате "минуты:секунды"
insert into Tracks (title, duration, album_id) values
('First Times', '00:03:05', 1),
('Sandman', '00:04:19', 1),
('The Garden Path', '00:06:40', 2),
('Lines in the Sand', '00:07:26', 2),
('Shadows Follow', '00:06:12', 3),
('Room of Mirrors', '00:05:34', 3),
('My Boy', '00:02:50', 4),
('Six Feet Under', '00:03:09', 4),
('my own', '00:03:00', 1),
('own my', '00:03:00', 1),
('my', '00:03:00', 1),
('oh my god', '00:03:00', 1),
('myself', '00:03:00', 1),
('by myself', '00:03:00', 1),
('bemy self', '00:03:00', 1),
('myself by', '00:03:00', 1),
('by myself by', '00:03:00', 1),
('beemy', '00:03:00', 1),
('premyne', '00:03:00', 1);

-- Вставка данных в таблицу Collections
insert into Collections (title, release_year) values
('Rock and Jazz', 2021),
('Jazz and Pop', 2022),
('Rock and Pop', 2023),
('Rock, Jazz and Pop', 2024);

-- Вставка данных в таблицу Artist_Genre
insert into Artist_Genre (artist_id, genre_id) values
(1, 1),
(1, 2),
(2, 3),
(3, 1),
(4, 2);

-- Вставка данных в таблицу Artist_Album
insert into Artist_Album (artist_id, album_id) values
(1, 1),
(2, 2),
(3, 3),
(4, 4);

-- Вставка данных в таблицу Track_Collection
insert into Track_Collection (track_id, collection_id) values
(1, 1),
(2, 4),
(3, 1),
(3, 4),
(4, 2),
(5, 3),
(6, 4),
(7, 2),
(8, 3);
