create table if not exists genres(
	id serial primary key,
	name varchar(40) not null
);


insert into genres(id, name)
values(1, 'rock'), (2, 'hip-hop'), (3, 'rap'), (4, 'jazz'), (5, 'pop');


create table if not exists artists(
	id serial primary key,
	name varchar(40) not null
);


insert into artists
values(1, 'Drake '), (2, 'XXXTENTACION'), (3, 'Coldplay '), 
(4, 'Steve Lacy'), (5, 'Snoop Dogg'), (6, 'Ariana Grande'), 
(7, 'Billie Eilish'), (8, 'Eminem'), (9, 'Larry Carlton'),
(10, 'Tak Matsumoto');


create table if not exists genre_artist(
	id serial primary key,
	artist_id integer references artists(id),
	genre_id integer references genres(id)
);


insert into genre_artist
values(1, 1, 2), (2, 1, 3), (3, 2, 2), (4, 2, 3),
(5, 3, 1), (6, 4, 4), (7, 5, 2), (8, 5, 3),
(9, 6, 5), (10, 7, 5), (11, 8, 2), (12, 8, 3),
(13, 8, 5), (14, 9, 4), (15, 10, 1)


create table if not exists albums(
	id serial primary key,
	name varchar(40) not null,
	year integer
);

insert into albums
values(1, 'Her Loss', 2022), (2, '17', 2017), (3, 'Parachutes', 2000), 
(4, 'Gemini Rights', 2022), (5, 'Tha Blue Carpet Treatment', 2006), (6, 'Santa Tell Me', 2014), 
(7, 'Happier Than Ever', 2021), (8, 'The Eminem Show', 2002), (9, 'Take Your Pick', 2010);


create table if not exists artist_album(
	id serial primary key,
	artist_id integer references artists(id),
	album_id integer references albums(id)
);


insert into artist_album
values(1, 1, 1), (2, 2, 2), (3, 3, 3),
(4, 4, 4), (5, 5, 5), (6, 6, 6),
(7, 7, 7), (8, 8, 8), (9, 9, 9), (10, 10, 9)


create table if not exists tracks(
	id serial primary key,
	name varchar(40) not null,
	duration float,
	album_id integer references albums(id)
);



insert into tracks
values (1, 'Rich Flex', 3.59, 1), (2, 'Major Distribution', 4.23, 1), (3, 'Jocelyn Flores', 1.59, 2),
(4, 'The Explanation', 1.00, 2), (5, 'Don’t Panic', 2.17, 3), (6, 'Shiver', 4.55, 3),
(7, 'Static', 3.02, 4), (8, 'Helmet', 2.34, 4), (9, 'Intrology', 2.06, 5),
(10, 'Think About It', 4.27, 5), (11, 'Santa tell me', 3.18, 6), (12, 'Last Christmas', 3.25, 6),
(13, 'Getting Older', 3.55, 7), (14, 'I Didn_t Change My Number', 3.14, 7), (15, 'White America', 4.59, 8),
(16, 'Business', 4.07, 8), (17, 'Savoy Orphans', 3.01, 9), (18, 'The Clouds in the Sky', 3.07, 9);


create table if not exists collections(
	id serial primary key,
	name varchar(40) not null,
	year integer
);


insert into collections
values (1, 'Сollection 1', 2015), (2, 'Сollection 2', 2023), (3, 'Сollection 3', 2022),
(4, 'Сollection 4', 2016), (5, 'Сollection 5', 2017), (6, 'Сollection 6', 2020),
(7, 'Сollection 7', 2018), (8, 'Сollection 8', 2018), (9, 'Сollection 9', 2019)


create table if not exists tracks_collection(
	id serial primary key,
	track_id integer references tracks(id),
	collection_id integer references collections(id)
);


insert into tracks_collection
values (1, 1, 1), (2, 3, 1), (3, 2, 2),
(4, 4, 2), (5, 5, 3), (6, 7, 3),
(7, 6, 4), (8, 8, 4), (9, 9, 5),
(10, 11, 5), (11, 10, 6), (12, 12, 6),
(13, 13, 7), (14, 15, 7), (15, 14, 8),
(16, 16, 8), (17, 17, 9), (18, 18, 9);



