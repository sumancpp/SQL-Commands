CREATE TABLE Members (
    rollno INT PRIMARY KEY,
    name VARCHAR2(50),
    city VARCHAR2(50),
    mobno VARCHAR2(15)
);

INSERT INTO Members VALUES (1, 'X', 'Howrah', '9876543210');
INSERT INTO Members VALUES (2, 'Y', 'Kolkata', '9876543220');
INSERT INTO Members VALUES (3, 'Z', 'Delhi', '9876543230');

SELECT * FROM Members;

CREATE VIEW V1_Members AS SELECT name, city FROM Members;

SELECT * FROM V1_Members;//Cannot insert (no primary key)

CREATE VIEW V2_Members AS SELECT rollno, name FROM Members;
SELECT * FROM V2_Members;

INSERT INTO V2_Members VALUES (4, 'ABC');

CREATE TABLE Teacher (
    empno INT PRIMARY KEY,
    ename VARCHAR(50),
    salary INT
);

INSERT INTO Teacher VALUES (101, 'Ram', 10000);
INSERT INTO Teacher VALUES (102, 'Shyam', 15000);

SELECT * FROM teacher

CREATE VIEW V_Teacher AS SELECT ename, salary * 100 AS salary_mul FROM Teacher;
SELECT * FROM V_Teacher;


CREATE TABLE Bank (
    bankid INT PRIMARY KEY,
    bankname VARCHAR(50),
    branch VARCHAR(50),
    asset INT
);

INSERT INTO Bank VALUES (1, 'SBI', 'KOL', 50);
INSERT INTO Bank VALUES (2, 'SBI', 'HOW', 60);
INSERT INTO Bank VALUES (3, 'HDFC', 'KOL', 70);
INSERT INTO Bank VALUES (4, 'ICICI', 'HOW', 75);

SELECT * FROM Bank

SELECT branch, SUM(asset) FROM Bank GROUP BY branch;
SELECT branch, SUM(asset) FROM Bank GROUP BY branch HAVING SUM(asset) > 125;


//Deletes table and its data permanently
DROP TABLE Members;
DROP TABLE teacher;
DROP TABLE Bank;








