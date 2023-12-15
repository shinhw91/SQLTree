-- 계정 테이블
CREATE TABLE account (
               account_code                  VARCHAR2 (100) PRIMARY KEY,
               account_name                  VARCHAR2 (100),
               account_grade                 VARCHAR2 (100),
               account_pw                    VARCHAR2 (100));
               
-- 등록
INSERT INTO account
VALUES ('A-001', '관리자001', '관리자', '111');

INSERT INTO account
VALUES ('A-002', '관리자002', '관리자', '222');

-- 수정
UPDATE account
SET account_grade = '판매원'
WHERE account_code = 'A-002';

-- 삭제
DELETE FROM account
WHERE account_code = 'A-002' AND account_pw = '222';

-- 목록
SELECT *
FROM account;

-- 로그인
SELECT *
FROM account
WHERE account_code = 'A-001' AND account_pw = '111';

DROP TABLE account;







-- 상품 테이블
CREATE TABLE product (
               product_code                  VARCHAR2 (100) PRIMARY KEY,
               product_name                  VARCHAR2 (100),
               product_price                NUMBER,
               product_enterdate           VARCHAR2 (100),
               product_count                NUMBER);

-- 등록
INSERT INTO product
VALUES ('Z-001', '상품001', 1000, '2023-01-01', 10);

INSERT INTO product
VALUES ('Z-002', '상품002', 2000, '2023-02-02', 20);

INSERT INTO product(product_code, product_name, product_price)
VALUES('Z-003', '상품003', 3000);

-- 수정
UPDATE product
SET product_price = 30000
WHERE product_code = 'Z-002';

UPDATE product
SET product_enterdate = '2020-20-20', product_count = 50
WHERE product_code = 'Z-002';

-- 삭제
DELETE FROM product
WHERE product_code = 'Z-002';

-- 목록
SELECT *
FROM product;

-- 조회
SELECT *
FROM product
WHERE product_code = 'Z-003';

DROP TABLE product;

