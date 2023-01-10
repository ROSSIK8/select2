create table if not exists genres(
	id serial primary key,
	name varchar(40) not null
);


create table if not exists artists(
	id serial primary key,
	name varchar(40) not null
);


create table if not exists genre_artist(
	id serial primary key,
	artist_id integer references artists(id),
	genre_id integer references genres(id)
);


create table if not exists albums(
	id serial primary key,
	name varchar(40) not null,
	year integer
);


create table if not exists artist_album(
	id serial primary key,
	artist_id integer references artists(id),
	album_id integer references albums(id)
);


create table if not exists tracks(
	id serial primary key,
	name varchar(40) not null,
	duration_min float,
	album_id integer references albums(id)
);


create table if not exists collections(
	id serial primary key,
	name varchar(40) not null,
	year integer
);


create table if not exists tracks_collection(
	id serial primary key,
	track_id integer references tracks(id),
	collection_id integer references collections(id)
);



