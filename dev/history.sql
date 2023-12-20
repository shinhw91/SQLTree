SELECT *
FROM history
ORDER BY 1;

DROP TABLE history;

-- 내역 테이블
CREATE TABLE history (
               history_number                NUMBER PRIMARY KEY,
               history_date                 VARCHAR2 (100),
               product_code                  VARCHAR2 (100) NOT NULL,
               product_count                 NUMBER NOT NULL,
               sale_income                   NUMBER,
               sale_sort                     VARCHAR2 (100),
               history_sort                  VARCHAR2 (100) NOT NULL,
               FOREIGN KEY(product_code) REFERENCES product(product_code));
               
INSERT INTO history(history_number, history_date, product_code, product_count, history_sort)
VALUES (1, '2023-01-15', 'P00001', 10, '입고');
INSERT INTO history(history_number, history_date, product_code, product_count, history_sort)
VALUES (2, '2023-01-15', 'P00002', 10, '입고');
INSERT INTO history(history_number, history_date, product_code, product_count, history_sort)
VALUES (3, '2023-01-15', 'P00003', 10, '입고');
INSERT INTO history(history_number, history_date, product_code, product_count, history_sort)
VALUES (4, '2023-01-15', 'P00004', 10, '입고');
INSERT INTO history(history_number, history_date, product_code, product_count, history_sort)
VALUES (5, '2023-01-15', 'P00005', 10, '입고');
INSERT INTO history(history_number, history_date, product_code, product_count, history_sort)
VALUES (6, '2023-01-15', 'P00006', 10, '입고');
INSERT INTO history(history_number, history_date, product_code, product_count, history_sort)
VALUES (7, '2023-01-15', 'P00007', 10, '입고');
INSERT INTO history(history_number, history_date, product_code, product_count, history_sort)
VALUES (8, '2023-01-15', 'P00008', 10, '입고');
INSERT INTO history(history_number, history_date, product_code, product_count, history_sort)
VALUES (9, '2023-01-15', 'P00009', 10, '입고');
INSERT INTO history(history_number, history_date, product_code, product_count, history_sort)
VALUES (10, '2023-01-15', 'P00010', 10, '입고');

INSERT INTO history
VALUES (11, '2023-01-20', 'P00002', 1, 3600*1, '카드', '판매');
INSERT INTO history
VALUES (12, '2023-01-25', 'P00005', 2, 2900*2, '카드', '판매');
INSERT INTO history
VALUES (13, '2023-02-12', 'P00010', 1, 1400*1, '현금', '판매');
INSERT INTO history
VALUES (14, '2023-04-08', 'P00003', 1, 1300*1, '카드', '판매');
INSERT INTO history
VALUES (15, '2023-04-08', 'P00008', 1, 1800*1, '카드', '판매');
INSERT INTO history
VALUES (16, '2023-04-30', 'P00006', 5, 1200*5, '현금', '판매');
INSERT INTO history
VALUES (17, '2023-11-01', 'P00007', 1, 2200*1, '현금', '판매');
INSERT INTO history
VALUES (18, '2023-11-23', 'P00004', 1, 1700*1, '카드', '판매');
INSERT INTO history
VALUES (19, '2023-12-08', 'P00008', 2, 1800*2, '카드', '판매');
INSERT INTO history
VALUES (20, '2023-12-20', 'P00009', 1, 2300*1, '카드', '판매');

CREATE SEQUENCE history_seq
                              INCREMENT BY 1
                              START WITH 21
                              MAXVALUE 9999
                              NOCACHE
                              NOCYCLE;
                              
INSERT INTO history
VALUES (history_seq.NEXTVAL, '2023-12-31', 'P00010', 1, 1400*1, '카드', '판매');

SELECT history_seq.CURRVAL
FROM dual;

ALTER SEQUENCE history_seq INCREMENT BY -5;

drop sequence history_seq;





               
               

--select to_char(history_date, 'yyyy-MM'), sum(sale_income)
--from history
----where history_date between to_date('2023-01-01', 'yyyy-MM-DD')
----                              and to_date('2023-12-31', 'yyyy-MM-DD')
--group by to_char(history_date, 'yyyy-MM')
--order by 1;
--
--select  to_char(history_date, 'yyyy-MM'), sum(sale_income)
--from history
----where history_date between to_date('2023-01-01', 'yyyy-MM-DD')
----                              and to_date('2023-12-31', 'yyyy-MM-DD')
--group by  to_char(history_date, 'yyyy-MM')
--order by 1;
--
--select substr(history_date, 1, 7) month, sum(sale_income) as sum
--from history
--group by substr(history_date, 1, 7)
--order by 1;

               


--CREATE SEQUENCE history_sequence
--                              INCREMENT BY 1
--                              START WITH 1
--                              MAXVALUE 9999
--                              NOCACHE
--                              NOCYCLE;
--
--INSERT INTO departments(department_id, department_name, location_id)
--VALUES (dept_deptid_seq.NEXTVAL,
--               'Support', 2500);