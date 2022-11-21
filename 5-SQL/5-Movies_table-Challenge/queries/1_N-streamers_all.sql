-- DROP IF EXISTS
DROP TABLE IF EXISTS streamers_titles;


-- CREATING TABLE IF NOT EXISTS
CREATE TABLE IF NOT EXISTS "streamers_titles" 
(   "show_id" SERIAL UNIQUE NOT NULL PRIMARY KEY,
    "platform" VARCHAR(25),
    "type" VARCHAR(10),
    "title" VARCHAR(110),
    "director" VARCHAR(1500),
    "cast" VARCHAR(1500),
    "country" VARCHAR(500),
    "date_added" VARCHAR(20),
    "release_year" SMALLINT,
    "rating" VARCHAR(10),
    "duration" VARCHAR(10),
    "listed_in" VARCHAR(80),
    "description" VARCHAR(1500)
);

-- POPULATING streamers_titles
INSERT INTO streamers_titles 
(   "platform", 
    "type", 
    "title", 
    "director", 
    "cast", 
    "country", 
    "date_added", 
    "release_year", 
    "rating", 
    "duration", 
    "listed_in", 
    "description"
)
SELECT      
            "platform", 
            "type", 
            "title", 
            "director", 
            "cast", 
            "country", 
            "date_added", 
            "release_year", 
            "rating", 
            "duration", 
            "listed_in", 
            "description"
FROM amazon_prime_titles;

INSERT INTO streamers_titles 
(   "platform", 
    "type", 
    "title", 
    "director", 
    "cast", 
    "country", 
    "date_added", 
    "release_year", 
    "rating", 
    "duration", 
    "listed_in", 
    "description")
SELECT 
            "platform", 
            "type", 
            "title", 
            "director", 
            "cast", 
            "country", 
            "date_added", 
            "release_year", 
            "rating", 
            "duration", 
            "listed_in", 
            "description"
FROM disney_plus_titles;

INSERT INTO streamers_titles 
(   "platform", 
    "type", 
    "title", 
    "director", 
    "cast", 
    "country", 
    "date_added", 
    "release_year", 
    "rating", 
    "duration", 
    "listed_in", 
    "description")
SELECT      
            "platform", 
            "type", 
            "title", 
            "director", 
            "cast", 
            "country", 
            "date_added", 
            "release_year", 
            "rating", 
            "duration", 
            "listed_in", 
            "description"
FROM netflix_titles;