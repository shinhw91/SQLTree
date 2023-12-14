-- 1번 문제
SELECT employee_id, last_name, salary, department_id
FROM employees
WHERE salary BETWEEN 7000 AND 12000
AND LOWER(last_name) LIKE 'h%';

-- 2번 문제
SELECT employee_id,
               last_name,
               TO_CHAR(hire_date, 'MM/DD/YYYY DAY'),
               TO_CHAR(salary * commission_pct, '$9999.99') AS pay
FROM employees
WHERE commission_pct IS NOT NULL
ORDER BY 4 DESC;

-- 3번 문제
SELECT employee_id, last_name, job_id, salary, department_id
FROM employees
WHERE department_id IN (50, 60)
AND salary > 5000;

-- 4번 문제
SELECT employee_id, last_name, department_id,
               CASE department_id WHEN 20 THEN 'Canade'
                                             WHEN 80 THEN 'UK'
                                             ELSE 'USA'
               END location
FROM employees;

-- 5번 문제
SELECT e.last_name, e.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id(+);

-- 6번 문제
SELECT employee_id, last_name, hire_date,
               CASE WHEN hire_date >= TO_DATE('20050101', 'YYYYMMDD') THEN 'New employee'
                              ELSE 'Career employee'
               END AS career
FROM employees
WHERE employee_id = &employee_id;

-- 7번 문제
SELECT employee_id, last_name, salary,
               CASE WHEN salary <= 5000 THEN salary * 1.2
                              WHEN salary <= 10000 THEN salary * 1.15
                              WHEN salary <= 15000 THEN salary * 1.1
                              ELSE salary
               END "increase_salary"
FROM employees
WHERE employee_id = &employee_id;


-- 8번 문제
SELECT d.department_id, d.department_name, l.city
FROM departments d, locations l
WHERE d.location_id = l.location_id;

-- 9번 문제
SELECT employee_id, last_name, job_id
FROM employees
WHERE department_id = (SELECT department_id
                                             FROM departments
                                             WHERE department_name = 'IT');

-- 10번 문제
SELECT department_id, COUNT(*), TRUNC(AVG(salary))
FROM employees
GROUP BY department_id;

-- 11번 문제
CREATE TABLE PROF(
               PROFNO          NUMBER (4),
               NAME           VARCHAR2 (15) NOT NULL,
               ID             VARCHAR2 (15) NOT NULL,
               HIREDATE       DATE,
               PAY            NUMBER (4));

-- 12번 문제
-- (1)
INSERT INTO PROF
VALUES (1001, 'Mark', 'm1001', '07/03/01', 800);

INSERT INTO PROF
VALUES (1003, 'Adam', 'a1003', '11/03/02', null);

COMMIT;

-- (2)
UPDATE PROF
SET PROFNO = 1001
WHERE PAY = 1200;

-- (3)
DELETE FROM PROF
WHERE PROFNO = 1003;

-- 13번 문제
-- (1)
ALTER TABLE PROF
ADD PRIMARY KEY (PROFNO);

-- (2)
ALTER TABLE PROF
ADD            (GENDER CHAR (3));

-- (3)
ALTER TABLE PROF
MODIFY (NAME VARCHAR2 (20));

-- 14번 문제
-- (1)
CREATE VIEW PROF_VU
AS SELECT PROFNO AS PNO, NAME AS PNAME, ID
               FROM PROF;

-- (2)
CREATE OR REPLACE VIEW PROF_VU
AS SELECT PROFNO AS PNO, NAME AS PNAME, ID, HIREDATE
               FROM PROF;
               
-- 15번 문제
-- (1)
DROP TABLE PROF_VU PURGE;