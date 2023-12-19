SELECT *
FROM account
ORDER BY 1;

DROP TABLE account;

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
VALUES('A-004', '관리자001', '관리자', '444');
INSERT INTO account
VALUES('A-005', '관리자001', '관리자', '555');

INSERT INTO account
VALUES('B-001', '판매원001', '판매원', '111');
INSERT INTO account
VALUES('B-002', '판매원002', '판매원', '222');
INSERT INTO account
VALUES('B-003', '판매원003', '판매원', '333');
INSERT INTO account
VALUES('B-004', '판매원004', '판매원', '444');
INSERT INTO account
VALUES('B-005', '판매원005', '판매원', '555');