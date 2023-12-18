SELECT *
FROM history
ORDER BY 1;

DROP TABLE history;

-- ���� ���̺�
CREATE TABLE history (
               history_number                NUMBER NOT NULL,
               history_date                 VARCHAR2 (100),
               product_code                  VARCHAR2 (100) NOT NULL,
               product_count                 NUMBER NOT NULL,
               sale_income                   NUMBER,
               sale_sort                     VARCHAR2 (100),
               history_sort                  VARCHAR2 (100) NOT NULL,
               FOREIGN KEY(product_code) REFERENCES product(product_code));

               
-- �԰�
INSERT INTO history(history_number, history_date, product_code, product_count, history_sort)
VALUES (1, '2023-12-15', 'F-001', 10, '�԰�');

INSERT INTO history(history_number, history_date, product_code, product_count, history_sort)
VALUES (2, '2023-12-15', 'F-002', 20, '�԰�');

-- �Ǹ�
INSERT INTO history
VALUES (3, '2023-12-15', 'F-001', 5, 10000, '����', '�Ǹ�');

INSERT INTO history
VALUES (4, '2023-12-16', 'F-002', 5, 10000, 'ī��', '�Ǹ�');

SELECT MAX(history_number)
FROM history;

SELECT h.history_number, h.history_date, h.product_code, p.product_name, p.product_price, h.product_count, h.history_sort
from product p, history h
where p.product_code = h.product_code
order by 1;

CREATE SEQUENCE history_sequence
                              INCREMENT BY 1
                              START WITH 1
                              MAXVALUE 9999
                              NOCACHE
                              NOCYCLE;

INSERT INTO departments(department_id, department_name, location_id)
VALUES (dept_deptid_seq.NEXTVAL,
               'Support', 2500);