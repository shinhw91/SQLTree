SELECT *
FROM account
ORDER BY 1;

DROP TABLE account;

-- ���� ���̺�
CREATE TABLE account (
               account_code                  VARCHAR2 (100) PRIMARY KEY,
               account_name                  VARCHAR2 (100) NOT NULL,
               account_grade                 VARCHAR2 (100) NOT NULL,
               account_pw                    VARCHAR2 (100) NOT NULL);
      
               
---- �α���
--SELECT *
--FROM account
--WHERE account_code = 'A-001' AND account_pw = '111';
--        
--               
---- �������
--INSERT INTO account
--VALUES ('A-001', '������001', '������', '111');
--
--
---- ��������
--UPDATE account
--SET account_pw = '0000'
--WHERE account_code = 'A-002';
--
--
---- �������
--SELECT *
--FROM account;
--
--
---- ����
--DELETE FROM account
--WHERE account_code = 'A-002' AND account_pw = '222';