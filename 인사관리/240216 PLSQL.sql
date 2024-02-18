SET SERVEROUTPUT ON

-- 커서 FOR LOOP
DECLARE
          CURSOR emp_cursor IS
                    SELECT employee_id, last_name
                    FROM employees
                    WHERE employee_id = 0;
BEGIN
          FOR emp_record IN emp_cursor LOOP
                    DBMS_OUTPUT.PUT('NO. : ' || emp_cursor%ROWCOUNT);
                    DBMS_OUTPUT.PUT(', 사원번호 : ' || emp_record.employee_id);
                    DBMS_OUTPUT.PUT_LINE(', 사원이름 : ' || emp_record.last_name);
          END LOOP; -- CLOSE; 함께 실행
--          DBMS_OUTPUT.PUT_LINE('Total : ' || emp_cursor%ROWCOUNT);    -- 커서 밖에서 %ROWCOUNT, %NOTFOUND 사용 불가
          
          FOR dept_info IN (SELECT * FROM departments) LOOP
                    DBMS_OUTPUT.PUT(', 부서번호 : ' || dept_info.department_id);
                    DBMS_OUTPUT.PUT_LINE(', 부서이름 : ' || dept_info.department_name);
          END LOOP;
END;
/



-- 1) 모든 사원의 사원번호, 이름, 부서이름 출력
DECLARE
          CURSOR emp_cursor IS
                    SELECT employee_id, last_name, department_name
                    FROM employees e LEFT OUTER JOIN departments d
                    ON e.department_id = d.department_id;
BEGIN
          FOR emp_record IN emp_cursor LOOP
                    DBMS_OUTPUT.PUT('사원번호 : ' || emp_record.employee_id);
                    DBMS_OUTPUT.PUT(', 이름 : ' || emp_record.last_name);
                    DBMS_OUTPUT.PUT_LINE(', 부서이름 : ' || emp_record.department_name);                    
          END LOOP;

END;
/

-- 2) 부서번호가 50이거나 80인 사원들의 사원이름, 급여, 연봉 출력
DECLARE
          CURSOR emp_cursor IS
                    SELECT *
                    FROM employees e JOIN departments d
                    ON e.department_id = d.department_id
                    WHERE e.department_id IN (50, 80);
          
          emp_record emp_cursor%ROWTYPE;
          v_annual emp_record.salary%TYPE;
BEGIN
          FOR emp_record IN emp_cursor LOOP
                    DBMS_OUTPUT.PUT('사원이름 : ' || emp_record.last_name);
                    DBMS_OUTPUT.PUT(', 급여 : ' || emp_record.salary);
                    
                    v_annual := emp_record.salary * (1 + NVL(emp_record.commission_pct, 0)) * 12;
                    DBMS_OUTPUT.PUT_LINE(', 연봉 : ' || v_annual);            
          END LOOP;

END;
/



-- 매개변수
DECLARE
          CURSOR emp_cursor
                    (p_mgr employees.manager_id%TYPE) IS
                    SELECT *
                    FROM employees
                    WHERE manager_id = p_mgr;
                    
          v_emp_info emp_cursor%ROWTYPE;
BEGIN
          -- 기본
          OPEN emp_cursor(100);
          
          LOOP
                    FETCH emp_cursor INTO v_emp_info;
                    EXIT WHEN emp_cursor%NOTFOUND;
                    
                    DBMS_OUTPUT.PUT(v_emp_info.employee_id || ', ');
                    DBMS_OUTPUT.PUT_LINE(v_emp_info.last_name || ', ');       
          END LOOP;
                    DBMS_OUTPUT.PUT_LINE('========================');  
          
          CLOSE emp_cursor;
          
          -- 커서 FOR LOOP
          FOR v_emp_info IN emp_cursor(149) LOOP
                    DBMS_OUTPUT.PUT(v_emp_info.employee_id || ', ');
                    DBMS_OUTPUT.PUT_LINE(v_emp_info.last_name || ', ');                
          END LOOP;

END;
/



-- 문제 1
-- 테이블 생성(test01, test02)
CREATE TABLE test01
AS
          SELECT employee_id, first_name, hire_date
          FROM employees
          WHERE employee_id = 0;
          
CREATE TABLE test02
AS
          SELECT employee_id, first_name, hire_date
          FROM employees
          WHERE employee_id = 0;
          

-- 2015년(포함) 이후 입사 => test01
-- 2015년 이전 입사 => test02
DECLARE
          CURSOR emp_cursor IS
                    SELECT employee_id, last_name, hire_date
                    FROM employees;
                    
          emp_record emp_cursor%ROWTYPE;
BEGIN
          -- 기본 LOOP
          OPEN emp_cursor;
          
          LOOP
                    FETCH emp_cursor INTO emp_record;
                    EXIT WHEN emp_cursor%NOTFOUND;
                    
                    IF TO_CHAR(emp_record.hire_date, 'YYYY') >= 2015 THEN
                              INSERT INTO test01
                              VALUES(emp_record.employee_id, emp_record.last_name, emp_record.hire_date);
                    ELSE
                              INSERT INTO test02
                              VALUES emp_record;
                    END IF;
          END LOOP;

          CLOSE emp_cursor;
          
          -- 커서 FOR LOOP
--          FOR v_emp_info IN emp_cursor LOOP
--                    IF TO_CHAR(v_emp_info.hire_date, 'YYYY') >= 2015 THEN
--                              INSERT INTO test01
--                              VALUES(v_emp_info.employee_id, v_emp_info.last_name, v_emp_info.hire_date);
--                    ELSE
--                              INSERT INTO test02
--                              VALUES(v_emp_info.employee_id, v_emp_info.last_name, v_emp_info.hire_date);
--                    END IF;
--          END LOOP;


END;
/

SELECT * FROM test01;
SELECT * FROM test02;

DROP TABLE test01;
DROP TABLE test02;



-- 문제 2
DECLARE
          CURSOR emp_cursor IS
                    SELECT last_name, hire_date, department_name
                    FROM employees e JOIN departments d
                    ON e.department_id = d.department_id
                    WHERE d.department_id = &부서번호;
          
          emp_record emp_cursor%ROWTYPE;
BEGIN
          OPEN emp_cursor;
          
          LOOP
                    FETCH emp_cursor INTO emp_record;
                    EXIT WHEN emp_cursor%NOTFOUND;
                    
                    DBMS_OUTPUT.PUT('사원이름 : ' || emp_record.last_name);
                    DBMS_OUTPUT.PUT(', 입사일자 : ' || emp_record.hire_date);
                    DBMS_OUTPUT.PUT_LINE(', 부서명 : ' || emp_record.department_name);
          END LOOP;
          
          CLOSE emp_cursor;
END;
/

-- 매개변수
DECLARE
          CURSOR dept_cursor IS
                    SELECT *
                    FROM departments;

          CURSOR emp_cursor (p_dept_id departments.department_id%TYPE) IS
                    SELECT last_name, hire_date, department_name
                    FROM employees e JOIN departments d
                    ON e.department_id = d.department_id
                    WHERE d.department_id = p_dept_id;
          
          emp_record emp_cursor%ROWTYPE;
BEGIN
          FOR dept_info IN dept_cursor LOOP
                    DBMS_OUTPUT.PUT_LINE('========== 현재 부서 정보 : ' || dept_info.department_name || '==========');

                    OPEN emp_cursor(dept_info.department_id);
                    
                    LOOP
                              FETCH emp_cursor INTO emp_record;
                              EXIT WHEN emp_cursor%NOTFOUND;
                              
                              DBMS_OUTPUT.PUT('사원이름 : ' || emp_record.last_name);
                              DBMS_OUTPUT.PUT(', 입사일자 : ' || emp_record.hire_date);
                              DBMS_OUTPUT.PUT_LINE(', 부서명 : ' || emp_record.department_name);
                    END LOOP;
                    
                    IF emp_cursor%ROWCOUNT = 0 THEN
                              DBMS_OUTPUT.PUT_LINE('현재 소속된 사원이 없습니다.');
                    END IF;
                    
                    CLOSE emp_cursor;
          END LOOP;
END;
/


-- 예외처리
-- 1) 오라클 관리 예외(이름 존재)
-- EXCEPTION 작성 : WHEN ~ THEN

-- 2) 오라클 관리 예외(이름 미존재, 코드 존재)
-- DECLARE 작성
--        : 이름 EXCEPTION;
--        PRAGMA EXCEPTION INIT(이름, 에러코드);
-- EXCEPTION 작성 : WHEN ~ THEN

-- 3) 사용자 정의 예외
-- DECLARE 작성 : 이름 EXCEPTION
-- BEGIN 작성 : RAISE 이름
-- EXCEPTION 작성 : WHEN ~ THEN


-- 1) Oracle이 관리하고 이름이 존재하는 경우
DECLARE
          v_ename employees.last_name%TYPE;
BEGIN
          SELECT last_name
          INTO v_ename
          FROM employees
          WHERE department_id = &부서번호;
          
          DBMS_OUTPUT.PUT_LINE(v_ename);
EXCEPTION
          WHEN TOO_MANY_ROWS THEN       -- PL/SQL 결과는 하나만 출력 가능
                    DBMS_OUTPUT.PUT_LINE('해당 부서에는 여러명의 사원이 존재합니다.');
          WHEN NO_DATA_FOUND THEN
                    DBMS_OUTPUT.PUT_LINE('해당 부서는 존재하지 않습니다.');
-- 코드 개선을 위해 미권장
--          WHEN OTHERS THEN
--                    DBMS_OUTPUT.PUT_LINE('기타 예외가 발생했습니다.');
--                    
--          DBMS_OUTPUT.PUT_LINE('EXCEPTION 절이 실행되었습니다.');    -- OTHERS 영역
END;
/



-- 2) Oracle이 관리하고 이름이 존재하지 않는 경우
DECLARE
          e_emps_remaining EXCEPTION;
          PRAGMA EXCEPTION_INIT(e_emps_remaining, -02292);
BEGIN
          DELETE FROM departments
          WHERE department_id = &부서번호;  -- 제약조건(FK), 데이터타입 (단, 0행 실행은 오류 아님)
EXCEPTION
          WHEN e_emps_remaining THEN
                    DBMS_OUTPUT.PUT_LINE('다른 테이블에서 사용하고 있습니다.');
END;
/



-- 3) 사용자가 정의하는 예외사항
-- 오라클 오류는 아니지만 이용자에게 안내
DECLARE
          e_emp_del_fail EXCEPTION;
BEGIN
          DELETE FROM test_employees
          WHERE employee_id = &사원번호;
          
          IF SQL%ROWCOUNT = 0 THEN
                    RAISE e_emp_del_fail;
          END IF;
EXCEPTION
          WHEN e_emp_del_fail THEN
                    DBMS_OUTPUT.PUT_LINE('해당 사원이 존재하지 않습니다.');
END;
/



-- 예외 트랩 함수(SQLCODE, SQLERRM)
DECLARE
    e_too_many EXCEPTION;
    
    v_ex_code NUMBER;
    v_ex_msg VARCHAR2(1000);
    emp_info employees%ROWTYPE;
BEGIN
    SELECT *
    INTO emp_info
    FROM employees
    WHERE department_id = &부서번호;
    
    IF emp_info.salary < (emp_info.salary * emp_info.commission_pct + 10000) THEN
        RAISE e_too_many;
    END IF;
EXCEPTION
    WHEN e_too_many THEN
        DBMS_OUTPUT.PUT_LINE('사용자 정의 예외 발생!');
    WHEN OTHERS THEN
        v_ex_code := SQLCODE;
        v_ex_msg := SQLERRM;
        DBMS_OUTPUT.PUT_LINE('ORA ' || v_ex_code);
        DBMS_OUTPUT.PUT_LINE(' - ' || v_ex_msg);
END;
/



-- 1) test_employees 테이블을 사용하여 선택된 사원을 삭제하는 PL/SQL 작성
-- 조건 1) 치환변수 사용
-- 조건 2) 사원이 존재하지 않는 경우, '해당 사원이 존재하지 않습니다.'라는 메세지를 출력
-- => 사용자 정의 예외 활용

DECLARE
          e_no_data EXCEPTION;
BEGIN
          DELETE FROM test_employees
          WHERE employee_id = &사원번호;
          
          IF SQL%ROWCOUNT = 0 THEN
                    RAISE e_no_data;
          END IF;
EXCEPTION
          WHEN e_no_data THEN
                    DBMS_OUTPUT.PUT_LINE('해당 사원이 존재하지 않습니다.');
END;
/



-- PROCEDURE
-- 치환변수 사용 시 값 고정되어 미권장
-- 생성 후 수정 불가, 블럭 안에서 실행 가능
CREATE PROCEDURE test_pro
IS
-- 선언부 : 내부에서 사용하는 변수, 커서, 타입, 예외 정의
-- DECLARE 단어만 생략
          v_msg VARCHAR2(1000) := 'Excute Procedure';
BEGIN
          DELETE FROM test_employees
          WHERE department_id = 50;

          DBMS_OUTPUT.PUT_LINE(v_msg);
EXCEPTION
          WHEN INVALID_CURSOR THEN
                    DBMS_OUTPUT.PUT_LINE('사용할 수 없는 커서입니다.');
END;
/


-- 프로시저 실행 1)
BEGIN
          test_pro;
END;
/

--프로시저 실행 2) 단축어로 가상 블럭 생성
EXECUTE test_pro;



-- 1. 프로시저 매개변수 (IN)
-- IN : PROCEDURE 내부에서 상수로 인식
DROP PROCEDURE raise_salary;

CREATE PROCEDURE raise_salary
(p_eid IN employees.employee_id%TYPE)
IS

BEGIN
--          p_eid := 100;     -- 입력 불가
          
          UPDATE employees
          SET salary = salary * 1.1
          WHERE employee_id = p_eid;
END;
/


-- 프로시저 실행 시 매개변수 형식
DECLARE
          v_first NUMBER(3, 0) := 100;
          V_second CONSTANT NUMBER(3, 0) := 149;
BEGIN
          raise_salary(103);
          raise_salary(120 + 10);
          raise_salary(v_second);
          raise_salary(v_first);
END;
/

SELECT employee_id, salary
FROM employees;



-- 2. 프로시저 매개변수 (OUT)???????????????????
-- OUT : PROCEDURE 내부에서 초기화되지 않은 변수
DROP PROCEDURE test_p_out;

CREATE PROCEDURE test_p_out
(p_num IN NUMBER,
p_result OUT NUMBER)
IS
          v_sum NUMBER;
BEGIN
          DBMS_OUTPUT.PUT_LINE('IN : ' || p_num);
          DBMS_OUTPUT.PUT_LINE('OUT : ' || p_result);
--          p_result := 10;
          v_sum := p_num + p_result;
          p_result := v_sum;
END;
/



DECLARE
          v_result NUMBER(4, 0) := 1234;
BEGIN
          DBMS_OUTPUT.PUT_LINE('1) result : ' || v_result);
          test_p_out(1000, v_result);
          DBMS_OUTPUT.PUT_LINE('2) result : ' || v_result);
END;
/


--
CREATE PROCEDURE select_emp
(p_eid IN employees.employee_id%TYPE,
p_ename OUT employees.last_name%TYPE,
p_sal OUT employees.salary%TYPE,
p_comm OUT employees.commission_pct%TYPE)
IS

BEGIN
          SELECT last_name, salary, NVL(commission_pct, 0)
          INTO p_ename, p_sal, p_comm
          FROM employees
          WHERE employee_id = p_eid;
END;
/



DECLARE
          v_name VARCHAR2(100 char);
          v_sal NUMBER;
          v_comm NUMBER;
          
          v_eid NUMBER := &사원번호;
BEGIN
          select_emp(v_eid, v_name, v_sal, v_comm);
          
          DBMS_OUTPUT.PUT('사원번호 : ' || v_eid);
          DBMS_OUTPUT.PUT(', 사원이름 : ' || v_name);
          DBMS_OUTPUT.PUT(', 급여 : ' || v_sal);
          DBMS_OUTPUT.PUT_LINE(', 커미션 : ' || v_comm);
END;
/



-- 3. 프로시저 매개변수 (IN OUT)
-- IN OUT 매개변수
-- '01012341234' => '010-1234-1234'
DROP PROCEDURE format_phone;

CREATE PROCEDURE format_phone
(p_phone_no IN OUT VARCHAR2)
IS

BEGIN
          p_phone_no := SUBSTR(p_phone_no, 1, 3)
                              || '-' || SUBSTR(p_phone_no, 4, 4)
                              || '-' || SUBSTR(p_phone_no, 8);
END;
/



DECLARE
          v_ph_no VARCHAR2(100) := '01012341234';
BEGIN
          DBMS_OUTPUT.PUT_LINE('1) ' || v_ph_no);
          format_phone(v_ph_no);
          DBMS_OUTPUT.PUT_LINE('2) ' || v_ph_no);
END;
/


-- 기본키 참고 내용(PLSQL 수업 아님)
CREATE TABLE var_pk_tbl
(
          no VARCHAR2(1000) PRIMARY KEY,
          name VARCHAR2(4000) DEFAULT 'anony'
);

SELECT no, name
FROM var_pk_tbl;


-- 다음에 입력되는 코드값
-- 'TEMP240215101'  -- TEMP + yyMMdd + 숫자(3자리)
SELECT 'TEMP' || TO_CHAR(sysdate, 'yyMMdd') || LPAD(NVL(SUBSTR(no, -3)), 0) + 1, 3, '0')
FROM var_pk_tbl
WHERE SUBSTR(no, 5, 6) = TO_CHAR(sysdate, 'yyMMdd');



/*
1.
주민등록번호를 입력하면 
다음과 같이 출력되도록 yedam_ju 프로시저를 작성하시오.

EXECUTE yedam_ju(9501011667777)
EXECUTE yedam_ju(1511013689977)

  -> 950101-1******
*/

--DROP PROCEDURE yedam_ju;

CREATE PROCEDURE yedam_ju
(p_num IN VARCHAR2)
IS
v_result VARCHAR2(100);
BEGIN
--          v_result := SUBSTR(p_num, 1, 6) || ' - ' || SUBSTR(p_num, 7, 1) || '******';
          v_result := SUBSTR(p_num, 1, 6) || ' - ' || RPAD(SUBSTR(p_num, 7, 1), 7, '*');
                    
          DBMS_OUTPUT.PUT_LINE(v_result);
END;
/

EXECUTE yedam_ju(9501011667777);



/*
2.
사원번호를 입력할 경우
삭제하는 TEST_PRO 프로시저를 생성하시오.
단, 해당사원이 없는 경우 "해당사원이 없습니다." 출력
예) EXECUTE TEST_PRO(176)
*/

--CREATE TABLE test_employees
--AS
--          SELECT *
--          FROM employees;
--          
--SELECT *
--FROM test_employees;
--
--DROP PROCEDURE TEST_PRO;

CREATE PROCEDURE TEST_PRO
(p_eid IN NUMBER)
IS
e_no_data EXCEPTION;
BEGIN
          DELETE FROM test_employees
          WHERE employee_id = p_eid;
          
          IF SQL%ROWCOUNT = 0 THEN
                    RAISE e_no_data;
          END IF;

EXCEPTION
          WHEN e_no_data THEN
                    DBMS_OUTPUT.PUT_LINE('해당사원이 없습니다.');
          
END;
/

EXECUTE TEST_PRO(100);



/*
3.
다음과 같이 PL/SQL 블록을 실행할 경우 
사원번호를 입력할 경우 사원의 이름(last_name)의 첫번째 글자를 제외하고는
'*'가 출력되도록 yedam_emp 프로시저를 생성하시오.

실행) EXECUTE yedam_emp(176)
실행결과) TAYLOR -> T*****  <- 이름 크기만큼 별표(*) 출력
*/

--DROP PROCEDURE yedam_emp;

CREATE PROCEDURE yedam_emp
(p_eid IN NUMBER)
IS
v_name test_employees.last_name%TYPE;
v_result VARCHAR2(100);
BEGIN
          SELECT last_name
          INTO v_name
          FROM test_employees
          WHERE employee_id = p_eid;

          v_result := RPAD(SUBSTR(v_name, 1, 1), LENGTH(v_name), '*');
          
          DBMS_OUTPUT.PUT_LINE(v_result);
END;
/

EXECUTE yedam_emp(101);



/*
4.
부서번호를 입력할 경우 
해당부서에 근무하는 사원의 사원번호, 사원이름(last_name)을 출력하는 get_emp 프로시저를 생성하시오. 
(cursor 사용해야 함)
단, 사원이 없을 경우 "해당 부서에는 사원이 없습니다."라고 출력(exception 사용)
실행) EXECUTE get_emp(30)
*/

--DROP PROCEDURE get_emp;

CREATE PROCEDURE get_emp
(p_did IN NUMBER)
IS
          CURSOR emp_cursor (p_did test_employees.department_id%TYPE) IS
          SELECT employee_id, last_name
          FROM test_employees
          WHERE department_id = p_did;

v_emp_info emp_cursor%ROWTYPE;
e_no_data EXCEPTION;
BEGIN

          OPEN emp_cursor(p_did);
          
          LOOP
                    FETCH emp_cursor INTO v_emp_info;
                    EXIT WHEN emp_cursor%NOTFOUND;
                    
                    DBMS_OUTPUT.PUT(v_emp_info.employee_id);
                    DBMS_OUTPUT.PUT_LINE(', ' || v_emp_info.last_name);
          END LOOP;
          
          IF emp_cursor%ROWCOUNT = 0 THEN
                    RAISE e_no_data;
          END IF;
          
          CLOSE emp_cursor;

EXCEPTION
          WHEN e_no_data THEN
                    DBMS_OUTPUT.PUT_LINE('해당 부서에는 사원이 없습니다.');
END;
/

EXECUTE get_emp(0);



/*
5.
직원들의 사번, 급여 증가치만 입력하면 Employees테이블에 쉽게 사원의 급여를 갱신할 수 있는 y_update 프로시저를 작성하세요. 
만약 입력한 사원이 없는 경우에는 ‘No search employee!!’라는 메시지를 출력하세요.(예외처리)
실행) EXECUTE y_update(200, 10)
*/

--DROP PROCEDURE y_update;

CREATE PROCEDURE y_update
(p_eid IN NUMBER,
p_cmt IN NUMBER)
IS
e_no_data EXCEPTION;
BEGIN
          UPDATE test_employees
          SET salary = salary * (1 + p_cmt/100)
          WHERE employee_id = p_eid;
          
          IF SQL%ROWCOUNT = 0 THEN
                    RAISE e_no_data;
          END IF;
          
EXCEPTION
          WHEN e_no_data THEN
                    DBMS_OUTPUT.PUT_LINE('No search employee!!');
END;
/

EXECUTE y_update(0, 10);

--SELECT *
--FROM test_employees;