-- QUERY 35
-- date_table
DROP TABLE IF EXISTS "date_table";

CREATE TABLE IF NOT EXISTS "date_table"
(
    "id" SERIAL UNIQUE NOT NULL PRIMARY KEY,
    "show_id" VARCHAR(10),
    "day"  SMALLINT,
    "month" SMALLINT,
    "year" SMALLINT,
    "iso_date_1" DATE,
    "iso_date_2" VARCHAR(10),
    "iso_date_3" VARCHAR(10)

    CONSTRAINT "CHECK_DAY_COLUMN" CHECK ("day" < 100),
    CONSTRAINT "CHECK_MONTH_COLUMN" CHECK ("month" < 13)
);

-- INSERT INTO iso_date_1
INSERT INTO "date_table" ("show_id", "iso_date_1")
    SELECT  "show_id",
            CASE
                WHEN "date_added" = '' THEN NULL
                ELSE to_date("date_added", 'MONTH DD, YYYY')
            END AS "iso_date_1"
    FROM disney_plus_titles;

SELECT * FROM "date_table";

-- INSERT INTO day
INSERT INTO "date_table" ("show_id", "day")
    SELECT  "show_id",
            CASE
                WHEN "date_added" = '' THEN NULL
                ELSE to_date("date_added", 'MONTH DD, YYYY')
            END AS "iso_date_1"
    FROM disney_plus_titles
    WHERE date_table."show_id" = disney_plus_titles."show_id";

SELECT * FROM "date_table";

