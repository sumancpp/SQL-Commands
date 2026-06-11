----------------------------------------------------
-- I. Create TRANSACTION table
----------------------------------------------------

CREATE TABLE TRANSACTION (
    transaction_id NUMBER,
    description VARCHAR2(100),
    product VARCHAR2(50),
    quantity NUMBER,
    amount NUMBER(10,2)
);

----------------------------------------------------
-- Create a Sequence
----------------------------------------------------

CREATE SEQUENCE trans_seq
START WITH 1
INCREMENT BY 1;

----------------------------------------------------
-- II. Trigger to automatically generate
-- transaction_id
----------------------------------------------------

CREATE OR REPLACE TRIGGER trg_trans_id
BEFORE INSERT
ON TRANSACTION
FOR EACH ROW
BEGIN
    :NEW.transaction_id := trans_seq.NEXTVAL;
END;
/

INSERT INTO TRANSACTION
(description, product, quantity, amount)
VALUES
('Mobile Purchase', 'Mobile', 2, 30000);
