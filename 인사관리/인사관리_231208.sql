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
WHERE salary > 12000;

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
--WHERE (salary BETWEEN 5000 AND 12000) AND (department_id = 20 OR department_id = 50)
WHERE salary BETWEEN 5000 AND 12000 AND department_id IN (20, 50);

-- 7�� ����
SELECT last_name, hire_date
FROM employees
WHERE hire_date LIKE '05%';

-- 8�� ����
SELECT last_name, job_id
FROM employees
WHERE manager_id IS NULL;

-- 10�� ����
SELECT last_name
FROM employees
WHERE last_name LIKE '__a%';

-- 11�� ����
SELECT last_name
FROM employees
WHERE last_name LIKE '%a%' AND last_name LIKE '%e%';

-- 12�� ����
SELECT last_name, job_id, salary
FROM employees
--WHERE (job_id = 'SA_REP' OR job_id = 'ST_CLERK') AND (salary NOT IN (2500, 3500, 7000));
WHERE job_id IN ('SA_REP', 'ST_CLERK') AND salary NOT IN (2500, 3500, 7000);

-- 13�� ����
SELECT last_name, salary, commission_pct
FROM employees
WHERE commission_pct = 0.2;

-- ORDER BY ��
-- �Ľ� ���� : FROM -> WHERE -> SELECT -> ORDER BY
SELECT last_name, job_id, department_id, hire_date
FROM employees
ORDER BY hire_date;

-- �������� (DESC)
SELECT last_name, job_id, department_id, hire_date
FROM employees
ORDER BY hire_date DESC;

-- �� ��Ī ����
SELECT employee_id, last_name, salary * 12 annsal
FROM employees
ORDER BY annsal;

-- colunm ��ȣ ����
SELECT last_name, job_id, department_id, hire_date
FROM employees
ORDER BY 3;

-- 1�� ����, 2�� ����
SELECT last_name, department_id, salary
FROM employees
ORDER BY department_id, salary DESC;

-- SELECT ��� ���� ����
SELECT employee_id, salary
FROM employees
ORDER BY hire_date;

-- ġȯ���� (&)
SELECT employee_id, last_name, salary, department_id
FROM employees
WHERE employee_id = &employee_num;

SELECT employee_id, last_name, job_id, &column_name
FROM employees
WHERE &condition
ORDER BY &order_column;

-- ġȯ���� (&&) ��������
SELECT employee_id, last_name, job_id, &&column_name
FROM employees
ORDER BY &column_name;

SELECT employee_id, salary
FROM employees
ORDER BY &column_name;

-- ġȯ���� (&&) ����
UNDEFINE column_name;

-- < ����(set) ������ >
SELECT *
FROM job_history;

-- UNION (�ߺ��� ����)
SELECT employee_id, job_id
FROM employees
UNION
SELECT employee_id, job_id
FROM job_history;

-- UNION ALL (�ߺ��� ����, ���� �ȵ�)
SELECT employee_id, job_id
FROM employees
UNION ALL
SELECT employee_id, job_id
FROM job_history;

SELECT employee_id, job_id, department_id
FROM employees
UNION ALL
SELECT employee_id, job_id, department_id
FROM job_history
ORDER BY  employee_id;

-- INTERSECT (������)
SELECT employee_id, job_id
FROM employees
INTERSECT
SELECT employee_id, job_id
FROM job_history;

SELECT employee_id, job_id
FROM  job_history
INTERSECT
SELECT employee_id, job_id
FROM employees;

-- MINUS (������)
SELECT employee_id, job_id
FROM employees
MINUS
SELECT employee_id, job_id
FROM job_history;

SELECT employee_id, job_id
FROM job_history
MINUS
SELECT employee_id, job_id
FROM employees;

-- < ���� �Լ� �� >
DESC dual;

SELECT *
FROM dual;

SELECT sysdate
FROM employees;

SELECT sysdate
FROM dual;

-- ��ҹ��� ���� �Լ�
SELECT 'The job id for ' || UPPER (last_name) || ' is ' || LOWER (job_id) AS "EMPLOYEE DETAILS"
FROM employees;

SELECT employee_id, last_name, department_id
FROM employees
WHERE LOWER (last_name) = 'higgins';

-- < ���� �Լ� �� >
-- ���� ���� �Լ�
SELECT last_name, SUBSTR (last_name, 4)
FROM employees
WHERE department_id = 90;

SELECT last_name, SUBSTR (last_name, 2, 2)
FROM employees
WHERE department_id = 90;

SELECT last_name, SUBSTR (last_name, -3, 2)
FROM employees
WHERE department_id = 90;

SELECT employee_id, CONCAT (first_name, last_name) NAME,
    job_id, LENGTH (last_name),
    INSTR (last_name, 'a') "Comtains 'a'?"
FROM employees
WHERE SUBSTR (job_id, 4) = 'REP';

-- LTRIM : ���ʿ��� y, e, a ������� ����
SELECT LTRIM ('yyedaymy', 'yea')
FROM dual;

-- RTRIM : �����ʿ��� y, e, a ������� ����
SELECT RTRIM ('yyedaymy', 'yea')
FROM dual;

-- < ���� �Լ��� ��¥ �Լ� >
-- ���� �Լ�
-- ROUND (�ݿø�)
SELECT ROUND (345.678) AS round1,
    ROUND (345.678, 0) AS round2,
    ROUND (345.678, 1) AS round3,
    ROUND (345.678, -1) AS round4
FROM dual;

-- TRUNC (����)
SELECT TRUNC (345.678) AS round1,
    TRUNC (345.678, 0) AS round2,
    TRUNC (345.678, 1) AS round3,
    TRUNC (345.678, -1) AS round4
FROM dual;

-- MOD (������)
SELECT last_name, salary, MOD (salary, 5000)
FROM employees;

SELECT *
FROM employees;

-- 1�� ����
SELECT sysdate AS "Date"
FROM dual;

-- 2�� ����
SELECT employee_id, last_name, salary, TRUNC(salary * 1.15) AS "New Salary"
FROM employees;

-- 3�� ����
SELECT employee_id, last_name, salary, TRUNC(salary * 1.15) AS "New Salary", TRUNC(salary * 1.15 - salary) AS "Increase"
FROM employees;

-- 4�� ����
SELECT UPPER(last_name) AS name, LENGTH(last_name) AS name_length
FROM employees
--WHERE last_name LIKE 'J%' OR last_name LIKE 'A%' OR last_name LIKE 'M%'
WHERE SUBSTR (last_name, 1, 1) IN ('J', 'A', 'M')
--ORDER BY last_name;
ORDER BY 1;

-- ��¥ �Լ�
SELECT SYSDATE
FROM dual;

SELECT last_name, (SYSDATE - hire_date) / 7 AS WEEKS
FROM employees
WHERE department_id = 90;

-- MONTHS_BETWEEN : �� ��¥ ������ ���� ��
-- ADD_MONTHS : ��¥�� ���� �� ����
-- NEXT_DAY : ��¥�� ������ ���ƿ��� ����� ������ ��¥
-- LAST_DAY : ������ ��¥
-- ROUND : �ݿø�
-- TRUNC : ����

SELECT employee_id, hire_date,
    MONTHS_BETWEEN (SYSDATE, hire_date) TENURE,
    ADD_MONTHS(hire_date, 6) REVIEW,
    NEXT_DAY(hire_date, '��'),
    LAST_DAY(hire_date)
FROM employees;

SELECT ROUND(SYSDATE, 'YEAR'),   -- 7�� 1��
    ROUND(SYSDATE, 'MONTH'),    -- 15�� ����
    ROUND(SYSDATE, 'DAY'),  -- ������ ����
    ROUND(SYSDATE, 'DD')    -- ����
FROM dual;

-- < ��ȯ �Լ� �� >
-- �Ͻ��� ������ ���� ��ȯ
SELECT *
FROM employees
WHERE employee_id = '101';

-- ����� ������ ���� ��ȯ
ALTER SESSION SET
NLS_DATE_LANGUAGE = AMERICAN;

-- TO_CHAR (���� -> ����, ��¥ -> ����)
SELECT employee_id, TO_CHAR (hire_date, 'MM/YY') Month_Hired
FROM employees;

SELECT last_name,
    TO_CHAR (hire_date, 'DD Month YYYY')
    AS HIREDATE
FROM employees;

SELECT last_name,
    TO_CHAR (hire_date, 'DD month YYYY')
    AS HIREDATE
FROM employees;

SELECT last_name,
    TO_CHAR (hire_date, 'DD MONTH YYYY')
    AS HIREDATE
FROM employees;

-- fm (0 �߰�) : 3 -> 03
SELECT last_name,
    TO_CHAR (hire_date, 'fmDD MONTH YYYY')
    AS HIREDATE
FROM employees;

-- SP : ���ڷ� ǥ���� �� (4 -> FOUR)
-- SPTH : ���ڷ� ǥ���� ���� (4 -> FOURTH)
SELECT last_name,
    TO_CHAR (hire_date, 'fmDdspth "of" Month YYYY fmHH:MI:SS AM')
FROM employees;

SELECT TO_CHAR (salary, '$99,999.00') SALARY
FROM employees;

SELECT TO_CHAR (salary, '$9,999.00') SALARY
FROM employees;

-- < ��ȯ �Լ� �� >
-- TO_NUMBER (���� -> ����)
SELECT TO_NUMBER ('$3,400', '$99,999')
FROM dual;

-- TO_DATE (���� -> ��¥)
SELECT TO_DATE ('2010��, 02��', 'YYYY"��", MM"��"')
FROM dual;

SELECT last_name, hire_date
FROM employees
WHERE hire_date > TO_DATE ('2005�� 07�� 01��', 'YYYY"��" MM"��" DD"��"');

-- fx : ��Ȯ�� ���� ��
SELECT last_name, hire_date
FROM employees
--WHERE hire_date > TO_DATE ('05/07/01', 'fxYY-MM-DD');
WHERE hire_date > TO_DATE ('05/07/01', 'fxYY/MM/DD');

-- < �Ϲ� �Լ��� ��ø �Լ�>
-- NVL �Լ�
-- NVL(��, ������) : ���� null�� ��� ������ ����
SELECT last_name, salary, NVL (commission_pct, 0),
    (salary * 12) + (salary * 12 * NVL (commission_pct, 0)) AN_SAL
FROM employees;

-- ������ Ÿ�� ��ġ �ʿ�
SELECT last_name, salary, NVL (TO_CHAR(commission_pct), '���ʽ� ����')
FROM employees;

-- NVL2 �Լ�
-- NVL(��, expr1, expr2) : ���� null�� �ƴ� ��� expr1, null�� ��� expr2
SELECT last_name, salary, commission_pct,
    NVL2 (commission_pct, 'SAL+COMM', 'SAL') income
FROM employees;

-- NULLIF �Լ�
-- NULLIF(expr1, expr2) : expr1, expr2 �����ϸ� null, �������� ������ expr1
SELECT first_name, LENGTH (first_name) "expr1",
    last_name, LENGTH (last_name) "expr2",
    NULLIF (LENGTH (first_name), LENGTH (last_name)) result
FROM employees;

-- ���� ǥ����
-- CASE ǥ���� (IF-THEN-ELSE)
-- �� ����
SELECT last_name, job_id, salary,
    CASE job_id WHEN 'IT_PROG' THEN 1.10 * salary
                        WHEN 'ST_CLERK' THEN 1.15 * salary
                        WHEN 'SA_REP' THEN 1.20 * salary
                        ELSE salary
    END "REVISED_SALARY"
FROM employees;

-- ���� ����
SELECT last_name, salary,
               CASE WHEN salary < 5000 THEN 'Low'
                              WHEN salary < 10000 THEN 'Medium'
                              WHEN salary < 20000 THEN 'Good'
                              ELSE 'Excellent'
               END qualified_salary
FROM employees;

-- DECODE �Լ� : ���� ���� �Ұ�
SELECT last_name, job_id, salary,
               DECODE(job_id, 'IT_PROG', 1.10 * salary,
                                             'ST_CLERK', 1.15 * salary,
                                             'SA_REP', 1.20 * salary,
                                                            salary)
               REVISED_SALARY
FROM employees;

-- sql03_2
-- 5�� ����
SELECT last_name, 
               ROUND(MONTHS_BETWEEN(SYSDATE, hire_date)) AS "MONTHS_WORKED"
FROM employees;

-- 6�� ����
SELECT first_name, LPAD(salary, 15, '#') AS salary
FROM employees;

-- 7�� ����
SELECT last_name, TRUNC((SYSDATE - hire_date) / 7) AS TENURE
FROM employees;
WHERE department_id = 90;

-- sql04
-- 1�� ����
SELECT last_name || ' earns ' || TO_CHAR(salary, '$999,999.00') || ' monthly but wants ' || TO_CHAR(salary * 3, '$999,999.00') AS "Dream Salaries"
FROM employees;

-- 2�� ����
SELECT last_name, hire_date, TO_CHAR(NEXT_DAY(ADD_MONTHS(hire_date, 6), '��'), 'YYYY.MM.DD DAY') AS REVIEW
FROM employees;

-- 3�� ����
SELECT last_name, hire_date, TO_CHAR(hire_date, 'DAY') AS DAY
FROM employees
ORDER BY TO_CHAR(hire_date - 1, 'D');

-- 4�� ����
SELECT last_name, NVL (TO_CHAR(commission_pct), 'No Commission') AS COMM
FROM employees;

-- 5�� ����
-- DECODE �Լ�
SELECT last_name, job_id,
               DECODE(job_id, 'AD_PRES', 'A',
                                             'ST_MAN', 'B',
                                             'IT_PROG', 'C',
                                             'SA_REP', 'D',
                                             'ST_CLERK', 'E',
                                             0)
               AS grade
FROM employees;

-- CASE ����
SELECT last_name, job_id,
               CASE job_id WHEN 'AD_PRES' THEN 'A'
                              WHEN 'ST_MAN' THEN 'B'
                              WHEN 'IT_PROG' THEN 'C'
                              WHEN 'SA_REP' THEN 'D'
                              WHEN 'ST_CLERK' THEN 'E'
                              ELSE '0'
               END grade
FROM employees;