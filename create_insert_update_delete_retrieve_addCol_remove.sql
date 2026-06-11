-- I. Create STUDENT table
CREATE TABLE STUDENT (
    roll_no INT PRIMARY KEY,
    name VARCHAR(50),
    address VARCHAR(100),
    phone_no VARCHAR(15),
    birth_date DATE,
    UNIQUE (name, address)
);

-- II. Insert a record
INSERT INTO STUDENT
VALUES (101, 'Rahul', 'Howrah', '9876543210', '2003-05-15');

-- Update a record
UPDATE STUDENT
SET phone_no = '9999999999'
WHERE roll_no = 101;

-- Delete a record
DELETE FROM STUDENT
WHERE roll_no = 101;

-- III. Retrieve records of students staying at Howrah
SELECT *
FROM STUDENT
WHERE address = 'Howrah';

-- IV. Add extra column father's name
ALTER TABLE STUDENT
ADD father_name VARCHAR(50);

-- V. Remove phone_no column
ALTER TABLE STUDENT
DROP COLUMN phone_no;
