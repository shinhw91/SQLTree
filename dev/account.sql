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
      
               
---- 로그인
--SELECT *
--FROM account
--WHERE account_code = 'A-001' AND account_pw = '111';
--        
--               
---- 계정등록
--INSERT INTO account
--VALUES ('A-001', '관리자001', '관리자', '111');
--
--
---- 정보수정
--UPDATE account
--SET account_pw = '0000'
--WHERE account_code = 'A-002';
--
--
---- 계정목록
--SELECT *
--FROM account;
--
--
---- 삭제
--DELETE FROM account
--WHERE account_code = 'A-002' AND account_pw = '222';