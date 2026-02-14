CREATE TABLE emp (
    emp_no NUMBER(2) PRIMARY KEY,
    emp_name VARCHAR2(30),
    city VARCHAR2(20)
);
INSERT INTO emp VALUES (1, 'Akash', 'Hooghly');
INSERT INTO emp VALUES (2, 'Rahul', 'Kolkata');
INSERT INTO emp VALUES (3, 'Rohit', 'Howrah');

SELECT * FROM emp;

CREATE TABLE emp_sal (
    emp_no NUMBER(2) PRIMARY KEY,
    salary FLOAT
);

INSERT INTO emp_sal VALUES (1, 45000);
INSERT INTO emp_sal VALUES (2, 40000);
INSERT INTO emp_sal VALUES (4, 35000);

SELECT * FROM emp_sal;

SELECT * FROM emp, emp_sal WHERE emp.emp_no = emp_sal.emp_no;

SELECT emp.emp_no, emp_name, city, salary FROM emp, emp_sal WHERE emp.emp_no = emp_sal.emp_no;

SELECT * FROM emp, emp_sal WHERE emp.emp_no = emp_sal.emp_no(+);

SELECT * FROM emp, emp_sal WHERE emp.emp_no(+) = emp_sal.emp_no;

SELECT * FROM emp, emp_sal WHERE emp.emp_no = emp_sal.emp_no(+) UNION SELECT * FROM emp, emp_sal WHERE emp.emp_no(+) = emp_sal.emp_no;

drop table emp
drop table emp_sal












