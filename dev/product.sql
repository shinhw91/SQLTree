SELECT *
FROM product
ORDER BY 1;

DROP TABLE product;

-- ��ǰ ���̺�
CREATE TABLE product (
               product_code                  VARCHAR2 (100) PRIMARY KEY,
               product_name                  VARCHAR2 (100) NOT NULL,
               product_price                NUMBER NOT NULL,
               product_remain                NUMBER DEFAULT 0);

insert all
               into product (product_code, product_name, product_price, product_remain)
               values ('P00001', '��ǰ001', 1000, 10)
               into history (history_number, history_date, product_code, product_count, sale_income, sale_sort, history_sort)
               values(1, '2023-12-01', 'P00001', 10, 10000, '����', '�Ǹ�')
select * from dual;



INSERT INTO product
VALUES('P00001', '��ǰ001', 1000, 10);
INSERT INTO product
VALUES('P00002', '��ǰ002', 2000, 10);
INSERT INTO product
VALUES('P00003', '��ǰ003', 3000, 10);
INSERT INTO product
VALUES('P00004', '��ǰ004', 4000, 10);
INSERT INTO product
VALUES('P00005', '��ǰ005', 5000, 10);
INSERT INTO product
VALUES('P00006', '��ǰ006', 6000, 10);
INSERT INTO product
VALUES('P00007', '��ǰ007', 7000, 10);
INSERT INTO product
VALUES('P00008', '��ǰ008', 8000, 10);
INSERT INTO product
VALUES('P00009', '��ǰ009', 9000, 10);
INSERT INTO product
VALUES('P00010', '��ǰ010', 10000, 10);

INSERT INTO product
VALUES('P00011', '��ǰ011', 100, 20);
INSERT INTO product
VALUES('P00012', '��ǰ012', 200, 20);
INSERT INTO product
VALUES('P00013', '��ǰ013', 300, 20);
INSERT INTO product
VALUES('P00014', '��ǰ014', 400, 20);
INSERT INTO product
VALUES('P00015', '��ǰ015', 500, 20);
INSERT INTO product
VALUES('P00016', '��ǰ016', 600, 20);
INSERT INTO product
VALUES('P00017', '��ǰ017', 700, 20);
INSERT INTO product
VALUES('P00018', '��ǰ018', 800, 20);
INSERT INTO product
VALUES('P00019', '��ǰ019', 900, 20);
INSERT INTO product
VALUES('P00020', '��ǰ020', 1000, 20);