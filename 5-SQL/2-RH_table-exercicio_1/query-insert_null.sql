------------------------------------------
-- Relating Departments & Locations
------------------------------------------

-- inner
SELECT * FROM departments AS a
INNER JOIN locations AS b
on a.loc_id = b.loct_id

-- inenr por cross
SELECT * FROM departments
CROSS JOIN locations
WHERE departments.loc_id = locations.loct_id

-- left
SELECT * FROM departments AS a
LEFT JOIN locations AS b
on a.loc_id = b.loct_id

-- left por cross
SELECT * FROM departments AS a
LEFT JOIN locations AS b
on a.loc_id = b.loct_id or a.loc_id != ''

-- right
SELECT * FROM locations AS b
LEFT JOIN departments AS a
on a.loc_id = b.loct_id

-- right
SELECT * FROM departments AS a, locations AS b 
WHERE   a.loc_id = b.loct_id AND (b.LOCT_ID <> '' OR a.LOC_ID = NULL)

