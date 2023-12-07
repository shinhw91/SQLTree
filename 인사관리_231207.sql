-- < 기본적인 데이터 조회 >
-- 테이블 구조 확인
DESC departments;

-- 테이블 조회
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

-- NVL(값, 지정값) : 값이 null일 경우 지정값 적용
SELECT last_name, 12 * salary * NVL(commission_pct, 1) 
FROM employees;

-- 열 별칭 (AS)
SELECT last_name AS name, commission_pct comm
FROM employees;

SELECT last_name AS "Name", commission_pct "Annual Salary"
FROM employees;

SELECT last_name AS 이름, commission_pct 보너스
FROM employees;

-- 연결 연산자 (||)
SELECT last_name || job_id AS "Employee"
FROM employees;

SELECT last_name || ' is a ' || job_id
    AS "EMployee Details"
FROM employees;

-- 중복 행 제거 (DISTINCT)
SELECT department_id
FROM employees;

SELECT DISTINCT department_id
FROM employees;

SELECT DISTINCT department_id, job_id
FROM employees;

-- 1번 문제
DESC departments;

SELECT *
FROM departments;

-- 2번 문제
DESC employees;

SELECT department_id, last_name, job_id, hire_date AS startdate
FROM employees;

-- 3번 문제
SELECT DISTINCT job_id
FROM employees;

-- 4번 문제
SELECT department_id AS "Emp #", last_name AS "Employee", job_id AS "Job", hire_date AS "Hire Date"
FROM employees;

-- 5번 문제
SELECT job_id || ', ' || last_name
    AS "Employee and Title"
FROM employees;

-- < 데이터 제한 및 정렬 >
-- 파싱 순서 : FROM -> WHERE -> SELECT
SELECT employee_id, last_name, job_id, department_id
FROM employees
WHERE department_id = 90;

SELECT last_name, job_id, department_id
FROM employees
WHERE last_name = 'Whalen';

-- 날짜 형식 일치
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

-- BETWEEN 연산자
-- BETWEEN A AND B : A 이상, B 이하
SELECT last_name, salary
FROM employees
WHERE salary BETWEEN 2500 AND 3500;
--WHERE salary BETWEEN 3500 AND 2500; : 쓰레기 값

-- IN 연산자 (목록 조회)
SELECT employee_id, last_name, salary, manager_id
FROM employees
WHERE manager_id IN (100, 101, 201);

-- LIKE 연산자 (조건 검색)
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

-- %, _ 문자 인식 (ESCAPE) : 식별자(3) 변경 가능
SELECT employee_id, last_name, job_id
FROM employees
WHERE job_id LIKE '%SA3_%' ESCAPE '3';

-- IS NULL 연산자
SELECT *
FROM employees
WHERE commission_pct is null;

-- 논리연산자
SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary >= 1000 AND job_id LIKE '%MAN%';

SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary >= 1000 OR job_id LIKE '%MAN%';

-- NOT 연산자 (IN, BETWEEN, LIKE, NULL)
SELECT last_name, job_id
FROM employees
WHERE job_id
    NOT IN ('IT_PROG', 'ST_CLERK', 'SA_REP');
    
-- 연산자 우선순위 : AND > OR
SELECT last_name, job_id, salary
FROM employees
WHERE job_id = 'SA_REP' OR job_id = 'AD_PRES' AND salary > 15000;

SELECT last_name, job_id, salary
FROM employees
WHERE (job_id = 'SA_REP' OR job_id = 'AD_PRES') AND salary > 15000;

SELECT *
FROM employees;

-- 1번 문제
SELECT last_name, salary
FROM employees
WHERE salary >= 12000;

-- 2번 문제
SELECT last_name, department_id
FROM employees
WHERE employee_id = 176;

-- 3번 문제
SELECT last_name, salary
FROM employees
WHERE salary NOT BETWEEN 5000 AND 12000;

-- 6번 문제
SELECT last_name AS "Employee", salary AS "Monthly Salary"
FROM employees
WHERE (salary BETWEEN 5000 AND 12000) AND (department_id = 20 OR department_id = 50);

-- 7번 문제
SELECT last_name, job_id
FROM employees
WHERE hire_date = '14%';

-- 8번 문제
-- 9번 문제
-- 10번 문제
