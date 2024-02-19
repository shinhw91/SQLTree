SET SERVEROUTPUT ON

-- 평가 범위 : ~ 함수까지

-- FUNCTION
CREATE FUNCTION test_fun
(p_msg IN VARCHAR2)
RETURN VARCHAR2
IS
          -- 선언부
BEGIN
          RETURN p_msg;
EXCEPTION
          WHEN NO_DATA_FOUND THEN
                    RETURN '데이터가 존재하지 않습니다.';
                    
END;
/



-- FUNCTION 실행방법 (1)
-- 블럭에서 실행 시 변수 필요
DECLARE
          v_result VARCHAR2(1000);
BEGIN
          v_result := test_fun('테스트');
          DBMS_OUTPUT.PUT_LINE(v_result);
END;
/

-- 객체 정보 확인
SELECT *
FROM user_source
WHERE type IN ('PROCEDURE');



-- FUNCTION 실행방법 (2) : 간단한 내용 확인
SELECT test_fun('SELECT문에서 호출')
FROM dual;

-- 더하기
DROP FUNCTION y_sum;

CREATE FUNCTION y_sum
(p_x IN NUMBER,
p_y IN NUMBER)
RETURN NUMBER
IS
          v_result NUMBER;
BEGIN
          v_result := p_x + p_y;
          RETURN v_result;
END;
/

SELECT y_sum(100, 200)
FROM dual;



-- FUNCTION 활용
-- 사원번호를 기준으로 직속상사 이름을 출력
-- *셀프조인 주의!
SELECT m.last_name
FROM employees e JOIN employees m
          ON (e.manager_id = m.employee_id)
WHERE e.employee_id = 149;


DROP FUNCTION get_mgr;

CREATE FUNCTION get_mgr
(p_eid employees.employee_id%TYPE)
RETURN VARCHAR2
IS
          v_mgr_name employees.last_name%TYPE;
BEGIN
          SELECT m.last_name
          INTO v_mgr_name
          FROM employees e JOIN employees m
                    ON (e.manager_id = m.employee_id)
          WHERE e.employee_id = p_eid;
          
          RETURN v_mgr_name;
          
EXCEPTION
          WHEN NO_DATA_FOUND THEN
                    RETURN '직속 상사가 존재하지 않습니다.';   -- 데이터타입 일치 필요
END;
/

SELECT employee_id, last_name, get_mgr(employee_id) as manager
FROM employees;



/*

1.
사원번호를 입력하면 
last_name + first_name 이 출력되는 
y_yedam 함수를 생성하시오.

실행) EXECUTE DBMS_OUTPUT.PUT_LINE(y_yedam(174))
출력 예)  Abel Ellen

SELECT employee_id, y_yedam(employee_id)
FROM   employees;

*/

DROP FUNCTION y_yedam;

CREATE FUNCTION y_yedam
(p_eid IN employees.employee_id%TYPE)
RETURN VARCHAR2
IS
          v_last employees.last_name%TYPE;
          v_first employees.first_name%TYPE;
          v_result VARCHAR2(100);
BEGIN
          SELECT last_name, first_name
          INTO v_last, v_first
          FROM employees
          WHERE employee_id = p_eid;
          
          v_result := v_last || ' ' || v_first;
          RETURN v_result;
END;
/

EXECUTE DBMS_OUTPUT.PUT_LINE(y_yedam(174));       -- FUNCTION 실행방법 (3) : 프로시저 활용

SELECT employee_id, y_yedam(employee_id)
FROM   employees;



/*
2.
사원번호를 입력할 경우 다음 조건을 만족하는 결과가 출력되는 ydinc 함수를 생성하시오.
- 급여가 5000 이하이면 20% 인상된 급여 출력
- 급여가 10000 이하이면 15% 인상된 급여 출력
- 급여가 20000 이하이면 10% 인상된 급여 출력
- 급여가 20000 이상이면 급여 그대로 출력
실행) SELECT last_name, salary, YDINC(employee_id)
     FROM   employees;
*/

DROP FUNCTION ydinc;

CREATE FUNCTION ydinc
(p_eid IN employees.employee_id%TYPE)
RETURN NUMBER
IS
          v_sal employees.salary%TYPE;
          v_point NUMBER(2, 0);
          v_result employees.salary%TYPE;
BEGIN
          -- 1) SELECT => salary
          SELECT salary
          INTO v_sal
          FROM employees
          WHERE employee_id = p_eid;
          
          -- 2) salary에 따라 비율을 다르게 적용
          IF v_sal <= 5000 THEN
                    v_point := 20;
          ELSIF v_sal <= 10000 THEN
                    v_point := 15;
          ELSIF v_sal <= 20000 THEN
                    v_point := 10;
          ELSE
                    v_point := 0;
          END IF;
          
          v_result := v_sal * (1 + v_point/100);
          RETURN v_result;
END;
/

SELECT last_name, salary, YDINC(employee_id)
FROM   employees;


-- SELECT + CASE문
SELECT CASE
          WHEN salary <= 5000 THEN
                    salary * (1 + 20/100)
          WHEN salary <= 10000 THEN
                    salary * (1 + 15/100)
          WHEN salary <= 20000 THEN
                    salary * (1 + 10/100)
          ELSE
                    salary
          END as "new sal"
FROM employees;



/*

3.
사원번호를 입력하면 해당 사원의 연봉이 출력되는 yd_func 함수를 생성하시오.
->연봉계산 : (급여+(급여*인센티브퍼센트))*12
실행) SELECT last_name, salary, YD_FUNC(employee_id)
     FROM   employees;
     
*/

DROP FUNCTION yd_func;

CREATE FUNCTION yd_func
(p_eid IN employees.employee_id%TYPE)
RETURN NUMBER
IS
          v_sal employees.salary%TYPE;
          v_comm employees.commission_pct%TYPE;
          v_result employees.salary%TYPE;
BEGIN
          SELECT salary, commission_pct
          INTO v_sal, v_comm
          FROM employees
          WHERE employee_id = p_eid;
          
          v_result := v_sal + (v_sal * NVL(v_comm, 0)) * 12;
          RETURN v_result;
END;
/

SELECT last_name, salary, YD_FUNC(employee_id)
FROM   employees;



/*
4. 
SELECT last_name, subname(last_name)
FROM   employees;

LAST_NAME     SUBNAME(LA
------------ ------------
King         K***
Smith        S****
...
예제와 같이 출력되는 subname 함수를 작성하시오.
*/

DROP FUNCTION subname;

CREATE FUNCTION subname
(p_last employees.last_name%TYPE)
RETURN VARCHAR2
IS
          v_result VARCHAR2(100);
BEGIN
          v_result := RPAD(SUBSTR(p_last, 1, 1), LENGTH(p_last), '*');
          RETURN v_result;
END;
/

SELECT last_name, subname(last_name)
FROM   employees;