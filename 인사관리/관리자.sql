-- ����� ���� (������ ��������)
CREATE USER skj
IDENTIFIED BY test;

-- GRANT (���� �ο�)
-- WITH ADMIN OPTION : ���� �ο��� �� �ִ� ���� �Բ� �ο�
GRANT CREATE SESSION
TO skj;

-- Run SQL Command Line
-- CONN skj/test

GRANT CREATE SESSION, CREATE TABLE, CREATE VIEW
TO skj;

-- REVOKE (���� ����)
-- WITH ADMIN OPTION�� ���� ���� ����
REVOKE CREATE TABLE, CREATE VIEW
FROM skj;

-- ��й�ȣ ����
ALTER USER skj
IDENTIFIED BY lion;

CREATE USER yedam
IDENTIFIED BY yedam
DEFAULT TABLESPACE users
TEMPORARY TABLESPACE temp;

-- Run SQL Command Line
-- CONN yedam/yedam

-- ����Ŭ ���� ROLE (���� ����)
GRANT connect, dba
TO yedam;

REVOKE SELECT
ON hr.employees
FROM yedam;