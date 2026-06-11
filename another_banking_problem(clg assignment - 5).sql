-- I. Create BANK table

CREATE TABLE BANK (
    Branchid INT PRIMARY KEY,
    branchname VARCHAR(50),
    city VARCHAR(50),
    asset DECIMAL(12,2)
);

-- Insert 5 records

INSERT INTO BANK VALUES (1, 'Main Branch', 'Kolkata', 5000000);
INSERT INTO BANK VALUES (2, 'Park Street', 'Kolkata', 7000000);
INSERT INTO BANK VALUES (3, 'Howrah Branch', 'Howrah', 4000000);
INSERT INTO BANK VALUES (4, 'Durgapur Branch', 'Durgapur', 6000000);
INSERT INTO BANK VALUES (5, 'Siliguri Branch', 'Siliguri', 3000000);

----------------------------------------------------
-- II. Number of records, Maximum, Minimum,
-- Average and Total Asset
----------------------------------------------------

SELECT COUNT(*) AS Total_Records
FROM BANK;

SELECT MAX(asset) AS Maximum_Asset
FROM BANK;

SELECT MIN(asset) AS Minimum_Asset
FROM BANK;

SELECT AVG(asset) AS Average_Asset
FROM BANK;

SELECT SUM(asset) AS Total_Asset
FROM BANK;

----------------------------------------------------
-- III. City-wise assets of branches
----------------------------------------------------

SELECT city, SUM(asset) AS City_Asset
FROM BANK
GROUP BY city;

----------------------------------------------------
-- IV. Average asset of banks situated at Kolkata
----------------------------------------------------

SELECT AVG(asset) AS Average_Asset
FROM BANK
WHERE city = 'Kolkata';

----------------------------------------------------
-- V. String Functions
----------------------------------------------------

-- LPAD()
SELECT LPAD('BANK', 8, '*') FROM DUAL;

-- RPAD()
SELECT RPAD('BANK', 8, '*') FROM DUAL;

-- LTRIM()
SELECT LTRIM('   BANK') FROM DUAL;

-- RTRIM()
SELECT RTRIM('BANK   ') FROM DUAL;

-- SUBSTR()
SELECT SUBSTR('KOLKATA', 1, 4) FROM DUAL;

----------------------------------------------------
-- VI. Branches having asset more than
-- average asset of all branches
----------------------------------------------------

SELECT branchname, asset
FROM BANK
WHERE asset >
      (SELECT AVG(asset)
       FROM BANK);
