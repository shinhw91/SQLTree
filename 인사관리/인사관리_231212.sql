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

-- ������ �������� (���ϰ� 2�� �̻�) : IN, ANY, ALL, SOME
-- < ANY : �ִ밪���� ����
SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary < ANY (SELECT salary
                                             FROM employees
                                             WHERE job_id = 'IT_PROG')
AND job_id <> 'IT_PROG';

-- < ALL : �ּҰ����� ����
SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary < ALL (SELECT salary
                                             FROM employees
                                             WHERE job_id = 'IT_PROG')
AND job_id <> 'IT_PROG';

-- > ANY : �ּҰ����� ŭ
-- > ALL : �ִ밪���� ŭ

-- cre_empl ���� ����
-- ���߿� �������� : �÷�(Colunm) ������
-- WHERE : ��ȣ() �ȿ� �ۼ�
SELECT employee_id, manager_id, department_id
FROM empl_demo
WHERE (manager_id, department_id) IN
                                                            (SELECT manager_id, department_id
                                                            FROM empl_demo
                                                            WHERE first_name = 'John')
AND first_name <> 'John';

-- AND : �������
SELECT employee_id, manager_id, department_id
FROM empl_demo
WHERE manager_id IN (SELECT manager_id
                                             FROM empl_demo
                                             WHERE first_name = 'John')
AND department_id IN (SELECT department_id
                                             FROM empl_demo
                                             WHERE first_name = 'John')
AND first_name <> 'John';

-- cre_hrdata ���� ����
-- < ������ ���۾� (DML) >
-- INSERT (�߰�)
INSERT INTO departments(department_id, department_name, manager_id, location_id)
VALUES (370, 'Public Relations', 100, 1700);

SELECT *
FROM departments;

INSERT INTO departments
VALUES (371, 'Public Relations', 100, 1700);

SELECT *
FROM departments;

-- �Ͻ��� NULL �� �Է�
INSERT INTO departments(department_id, department_name)
VALUES (330, 'Purchasing');

SELECT *
FROM departments;

-- ����� NULL �� �Է�
INSERT INTO departments
VALUES (400, 'Finance', NULL, NULL);

INSERT INTO departments
VALUES (100, 'Finance', '', '');

SELECT *
FROM departments;

-- �Լ� �� �Է�
INSERT INTO employees
VALUES (113, 'Louis', 'Popp', 'LPOPP', '515.124.4567', SYSDATE, 'AC_ACCOUNT', 6900, NULL, 205, 110);

SELECT *
FROM employees;

INSERT INTO employees
VALUES (114, 'Den', 'Raphealy', 'DRAPHEAL', '515.127.4561', TO_DATE('FEB 3, 1999', 'MON DD, YYYY'), 'SA_REP', 11000, 0.2, 100, 60);

SELECT *
FROM employees;

-- ġȯ���� : ���ڰ��� ' ' ���̿� �Է�
INSERT INTO departments(department_id, department_name, location_id)
VALUES (&department_id,'&department_name', &location);

SELECT *
FROM departments;

-- sales_reps ���� ����
-- ��������
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

-- �⺻Ű �Է� �ʼ�
INSERT INTO departments (department_name)
VALUES ('Yedam');

-- �⺻Ű �ߺ� �Ұ�
INSERT INTO departments (department_id, department_name)
VALUES (10, 'Yedam');

INSERT INTO departments (department_id, department_name)
VALUES (120, 'Yedam');

SELECT *
FROM departments;

-- NOT NULL ��������
INSERT INTO departments (department_id)
VALUES (130);

-- ����Ű ���� (�θ����̺� �⺻Ű ����)
INSERT INTO departments (department_id, department_name, manager_id)
VALUES (130, 'YD', 1);

INSERT INTO departments (department_id, department_name, manager_id)
VALUES (130, 'YD', 100);

-- UPDATE (����)
UPDATE employees
SET department_id = 50
WHERE employee_id = 113;

SELECT *
FROM employees;

-- ���� ���� : �ش� �� ����
UPDATE employees
SET department_id = 51
WHERE employee_id = 113;

UPDATE copy_emp
SET department_id = 110;

-- ���� ������ : ��ü �� ����
SELECT *
FROM copy_emp;

-- ���� ���� ����
UPDATE employees
SET job_id = 'IT_PROG', commission_pct = NULL
WHERE employee_id = 114;

SELECT *
FROM employees;

-- DML �۾� ���
ROLLBACK;

SELECT *
FROM copy_emp;

-- DELETE (����)
-- �ڽ����̺�
DELETE employees;

SELECT *
FROM employees;

INSERT INTO copy_emp
               SELECT *
               FROM employees;

SELECT *
FROM copy_emp;

-- �����ͺ��̽� ����
COMMIT;

-- ���� ������ : ��ü �� ����
DELETE copy_emp;

SELECT *
FROM copy_emp;

ROLLBACK;

SELECT *
FROM copy_emp;

-- ���� ���� : �ش� �� ����
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

-- DELETE : ROLLBACK ���� (DML)
-- TRUNCATE : ROLLBACK �Ұ��� (DDL)

-- sql08
-- 1�� ����
CREATE TABLE my_employee
  (id         NUMBER(4) NOT NULL,
   last_name  VARCHAR2(25),
   first_name VARCHAR2(25),
   userid     VARCHAR2(8),
   salary     NUMBER(9,2));

SELECT *
FROM my_employee;

-- 3�� ����
INSERT INTO my_employee
VALUES (1, 'Patel', 'Ralph', 'Rpatel', 895);

INSERT INTO my_employee
VALUES (2, 'Dancs', 'Betty', 'Bdansc', 860);

INSERT INTO my_employee
VALUES (3, 'Biri', 'Ben', 'Bbiri', 1000);

INSERT INTO my_employee
VALUES (&id, '&last_name', '&first_name', '&userid', &salary);

-- 4�� ����
SELECT *
FROM my_employee;

-- 6�� ����
UPDATE my_employee
SET last_name = 'Drexler'
WHERE id = 3;

SELECT *
FROM my_employee;

-- 7�� ����
UPDATE my_employee
SET salary = 1000
WHERE salary < 900;

SELECT *
FROM my_employee;

-- 8�� ����
DELETE my_employee
WHERE id = 3;

SELECT *
FROM my_employee;

-- 11�� ����
DELETE my_employee;
--TRUNCATE TABLE my_employee;

SELECT *
FROM my_employee;

-- < Ʈ����� ���� (TCL) >
-- Ʈ����� ���� : COMMIT, ROLLBACK(DML�� ����), DDL(�ڵ�Ŀ��), DCL(�ڵ�Ŀ��)
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

-- < ������ ���Ǿ�(DDL) - ��ü ���� >
SELECT table_name
FROM user_tables;

SELECT DISTINCT object_type
FROM user_objects;

SELECT *
FROM user_catalog;

-- CREATE (���̺� ����)
-- DEFAULT �ɼ�
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

-- ���̺� ����
CREATE TABLE dept
               (deptno        NUMBER (2),
               dname          VARCHAR2 (14),
               loc            VARCHAR2 (13),
               create_date    DATE DEFAULT SYSDATE);
               
DESCRIBE dept;

SELECT table_name
FROM user_tables;

-- �������� ���̺� ����
CREATE TABLE dept80
               AS
                              SELECT employee_id, last_name, salary * 12 ANNSAL, hire_date
                              FROM employees
                              WHERE department_id = 80;

SELECT *
FROM dept80;

-- < ������ ���Ǿ�(DDL) - ��ü ���� >
-- ALTER (���̺� ����)
-- ADD �ɼ� (�߰�)
ALTER TABLE dept80
ADD            (job_id VARCHAR2 (9));

SELECT *
FROM dept80;

ALTER TABLE dept80
ADD            (hdate DATE DEFAULT SYSDATE);

SELECT *
FROM dept80;

-- MODIFY �ɼ� (����)
ALTER TABLE dept80
MODIFY         (last_name VARCHAR2 (30));

ALTER TABLE dept80
MODIFY         (last_name VARCHAR2 (10));

-- ������ ũ����� ���� ����
ALTER TABLE dept80
MODIFY         (last_name VARCHAR2 (5));

--?????????
ALTER TABLE dept80
MODIFY         (job_id NUMBER (10));

ALTER TABLE dept80
MODIFY         (last_name NUMBER (10));

-- DROP �ɼ� (����)
ALTER TABLE dept80
DROP (job_id);

SELECT *
FROM dept80;

-- SET UNUSED �ɼ� (��Ȱ��) : ��Ȱ�� �Ұ�
-- SET UNUSED -> DROP UNUSED COLUMNS
ALTER TABLE dept80
SET UNUSED (last_name);

SELECT *
FROM dept80;

ALTER TABLE dept80
DROP UNUSED COLUMNS;

-- < ��Ÿ ������ ���Ǿ� >
-- DROP (���̺� ����)
DROP TABLE dept80;

-- ����Ŭ ������
SELECT object_name, original_name, type
FROM user_recyclebin;

-- FLASHBACK (����)
FLASHBACK TABLE dept80 TO BEFORE DROP;

SELECT *
FROM dept80;

-- DROP (���̺� ���� ����)
DROP TABLE dept80 PURGE;

SELECT object_name, original_name, type
FROM user_recyclebin;

-- RENAME (�̸� ����)
RENAME dept TO dept80;

SELECT *
FROM dept;

SELECT *
FROM dept80;

-- TRUNCATE (���̺� ����)
TRUNCATE TABLE dept80;