--Название и продолжительность самого длительного трека
select title, duration
from tracks
order by duration desc
limit 1;

--Название треков, продолжительность которых не менее 3,5 минут
select title
from tracks
where duration >= '00:03:30';

--Названия сборников, вышедших в период с 2018 по 2020 год включительно
select title
from collections
where release_year between 2018 and 2020;

--Исполнители, чьё имя состоит из одного слова
select name
from artists
where name not like '% %';

--Название треков, которые содержат слово «мой» или «my»
select title
from tracks
where title ilike 'мой %'
	or title ilike '% мой %'
	or title ilike '% мой'
	or title ilike 'мой'
	or title ilike 'my %'
	or title ilike '% my %'
	or title ilike '% my'
	or title ilike 'my';

--Количество исполнителей в каждом жанре
select g.name as genre_name, count(ag.artist_id) as artist_count
from Genres g
join Artist_Genre ag on g.id = ag.genre_id
group by g.name;

--Количество треков, вошедших в альбомы 2019–2020 годов
select count(*) as track_count
from tracks t
join albums a on t.album_id = a.id
where a.release_year between 2019 and 2020;

--Средняя продолжительность треков по каждому альбому
select a.title as album_title, AVG(extract(epoch from t.duration)) / 60 as average_duration_minutes
from albums a
join tracks t on a.id = t.album_id
group by a.title;

--Все исполнители, которые не выпустили альбомы в 2020 году
select a.name as artist_name
from artists a
where a.id not in (
	select aa.artist_id
	from artist_album aa
	join albums al on aa.album_id = al.id
	where al.release_year = 2020
);

--Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами). Допустим, мы выбираем исполнителя с artist_id = 1 (Ed Sheeran).
select distinct c.title as collection_title
from collections c
join track_collection tc on c.id = tc.collection_id
join tracks t on tc.track_id = t.id
join albums a on t.album_id = a.id
join artist_album aa on a.id = aa.album_id
join artists ar on aa.artist_id = ar.id 
where ar.name ilike '%Ed Sheeran%';

--Названия альбомов, в которых присутствуют исполнители более чем одного жанра
select distinct a.title as album_title
from albums a
join artist_album aa on a.id = aa.album_id
join artist_genre ag on aa.artist_id  = ag.artist_id
group by a.title, aa.artist_id
having count(distinct ag.genre_id) > 1;

--Наименования треков, которые не входят в сборники
select t.title as track_title
from tracks t
left join track_collection tc on t.id = tc.track_id
where tc.track_id is null;

--Исполнитель или исполнители, написавшие самый короткий по продолжительности трек
select distinct a.name as artist_name
from artists a
join artist_album aa on a.id = aa.artist_id 
join albums al on aa.album_id =  al.id
join tracks t on al.id = t.album_id
where t.duration  = (select min(duration) from tracks);

--Названия альбомов, содержащих наименьшее количество треков
select a.title as album_title
from albums a
join tracks t on a.id = t.album_id
group by a.id 
having count(t.id) = (
	select count(t.id)
	from tracks t
	group by t.album_id
	order by count(t.id)
	limit 1
);