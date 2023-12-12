SELECT last_name, job_id, salary
FROM employees
WHERE salary = (SELECT MIN(salary)
                              FROM employees);
                              
SELECT department_id, MIN(salary)
FROM employees
GROUP BY department_id
HAVING MIN(salary) > (SELECT MIN(salary)
                                             FROM employees
                                             WHERE department_id = 50);

-- 다중행 서브쿼리 (리턴값 2개 이상) : IN, ANY, ALL, SOME
-- < ANY : 최대값보다 작음
SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary < ANY (SELECT salary
                                             FROM employees
                                             WHERE job_id = 'IT_PROG')
AND job_id <> 'IT_PROG';

-- < ALL : 최소값보다 작음
SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary < ALL (SELECT salary
                                             FROM employees
                                             WHERE job_id = 'IT_PROG')
AND job_id <> 'IT_PROG';

-- > ANY : 최소값보다 큼
-- > ALL : 최대값보다 큼

-- cre_empl 파일 열기
-- 다중열 서브쿼리 : 컬럼(Colunm) 순서쌍
-- WHERE : 괄호() 안에 작성
SELECT employee_id, manager_id, department_id
FROM empl_demo
WHERE (manager_id, department_id) IN
                                                            (SELECT manager_id, department_id
                                                            FROM empl_demo
                                                            WHERE first_name = 'John')
AND first_name <> 'John';

-- AND : 비순서쌍
SELECT employee_id, manager_id, department_id
FROM empl_demo
WHERE manager_id IN (SELECT manager_id
                                             FROM empl_demo
                                             WHERE first_name = 'John')
AND department_id IN (SELECT department_id
                                             FROM empl_demo
                                             WHERE first_name = 'John')
AND first_name <> 'John';

-- cre_hrdata 파일 열기
-- < 데이터 조작어 (DML) >
-- INSERT (추가)
INSERT INTO departments(department_id, department_name, manager_id, location_id)
VALUES (370, 'Public Relations', 100, 1700);

SELECT *
FROM departments;

INSERT INTO departments
VALUES (371, 'Public Relations', 100, 1700);

SELECT *
FROM departments;

-- 암시적 NULL 값 입력
INSERT INTO departments(department_id, department_name)
VALUES (330, 'Purchasing');

SELECT *
FROM departments;

-- 명시적 NULL 값 입력
INSERT INTO departments
VALUES (400, 'Finance', NULL, NULL);

INSERT INTO departments
VALUES (100, 'Finance', '', '');

SELECT *
FROM departments;

-- 함수 값 입력
INSERT INTO employees
VALUES (113, 'Louis', 'Popp', 'LPOPP', '515.124.4567', SYSDATE, 'AC_ACCOUNT', 6900, NULL, 205, 110);

SELECT *
FROM employees;

INSERT INTO employees
VALUES (114, 'Den', 'Raphealy', 'DRAPHEAL', '515.127.4561', TO_DATE('FEB 3, 1999', 'MON DD, YYYY'), 'SA_REP', 11000, 0.2, 100, 60);

SELECT *
FROM employees;

-- 치환변수 : 문자값은 ' ' 사이에 입력
INSERT INTO departments(department_id, department_name, location_id)
VALUES (&department_id,'&department_name', &location);

SELECT *
FROM departments;

-- sales_reps 파일 열기
-- 서브쿼리
SELECT *
FROM sales_reps;

SELECT *
FROM copy_emp;

INSERT INTO sales_reps
               SELECT employee_id, last_name, salary, commission_pct
               FROM employees
               WHERE job_id LIKE '%REP%';

SELECT *
FROM sales_reps;

INSERT INTO copy_emp
               SELECT *
               FROM employees;

SELECT *
FROM copy_emp;

-- 기본키 입력 필수
INSERT INTO departments (department_name)
VALUES ('Yedam');

-- 기본키 중복 불가
INSERT INTO departments (department_id, department_name)
VALUES (10, 'Yedam');

INSERT INTO departments (department_id, department_name)
VALUES (120, 'Yedam');

SELECT *
FROM departments;

-- NOT NULL 제약조건
INSERT INTO departments (department_id)
VALUES (130);

-- 참조키 오류 (부모테이블 기본키 없음)
INSERT INTO departments (department_id, department_name, manager_id)
VALUES (130, 'YD', 1);

INSERT INTO departments (department_id, department_name, manager_id)
VALUES (130, 'YD', 100);

-- UPDATE (수정)
UPDATE employees
SET department_id = 50
WHERE employee_id = 113;

SELECT *
FROM employees;

-- 조건 지정 : 해당 행 변경
UPDATE employees
SET department_id = 51
WHERE employee_id = 113;

UPDATE copy_emp
SET department_id = 110;

-- 조건 미지정 : 전체 행 변경
SELECT *
FROM copy_emp;

-- 다중 조건 지정
UPDATE employees
SET job_id = 'IT_PROG', commission_pct = NULL
WHERE employee_id = 114;

SELECT *
FROM employees;

-- DML 작업 취소
ROLLBACK;

SELECT *
FROM copy_emp;

-- DELETE (삭제)
-- 자식테이블
DELETE employees;

SELECT *
FROM employees;

INSERT INTO copy_emp
               SELECT *
               FROM employees;

SELECT *
FROM copy_emp;

-- 데이터베이스 저장
COMMIT;

-- 조건 미지정 : 전체 행 삭제
DELETE copy_emp;

SELECT *
FROM copy_emp;

ROLLBACK;

SELECT *
FROM copy_emp;

-- 조건 지정 : 해당 행 삭제
DELETE FROM departments
WHERE department_name = 'Finance';

SELECT *
FROM departments;

DELETE departments
WHERE department_id IN (30, 40);

SELECT *
FROM departments;

ROLLBACK;

SELECT *
FROM copy_emp;

DELETE copy_emp;

SELECT *
FROM copy_emp;

ROLLBACK;

SELECT *
FROM copy_emp;

TRUNCATE TABLE copy_emp;

SELECT *
FROM copy_emp;

ROLLBACK;

SELECT *
FROM copy_emp;

-- DELETE : ROLLBACK 가능 (DML)
-- TRUNCATE : ROLLBACK 불가능 (DDL)

-- sql08
-- 1번 문제
CREATE TABLE my_employee
  (id         NUMBER(4) NOT NULL,
   last_name  VARCHAR2(25),
   first_name VARCHAR2(25),
   userid     VARCHAR2(8),
   salary     NUMBER(9,2));

SELECT *
FROM my_employee;

-- 3번 문제
INSERT INTO my_employee
VALUES (1, 'Patel', 'Ralph', 'Rpatel', 895);

INSERT INTO my_employee
VALUES (2, 'Dancs', 'Betty', 'Bdansc', 860);

INSERT INTO my_employee
VALUES (3, 'Biri', 'Ben', 'Bbiri', 1000);

INSERT INTO my_employee
VALUES (&id, '&last_name', '&first_name', '&userid', &salary);

-- 4번 문제
SELECT *
FROM my_employee;

-- 6번 문제
UPDATE my_employee
SET last_name = 'Drexler'
WHERE id = 3;

SELECT *
FROM my_employee;

-- 7번 문제
UPDATE my_employee
SET salary = 1000
WHERE salary < 900;

SELECT *
FROM my_employee;

-- 8번 문제
DELETE my_employee
WHERE id = 3;

SELECT *
FROM my_employee;

-- 11번 문제
DELETE my_employee;
--TRUNCATE TABLE my_employee;

SELECT *
FROM my_employee;

-- < 트랜잭션 제어 (TCL) >
-- 트랜잭션 종료 : COMMIT, ROLLBACK(DML만 적용), DDL(자동커밋), DCL(자동커밋)
COMMIT;

UPDATE employees
SET salary = 99999
WHERE employee_id = 176;

SELECT *
FROM employees
WHERE employee_id = 176;

ROLLBACK;

SELECT *
FROM employees
WHERE employee_id = 176;

COMMIT;

TRUNCATE TABLE aa;

-- < 데이터 정의어(DDL) - 객체 생성 >
SELECT table_name
FROM user_tables;

SELECT DISTINCT object_type
FROM user_objects;

SELECT *
FROM user_catalog;

-- CREATE (테이블 생성)
-- DEFAULT 옵션
CREATE TABLE hire_dates
               (id            NUMBER (8),
               hire_date DATE DEFAULT SYSDATE);

INSERT INTO hire_dates (id)
VALUES (35);

SELECT *
FROM hire_dates;

INSERT INTO hire_dates
VALUES (45, NULL);

SELECT *
FROM hire_dates;

-- 테이블 생성
CREATE TABLE dept
               (deptno        NUMBER (2),
               dname          VARCHAR2 (14),
               loc            VARCHAR2 (13),
               create_date    DATE DEFAULT SYSDATE);
               
DESCRIBE dept;

SELECT table_name
FROM user_tables;

-- 서브쿼리 테이블 생성
CREATE TABLE dept80
               AS
                              SELECT employee_id, last_name, salary * 12 ANNSAL, hire_date
                              FROM employees
                              WHERE department_id = 80;

SELECT *
FROM dept80;

-- < 데이터 정의어(DDL) - 객체 수정 >
-- ALTER (테이블 수정)
-- ADD 옵션 (추가)
ALTER TABLE dept80
ADD            (job_id VARCHAR2 (9));

SELECT *
FROM dept80;

ALTER TABLE dept80
ADD            (hdate DATE DEFAULT SYSDATE);

SELECT *
FROM dept80;

-- MODIFY 옵션 (수정)
ALTER TABLE dept80
MODIFY         (last_name VARCHAR2 (30));

ALTER TABLE dept80
MODIFY         (last_name VARCHAR2 (10));

-- 데이터 크기까지 감소 가능
ALTER TABLE dept80
MODIFY         (last_name VARCHAR2 (5));

--?????????
ALTER TABLE dept80
MODIFY         (job_id NUMBER (10));

ALTER TABLE dept80
MODIFY         (last_name NUMBER (10));

-- DROP 옵션 (삭제)
ALTER TABLE dept80
DROP (job_id);

SELECT *
FROM dept80;

-- SET UNUSED 옵션 (비활성) : 재활성 불가
-- SET UNUSED -> DROP UNUSED COLUMNS
ALTER TABLE dept80
SET UNUSED (last_name);

SELECT *
FROM dept80;

ALTER TABLE dept80
DROP UNUSED COLUMNS;

-- < 기타 데이터 정의어 >
-- DROP (테이블 삭제)
DROP TABLE dept80;

-- 오라클 휴지통
SELECT object_name, original_name, type
FROM user_recyclebin;

-- FLASHBACK (복구)
FLASHBACK TABLE dept80 TO BEFORE DROP;

SELECT *
FROM dept80;

-- DROP (테이블 완전 삭제)
DROP TABLE dept80 PURGE;

SELECT object_name, original_name, type
FROM user_recyclebin;

-- RENAME (이름 변경)
RENAME dept TO dept80;

SELECT *
FROM dept;

SELECT *
FROM dept80;

-- TRUNCATE (테이블 삭제)
TRUNCATE TABLE dept80;