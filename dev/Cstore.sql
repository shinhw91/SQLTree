-- ���� ���̺�
CREATE TABLE account (
               account_code                  VARCHAR2 (100) PRIMARY KEY,
               account_name                  VARCHAR2 (100),
               account_grade                 VARCHAR2 (100),
               account_pw                    VARCHAR2 (100));
               
-- ���
INSERT INTO account
VALUES ('A-001', '������001', '������', '111');

INSERT INTO account
VALUES ('A-002', '������002', '������', '222');

-- ����
UPDATE account
SET account_grade = '�Ǹſ�'
WHERE account_code = 'A-002';

-- ����
DELETE FROM account
WHERE account_code = 'A-002' AND account_pw = '222';

-- ���
SELECT *
FROM account;

-- �α���
SELECT *
FROM account
WHERE account_code = 'A-001' AND account_pw = '111';

DROP TABLE account;







-- ��ǰ ���̺�
CREATE TABLE product (
               product_code                  VARCHAR2 (100) PRIMARY KEY,
               product_name                  VARCHAR2 (100),
               product_price                NUMBER,
               product_enterdate           VARCHAR2 (100),
               product_count                NUMBER);

-- ���
INSERT INTO product
VALUES ('Z-001', '��ǰ001', 1000, '2023-01-01', 10);

INSERT INTO product
VALUES ('Z-002', '��ǰ002', 2000, '2023-02-02', 20);

INSERT INTO product(product_code, product_name, product_price)
VALUES('Z-003', '��ǰ003', 3000);

-- ����
UPDATE product
SET product_price = 30000
WHERE product_code = 'Z-002';

UPDATE product
SET product_enterdate = '2020-20-20', product_count = 50
WHERE product_code = 'Z-002';

-- ����
DELETE FROM product
WHERE product_code = 'Z-002';

-- ���
SELECT *
FROM product;

-- ��ȸ
SELECT *
FROM product
WHERE product_code = 'Z-003';

DROP TABLE product;

