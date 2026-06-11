-- I. Create parent table LABOUR

CREATE TABLE LABOUR (
    empid INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50),
    rate DECIMAL(5,2)
);

-- Create child table LAB_DETAIL

CREATE TABLE LAB_DETAIL (
    empid INT,
    work_date DATE,
    hour INT,
    FOREIGN KEY (empid) REFERENCES LABOUR(empid)
);

-- Insert records into LABOUR

INSERT INTO LABOUR VALUES (101, 'Rahul', 'Howrah', 80);
INSERT INTO LABOUR VALUES (102, 'Amit', 'Kolkata', 90);
INSERT INTO LABOUR VALUES (103, 'Sumit', 'Durgapur', 75);

-- Insert records into LAB_DETAIL

INSERT INTO LAB_DETAIL VALUES (101, '2026-06-01', 8);
INSERT INTO LAB_DETAIL VALUES (102, '2026-06-02', 6);
INSERT INTO LAB_DETAIL VALUES (103, '2026-06-03', 7);

----------------------------------------------------
-- II. Insert a record in child table where parent
-- record does not exist
----------------------------------------------------

INSERT INTO LAB_DETAIL
VALUES (104, '2026-06-04', 5);

-- Result:
-- ERROR: Foreign Key Constraint Violated
-- because empid 104 does not exist in LABOUR.

----------------------------------------------------
-- III. Delete a parent record whose empid exists
-- in child table
----------------------------------------------------

DELETE FROM LABOUR
WHERE empid = 101;

-- Result:
-- ERROR: Cannot delete or update a parent row
-- because related records exist in LAB_DETAIL.

----------------------------------------------------
-- IV. If ON DELETE CASCADE is used
----------------------------------------------------

CREATE TABLE LAB_DETAIL (
    empid INT,
    work_date DATE,
    hour INT,
    FOREIGN KEY (empid)
    REFERENCES LABOUR(empid)
    ON DELETE CASCADE
);

-- Now if:
-- DELETE FROM LABOUR WHERE empid = 101;

-- Then all rows in LAB_DETAIL having empid = 101
-- will be automatically deleted.

----------------------------------------------------
-- V. Restrict rate so that rate > 100
-- cannot be inserted
----------------------------------------------------

ALTER TABLE LABOUR
ADD CONSTRAINT chk_rate
CHECK (rate <= 100);

-- Example (will fail)

INSERT INTO LABOUR
VALUES (104, 'Rita', 'Kolkata', 120);

-- Result:
-- ERROR: CHECK constraint violated.
