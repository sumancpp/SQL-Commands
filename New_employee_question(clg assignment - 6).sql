-- Create EMP table

CREATE TABLE EMP (
    EMPNO VARCHAR(10),
    FNAME VARCHAR(50),
    DEPT VARCHAR(20)
);

-- Insert records

INSERT INTO EMP VALUES ('E1', 'Amit', 'CSE');
INSERT INTO EMP VALUES ('E2', 'Sumit', 'ECE');
INSERT INTO EMP VALUES ('E1', 'Amit', 'CSE');
INSERT INTO EMP VALUES ('E3', 'Ram', 'ME');

----------------------------------------------------
-- I. Create index on EMPNO
----------------------------------------------------

CREATE INDEX idx_empno
ON EMP(EMPNO);

----------------------------------------------------
-- II. Create index on (FNAME, DEPT)
----------------------------------------------------

CREATE INDEX idx_fname_dept
ON EMP(FNAME, DEPT);

----------------------------------------------------
-- III. Queries that use the indexes
----------------------------------------------------

-- Uses idx_empno
SELECT *
FROM EMP
WHERE EMPNO = 'E1';

-- Uses idx_fname_dept
SELECT *
FROM EMP
WHERE FNAME = 'Amit'
AND DEPT = 'CSE';

----------------------------------------------------
-- IV. Drop the first index
----------------------------------------------------

DROP INDEX idx_empno;

----------------------------------------------------
-- V. Delete duplicate records
----------------------------------------------------

DELETE FROM EMP
WHERE ROWID NOT IN (
    SELECT MIN(ROWID)
    FROM EMP
    GROUP BY EMPNO, FNAME, DEPT
);

----------------------------------------------------
-- VI. Show last two records
----------------------------------------------------

SELECT *
FROM (
    SELECT *
    FROM EMP
    ORDER BY EMPNO DESC
)
WHERE ROWNUM <= 2;
