-- < �׷� �Լ�>
-- SUM, AVG, \MAX, MIN : null �� ����
SELECT AVG(salary), MAX(salary), MIN(salary), SUM(salary)
FROM employees
WHERE job_id LIKE '%REP%';

SELECT MIN(hire_date), MAX(hire_date)
FROM employees;

SELECT MIN(last_name), MAX(last_name)
FROM employees;

-- COUNT(*) : null �� ����
SELECT COUNT(*)
FROM employees;

SELECT COUNT(*)
FROM departments;

SELECT COUNT(*)
FROM employees
WHERE department_id = 50;

-- COUNT : null �� ����
SELECT COUNT(commission_pct)
FROM employees
WHERE department_id = 80;

SELECT COUNT(DISTINCT department_id),
               COUNT(department_id)
FROM employees;

SELECT DISTINCT department_id
FROM employees;

-- AVG(NVL) : null �� ����
SELECT AVG(NVL(commission_pct, 0)), AVG(commission_pct)
FROM employees;

-- �Ľ� ���� : FROM -> WHERE -> GROUP BY -> SELECT -> ORDER BY
-- GROUP BY : �÷�(Colunm)��
-- �׷��Լ� �� �÷�(Colunm) GROUP BY �߰� �ʼ�
SELECT department_id, AVG(salary)
FROM employees
GROUP BY department_id;

SELECT AVG(salary)
FROM employees
GROUP BY department_id;

-- GROUP BY : 1�� �÷�(Colunm)��, 2�� �÷�(Colunm)��
SELECT department_id, job_id, SUM(salary), COUNT(salary)
FROM employees
GROUP BY department_id, job_id
ORDER BY job_id;

SELECT department_id, job_id, SUM(salary)
FROM employees
WHERE department_id > 40
GROUP BY department_id, job_id
ORDER BY department_id;

-- HAVING : �׷��Լ� ����
SELECT department_id, MAX(salary)
FROM employees
GROUP BY department_id
HAVING MAX(salary) > 10000;

SELECT job_id, SUM(salary) PAYROLL
FROM employees
WHERE job_id NOT LIKE '%REP%'
GROUP BY job_id
HAVING SUM(salary) > 13000
ORDER BY SUM(salary);

-- �׷� �Լ� ��ø : �ִ� 2������ ��ø ����
SELECT MAX(AVG(salary))
FROM employees
GROUP BY department_id;

-- �׷� �Լ� ��ø �� �Ϲ� �÷�(Colunm) �߰� �Ұ�
SELECT department_id, MAX(AVG(salary))
FROM employees
GROUP BY department_id;

SELECT *
FROM employees;

-- sql05
-- 1�� ���� : True
-- 2�� ���� : False
-- 3�� ���� : True
-- 4�� ����
SELECT ROUND(MAX(salary)) AS "Maximum", 
               ROUND(MIN(salary)) AS "Minimum", 
               ROUND(Sum(salary)) AS "Sum", 
               ROUND(AVG(salary)) AS "Average"
FROM employees;

-- 5�� ����
SELECT job_id,
               ROUND(MAX(salary)) AS "Maximum", 
               ROUND(MIN(salary)) AS "Minimum", 
               ROUND(Sum(salary)) AS "Sum", 
               ROUND(AVG(salary)) AS "Average"
FROM employees
GROUP BY job_id;

-- 6�� ����
SELECT job_id, COUNT(employee_id)
-- SELECT job_id, COUNT(*)
FROM employees
GROUP BY job_id;

-- 7�� ����
SELECT COUNT(DISTINCT manager_id) AS "Number of Managers"
FROM employees;

SELECT manager_id
FROM employees;

-- 8�� ����
SELECT MAX(salary) - MIN(salary) AS difference
FROM employees;

-- 9�� ����
SELECT manager_id, MIN(salary)
FROM employees
WHERE manager_id IS NOT NULL
GROUP BY manager_id
HAVING MIN(salary) >= 6000
ORDER BY MIN(salary) DESC;

-- < ����(JOIN) - ����Ŭ ���� ���� >
SELECT employee_id, last_name, department_id
FROM employees;

SELECT department_id, department_name
FROM departments;

-- ī�׽þ� ���δ�Ʈ (last_name * department_name) = ���� ���� : ����
SELECT last_name, department_name
FROM employees, departments;

-- ����Ŭ ���� ���� : WHERE ��
-- �ּ� (���̺� �� - 1) ���ǹ� �ʿ�
-- Equi Join (=)
SELECT e.employee_id, e.last_name, e.department_id, d.department_id, d.location_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id;

SELECT employee_id, last_name, e.department_id, d.department_id, location_id, department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id;

SELECT d.department_id, d.department_name, d.location_id, l.city
FROM departments d, locations l
WHERE d.location_id = l.location_id;

SELECT d.department_id, d.department_name, d.location_id, l.city
FROM departments d, locations l
WHERE d.location_id = l.location_id
AND d.department_id IN (20, 50);

SELECT *
FROM job_grades;

-- Non-Equi Join (= ���� ������)
SELECT e.last_name, e.salary, j.grade_level, j.lowest_sal, j.highest_sal
FROM employees e, job_grades j
WHERE e.salary
               BETWEEN j.lowest_sal AND j.highest_sal;
               
-- OUTER JOIN : ����Ŭ�� FULL OUTER JOIN ����
-- RIGHT OUTER JOIN : ������ �÷�(Colunm)���� ���� �� ����
SELECT e.last_name, e.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id(+) = d.department_id;

-- LEFT OUTER JOIN : ���� �÷�(Colunm)���� ���� �� ����
SELECT e.last_name, e.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id(+);

-- Self Join
-- manager_id, employee_id ����
SELECT employee_id, last_name, manager_id
FROM employees;

SELECT employee_id, last_name
FROM employees
ORDER BY 1;

SELECT worker.last_name || ' works for ' || manager.last_name
FROM employees worker, employees manager
WHERE worker.manager_id = manager.employee_id;

SELECT *
FROM employees;

-- < ����(JOIN) - ����Ŭ - 1999 ���� ���� > : ANSI ����
-- ANSI ���� ���� : FROM��
-- ���� ����(CROSS JOIN)          * ANSI ����
SELECT last_name, department_name
FROM employees CROSS JOIN departments;

-- ���� ����(CROSS JOIN)          * ����Ŭ ����
SELECT last_name, department_name
FROM employees, departments;

-- �ڿ� ����(NATURAL JOIN) : ������ �÷�(Colunm) ����
SELECT department_id, department_name, location_id, city
FROM departments NATURAL JOIN locations;

DESC departments;
DESC locations;

-- USING�� : () �ȿ� �ۼ�
SELECT employee_id, last_name, location_id, department_id
FROM employees JOIN departments
                              USING (department_id);

-- ���� �÷�(Colunm)������ ���̺� �� ��Ī ����
SELECT l.city, d.department_name
FROM locations l JOIN departments d
                              USING (location_id)
WHERE location_id = 1400;

-- ON��          * ANSI ����
SELECT e.employee_id, e.last_name, e.department_id, d.department_id, d.location_id
FROM employees e JOIN departments d
                              ON (e.department_id = d.department_id);
                              
-- ON��         * ����Ŭ ����
SELECT e.employee_id, e.last_name, e. department_id, d.department_id, d.location_id
FROM employees e, departments d
WHERE e.department_id = d.department_id;

-- ON�� 3-way ����               * ANSI ����
SELECT employee_id, city, department_name
FROM employees e
               JOIN departments d
                              ON d.department_id = e.department_id
               JOIN locations l
                              ON d.location_id = l.location_id;

-- ON�� 3-way ����               * ����Ŭ ����
SELECT employee_id, city, department_name
FROM employees e, departments d, locations l
WHERE d.department_id = e.department_id
AND d.location_id = l.location_id;

-- OUTER JOIN
-- LEFT OUTER JOIN            * ANSI ����
SELECT e.last_name, e.department_id, d.department_name
FROM employees e LEFT OUTER JOIN departments d
               ON (e.department_id = d.department_id);

-- LEFT OUTER JOIN            * ����Ŭ ����
SELECT e.last_name, e.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id(+);

-- RIGHT OUTER JOIN           * ANSI ����
SELECT e.last_name, e.department_id, d.department_name
FROM employees e RIGHT OUTER JOIN departments d
               ON (e.department_id = d.department_id);

-- RIGHT OUTER JOIN           * ����Ŭ ����
SELECT e.last_name, e.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id(+) = d.department_id;

SELECT e.last_name, e.department_id, d.department_name
FROM employees e, departments d
WHERE d.department_id = e.department_id(+);

-- FULL OUTER JOIN
SELECT e.last_name, e.department_id, d.department_name
FROM employees e FULL OUTER JOIN departments d
               ON (e.department_id = d.department_id);

-- �߰� ����
SELECT e.last_name, e.department_id, d.department_name
FROM employees e JOIN departments d
               ON (e.department_id = d.department_id)
AND e.manager_id = 149;

SELECT e.last_name, e.department_id, d.department_name
FROM employees e JOIN departments d
               ON (e.department_id = d.department_id)
WHERE e.manager_id = 149;

-- sql06
-- 1�� ����
-- ����Ŭ ����
SELECT l.location_id, l.street_address, l.city, l.state_province, c.country_name
FROM locations l, countries c
WHERE l.country_id = c.country_id;

-- ANSI ����
SELECT l.location_id, l.street_address, l.city, l.state_province, c.country_name
FROM locations l JOIN countries c
                              ON l.country_id = c.country_id;

-- 2�� ����
-- ����Ŭ ����
SELECT e.last_name, e.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id;

-- ANSI ����
SELECT e.last_name, e.department_id, d.department_name
FROM employees e JOIN departments d
                              ON e.department_id = d.department_id;

-- 3�� ����
-- ����Ŭ ����
SELECT e.last_name, e.job_id, e.department_id, d.department_name
FROM employees e, departments d, locations l
WHERE e.department_id = d.department_id
AND d.location_id = l.location_id
AND LOWER(l.city) = 'toronto';

-- ANSI ����
SELECT e.last_name, e.job_id, e.department_id, d.department_name
FROM employees e JOIN departments d
                              ON e.department_id = d.department_id
                              JOIN locations l
                              ON d.location_id = l.location_id
--AND LOWER(l.city) = 'toronto';
WHERE LOWER(l.city) = 'toronto';

-- 4�� ����
-- ����Ŭ ����
SELECT w.last_name AS "Employee", w.employee_id AS "Emp#", m.last_name AS "Manager", m.employee_id AS "Mgr#"
--SELECT w.last_name, w.employee_id, m.last_name, w.manager_id
FROM employees w, employees m
WHERE w.manager_id = m.employee_id;

-- ANSI ����
SELECT w.last_name AS "Employee", w.employee_id AS "Emp#", m.last_name AS "Manager", m.employee_id AS "Mgr#"
FROM employees w JOIN employees m
                              ON w.manager_id = m.employee_id;
                              
-- 5�� ����
-- ����Ŭ ����
SELECT w.last_name AS "Employee", w.employee_id AS "Emp#", m.last_name AS "Manager", m.employee_id AS "Mgr#"
FROM employees w, employees m
WHERE w.manager_id = m.employee_id(+)
ORDER BY 2;

-- ANSI ����
SELECT w.last_name AS "Employee", w.employee_id AS "Emp#", m.last_name AS "Manager", m.employee_id AS "Mgr#"
FROM employees w LEFT OUTER JOIN employees m
                              ON w.manager_id = m.employee_id
ORDER BY 2;

-- 6�� ����
DESC job_grades;

SELECT *
FROM job_grades;

-- ����Ŭ ����
SELECT e.last_name, e.job_id, d.department_name, e.salary, j.grade_level
FROM employees e, departments d, job_grades j
WHERE e.department_id = d.department_id
AND e.salary BETWEEN j.lowest_sal AND j.highest_sal;

-- ANSI ����
SELECT e.last_name, e.job_id, d.department_name, e.salary, j.grade_level
FROM employees e JOIN departments d
                              ON e.department_id = d.department_id
                              JOIN job_grades j
                              ON e.salary BETWEEN j.lowest_sal AND j.highest_sal;

-- < �������� >
SELECT last_name, salary
FROM employees
WHERE salary IN (SELECT MAX(salary)
                              FROM employees
                              GROUP BY department_id);

SELECT MAX(salary)
FROM employees
GROUP BY department_id;

-- ������ �������� (���ϰ� 1��) : �� ������ ���
SELECT last_name, salary
FROM employees
WHERE salary > (SELECT salary
                              FROM employees
                              WHERE last_name = 'Abel');
                              
SELECT employee_id, last_name, job_id
FROM employees
WHERE job_id = (SELECT job_id
                              FROM employees
                              WHERE employee_id = 141)
AND employee_id != 141;

SELECT last_name, job_id, salary
FROM employees
WHERE job_id = (SELECT job_id
                              FROM employees
                              WHERE last_name = 'Abel')
AND salary > (SELECT salary
                              FROM employees
                              WHERE last_name = 'Abel');