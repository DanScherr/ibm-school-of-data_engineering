SELECT  "show_id",
        EXTRACT(day from "iso_date_1") as "day"
FROM disney_plus_titles;