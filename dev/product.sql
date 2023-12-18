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

-- ���
INSERT INTO product(product_code, product_name, product_price)
VALUES('Z-002', '��ǰ002', 2000);

INSERT INTO product(product_code, product_name, product_price)
VALUES('G-001', 'GGG', 99999);

-- ����
UPDATE product
SET product_price = 30000
WHERE product_code = 'Z-002';

-- ��ȸ
SELECT *
FROM product
WHERE product_code = 'Z-002';

-- ���
SELECT *
FROM product;

-- ����
DELETE FROM product
WHERE product_code = 'Z-002';

-- �԰�
UPDATE product
SET product_remain = 10
WHERE product_code = 'Z-002';

-- ���
SELECT product_remain
FROM product
WHERE product_code = 'Z-002';