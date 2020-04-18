-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "anime" (
    "id" int   NOT NULL,
    "title" varchar   NOT NULL,
    "episodes" int   NOT NULL
);

CREATE TABLE "source" (
    "id" int   NOT NULL,
    "source_name" varchar   NOT NULL
);

CREATE TABLE "rating" (
    "id_anime" int   NOT NULL,
    "id_source" int   NOT NULL,
    "rating" int   NOT NULL
);

CREATE TABLE "genre" (
    "id" int   NOT NULL,
    "genre_name" varchar   NOT NULL
);

CREATE TABLE "genre_anime" (
    "id_anime" int   NOT NULL,
    "id_genre" int   NOT NULL
);

ALTER TABLE "rating" ADD CONSTRAINT "fk_rating_id_anime" FOREIGN KEY("id_anime")
REFERENCES "anime" ("id");

ALTER TABLE "rating" ADD CONSTRAINT "fk_rating_id_source" FOREIGN KEY("id_source")
REFERENCES "source" ("id");

ALTER TABLE "genre_anime" ADD CONSTRAINT "fk_genre_anime_id_anime" FOREIGN KEY("id_anime")
REFERENCES "anime" ("id");

ALTER TABLE "genre_anime" ADD CONSTRAINT "fk_genre_anime_id_genre" FOREIGN KEY("id_genre")
REFERENCES "genre" ("id");

delete from anime;
select * from anime;

delete from genre;
select * from genre;

