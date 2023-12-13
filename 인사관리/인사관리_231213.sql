-- < �������� ���� >
-- NOT NULL, PRIMARY KEY : null �� �Ұ���
-- UNIQUE, FOREIGN KEY, CHECK : null �� ����

-- NOT NULL : �� ���� �������Ǹ� ����
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

-- UNIQUE (��, �� ���� ����) : ���̺� ���� �������Ǹ� ����
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

-- �ĺ�Ű = �⺻Ű + ��üŰ
-- �ĺ�Ű : ���ϼ� + �ּҼ�
-- ����Ű : ���ϼ�

-- PRIMARY KEY (��, �� ���� ����) = UNIQUE + NOT NULL
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

-- FOREIGN KEY (�ܷ�Ű)
DROP TABLE emp_test;

-- ���̺� ���� ��������
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

-- �� ���� ��������
-- ON DELETE SET NULL �ɼ� : �θ����̺� �� �����Ǵ� ���, NULL
-- ON DELETE CASCADE �ɼ� : �θ����̺� �� �����Ǵ� ���, �� ���� 
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

-- CHECK (����)
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

-- < �������� ���� �� ���� >
-- ALTER (����)
-- ADD��
ALTER TABLE emp_test
ADD PRIMARY KEY (empid);

ALTER TABLE emp_test
ADD FOREIGN KEY (mgr) REFERENCES emp_test (empid);

-- MODIFY�� : NOT NULL
ALTER TABLE emp_test
MODIFY (duty VARCHAR2 (9) NOT NULL);

ALTER TABLE emp_test
MODIFY (duty NOT NULL);

-- �������� Ȯ��
SELECT constraint_name, column_name
FROM user_cons_columns;

DESC user_cons_columns;

SELECT constraint_name, table_name, column_name
FROM user_cons_columns
WHERE table_name = 'EMP_TEST';

-- DROP (����)
ALTER TABLE emp_test
DROP constraint sys_C007024;

-- < �� (view) >
-- CREATE (�� ����)
CREATE VIEW empvu80
AS SELECT employee_id, last_name, salary
               FROM employees
               WHERE department_id = 80;
               
SELECT *
FROM empvu80;

-- �� ��Ī ����
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

-- CREATE OR REPLACE (����, ��ü)
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

-- DROP (�� ����)
DROP VIEW dept_sum_vu;

-- �並 ���� ������ ����
-- DELETE �Ұ� : �׷� �Լ�, GROUP BY, DISTINCT, ROWNUM
-- UPDATE �Ұ� : �׷� �Լ�, GROUP BY, DISTINCT, ROWNUM, ǥ����?????????
SELECT rownum, employee_id
FROM employees;

COMMIT;

-- DELETE ����
SELECT *
FROM empvu80;

DELETE empvu80
WHERE id_number = 176;

SELECT *
FROM empvu80;

SELECT *
FROM employees;

-- DELETE �Ұ� (�׷� �Լ�)
SELECT *
FROM dept_sum_vu;

DELETE dept_sum_vu
WHERE name = 'IT';

-- WITH CHECK OPTION
-- WITH READ ONLY

-- PRIMARY KEY �Է� �ʿ�
CREATE VIEW test_vu
AS SELECT department_name
               FROM departments;
               
SELECT *
FROM test_vu;

INSERT INTO test_vu
VALUES ('YD');

-- < ��Ÿ ��ü >
-- SEQUENCE (���� ��ȣ)
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

-- ������ �� ����
ROLLBACK;

SELECT *
FROM departments;

-- ���� ������ ��
SELECT dept_deptid_seq.CURRVAL
FROM dual;

-- SYNONYM (���Ǿ�)
CREATE SYNONYM d_sum
FOR dept_sum_vu;

SELECT *
FROM d_sum;

SELECT *
FROM dept_sum_vu;

-- < ������ ����� (DCL) >
-- �ý��� ���� Ȯ��
SELECT *
FROM system_privilege_map;

-- < ������ ���� >
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
