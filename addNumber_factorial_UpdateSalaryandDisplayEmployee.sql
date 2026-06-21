I. PL/SQL Code to Add Two Numbers

DECLARE
    a NUMBER := 10;
    b NUMBER := 20;
    c NUMBER;
BEGIN
    c := a + b;
    DBMS_OUTPUT.PUT_LINE('Sum = ' || c);
END;
/


II. PL/SQL Code to Calculate Factorial of a Number

DECLARE
    n NUMBER := 5;
    fact NUMBER := 1;
    i NUMBER;
BEGIN
    FOR i IN 1..n LOOP
        fact := fact * i;
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('Factorial = ' || fact);
END;
/

III. PL/SQL Code to Update Salary and Display Employee Name & Updated Salary

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
            v_sal := v_sal + (v_sal * 12 / 100);
        ELSE
            v_sal := v_sal + (v_sal * 10 / 100);
        END IF;

        UPDATE EMPSAL
        SET salary = v_sal
        WHERE Eno = v_eno;

        DBMS_OUTPUT.PUT_LINE(
            'Employee Name: ' || v_name ||
            ' Updated Salary: ' || v_sal
        );
    END LOOP;

    CLOSE c1;
END;
/
