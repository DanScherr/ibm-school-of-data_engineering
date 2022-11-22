-- date_table
DROP TABLE IF EXISTS "date_table";

CREATE TABLE IF NOT EXISTS "date_table"
(
    "show_id" INTEGER PRIMARY KEY,
    "day"  SMALLINT,
    "month" SMALLINT,
    "year" SMALLINT,
    "iso_date_1" DATE

    CONSTRAINT "CHECK_DAY_COLUMN" CHECK ("day" < 100),
    CONSTRAINT "CHECK_MONTH_COLUMN" CHECK ("month" < 13),
    CONSTRAINT fk_show_id FOREIGN KEY ("show_id" )
        REFERENCES streamers_titles("show_id")
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- INSERT INTO iso_date_1
INSERT INTO "date_table" ("show_id", "iso_date_1")
    SELECT  "show_id",
            CASE
                WHEN "date_added" = '' THEN NULL
                ELSE to_date("date_added", 'MONTH DD, YYYY')
            END AS "iso_date_1"
    FROM streamers_titles;


-- UPDATE day, month, year, iso_date_2, iso_date_3, iso_date_4
UPDATE 
    "date_table" AS dt
--
SET (  "day",
        "month",
        "year"
    ) =
    (   subquery."day",
        subquery."month",
        subquery."year"
    )
--
FROM
    (SELECT "show_id",
            CASE WHEN "iso_date_1" IS NULL THEN NULL
            ELSE
                DATE_PART('day', iso_date_1)::INTEGER
            END AS day,
            --
            CASE WHEN "iso_date_1" IS NULL THEN NULL
            ELSE
                DATE_PART('month', iso_date_1)::INTEGER 
            END AS month,
            --
            CASE WHEN "iso_date_1" IS NULL THEN NULL
            ELSE
                TO_CHAR(iso_date_1, 'yy')::INTEGER 
            END AS year
            --
    FROM "date_table") AS subquery
    --
    WHERE dt."show_id" = subquery."show_id";


-- SHOW RESULTS
SELECT * FROM "date_table";
