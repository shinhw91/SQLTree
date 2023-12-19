SELECT *
FROM product
ORDER BY 1;

DROP TABLE product;

-- 상품 테이블
CREATE TABLE product (
               product_code                  VARCHAR2 (100) PRIMARY KEY,
               product_name                  VARCHAR2 (100) NOT NULL,
               product_price                NUMBER NOT NULL,
               product_remain                NUMBER DEFAULT 0);

insert all
               into product (product_code, product_name, product_price, product_remain)
               values ('P00001', '상품001', 1000, 10)
               into history (history_number, history_date, product_code, product_count, sale_income, sale_sort, history_sort)
               values(1, '2023-12-01', 'P00001', 10, 10000, '현금', '판매')
select * from dual;



INSERT INTO product
VALUES('P00001', '상품001', 1000, 10);
INSERT INTO product
VALUES('P00002', '상품002', 2000, 10);
INSERT INTO product
VALUES('P00003', '상품003', 3000, 10);
INSERT INTO product
VALUES('P00004', '상품004', 4000, 10);
INSERT INTO product
VALUES('P00005', '상품005', 5000, 10);
INSERT INTO product
VALUES('P00006', '상품006', 6000, 10);
INSERT INTO product
VALUES('P00007', '상품007', 7000, 10);
INSERT INTO product
VALUES('P00008', '상품008', 8000, 10);
INSERT INTO product
VALUES('P00009', '상품009', 9000, 10);
INSERT INTO product
VALUES('P00010', '상품010', 10000, 10);

INSERT INTO product
VALUES('P00011', '상품011', 100, 20);
INSERT INTO product
VALUES('P00012', '상품012', 200, 20);
INSERT INTO product
VALUES('P00013', '상품013', 300, 20);
INSERT INTO product
VALUES('P00014', '상품014', 400, 20);
INSERT INTO product
VALUES('P00015', '상품015', 500, 20);
INSERT INTO product
VALUES('P00016', '상품016', 600, 20);
INSERT INTO product
VALUES('P00017', '상품017', 700, 20);
INSERT INTO product
VALUES('P00018', '상품018', 800, 20);
INSERT INTO product
VALUES('P00019', '상품019', 900, 20);
INSERT INTO product
VALUES('P00020', '상품020', 1000, 20);