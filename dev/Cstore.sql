-- ���� ���̺�
CREATE TABLE account (
               account_code   VARCHAR2 (10) PRIMARY KEY,
               account_name   VARCHAR2 (100) NOT NULL,
               account_grade  VARCHAR2 (100) NOT NULL,
               manager_pw     VARCHAR2 (100));
               
-- ���
INSERT INTO account
VALUES ('A-001', '������001', '������', '111');

INSERT INTO account
VALUES ('A-002', '������002', '������', '222');

INSERT INTO account(account_code, account_name, account_grade)
VALUES ('A-003', '�Ǹſ�003', '�Ǹſ�');

-- ����
UPDATE account
SET account_grade = '�Ǹſ�'
WHERE account_code = 'A-002';

-- ����
DELETE FROM account
WHERE account_code = 'A-002';

-- ���
SELECT *
FROM account;