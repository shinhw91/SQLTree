SET SERVEROUTPUT ON

DECLARE
          v_deptno departments.department_id%TYPE;
          v_comm employees.commission_pct%TYPE := .1;
BEGIN
          SELECT department_id
          INTO v_deptno
          FROM employees
          WHERE employee_id = &사원번호;
          
          INSERT INTO employees(employee_id, last_name, email, hire_date, job_id, department_id)
          VALUES(1000, 'Hong', 'hkd@google.com', sysdate, 'IT_PROG', v_deptno);

          UPDATE employees
          SET salary = (NVL(salary, 0) + 10000) * v_comm
          WHERE employee_id = 1000;
          
END;
/

--ROLLBACK;

SELECT *
FROM employees
WHERE employee_id = 1000;



BEGIN
          DELETE FROM employees
          WHERE employee_id = 1000;
          
--          UPDATE employees
--          SET salary = salary * 1.1
--          WHERE employee_id = 0;
          
          -- 가장 최근의 SQL문 적용          
          IF SQL%ROWCOUNT = 0 THEN
                    DBMS_OUTPUT.PUT_LINE('정상적으로 삭제되지 않았습니다.');
          END IF;
END;
/


-- 1번
-- SQL문 작성 -> PL/SQL 작성
SELECT e.employee_id, e.last_name, d.department_name
FROM employees e JOIN departments d
          ON e.department_id = d.department_id
WHERE employee_id = &사원번호;

-- (택1) PL/SQL 블록 작성(BEGIN -> DECLARE) : 권장
DECLARE
          v_eid employees.employee_id%TYPE;
          v_ename employees.last_name%TYPE;
          v_deptname departments.department_name%TYPE;
BEGIN
          SELECT e.employee_id, e.last_name, d.department_name
          INTO v_eid, v_ename, v_deptname
          FROM employees e JOIN departments d
                    ON e.department_id = d.department_id
          WHERE employee_id = &사원번호;
          
           DBMS_OUTPUT.PUT_LINE('사원번호 : ' || v_eid);
           DBMS_OUTPUT.PUT_LINE('사원이름 : ' || v_ename);
           DBMS_OUTPUT.PUT_LINE('부서 : ' || v_deptname);

END;
/

-- (택2) PL/SQL 블록 작성(BEGIN -> DECLARE) : 미권장
DECLARE
          v_eid employees.employee_id%TYPE;
          v_ename employees.last_name%TYPE;
          v_deptid departments.department_id%TYPE;
          v_deptname departments.department_name%TYPE;
BEGIN
          -- JOIN 분리(1)                    
          SELECT employee_id, last_name, department_id
          INTO v_eid, v_ename, v_deptid
          FROM employees
          WHERE employee_id = &사원번호;
          
          -- JOIN 분리(2)                    
          SELECT department_name
          INTO v_deptname
          FROM departments
          WHERE department_id = v_deptid;
          
           DBMS_OUTPUT.PUT_LINE('사원번호 : ' || v_eid);
           DBMS_OUTPUT.PUT_LINE('사원이름 : ' || v_ename);
           DBMS_OUTPUT.PUT_LINE('부서 : ' || v_deptname);

END;
/




-- 2번
SELECT last_name, salary, salary * 12 + (NVL(salary, 0) * NVL(commission_pct, 0) * 12) income
FROM employees
WHERE employee_id = &사원번호;

-- (택1) PL/SQL 블록 작성 : 권장
DECLARE
          v_ename employees.last_name%TYPE;
          v_salary employees.salary%TYPE;
          v_income v_salary%TYPE;
BEGIN
          SELECT last_name, salary, salary * 12 + (NVL(salary, 0) * NVL(commission_pct, 0) * 12) income
          INTO v_ename, v_salary, v_income
          FROM employees
          WHERE employee_id = &사원번호;
          
          DBMS_OUTPUT.PUT_LINE('사원이름 : ' || v_ename);
          DBMS_OUTPUT.PUT_LINE('급여 : ' || v_salary);
          DBMS_OUTPUT.PUT_LINE('연봉 : ' || v_income);
END;
/

-- (택2) PL/SQL 블록 작성 : 미권장
DECLARE
          v_ename employees.last_name%TYPE;
          v_salary employees.salary%TYPE;
          v_income v_salary%TYPE;
          v_comm v_salary%TYPE;
BEGIN
          SELECT last_name, salary, commission_pct
          INTO v_ename, v_salary, v_comm
          FROM employees
          WHERE employee_id = &사원번호;
          
          v_income := (v_salary * 12 + (NVL(v_salary, 0) * NVL(v_comm, 0) * 12));
                    
          DBMS_OUTPUT.PUT_LINE('사원이름 : ' || v_ename);
          DBMS_OUTPUT.PUT_LINE('급여 : ' || v_salary);
          DBMS_OUTPUT.PUT_LINE('연봉 : ' || v_income);
END;
/


-- 테이블 생성(NULL값 제외 제약조건 삭제)
CREATE TABLE test_employees
AS
          SELECT *
          FROM employees;
          
SELECT *
FROM test_employees
WHERE employee_id = 149;

-- 기본 IF문
BEGIN
          DELETE FROM test_employees
          WHERE employee_id = &사원번호;
          
          IF SQL%ROWCOUNT = 0 THEN
                    DBMS_OUTPUT.PUT_LINE('정상적으로 삭제되지 않았습니다.');
                    DBMS_OUTPUT.PUT_LINE('사원번호를 확인해주세요.');
          END IF;
END;
/



-- IF ~ ELSE문 : 하나의 조건식, 결과는 참과 거짓 각각
DECLARE
          v_result NUMBER(4, 0);
BEGIN
          SELECT COUNT(employee_id)     -- NULL 포함
          INTO v_result
          FROM employees
          WHERE manager_id = &사원번호;
          
          IF v_result  = 0 THEN
                    DBMS_OUTPUT.PUT_LINE('일반 사원입니다.');
          ELSE
                    DBMS_OUTPUT.PUT_LINE('관리자급입니다.');
          END IF;
END;
/

SELECT employee_id
FROM employees
WHERE manager_id = 100;



-- IF ~ ELSIF ~ ELSE문 : 다중 조건식이 필요, 각각 결과처리
-- 연차를 구하는 공식(소수점 절사)
SELECT employee_id, TRUNC (MONTHS_BETWEEN (sysdate, hire_date)/12)
FROM employees;

DECLARE
          v_hyear NUMBER(2, 0);
BEGIN
          SELECT TRUNC (MONTHS_BETWEEN (sysdate, hire_date)/12)
          INTO v_hyear
          FROM employees
          WHERE employee_id = &사원번호;
          
          IF v_hyear < 5 THEN
                    DBMS_OUTPUT.PUT_LINE('입사한 지 5년 미만입니다.');
          ELSIF v_hyear < 10 THEN
                    DBMS_OUTPUT.PUT_LINE('입사한 지 5년 이상 10년 미만입니다.');
          ELSIF v_hyear < 15 THEN
                    DBMS_OUTPUT.PUT_LINE('입사한 지 10년 이상 15년 미만입니다.');
          ELSIF v_hyear < 20 THEN
                    DBMS_OUTPUT.PUT_LINE('입사한 지 15년 이상 20년 미만입니다.');
          ELSE
                    DBMS_OUTPUT.PUT_LINE('입사한 지 20년 이상입니다.');
          END IF;
END;
/



-- 3-1번
--SELECT employee_id, TO_CHAR(hire_date, 'YYYY')
SELECT hire_date
FROM employees
WHERE employee_id = &사원번호;

DECLARE
          v_date employees.hire_date%TYPE;
BEGIN
          SELECT hire_date
          INTO v_date
          FROM employees
          WHERE employee_id = &사원번호;
          
--          IF TO_CHAR(v_date, 'YYYY') >= 2015 THEN
          IF v_date >= TO_DATE('2015-01-01', 'YYYY-MM-dd') THEN
                    DBMS_OUTPUT.PUT_LINE('New employee');
          ELSE
                    DBMS_OUTPUT.PUT_LINE('Career employee');
          END IF;
END;
/



-- 두자리 입력 시 rr(1900년대), yy(2000년대)
SELECT TO_CHAR(TO_DATE('99/01/01', 'rr/MM/dd'), 'yyyy-MM-dd'),
          TO_CHAR(TO_DATE('99/01/01', 'yy/MM/dd'), 'yyyy-MM-dd')
FROM dual;



-- 3-2번
DECLARE
          v_date employees.hire_date%TYPE;
--          v_result VARCHAR2(100);
          v_result VARCHAR2(100) := 'Career employee';
BEGIN
          SELECT hire_date
          INTO v_date
          FROM employees
          WHERE employee_id = &사원번호;
          
          IF TO_CHAR(v_date, 'YYYY') >= 2015 THEN
                    v_result := 'New employee';
--          ELSE
--                    v_result := 'Career employee';
          END IF;
          
          DBMS_OUTPUT.PUT_LINE(v_result);
END;
/



-- 5번
SELECT last_name, salary
FROM employees
WHERE employee_id = &사원번호;

DECLARE
          v_ename employees.last_name%TYPE;
          v_salary employees.salary%TYPE;
          v_point NUMBER(4, 0);
          v_result v_salary%TYPE;
BEGIN
          SELECT last_name, salary
          INTO v_ename, v_salary
          FROM employees
          WHERE employee_id = &사원번호;
          
          IF v_salary <= 5000 THEN
                    v_point := 20;
          ELSIF v_salary <= 10000 THEN
                    v_point := 15;
          ELSIF v_salary <= 15000 THEN
                    v_point := 10;
          ELSE
                    v_point := 0;
          END IF;
          
          v_result := v_salary * (1 + v_point/100);
          
          DBMS_OUTPUT.PUT_LINE('사원이름 : ' || v_ename);
          DBMS_OUTPUT.PUT_LINE('급여 : ' || v_salary);
          DBMS_OUTPUT.PUT_LINE('인상된 급여 : ' || v_result);
END;
/

SELECT employee_id, salary
FROM employees;



-- 기본 LOOP문
DECLARE
          v_num NUMBER(38) := 0;
BEGIN
          LOOP
                    v_num := v_num + 1;
                    DBMS_OUTPUT.PUT_LINE(v_num);
                    EXIT WHEN v_num > 10;         -- 종료조건
          END LOOP;
END;
/



-- WHILE LOOP문
DECLARE
          v_num NUMBER(38, 0) := 10;
BEGIN
          WHILE v_num < 5 LOOP          -- 반복조건
                    DBMS_OUTPUT.PUT_LINE(v_num);
                    v_num := v_num + 1;
          END LOOP;

END;
/



-- 예제 1 : 1에서 10까지 정수값의 합
-- 1) 기본 LOOP
DECLARE
          v_sum NUMBER(2, 0) := 0;
          v_num NUMBER(2, 0) := 1;
BEGIN
          LOOP
                    v_sum := v_sum + v_num;
                    v_num := v_num + 1;
                    EXIT WHEN v_num > 10;
          END LOOP;
          DBMS_OUTPUT.PUT_LINE(v_sum);
END;
/



-- 2) WHILE LOOP
DECLARE
          v_sum NUMBER(2, 0) := 0;
          v_num NUMBER(2, 0) := 1;
BEGIN
          WHILE v_num <= 10 LOOP
                    v_sum := v_sum + v_num;
                    v_num := v_num + 1;
          END LOOP;
          DBMS_OUTPUT.PUT_LINE(v_sum);
END;
/



-- FOR LOOP
BEGIN
          FOR idx IN -10 .. 5 LOOP
                    IF MOD(idx, 2) <> 0 THEN
                              DBMS_OUTPUT.PUT_LINE(idx);
                    END IF;
          END LOOP;
END;
/



-- 주의사항 1. 범위지정
-- 1) 범위 : 최소값 -> 최대값
-- 2) 내림차순 : REVERSE
BEGIN
          FOR idx IN REVERSE -10 .. 5 LOOP
                    IF MOD(idx, 2) <> 0 THEN
                              DBMS_OUTPUT.PUT_LINE(idx);
                    END IF;
          END LOOP;
END;
/



-- 주의사항 2. 카운터(counter)
-- 카운터 값 지정 불가(내부변수, READONLY)
-- DECLARE 변수명과 다르게 지정 권장
DECLARE
          v_num NUMBER(2, 0) := 0;
BEGIN
          DBMS_OUTPUT.PUT_LINE(v_num);
          v_num := v_num * 2;
          DBMS_OUTPUT.PUT_LINE(v_num);
          DBMS_OUTPUT.PUT_LINE('==========================');
          FOR v_num IN 1 .. 10 LOOP
--                    v_num := v_num * 2;
--                    v_num := 0;
                    DBMS_OUTPUT.PUT_LINE(v_num * 2);
          END LOOP;
          DBMS_OUTPUT.PUT_LINE(v_num);
END;
/



-- 예제 1 : 1에서 10까지 정수값의 합
-- 3) FOR LOOP
DECLARE
          -- 정수값 : 1 ~ 10 => FOR LOOP 카운터로 처리
          -- 합계
          v_total NUMBER(2, 0) := 0;
BEGIN
          FOR num IN 1 .. 10 LOOP
                    v_total := v_total + num;
          END LOOP;
          DBMS_OUTPUT.PUT_LINE(v_total);
END;
/


-- 문제 1. 다음과 같이 출력되도록 하시오
-- *
-- **
-- ***
-- ****
-- *****
-- 1) 기본 LOOP
DECLARE
          v_num NUMBER(2, 0) := 1;
          v_star VARCHAR2(100) := '';   -- NULL 초기값 미권장(연산 불가)
BEGIN
          LOOP
                    v_star := v_star || '*';
                    DBMS_OUTPUT.PUT_LINE(v_star);
                    v_num := v_num + 1;
                    EXIT WHEN v_num > 5;
          END LOOP;
END;
/



-- 2) WHILE LOOP
DECLARE
          v_num NUMBER(2, 0) := 1;
          v_star VARCHAR2(100) := '';
BEGIN
          WHILE  v_num <= 5 LOOP
                    v_star := v_star || '*';
                    DBMS_OUTPUT.PUT_LINE(v_star);
                    v_num := v_num + 1;
          END LOOP;
END;
/



-- 3) FOR LOOP
DECLARE
          v_star VARCHAR2(100) := '';
BEGIN
          FOR num IN 1 .. 5 LOOP
                    v_star := v_star || '*';
                    DBMS_OUTPUT.PUT_LINE(v_star);
          END LOOP;
END;
/

-- 이중 FOR LOOP
BEGIN
          FOR counter IN 1 .. 5 LOOP    -- 몇번째 줄
                    FOR i IN 1 .. counter LOOP
                              DBMS_OUTPUT.PUT('*');         -- 단독사용 불가(PUT_LINE 필요)
                    END LOOP;
                    DBMS_OUTPUT.PUT_LINE('');
          END LOOP;
END;
/



















