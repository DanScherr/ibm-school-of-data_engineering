------------------------------------------
-- Relating Departments & Locations
------------------------------------------

-- insert // erro <-- constraint
INSERT INTO DEPARTMENTS VALUES
 ('2','Architect Group','30001','L0001');

-- insert // erro <-- constraint
 INSERT INTO DEPARTMENTS VALUES
 ('3','Caixa 2','30006','L0001');

SELECT * FROM DEPARTMENTS
LEFT JOIN EMPLOYEES
ON DEPARTMENTS.MANAGER_ID = EMPLOYEES.MANAGER_ID