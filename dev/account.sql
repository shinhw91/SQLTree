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
      
INSERT INTO account
VALUES('A-001', '������001', '������', '111');
INSERT INTO account
VALUES('A-002', '������001', '������', '222');
INSERT INTO account
VALUES('A-003', '������001', '������', '333');

INSERT INTO account
VALUES('B-001', '�Ǹſ�001', '�Ǹſ�', '111');
INSERT INTO account
VALUES('B-002', '�Ǹſ�002', '�Ǹſ�', '222');
INSERT INTO account
VALUES('B-003', '�Ǹſ�003', '�Ǹſ�', '333');