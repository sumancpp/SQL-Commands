CREATE TABLE student (
    rollno NUMBER(2) PRIMARY KEY,
    name VARCHAR2(20),
    address VARCHAR2(40),
    dob DATE
);

DESC student;
INSERT INTO student VALUES (1, 'Suman', 'Khanakul', DATE '2004-04-04');
INSERT INTO student VALUES (2, 'Amit', 'Howrah', DATE '2003-01-15');
SELECT * FROM student;
SELECT name, address FROM student;
UPDATE student SET address = 'Kolkata' WHERE rollno = 1;
DELETE FROM student;
DROP TABLE student;
SELECT * FROM tab;
ALTER TABLE student ADD passportno NUMBER(12) UNIQUE;
INSERT INTO student VALUES (3, 'Nayan', 'Uluberia', DATE '2004-04-04', 1223456786);
INSERT INTO student VALUES (4, 'Riju', 'Arambagh', DATE '2005-05-05',  8654361223);
ALTER TABLE student DROP COLUMN address;
