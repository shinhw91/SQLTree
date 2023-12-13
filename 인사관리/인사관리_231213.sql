-- < 제약조건 개요 >
-- NOT NULL, PRIMARY KEY : null 값 불가능
-- UNIQUE, FOREIGN KEY, CHECK : null 값 가능

-- NOT NULL : 열 레벨 제약조건만 가능
CREATE TABLE emp_test (
               empid NUMBER (5),
               empname VARCHAR (10) NOT NULL,
               duty VARCHAR (9),
               sal NUMBER (7, 2),
               bonus NUMBER(7, 2),
               mgr NUMBER(5),
               hire_date DATE,
               deptid NUMBER (2));
                                             
INSERT INTO emp_test (empid, empname)
VALUES (10, NULL);

INSERT INTO emp_test (empid, empname)
VALUES (10, 'YD');

SELECT *
FROM emp_test;

-- UNIQUE (열, 열 집합 기준) : 테이블 레벨 제약조건만 가능
CREATE TABLE dept_test (
               deptid NUMBER (2),
               dname VARCHAR2 (14),
               loc VARCHAR2 (13),
               UNIQUE (dname));

INSERT INTO dept_test(deptid, dname)
VALUES (10, NULL);

INSERT INTO dept_test(deptid, dname)
VALUES (20, 'YD');

INSERT INTO dept_test(deptid, dname)
VALUES (20, 'YD');

SELECT *
FROM dept_test;

-- 후보키 = 기본키 + 대체키
-- 후보키 : 유일성 + 최소성
-- 슈퍼키 : 유일성

-- PRIMARY KEY (열, 열 집합 기준) = UNIQUE + NOT NULL
DROP TABLE dept_test;

CREATE TABLE dept_test (
               deptid NUMBER (2) PRIMARY KEY,
               dname VARCHAR2 (14),
               loc VARCHAR2 (13),
               UNIQUE (dname));

INSERT INTO dept_test
VALUES (10, 'YD', 'Daegu');

INSERT INTO dept_test
VALUES (20, 'YD1', 'Daegu');

INSERT INTO dept_test
VALUES (20, 'YD2', 'Daegu');

INSERT INTO dept_test
VALUES (NULL, 'YD3', 'Daegu');

-- FOREIGN KEY (외래키)
DROP TABLE emp_test;

-- 테이블 레벨 제약조건
CREATE TABLE emp_test (
               empid NUMBER (5),
               empname VARCHAR (10) NOT NULL,
               duty VARCHAR (9),
               sal NUMBER (7, 2),
               bonus NUMBER(7, 2),
               mgr NUMBER(5),
               hire_date DATE,
               deptid NUMBER (2),
               FOREIGN KEY (deptid) REFERENCES dept_test(deptid));

-- 열 레벨 제약조건
-- ON DELETE SET NULL 옵션 : 부모테이블 값 삭제되는 경우, NULL
-- ON DELETE CASCADE 옵션 : 부모테이블 값 삭제되는 경우, 행 삭제 
CREATE TABLE emp_test (
               empid NUMBER (5),
               empname VARCHAR (10) NOT NULL,
               duty VARCHAR (9),
               sal NUMBER (7, 2),
               bonus NUMBER(7, 2),
               mgr NUMBER(5),
               hire_date DATE,
               deptid NUMBER (2) REFERENCES dept_test(deptid) ON DELETE SET NULL);

INSERT INTO emp_test (empid, empname, deptid)
VALUES (100, 'YD1', 10);
INSERT INTO emp_test (empid, empname, deptid)
VALUES (200, 'YD2', NULL);
INSERT INTO emp_test (empid, empname, deptid)
VALUES (300, 'YD1', 30);

SELECT *
FROM emp_test;

SELECT *
FROM dept_test;

DELETE dept_test
WHERE deptid = 10;

SELECT *
FROM dept_test;

SELECT *
FROM emp_test;

-- CHECK (조건)
DROP TABLE emp_test;

CREATE TABLE emp_test (
               empid NUMBER (5),
               empname VARCHAR (10) NOT NULL,
               duty VARCHAR (9),
               sal NUMBER (7, 2),
               bonus NUMBER(7, 2),
               mgr NUMBER(5),
               hire_date DATE,
               deptid NUMBER (2) CHECK (deptid BETWEEN 10 AND 99),
               FOREIGN KEY (deptid) REFERENCES dept_test(deptid));

-- < 제약조건 수정 및 보기 >
-- ALTER (수정)
-- ADD절
ALTER TABLE emp_test
ADD PRIMARY KEY (empid);

ALTER TABLE emp_test
ADD FOREIGN KEY (mgr) REFERENCES emp_test (empid);

-- MODIFY절 : NOT NULL
ALTER TABLE emp_test
MODIFY (duty VARCHAR2 (9) NOT NULL);

ALTER TABLE emp_test
MODIFY (duty NOT NULL);

-- 제약조건 확인
SELECT constraint_name, column_name
FROM user_cons_columns;

DESC user_cons_columns;

SELECT constraint_name, table_name, column_name
FROM user_cons_columns
WHERE table_name = 'EMP_TEST';

-- DROP (삭제)
ALTER TABLE emp_test
DROP constraint sys_C007024;

-- < 뷰 (view) >
-- CREATE (뷰 생성)
CREATE VIEW empvu80
AS SELECT employee_id, last_name, salary
               FROM employees
               WHERE department_id = 80;
               
SELECT *
FROM empvu80;

-- 열 별칭 지정
CREATE VIEW salvu50
AS SELECT employee_id ID_NUMBER, last_name NAME, salary * 12 ANN_SALARY
               FROM employees
               WHERE department_id = 50;

CREATE VIEW salvu50(id_number, name, ann_salary)
AS SELECT employee_id, last_name, salary * 12
               FROM employees
               WHERE department_id = 50;

SELECT *
FROM salvu50;

-- CREATE OR REPLACE (수정, 대체)
CREATE OR REPLACE VIEW empvu80(id_number, name, sal, department_id)
AS SELECT employee_id, first_name || ' ' || last_name, salary, department_id
               FROM employees
               WHERE department_id = 80;

SELECT *
FROM empvu80;

CREATE OR REPLACE VIEW dept_sum_vu (name, minsal, maxsal, avgsal)
AS SELECT d.department_name, MIN(e.salary), MAX(e.salary), AVG(e.salary)
               FROM employees e JOIN departments d
                                             ON (e.department_id = d.department_id)
               GROUP BY d.department_name;
               
SELECT *
FROM dept_sum_vu;

-- DROP (뷰 삭제)
DROP VIEW dept_sum_vu;

-- 뷰를 통한 데이터 조작
-- DELETE 불가 : 그룹 함수, GROUP BY, DISTINCT, ROWNUM
-- UPDATE 불가 : 그룹 함수, GROUP BY, DISTINCT, ROWNUM, 표현식?????????
SELECT rownum, employee_id
FROM employees;

COMMIT;

-- DELETE 가능
SELECT *
FROM empvu80;

DELETE empvu80
WHERE id_number = 176;

SELECT *
FROM empvu80;

SELECT *
FROM employees;

-- DELETE 불가 (그룹 함수)
SELECT *
FROM dept_sum_vu;

DELETE dept_sum_vu
WHERE name = 'IT';

-- WITH CHECK OPTION
-- WITH READ ONLY

-- PRIMARY KEY 입력 필요
CREATE VIEW test_vu
AS SELECT department_name
               FROM departments;
               
SELECT *
FROM test_vu;

INSERT INTO test_vu
VALUES ('YD');

-- < 기타 객체 >
-- SEQUENCE (고유 번호)
CREATE SEQUENCE dept_deptid_seq
                              INCREMENT BY 10
                              START WITH 120
                              MAXVALUE 9999
                              NOCACHE
                              NOCYCLE;

INSERT INTO departments(department_id, department_name, location_id)
VALUES (dept_deptid_seq.NEXTVAL,
               'Support', 2500);
               
SELECT *
FROM departments;

-- 시퀀스 값 누적
ROLLBACK;

SELECT *
FROM departments;

-- 현재 시퀀스 값
SELECT dept_deptid_seq.CURRVAL
FROM dual;

-- SYNONYM (동의어)
CREATE SYNONYM d_sum
FOR dept_sum_vu;

SELECT *
FROM d_sum;

SELECT *
FROM dept_sum_vu;

-- < 데이터 제어어 (DCL) >
-- 시스템 권한 확인
SELECT *
FROM system_privilege_map;

-- < 계층적 질의 >
-- TOP DOWN
SELECT LEVEL, employee_id, last_name, manager_id
FROM employees
START WITH manager_id IS NULL
CONNECT BY PRIOR employee_id = manager_id;
--CONNECT BY manager_id = PRIOR employee_id;

-- bottom up
SELECT LEVEL, employee_id, last_name, manager_id
FROM employees
START WITH manager_id IS NULL
CONNECT BY PRIOR manager_id = employee_id;

SELECT LEVEL,
               LPAD(' ', 4 * (LEVEL - 1)) || employee_id employee, last_name, manager_id
FROM employees
START WITH manager_id IS NULL
CONNECT BY PRIOR employee_id = manager_id;
