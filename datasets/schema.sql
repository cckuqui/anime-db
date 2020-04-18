-- Base on the exported file from QuickDBD: https://www.quickdatabasediagrams.com/

----------------------

drop table if exists genre_anime;
drop table if exists rating;
drop table if exists genre;
drop table if exists source_site;
drop table if exists anime;

CREATE TABLE "anime" (
    "id" serial primary key,
    "title" varchar,
    "episodes" int
);


CREATE TABLE "source_site" (
    "id" serial primary key,
    "source_name" varchar
);

CREATE TABLE "genre" (
    "id" serial primary key,
    "genre_name" varchar
);

CREATE TABLE "rating" (
    "id" serial primary key,
    "id_anime" int,
    "id_source" int,
    "rating" int,
    FOREIGN KEY("id_anime")
    REFERENCES "anime" ("id"),
    FOREIGN KEY("id_source")
    REFERENCES "source_site" ("id")
);

CREATE TABLE "genre_anime" (
    "id_anime" int,
    "id_genre" int,
    FOREIGN KEY("id_anime")
    REFERENCES "anime" ("id"),
    FOREIGN KEY("id_genre")
    REFERENCES "genre" ("id")
);

insert into source_site (source_name)
values ('Crunchyroll'),
		('MyAnimeList');
		

select 
	a.title, 
 	ss.source_name, 
	r.rating
from anime a 
left join rating r
on a.id = r.id_anime
left join source_site ss
on r.id_source = ss.id
where source_name = 'Crunchyroll';
