----------------------------------------------------
-- I. Create View EMP_CITY1 (Empid, Emp_city)
----------------------------------------------------

CREATE VIEW EMP_CITY1 AS
SELECT Empid, city AS Emp_city
FROM EMPLOYEE;

-- Query data from view
SELECT * FROM EMP_CITY1;

-- Insert through view (possible)
INSERT INTO EMP_CITY1
VALUES (104, 'Kolkata');

-- Update through view (possible)
UPDATE EMP_CITY1
SET Emp_city = 'Howrah'
WHERE Empid = 104;

-- Delete through view (possible)
DELETE FROM EMP_CITY1
WHERE Empid = 104;

----------------------------------------------------
-- II. Create View EMP_CITY2 (Empname, Emp_city)
----------------------------------------------------

CREATE VIEW EMP_CITY2 AS
SELECT ename AS Empname,
       city AS Emp_city
FROM EMPLOYEE;

-- Query data from view
SELECT * FROM EMP_CITY2;

-- Insert through view
INSERT INTO EMP_CITY2
VALUES ('Rita', 'Kolkata');

-- Update through view
UPDATE EMP_CITY2
SET Emp_city = 'Howrah'
WHERE Empname = 'Rita';

-- Delete through view
DELETE FROM EMP_CITY2
WHERE Empname = 'Rita';

----------------------------------------------------
-- III. Create View EMP_PRJ
----------------------------------------------------

CREATE VIEW EMP_PRJ AS
SELECT E.ename, P.pname
FROM EMPLOYEE E
JOIN WORKS W ON E.Empid = W.Eno
JOIN PROJECT P ON W.Pno = P.Pno
WHERE P.plocation = 'Kolkata';

-- Query data from view
SELECT * FROM EMP_PRJ;

-- Insert / Update / Delete
-- Not possible because EMP_PRJ is based on
-- multiple tables (JOIN view).
