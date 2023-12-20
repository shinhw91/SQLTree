SELECT *
FROM account
ORDER BY 1;

SELECT *
FROM product
ORDER BY 1;

SELECT *
FROM history
ORDER BY 1;

DROP TABLE account;
DROP TABLE product;
DROP TABLE history;

-- 계정 테이블
CREATE TABLE account (
               account_code                  VARCHAR2 (100) PRIMARY KEY,
               account_name                  VARCHAR2 (100) NOT NULL,
               account_grade                 VARCHAR2 (100) NOT NULL,
               account_pw                    VARCHAR2 (100) NOT NULL);
      
INSERT INTO account
VALUES('A-001', '관리자001', '관리자', '111');
INSERT INTO account
VALUES('A-002', '관리자001', '관리자', '222');
INSERT INTO account
VALUES('A-003', '관리자001', '관리자', '333');

INSERT INTO account
VALUES('B-001', '판매원001', '판매원', '111');
INSERT INTO account
VALUES('B-002', '판매원002', '판매원', '222');
INSERT INTO account
VALUES('B-003', '판매원003', '판매원', '333');


-- 상품 테이블
CREATE TABLE product (
               product_code                  VARCHAR2 (100) PRIMARY KEY,
               product_name                  VARCHAR2 (100) NOT NULL,
               product_price                NUMBER NOT NULL,
               product_remain                NUMBER DEFAULT 0);

INSERT INTO product
VALUES ('P00001', '도시락', 5500, 10);
INSERT INTO product
VALUES ('P00002', '샌드위치', 3600, 9);
INSERT INTO product
VALUES ('P00003', '삼각김밥', 1300 ,9);
INSERT INTO product
VALUES ('P00004', '감자칩', 1700, 9);
INSERT INTO product
VALUES ('P00005', '크림빵', 2900, 8);
INSERT INTO product
VALUES ('P00006', '젤리', 1200, 5);
INSERT INTO product
VALUES ('P00007', '아이스크림', 2200, 9);
INSERT INTO product
VALUES ('P00008', '컵라면', 1800, 7);
INSERT INTO product
VALUES ('P00009', '구운계란', 2300, 9);
INSERT INTO product
VALUES ('P00010', '초코우유', 1400, 9);


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
