-- < 그룹 함수>
-- SUM, AVG, \MAX, MIN : null 값 제외
SELECT AVG(salary), MAX(salary), MIN(salary), SUM(salary)
FROM employees
WHERE job_id LIKE '%REP%';

SELECT MIN(hire_date), MAX(hire_date)
FROM employees;

SELECT MIN(last_name), MAX(last_name)
FROM employees;

-- COUNT(*) : null 값 포함
SELECT COUNT(*)
FROM employees;

SELECT COUNT(*)
FROM departments;

SELECT COUNT(*)
FROM employees
WHERE department_id = 50;

-- COUNT : null 값 제외
SELECT COUNT(commission_pct)
FROM employees
WHERE department_id = 80;

SELECT COUNT(DISTINCT department_id),
               COUNT(department_id)
FROM employees;

SELECT DISTINCT department_id
FROM employees;

-- AVG(NVL) : null 값 포함
SELECT AVG(NVL(commission_pct, 0)), AVG(commission_pct)
FROM employees;

-- 파싱 순서 : FROM -> WHERE -> GROUP BY -> SELECT -> ORDER BY
-- GROUP BY : 컬럼(Colunm)별
-- 그룹함수 외 컬럼(Colunm) GROUP BY 추가 필수
SELECT department_id, AVG(salary)
FROM employees
GROUP BY department_id;

SELECT AVG(salary)
FROM employees
GROUP BY department_id;

-- GROUP BY : 1차 컬럼(Colunm)별, 2차 컬럼(Colunm)별
SELECT department_id, job_id, SUM(salary), COUNT(salary)
FROM employees
GROUP BY department_id, job_id
ORDER BY job_id;

SELECT department_id, job_id, SUM(salary)
FROM employees
WHERE department_id > 40
GROUP BY department_id, job_id
ORDER BY department_id;

-- HAVING : 그룹함수 기준
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

-- 그룹 함수 중첩 : 최대 2번까지 중첩 가능
SELECT MAX(AVG(salary))
FROM employees
GROUP BY department_id;

-- 그룹 함수 중첩 시 일반 컬럼(Colunm) 추가 불가
SELECT department_id, MAX(AVG(salary))
FROM employees
GROUP BY department_id;

SELECT *
FROM employees;

-- sql05
-- 1번 문제 : True
-- 2번 문제 : False
-- 3번 문제 : True
-- 4번 문제
SELECT ROUND(MAX(salary)) AS "Maximum", 
               ROUND(MIN(salary)) AS "Minimum", 
               ROUND(Sum(salary)) AS "Sum", 
               ROUND(AVG(salary)) AS "Average"
FROM employees;

-- 5번 문제
SELECT job_id,
               ROUND(MAX(salary)) AS "Maximum", 
               ROUND(MIN(salary)) AS "Minimum", 
               ROUND(Sum(salary)) AS "Sum", 
               ROUND(AVG(salary)) AS "Average"
FROM employees
GROUP BY job_id;

-- 6번 문제
SELECT job_id, COUNT(employee_id)
-- SELECT job_id, COUNT(*)
FROM employees
GROUP BY job_id;

-- 7번 문제
SELECT COUNT(DISTINCT manager_id) AS "Number of Managers"
FROM employees;

SELECT manager_id
FROM employees;

-- 8번 문제
SELECT MAX(salary) - MIN(salary) AS difference
FROM employees;

-- 9번 문제
SELECT manager_id, MIN(salary)
FROM employees
WHERE manager_id IS NOT NULL
GROUP BY manager_id
HAVING MIN(salary) >= 6000
ORDER BY MIN(salary) DESC;

-- < 조인(JOIN) - 오라클 조인 구문 >
SELECT employee_id, last_name, department_id
FROM employees;

SELECT department_id, department_name
FROM departments;

-- 카테시안 프로덕트 (last_name * department_name) = 교차 조인 : 오류
SELECT last_name, department_name
FROM employees, departments;

-- 오라클 조인 조건 : WHERE 절
-- 최소 (테이블 수 - 1) 조건문 필요
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

-- Non-Equi Join (= 제외 나머지)
SELECT e.last_name, e.salary, j.grade_level, j.lowest_sal, j.highest_sal
FROM employees e, job_grades j
WHERE e.salary
               BETWEEN j.lowest_sal AND j.highest_sal;
               
-- OUTER JOIN : 오라클은 FULL OUTER JOIN 없음
-- RIGHT OUTER JOIN : 오른쪽 컬럼(Colunm)에서 남는 값 포함
SELECT e.last_name, e.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id(+) = d.department_id;

-- LEFT OUTER JOIN : 왼쪽 컬럼(Colunm)에서 남는 값 포함
SELECT e.last_name, e.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id(+);

-- Self Join
-- manager_id, employee_id 연결
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

-- < 조인(JOIN) - 오라클 - 1999 조인 구문 > : ANSI 조인
-- ANSI 조인 조건 : FROM절
-- 교차 조인(CROSS JOIN)          * ANSI 조인
SELECT last_name, department_name
FROM employees CROSS JOIN departments;

-- 교차 조인(CROSS JOIN)          * 오라클 조인
SELECT last_name, department_name
FROM employees, departments;

-- 자연 조인(NATURAL JOIN) : 동일한 컬럼(Colunm) 기준
SELECT department_id, department_name, location_id, city
FROM departments NATURAL JOIN locations;

DESC departments;
DESC locations;

-- USING절 : () 안에 작성
SELECT employee_id, last_name, location_id, department_id
FROM employees JOIN departments
                              USING (department_id);

-- 기준 컬럼(Colunm)에서는 테이블 열 별칭 제거
SELECT l.city, d.department_name
FROM locations l JOIN departments d
                              USING (location_id)
WHERE location_id = 1400;

-- ON절          * ANSI 조인
SELECT e.employee_id, e.last_name, e.department_id, d.department_id, d.location_id
FROM employees e JOIN departments d
                              ON (e.department_id = d.department_id);
                              
-- ON절         * 오라클 조인
SELECT e.employee_id, e.last_name, e. department_id, d.department_id, d.location_id
FROM employees e, departments d
WHERE e.department_id = d.department_id;

-- ON절 3-way 조인               * ANSI 조인
SELECT employee_id, city, department_name
FROM employees e
               JOIN departments d
                              ON d.department_id = e.department_id
               JOIN locations l
                              ON d.location_id = l.location_id;

-- ON절 3-way 조인               * 오라클 조인
SELECT employee_id, city, department_name
FROM employees e, departments d, locations l
WHERE d.department_id = e.department_id
AND d.location_id = l.location_id;

-- OUTER JOIN
-- LEFT OUTER JOIN            * ANSI 조인
SELECT e.last_name, e.department_id, d.department_name
FROM employees e LEFT OUTER JOIN departments d
               ON (e.department_id = d.department_id);

-- LEFT OUTER JOIN            * 오라클 조인
SELECT e.last_name, e.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id(+);

-- RIGHT OUTER JOIN           * ANSI 조인
SELECT e.last_name, e.department_id, d.department_name
FROM employees e RIGHT OUTER JOIN departments d
               ON (e.department_id = d.department_id);

-- RIGHT OUTER JOIN           * 오라클 조인
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

-- 추가 조건
SELECT e.last_name, e.department_id, d.department_name
FROM employees e JOIN departments d
               ON (e.department_id = d.department_id)
AND e.manager_id = 149;

SELECT e.last_name, e.department_id, d.department_name
FROM employees e JOIN departments d
               ON (e.department_id = d.department_id)
WHERE e.manager_id = 149;

-- sql06
-- 1번 문제
-- 오라클 조인
SELECT l.location_id, l.street_address, l.city, l.state_province, c.country_name
FROM locations l, countries c
WHERE l.country_id = c.country_id;

-- ANSI 조인
SELECT l.location_id, l.street_address, l.city, l.state_province, c.country_name
FROM locations l JOIN countries c
                              ON l.country_id = c.country_id;

-- 2번 문제
-- 오라클 조인
SELECT e.last_name, e.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id;

-- ANSI 조인
SELECT e.last_name, e.department_id, d.department_name
FROM employees e JOIN departments d
                              ON e.department_id = d.department_id;

-- 3번 문제
-- 오라클 조인
SELECT e.last_name, e.job_id, e.department_id, d.department_name
FROM employees e, departments d, locations l
WHERE e.department_id = d.department_id
AND d.location_id = l.location_id
AND LOWER(l.city) = 'toronto';

-- ANSI 조인
SELECT e.last_name, e.job_id, e.department_id, d.department_name
FROM employees e JOIN departments d
                              ON e.department_id = d.department_id
                              JOIN locations l
                              ON d.location_id = l.location_id
--AND LOWER(l.city) = 'toronto';
WHERE LOWER(l.city) = 'toronto';

-- 4번 문제
-- 오라클 조인
SELECT w.last_name AS "Employee", w.employee_id AS "Emp#", m.last_name AS "Manager", m.employee_id AS "Mgr#"
--SELECT w.last_name, w.employee_id, m.last_name, w.manager_id
FROM employees w, employees m
WHERE w.manager_id = m.employee_id;

-- ANSI 조인
SELECT w.last_name AS "Employee", w.employee_id AS "Emp#", m.last_name AS "Manager", m.employee_id AS "Mgr#"
FROM employees w JOIN employees m
                              ON w.manager_id = m.employee_id;
                              
-- 5번 문제
-- 오라클 조인
SELECT w.last_name AS "Employee", w.employee_id AS "Emp#", m.last_name AS "Manager", m.employee_id AS "Mgr#"
FROM employees w, employees m
WHERE w.manager_id = m.employee_id(+)
ORDER BY 2;

-- ANSI 조인
SELECT w.last_name AS "Employee", w.employee_id AS "Emp#", m.last_name AS "Manager", m.employee_id AS "Mgr#"
FROM employees w LEFT OUTER JOIN employees m
                              ON w.manager_id = m.employee_id
ORDER BY 2;

-- 6번 문제
DESC job_grades;

SELECT *
FROM job_grades;

-- 오라클 조인
SELECT e.last_name, e.job_id, d.department_name, e.salary, j.grade_level
FROM employees e, departments d, job_grades j
WHERE e.department_id = d.department_id
AND e.salary BETWEEN j.lowest_sal AND j.highest_sal;

-- ANSI 조인
SELECT e.last_name, e.job_id, d.department_name, e.salary, j.grade_level
FROM employees e JOIN departments d
                              ON e.department_id = d.department_id
                              JOIN job_grades j
                              ON e.salary BETWEEN j.lowest_sal AND j.highest_sal;

-- < 서브쿼리 >
SELECT last_name, salary
FROM employees
WHERE salary IN (SELECT MAX(salary)
                              FROM employees
                              GROUP BY department_id);

SELECT MAX(salary)
FROM employees
GROUP BY department_id;

-- 단일행 서브쿼리 (리턴값 1개) : 비교 연산자 사용
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