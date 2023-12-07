-- < �⺻���� ������ ��ȸ >
-- ���̺� ���� Ȯ��
DESC departments;

-- ���̺� ��ȸ
SELECT *
FROM departments;

SELECT *
FROM employees;

SELECT department_id, location_id
FROM departments;

SELECT location_id, department_id
FROM departments;

SELECT department_id, department_id
FROM departments;

SELECT last_name
FROM departments;

SELECT *
FROM employees;

SELECT last_name, salary, salary + 300
FROM employees;

SELECT last_name, salary, 12 * salary + 100
FROM employees;

SELECT last_name, salary, 12 * (salary + 100)
FROM employees;

SELECT last_name, job_id, salary, commission_pct
FROM employees;

-- NVL(��, ������) : ���� null�� ��� ������ ����
SELECT last_name, 12 * salary * NVL(commission_pct, 1) 
FROM employees;

-- �� ��Ī (AS)
SELECT last_name AS name, commission_pct comm
FROM employees;

SELECT last_name AS "Name", commission_pct "Annual Salary"
FROM employees;

SELECT last_name AS �̸�, commission_pct ���ʽ�
FROM employees;

-- ���� ������ (||)
SELECT last_name || job_id AS "Employee"
FROM employees;

SELECT last_name || ' is a ' || job_id
    AS "EMployee Details"
FROM employees;

-- �ߺ� �� ���� (DISTINCT)
SELECT department_id
FROM employees;

SELECT DISTINCT department_id
FROM employees;

SELECT DISTINCT department_id, job_id
FROM employees;

-- 1�� ����
DESC departments;

SELECT *
FROM departments;

-- 2�� ����
DESC employees;

SELECT department_id, last_name, job_id, hire_date AS startdate
FROM employees;

-- 3�� ����
SELECT DISTINCT job_id
FROM employees;

-- 4�� ����
SELECT department_id AS "Emp #", last_name AS "Employee", job_id AS "Job", hire_date AS "Hire Date"
FROM employees;

-- 5�� ����
SELECT job_id || ', ' || last_name
    AS "Employee and Title"
FROM employees;

-- < ������ ���� �� ���� >
-- �Ľ� ���� : FROM -> WHERE -> SELECT
SELECT employee_id, last_name, job_id, department_id
FROM employees
WHERE department_id = 90;

SELECT last_name, job_id, department_id
FROM employees
WHERE last_name = 'Whalen';

-- ��¥ ���� ��ġ
SELECT last_name
FROM employees
WHERE hire_date = '05/10/10';

SELECT *
FROM employees;

SELECT last_name, salary
FROM employees
WHERE salary <= 3000;

SELECT last_name, hire_date
FROM employees
WHERE hire_date < '05/01/01';

-- BETWEEN ������
-- BETWEEN A AND B : A �̻�, B ����
SELECT last_name, salary
FROM employees
WHERE salary BETWEEN 2500 AND 3500;
--WHERE salary BETWEEN 3500 AND 2500; : ������ ��

-- IN ������ (��� ��ȸ)
SELECT employee_id, last_name, salary, manager_id
FROM employees
WHERE manager_id IN (100, 101, 201);

-- LIKE ������ (���� �˻�)
SELECT first_name
FROM employees
WHERE first_name LIKE 'S%';

SELECT last_name
FROM employees
WHERE last_name LIKE '%s';

SELECT last_name, hire_date
FROM employees
WHERE hire_date LIKE '05%';

SELECT last_name
FROM employees
WHERE last_name LIKE '_o%';

SELECT employee_id, last_name, job_id
FROM employees
WHERE job_id LIKE '%SA_%';

SELECT employee_id, last_name, job_id
FROM employees;

-- %, _ ���� �ν� (ESCAPE) : �ĺ���(3) ���� ����
SELECT employee_id, last_name, job_id
FROM employees
WHERE job_id LIKE '%SA3_%' ESCAPE '3';

-- IS NULL ������
SELECT *
FROM employees
WHERE commission_pct is null;

-- ��������
SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary >= 1000 AND job_id LIKE '%MAN%';

SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary >= 1000 OR job_id LIKE '%MAN%';

-- NOT ������ (IN, BETWEEN, LIKE, NULL)
SELECT last_name, job_id
FROM employees
WHERE job_id
    NOT IN ('IT_PROG', 'ST_CLERK', 'SA_REP');
    
-- ������ �켱���� : AND > OR
SELECT last_name, job_id, salary
FROM employees
WHERE job_id = 'SA_REP' OR job_id = 'AD_PRES' AND salary > 15000;

SELECT last_name, job_id, salary
FROM employees
WHERE (job_id = 'SA_REP' OR job_id = 'AD_PRES') AND salary > 15000;

SELECT *
FROM employees;

-- 1�� ����
SELECT last_name, salary
FROM employees
WHERE salary >= 12000;

-- 2�� ����
SELECT last_name, department_id
FROM employees
WHERE employee_id = 176;

-- 3�� ����
SELECT last_name, salary
FROM employees
WHERE salary NOT BETWEEN 5000 AND 12000;

-- 6�� ����
SELECT last_name AS "Employee", salary AS "Monthly Salary"
FROM employees
WHERE (salary BETWEEN 5000 AND 12000) AND (department_id = 20 OR department_id = 50);

-- 7�� ����
SELECT last_name, job_id
FROM employees
WHERE hire_date = '14%';

-- 8�� ����
-- 9�� ����
-- 10�� ����
