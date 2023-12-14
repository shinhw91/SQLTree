-- 계정 테이블
CREATE TABLE account (
               account_code   VARCHAR2 (10) PRIMARY KEY,
               account_name   VARCHAR2 (100) NOT NULL,
               account_grade  VARCHAR2 (100) NOT NULL,
               manager_pw     VARCHAR2 (100));
               
-- 등록
INSERT INTO account
VALUES ('A-001', '관리자001', '관리자', '111');

INSERT INTO account
VALUES ('A-002', '관리자002', '관리자', '222');

INSERT INTO account(account_code, account_name, account_grade)
VALUES ('A-003', '판매원003', '판매원');

-- 수정
UPDATE account
SET account_grade = '판매원'
WHERE account_code = 'A-002';

-- 삭제
DELETE FROM account
WHERE account_code = 'A-002';

-- 목록
SELECT *
FROM account;