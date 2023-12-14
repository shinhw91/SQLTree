-- 사용자 생성 (관리자 계정에서)
CREATE USER skj
IDENTIFIED BY test;

-- GRANT (권한 부여)
-- WITH ADMIN OPTION : 권한 부여할 수 있는 권한 함께 부여
GRANT CREATE SESSION
TO skj;

-- Run SQL Command Line
-- CONN skj/test

GRANT CREATE SESSION, CREATE TABLE, CREATE VIEW
TO skj;

-- REVOKE (권한 해제)
-- WITH ADMIN OPTION을 통한 권한 제외
REVOKE CREATE TABLE, CREATE VIEW
FROM skj;

-- 비밀번호 변경
ALTER USER skj
IDENTIFIED BY lion;

CREATE USER yedam
IDENTIFIED BY yedam
DEFAULT TABLESPACE users
TEMPORARY TABLESPACE temp;

-- Run SQL Command Line
-- CONN yedam/yedam

-- 오라클 제공 ROLE (권한 묶음)
GRANT connect, dba
TO yedam;

REVOKE SELECT
ON hr.employees
FROM yedam;