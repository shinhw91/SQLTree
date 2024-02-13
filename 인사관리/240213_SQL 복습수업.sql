-- 6번
--DROP TABLE employee;
--DROP TABLE department;

CREATE TABLE department (
               deptid         NUMBER(10)     PRIMARY KEY,
               deptname       VARCHAR2(10),
               location       VARCHAR2(10),
               tel            VARCHAR2(15));
               
DESC department;

-- (택1) FK 추가

CREATE TABLE employee (
               empid          NUMBER(10)     PRIMARY KEY,
               empname        VARCHAR2(10),
               hiredate       DATE,
               addr           VARCHAR2(12),
               tel            VARCHAR(15),
               deptid         NUMBER(10)     REFERENCES     department (deptid));

-- (택2) FK 추가
CREATE TABLE employee (
               empid          NUMBER(10)     PRIMARY KEY,
               empname        VARCHAR2(10),
               hiredate       DATE,
               addr           VARCHAR2(12),
               tel            VARCHAR(15),
               deptid NUMBER(10),
               CONSTRAINT     emp_dept_deptid_FK            FOREIGN KEY (deptid)
               REFERENCES     department (deptid));
               
DESC employee;




-- 7번
ALTER TABLE employee ADD birthday DATE;
-- MODIFY, DROP
-- 제약조건은 변경 불가(단, NOT NULL은 MODIFY 가능)




-- 8번
INSERT INTO department VALUES (1001, '총무팀', '본101호', '053-777-8777');
INSERT INTO department VALUES (1002, '회계팀', '본102호', '053-888-9999');
INSERT INTO department VALUES (1003, '영업팀', '본103호', '053-222-3333');

SELECT * FROM department;

INSERT INTO employee (empid, empname, hiredate, addr, tel, deptid)
VALUES (20121945, '박민수', '20120302', '대구', '010-1111-1234', 1001);
INSERT INTO employee (empid, empname, hiredate, addr, tel, deptid)
VALUES (20101812, '박준식', '20100901', '경산', '010-2222-1234', 1003);
INSERT INTO employee (empid, empname, hiredate, addr, tel, deptid)
VALUES (20122245, '선아라', '20120302', '대구', '010-3333-1222', 1002);
INSERT INTO employee (empid, empname, hiredate, addr, tel, deptid)
VALUES (20121729, '이범수', '20110302', '서울', '010-3333-4444', 1001);
INSERT INTO employee (empid, empname, hiredate, addr, tel, deptid)
VALUES (20121646, '이융희', '20120901', '부산', '010-1234-2222', 1003);
-- TO_DATE('12/03/02', 'YY/MM/DD') 사용 권장

SELECT * FROM employee;




-- 9번
ALTER TABLE employee MODIFY empname NOT NULL;
-- 데이터 값이 NULL이 있을 경우, NOT NULL 제약조건 추가 불가




-- 10번
-- 오라클 조인
SELECT e.empname, e.hiredate, d.deptname
FROM department d, employee e
WHERE d.deptid = e.deptid
AND d.deptname = '총무팀';

-- ANSI 조인
SELECT empname, hiredate, deptname
FROM employee
JOIN department USING (deptid)
WHERE deptname = '총무팀';

SELECT e.empname, e.hiredate, d.deptname
FROM employee e
               INNER JOIN department d
               ON (e.deptid = d.deptid)
WHERE d.deptname = '총무팀';
-- (INNER) JOIN : 교집합
-- OUTER JOIN : NULL값 포함(LEFT, RIGHT, FULL 기준)




-- 11번
DELETE FROM employee
WHERE addr='대구';




-- 12번
UPDATE employee
SET deptid = (SELECT deptid
                              FROM department
                              WHERE deptname='회계팀')
WHERE deptid = (SELECT deptid
                              FROM department
                              WHERE deptname='영업팀');




-- 13번
SELECT e.empid,  e.empname, e.birthday, d.deptname
FROM employee e
               INNER JOIN department d
               ON (e.deptid = d.deptid)
WHERE e.hiredate > (SELECT hiredate
                              FROM employee
                              WHERE empid = 20121729);
                              
                              
                              
                              
-- 14번
-- 관리자 권한 부여 필요
GRANT CREATE VIEW TO dev;

--DROP VIEW emp_vu;

--CREATE OR REPLACE VIEW emp_vu
CREATE VIEW emp_vu
AS
               SELECT e.empname,
                              e.addr,
                              d.deptname
               FROM employee e
                              JOIN department d
                              ON (d.deptid = e.deptid)
               WHERE d.deptname = '총무팀';

SELECT * FROM emp_vu;




-- 페이징 처리