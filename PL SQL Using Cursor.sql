I. PL/SQL Using Cursor to Update Salary and Display Employee Name

DECLARE
    CURSOR c1 IS
    SELECT E.ename, S.Eno, S.salary
    FROM EMPLOYEE E, EMPSAL S
    WHERE E.Empid = S.Eno;

    v_name EMPLOYEE.ename%TYPE;
    v_eno EMPSAL.Eno%TYPE;
    v_sal EMPSAL.salary%TYPE;
BEGIN
    OPEN c1;

    LOOP
        FETCH c1 INTO v_name, v_eno, v_sal;
        EXIT WHEN c1%NOTFOUND;

        IF v_sal < 20000 THEN
            v_sal := v_sal * 1.12;
        ELSE
            v_sal := v_sal * 1.10;
        END IF;

        UPDATE EMPSAL
        SET salary = v_sal
        WHERE Eno = v_eno;

        DBMS_OUTPUT.PUT_LINE(
        'Employee: ' || v_name ||
        ' Updated Salary: ' || v_sal);
    END LOOP;

    CLOSE c1;
END;
/

II. PL/SQL Function to Add Two Numbers

CREATE OR REPLACE FUNCTION ADD_NUM(
    A NUMBER,
    B NUMBER
)
RETURN NUMBER
IS
BEGIN
    RETURN A + B;
END;
/
SELECT ADD_NUM(10,20) AS SUM
FROM DUAL;

III. PL/SQL Procedure to Insert Record into STUDENT Table

CREATE OR REPLACE PROCEDURE INSERT_STUDENT(
    P_ROLLNO NUMBER,
    P_NAME VARCHAR2,
    P_ADDRESS VARCHAR2,
    P_PHONE VARCHAR2,
    P_BDATE DATE
)
IS
BEGIN
    INSERT INTO STUDENT
    VALUES(
        P_ROLLNO,
        P_NAME,
        P_ADDRESS,
        P_PHONE,
        P_BDATE
    );

    COMMIT;
END;
/

EXEC INSERT_STUDENT(
    101,
    'Rahul',
    'Howrah',
    '9876543210',
    '15-MAY-2004'
);
