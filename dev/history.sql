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

select to_char(history_date, 'yyyy-MM'), sum(sale_income)
from history
--where history_date between to_date('2023-01-01', 'yyyy-MM-DD')
--                              and to_date('2023-12-31', 'yyyy-MM-DD')
group by to_char(history_date, 'yyyy-MM')
order by 1;

select  to_char(history_date, 'yyyy-MM'), sum(sale_income)
from history
--where history_date between to_date('2023-01-01', 'yyyy-MM-DD')
--                              and to_date('2023-12-31', 'yyyy-MM-DD')
group by  to_char(history_date, 'yyyy-MM')
order by 1;

select substr(history_date, 1, 7) month, sum(sale_income) as sum
from history
group by substr(history_date, 1, 7)
order by 1;

               
-- �԰�
INSERT INTO history(history_number, history_date, product_code, product_count, history_sort)
VALUES (100, '2023-12-15', 'P00001', 10, '�԰�');

INSERT INTO history(history_number, history_date, product_code, product_count, history_sort)
VALUES (2, '2023-12-15', 'F-002', 20, '�԰�');

INSERT INTO history(history_number, history_date, product_code, product_count, history_sort)
VALUES (2, '2023-12-18', 'G-001', 50, '�԰�');

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

SELECT h.history_number, h.history_date, h.product_code, p.product_name, h.sale_income
from product p, history h
where p.product_code = h.product_code
and h.history_sort = '�Ǹ�'
order by 1;

select sum(sale_income)
from history
where history_date = '2023-12-18';














CREATE SEQUENCE history_sequence
                              INCREMENT BY 1
                              START WITH 1
                              MAXVALUE 9999
                              NOCACHE
                              NOCYCLE;

INSERT INTO departments(department_id, department_name, location_id)
VALUES (dept_deptid_seq.NEXTVAL,
               'Support', 2500);