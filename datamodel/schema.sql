--------------------------------
-- Based on the exported file from QuickDBD: https://www.quickdatabasediagrams.com/

drop table if exists genre_anime;
drop table if exists rating;
drop table if exists genre;
drop table if exists source_site;
drop table if exists anime;

create table "anime" (
    "id" serial primary key,
    "title" varchar,
    "episodes" int
);


create table "source_site" (
    "id" serial primary key,
    "source_name" varchar
);

create table "genre" (
    "id" serial primary key,
    "genre_name" varchar
);

create table "rating" (
    "id" serial primary key,
    "id_anime" int,
    "id_source" int,
    "rating" int,
    foreign key("id_anime")
    references "anime" ("id"),
    foreign key("id_source")
    references "source_site" ("id")
);

create table "genre_anime" (
    "id_anime" int,
    "id_genre" int,
    foreign key("id_anime")
    references "anime" ("id"),
    foreign key("id_genre")
    references "genre" ("id")
);

--------------------------------
-- Added source_site values manually

insert into source_site (source_name)
values ('Crunchyroll'),
		('MyAnimeList');

--------------------------------		
-- Query ran to verify information

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
