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
WHERE salary > 12000;

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
--WHERE (salary BETWEEN 5000 AND 12000) AND (department_id = 20 OR department_id = 50)
WHERE salary BETWEEN 5000 AND 12000 AND department_id IN (20, 50);

-- 7번 문제
SELECT last_name, hire_date
FROM employees
WHERE hire_date LIKE '05%';

-- 8번 문제
SELECT last_name, job_id
FROM employees
WHERE manager_id IS NULL;

-- 10번 문제
SELECT last_name
FROM employees
WHERE last_name LIKE '__a%';

-- 11번 문제
SELECT last_name
FROM employees
WHERE last_name LIKE '%a%' AND last_name LIKE '%e%';

-- 12번 문제
SELECT last_name, job_id, salary
FROM employees
--WHERE (job_id = 'SA_REP' OR job_id = 'ST_CLERK') AND (salary NOT IN (2500, 3500, 7000));
WHERE job_id IN ('SA_REP', 'ST_CLERK') AND salary NOT IN (2500, 3500, 7000);

-- 13번 문제
SELECT last_name, salary, commission_pct
FROM employees
WHERE commission_pct = 0.2;

-- ORDER BY 절
-- 파싱 순서 : FROM -> WHERE -> SELECT -> ORDER BY
SELECT last_name, job_id, department_id, hire_date
FROM employees
ORDER BY hire_date;

-- 내림차순 (DESC)
SELECT last_name, job_id, department_id, hire_date
FROM employees
ORDER BY hire_date DESC;

-- 열 별칭 기준
SELECT employee_id, last_name, salary * 12 annsal
FROM employees
ORDER BY annsal;

-- colunm 번호 기준
SELECT last_name, job_id, department_id, hire_date
FROM employees
ORDER BY 3;

-- 1차 정렬, 2차 정렬
SELECT last_name, department_id, salary
FROM employees
ORDER BY department_id, salary DESC;

-- SELECT 없어도 정렬 가능
SELECT employee_id, salary
FROM employees
ORDER BY hire_date;

-- 치환변수 (&)
SELECT employee_id, last_name, salary, department_id
FROM employees
WHERE employee_id = &employee_num;

SELECT employee_id, last_name, job_id, &column_name
FROM employees
WHERE &condition
ORDER BY &order_column;

-- 치환변수 (&&) 영구저장
SELECT employee_id, last_name, job_id, &&column_name
FROM employees
ORDER BY &column_name;

SELECT employee_id, salary
FROM employees
ORDER BY &column_name;

-- 치환변수 (&&) 해제
UNDEFINE column_name;

-- < 집합(set) 연산자 >
SELECT *
FROM job_history;

-- UNION (중복값 제거)
SELECT employee_id, job_id
FROM employees
UNION
SELECT employee_id, job_id
FROM job_history;

-- UNION ALL (중복값 포함, 정렬 안됨)
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

-- INTERSECT (교집합)
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

-- MINUS (차집합)
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

-- < 문자 함수 Ⅰ >
DESC dual;

SELECT *
FROM dual;

SELECT sysdate
FROM employees;

SELECT sysdate
FROM dual;

-- 대소문자 조작 함수
SELECT 'The job id for ' || UPPER (last_name) || ' is ' || LOWER (job_id) AS "EMPLOYEE DETAILS"
FROM employees;

SELECT employee_id, last_name, department_id
FROM employees
WHERE LOWER (last_name) = 'higgins';

-- < 문자 함수 Ⅱ >
-- 문자 조작 함수
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

-- LTRIM : 왼쪽에서 y, e, a 순서대로 제거
SELECT LTRIM ('yyedaymy', 'yea')
FROM dual;

-- RTRIM : 오른쪽에서 y, e, a 순서대로 제거
SELECT RTRIM ('yyedaymy', 'yea')
FROM dual;

-- < 숫자 함수와 날짜 함수 >
-- 숫자 함수
-- ROUND (반올림)
SELECT ROUND (345.678) AS round1,
    ROUND (345.678, 0) AS round2,
    ROUND (345.678, 1) AS round3,
    ROUND (345.678, -1) AS round4
FROM dual;

-- TRUNC (버림)
SELECT TRUNC (345.678) AS round1,
    TRUNC (345.678, 0) AS round2,
    TRUNC (345.678, 1) AS round3,
    TRUNC (345.678, -1) AS round4
FROM dual;

-- MOD (나머지)
SELECT last_name, salary, MOD (salary, 5000)
FROM employees;

SELECT *
FROM employees;

-- 1번 문제
SELECT sysdate AS "Date"
FROM dual;

-- 2번 문제
SELECT employee_id, last_name, salary, TRUNC(salary * 1.15) AS "New Salary"
FROM employees;

-- 3번 문제
SELECT employee_id, last_name, salary, TRUNC(salary * 1.15) AS "New Salary", TRUNC(salary * 1.15 - salary) AS "Increase"
FROM employees;

-- 4번 문제
SELECT UPPER(last_name) AS name, LENGTH(last_name) AS name_length
FROM employees
--WHERE last_name LIKE 'J%' OR last_name LIKE 'A%' OR last_name LIKE 'M%'
WHERE SUBSTR (last_name, 1, 1) IN ('J', 'A', 'M')
--ORDER BY last_name;
ORDER BY 1;

-- 날짜 함수
SELECT SYSDATE
FROM dual;

SELECT last_name, (SYSDATE - hire_date) / 7 AS WEEKS
FROM employees
WHERE department_id = 90;

-- MONTHS_BETWEEN : 두 날짜 사이의 개월 수
-- ADD_MONTHS : 날짜에 개월 수 더함
-- NEXT_DAY : 날짜의 다음에 돌아오는 명시한 요일의 날짜
-- LAST_DAY : 마지막 날짜
-- ROUND : 반올림
-- TRUNC : 버림

SELECT employee_id, hire_date,
    MONTHS_BETWEEN (SYSDATE, hire_date) TENURE,
    ADD_MONTHS(hire_date, 6) REVIEW,
    NEXT_DAY(hire_date, '금'),
    LAST_DAY(hire_date)
FROM employees;

SELECT ROUND(SYSDATE, 'YEAR'),   -- 7월 1일
    ROUND(SYSDATE, 'MONTH'),    -- 15일 자정
    ROUND(SYSDATE, 'DAY'),  -- 수요일 정오
    ROUND(SYSDATE, 'DD')    -- 정오
FROM dual;

-- < 변환 함수 Ⅰ >
-- 암시적 데이터 유형 변환
SELECT *
FROM employees
WHERE employee_id = '101';

-- 명시적 데이터 유형 변환
ALTER SESSION SET
NLS_DATE_LANGUAGE = AMERICAN;

-- TO_CHAR (숫자 -> 문자, 날짜 -> 문자)
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

-- fm (0 추가) : 3 -> 03
SELECT last_name,
    TO_CHAR (hire_date, 'fmDD MONTH YYYY')
    AS HIREDATE
FROM employees;

-- SP : 문자로 표시한 수 (4 -> FOUR)
-- SPTH : 문자로 표시한 서수 (4 -> FOURTH)
SELECT last_name,
    TO_CHAR (hire_date, 'fmDdspth "of" Month YYYY fmHH:MI:SS AM')
FROM employees;

SELECT TO_CHAR (salary, '$99,999.00') SALARY
FROM employees;

SELECT TO_CHAR (salary, '$9,999.00') SALARY
FROM employees;

-- < 변환 함수 Ⅱ >
-- TO_NUMBER (문자 -> 숫자)
SELECT TO_NUMBER ('$3,400', '$99,999')
FROM dual;

-- TO_DATE (문자 -> 날짜)
SELECT TO_DATE ('2010년, 02월', 'YYYY"년", MM"월"')
FROM dual;

SELECT last_name, hire_date
FROM employees
WHERE hire_date > TO_DATE ('2005년 07월 01일', 'YYYY"년" MM"월" DD"일"');

-- fx : 정확한 형식 비교
SELECT last_name, hire_date
FROM employees
--WHERE hire_date > TO_DATE ('05/07/01', 'fxYY-MM-DD');
WHERE hire_date > TO_DATE ('05/07/01', 'fxYY/MM/DD');

-- < 일반 함수와 중첩 함수>
-- NVL 함수
-- NVL(값, 지정값) : 값이 null일 경우 지정값 적용
SELECT last_name, salary, NVL (commission_pct, 0),
    (salary * 12) + (salary * 12 * NVL (commission_pct, 0)) AN_SAL
FROM employees;

-- 데이터 타입 일치 필요
SELECT last_name, salary, NVL (TO_CHAR(commission_pct), '보너스 없음')
FROM employees;

-- NVL2 함수
-- NVL(값, expr1, expr2) : 값이 null이 아닐 경우 expr1, null일 경우 expr2
SELECT last_name, salary, commission_pct,
    NVL2 (commission_pct, 'SAL+COMM', 'SAL') income
FROM employees;

-- NULLIF 함수
-- NULLIF(expr1, expr2) : expr1, expr2 동일하면 null, 동일하지 않으면 expr1
SELECT first_name, LENGTH (first_name) "expr1",
    last_name, LENGTH (last_name) "expr2",
    NULLIF (LENGTH (first_name), LENGTH (last_name)) result
FROM employees;

-- 조건 표현식
-- CASE 표현식 (IF-THEN-ELSE)
-- 값 지정
SELECT last_name, job_id, salary,
    CASE job_id WHEN 'IT_PROG' THEN 1.10 * salary
                        WHEN 'ST_CLERK' THEN 1.15 * salary
                        WHEN 'SA_REP' THEN 1.20 * salary
                        ELSE salary
    END "REVISED_SALARY"
FROM employees;

-- 범위 지정
SELECT last_name, salary,
               CASE WHEN salary < 5000 THEN 'Low'
                              WHEN salary < 10000 THEN 'Medium'
                              WHEN salary < 20000 THEN 'Good'
                              ELSE 'Excellent'
               END qualified_salary
FROM employees;

-- DECODE 함수 : 범위 지정 불가
SELECT last_name, job_id, salary,
               DECODE(job_id, 'IT_PROG', 1.10 * salary,
                                             'ST_CLERK', 1.15 * salary,
                                             'SA_REP', 1.20 * salary,
                                                            salary)
               REVISED_SALARY
FROM employees;

-- sql03_2
-- 5번 문제
SELECT last_name, 
               ROUND(MONTHS_BETWEEN(SYSDATE, hire_date)) AS "MONTHS_WORKED"
FROM employees;

-- 6번 문제
SELECT first_name, LPAD(salary, 15, '#') AS salary
FROM employees;

-- 7번 문제
SELECT last_name, TRUNC((SYSDATE - hire_date) / 7) AS TENURE
FROM employees;
WHERE department_id = 90;

-- sql04
-- 1번 문제
SELECT last_name || ' earns ' || TO_CHAR(salary, '$999,999.00') || ' monthly but wants ' || TO_CHAR(salary * 3, '$999,999.00') AS "Dream Salaries"
FROM employees;

-- 2번 문제
SELECT last_name, hire_date, TO_CHAR(NEXT_DAY(ADD_MONTHS(hire_date, 6), '월'), 'YYYY.MM.DD DAY') AS REVIEW
FROM employees;

-- 3번 문제
SELECT last_name, hire_date, TO_CHAR(hire_date, 'DAY') AS DAY
FROM employees
ORDER BY TO_CHAR(hire_date - 1, 'D');

-- 4번 문제
SELECT last_name, NVL (TO_CHAR(commission_pct), 'No Commission') AS COMM
FROM employees;

-- 5번 문제
-- DECODE 함수
SELECT last_name, job_id,
               DECODE(job_id, 'AD_PRES', 'A',
                                             'ST_MAN', 'B',
                                             'IT_PROG', 'C',
                                             'SA_REP', 'D',
                                             'ST_CLERK', 'E',
                                             0)
               AS grade
FROM employees;

-- CASE 구문
SELECT last_name, job_id,
               CASE job_id WHEN 'AD_PRES' THEN 'A'
                              WHEN 'ST_MAN' THEN 'B'
                              WHEN 'IT_PROG' THEN 'C'
                              WHEN 'SA_REP' THEN 'D'
                              WHEN 'ST_CLERK' THEN 'E'
                              ELSE '0'
               END grade
FROM employees;