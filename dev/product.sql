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

INSERT INTO product
VALUES ('P00001', '���ö�', 5500, 10);
INSERT INTO product
VALUES ('P00002', '������ġ', 3600, 9);
INSERT INTO product
VALUES ('P00003', '�ﰢ���', 1300 ,9);
INSERT INTO product
VALUES ('P00004', '����Ĩ', 1700, 9);
INSERT INTO product
VALUES ('P00005', 'ũ����', 2900, 8);
INSERT INTO product
VALUES ('P00006', '����', 1200, 5);
INSERT INTO product
VALUES ('P00007', '���̽�ũ��', 2200, 9);
INSERT INTO product
VALUES ('P00008', '�Ŷ��', 1800, 7);
INSERT INTO product
VALUES ('P00009', '������', 2300, 9);
INSERT INTO product
VALUES ('P00010', '���ڿ���', 1400, 9);