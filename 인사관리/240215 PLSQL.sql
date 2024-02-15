SET SERVEROUTPUT ON

-- 문제 2. 구구단을 출력하시오(&치환변수 사용)
-- 1) 기본 LOOP : 조건과 관련된 변수 필수
DECLARE
          v_dan CONSTANT NUMBER(2, 0) := &단;
          v_num NUMBER(2, 0) := 1;
          v_result VARCHAR2(100);
BEGIN
          LOOP
                    v_result := v_dan || ' * ' || v_num || ' = ' || (v_dan * v_num);
                    DBMS_OUTPUT.PUT_LINE(v_result);
                    v_num := v_num + 1;
                    EXIT WHEN v_num > 9;
          END LOOP;
END;
/

-- 2) WHILE LOOP
DECLARE
          v_dan NUMBER(2, 0) := &단;
          v_num NUMBER(2, 0) := 1;
          v_result VARCHAR2(100);
BEGIN
          WHILE v_num <= 9 LOOP
                    v_result := v_dan || ' * ' || v_num || ' = ' || (v_dan * v_num);
                    DBMS_OUTPUT.PUT_LINE(v_result);
                    v_num := v_num + 1;
          END LOOP;
END;
/

-- 3) FOR LOOP
DECLARE
          v_dan NUMBER(2, 0) := &단;
          v_result VARCHAR2(100);
BEGIN
          FOR num IN 1 .. 9 LOOP
                    v_result := v_dan || ' * ' || num || ' = ' || (v_dan * num);
                    DBMS_OUTPUT.PUT_LINE(v_result);
          END LOOP;
END;
/




-- 문제 3. 구구단 2~9단까지 출력하시오
-- 1) 기본 LOOP
DECLARE
          v_dan NUMBER(2, 0) := 2;
          v_num NUMBER(2, 0) := 1;
          v_result VARCHAR2(100);
BEGIN
          LOOP
                    LOOP
                              v_result := v_dan || ' * ' || v_num || ' = ' || (v_dan * v_num);
                              DBMS_OUTPUT.PUT_LINE(v_result);
                              v_num := v_num + 1;
                              EXIT WHEN v_num > 9;
                    END LOOP;
                    DBMS_OUTPUT.PUT_LINE('=================================');
                    v_dan := v_dan + 1;
                    v_num := 1;
                    EXIT WHEN v_dan > 9;
          END LOOP;
END;
/


-- 2) WHILE LOOP : 반복조건과 관련된 변수
DECLARE
          v_dan NUMBER(2, 0) := 2;
          v_num NUMBER(2, 0) := 1;
          v_result VARCHAR2(100);
BEGIN
          WHILE v_dan <= 9 LOOP
                    WHILE v_num <= 9 LOOP
                              v_result := v_dan || ' * ' || v_num || ' = ' || (v_dan * v_num);
                              DBMS_OUTPUT.PUT_LINE(v_result);
                              v_num := v_num + 1;
                    END LOOP;
                    DBMS_OUTPUT.PUT_LINE('=================================');
                    v_dan := v_dan + 1;
                    v_num := 1;
          END LOOP;
END;
/

-- 가로 출력
DECLARE
          v_dan NUMBER(2, 0) := 2;
          v_num NUMBER(2, 0) := 1;
          v_result VARCHAR2(100);
BEGIN
          WHILE v_num <= 9 LOOP
                    WHILE v_dan <= 9 LOOP
                              v_result := v_dan || ' * ' || v_num || ' = ' || (v_dan * v_num) || ' || ';
                              DBMS_OUTPUT.PUT(v_result);
                              v_dan := v_dan + 1;
                    END LOOP;
                    DBMS_OUTPUT.PUT_LINE('');
                    v_num := v_num + 1;
                    v_dan := 2;
          END LOOP;
END;
/


-- 3) FOR LOOP
DECLARE
          v_result VARCHAR2(100);
BEGIN
          FOR dan IN 2 .. 9 LOOP        -- 단 : 2 ~ 9
                    FOR num IN 1 .. 9 LOOP        -- 곱하는 수 : 1 ~ 9
                              v_result := dan || ' * ' || num || ' = ' || (dan * num);
                              DBMS_OUTPUT.PUT_LINE(v_result);
                    END LOOP;
                    DBMS_OUTPUT.PUT_LINE('=================================');
          END LOOP;
END;
/

-- 가로 출력
DECLARE
          v_result VARCHAR2(100);
BEGIN
          FOR num IN 1 .. 9 LOOP
                    FOR dan IN 2 .. 9 LOOP
                              v_result := dan || ' * ' || num || ' = ' || (dan * num) || ' || ';
                              DBMS_OUTPUT.PUT(v_result);
                    END LOOP;
                    DBMS_OUTPUT.PUT_LINE('');
          END LOOP;
END;
/



-- 문제 4. 구구단 1~9단까지 출력하시오(단, 홀수단 출력)
-- 1) 기본 LOOP + IF문
DECLARE
          v_dan NUMBER(2, 0) := 1;
          v_num NUMBER(2, 0) := 1;
          v_result VARCHAR2(100);
BEGIN
          LOOP
                    IF MOD(v_dan, 2) <> 0 THEN
                    LOOP
                              v_result := v_dan || ' * ' || v_num || ' = ' || (v_dan * v_num);
                              DBMS_OUTPUT.PUT_LINE(v_result);
                              v_num := v_num + 1;
                              EXIT WHEN v_num > 9;
                    END LOOP;
                    DBMS_OUTPUT.PUT_LINE('=================================');
                    END IF;
                    v_dan := v_dan + 1;
                    v_num := 1;
                    EXIT WHEN v_dan > 9;
          END LOOP;
END;
/

-- 3) FOR LOOP + IF문
DECLARE
          v_result VARCHAR2(100);
BEGIN
          FOR dan IN 1 .. 9 LOOP        -- 단 : 2 ~ 9
                    IF MOD(dan, 2) = 0 THEN       -- 제한 조건
                              CONTINUE;
                    END IF;
                    
                    FOR num IN 1 .. 9 LOOP        -- 곱하는 수 : 1 ~ 9
                              v_result := dan || ' * ' || num || ' = ' || (dan * num);
                              DBMS_OUTPUT.PUT_LINE(v_result);
                    END LOOP;
                    DBMS_OUTPUT.PUT_LINE('=================================');
          END LOOP;
END;
/



-- 조합 데이터
-- RECORD
DECLARE
          -- 1) 정의
          TYPE emp_record_type IS RECORD
                    (empno NUMBER(6, 0),
                    ename employees.last_name%TYPE,
                    sal employees.salary%TYPE := 0);
          
          -- 2) 변수 선언
          v_emp_info emp_record_type;
          v_emp_record emp_record_type;
BEGIN
          SELECT employee_id, last_name, salary
          INTO v_emp_info     -- 1) 변수에 정의된 필드 수 = SELECT 컬럼 수    2) 데이터 타입 일치
          FROM employees
          WHERE employee_id = &사원번호;
          
          DBMS_OUTPUT.PUT('사원번호 : ' || v_emp_info.empno);
          DBMS_OUTPUT.PUT(', 사원이름 : ' || v_emp_info.ename);
          DBMS_OUTPUT.PUT_LINE(', 급여 : ' || v_emp_info.sal);
--          DBMS_OUTPUT.PUT_LINE(v_emp_info);     -- 접근 불가
END;
/



-- RECODE : %ROWTYPE
DECLARE
          v_emp_info employees%ROWTYPE; -- %ROWTYPE 사용 : 테이블, 뷰
BEGIN
          SELECT *
          INTO v_emp_info
          FROM employees
          WHERE employee_id = &사원번호;
          
          DBMS_OUTPUT.PUT('사원번호 : ' || v_emp_info.employee_id);
          DBMS_OUTPUT.PUT(', 사원이름 : ' || v_emp_info.last_name);
          DBMS_OUTPUT.PUT_LINE(', 업무 : ' || v_emp_info.job_id);
END;
/



-- TABLE
DECLARE
          -- 1) 정의
          TYPE num_table_type IS TABLE OF NUMBER
                    INDEX BY PLS_INTEGER;         -- 권장
                    
          -- 2) 변수 선언
          v_num_info num_table_type;
BEGIN
--          DBMS_OUTPUT.PUT_LINE('현재 인덱스 -1000 : ' || v_num_info(-1000));         -- 초기값 없음
          v_num_info (-1000) := 10000;  -- 인덱스 : -1000
          
          DBMS_OUTPUT.PUT_LINE('현재 인덱스 -1000 : ' || v_num_info(-1000));
END;
/



-- 2의 배수 10개를 담는 예제 : 2, 4, 6, 8, 10, 12, 14, ...
DECLARE
          TYPE num_table_type IS TABLE OF NUMBER
                    INDEX BY PLS_INTEGER;
          
          v_num_ary num_table_type;
          
          v_result NUMBER(4, 0) := 0;
BEGIN
          FOR idx IN 1 .. 10 LOOP
                    v_num_ary(idx * 5) := idx * 2;
          END LOOP;
          
          FOR i IN v_num_ary.FIRST .. v_num_ary.LAST LOOP
                    IF v_num_ary.EXISTS(i) THEN   -- 비어있는 인덱스 제외
                              DBMS_OUTPUT.PUT(i || ' : ');
                              DBMS_OUTPUT.PUT_LINE(v_num_ary(i));
                              
                              v_result := v_result + v_num_ary(i);
                    END IF;
          END LOOP;
          
          DBMS_OUTPUT.PUT_LINE('총 갯수 : ' || v_num_ary.COUNT);
          DBMS_OUTPUT.PUT_LINE('누적합 : ' || v_result);
END;
/


-- TABLE + RECORD
SELECT *
FROM employees;

DECLARE
          TYPE emp_table_type IS TABLE OF employees%ROWTYPE
                    INDEX BY PLS_INTEGER;
          
          v_emps emp_table_type;
          v_emp_info employees%ROWTYPE;
BEGIN
          FOR eid IN 100 .. 104 LOOP
                    SELECT *
                    INTO v_emp_info
                    FROM employees
                    WHERE employee_id = eid;
                    
                    v_emps(eid) := v_emp_info;
          END LOOP;

          DBMS_OUTPUT.PUT_LINE('총 갯수 : ' || v_emps.COUNT);
          DBMS_OUTPUT.PUT_LINE(v_emps(100).last_name);
END;
/

-- 비교 확인 (1) *****************************************************************
-- 메모장 확인
DECLARE
          TYPE emp_table_type IS TABLE OF employees%ROWTYPE
                    INDEX BY PLS_INTEGER;
          
          v_emps emp_table_type;
          v_emp_info employees%ROWTYPE;
          
          v_min NUMBER(3, 0);
          v_max NUMBER(3, 0);
BEGIN
          -- 최소 사원번호, 최대 사원번호
          SELECT MIN(employee_id), MAX(employee_id)
          INTO v_min, v_max
          FROM employees;
          
          FOR eid IN v_min .. v_max LOOP
                    SELECT COUNT(*)
                    INTO v_emp_info
                    FROM employees
                    WHERE employee_id = eid;
                    
                    v_emps(eid) := v_emp_info;
          END LOOP;

          DBMS_OUTPUT.PUT_LINE('총 갯수 : ' || v_emps.COUNT);
          DBMS_OUTPUT.PUT_LINE(v_emps(100).last_name);
END;
/



-- CURSOR
-- NO DATA FOUND 오류 미발생
DECLARE
          -- 커서를 선언
          CURSOR emp_cursor IS
                    SELECT employee_id, last_name
                    FROM employees;
--                    WHERE employee_id = 0;
                    
          v_eid employees.employee_id%TYPE;
          v_ename employees.last_name%TYPE;
BEGIN
          OPEN emp_cursor;
          
          FETCH emp_cursor INTO v_eid, v_ename;
          
          DBMS_OUTPUT.PUT_LINE('사원번호 : ' || v_eid);
          DBMS_OUTPUT.PUT_LINE('사원이름 : ' || v_ename);
          
          CLOSE emp_cursor;
END;
/



DECLARE
          CURSOR emp_cursor IS
                    SELECT employee_id, last_name, job_id
                    FROM employees;
                    
          v_emp_record emp_cursor%ROWTYPE;
BEGIN
          OPEN emp_cursor;
          
          LOOP
                    FETCH emp_cursor INTO v_emp_record;
                    EXIT WHEN emp_cursor%NOTFOUND;
                    
                    -- 실제 연산 진행
                    DBMS_OUTPUT.PUT(emp_cursor%ROWCOUNT || ', ');
                    DBMS_OUTPUT.PUT_LINE(v_emp_record.last_name);
          END LOOP;
          
          CLOSE emp_cursor;
END;
/


-- 비교 확인 (2) *****************************************************************
-- employees => 테이블
DECLARE
          CURSOR emp_cursor IS
                    SELECT *
                    FROM employees;
                    
          v_emp_record employees%ROWTYPE;

          TYPE emp_table_type IS TABLE OF employees%ROWTYPE
                    INDEX BY PLS_INTEGER;
          
          v_emp_table emp_table_type;
BEGIN
          OPEN emp_cursor;
          
          LOOP
                    FETCH emp_cursor INTO v_emp_record;
                    EXIT WHEN emp_cursor%NOTFOUND;
                    
                    v_emp_table(v_emp_record.employee_id) := v_emp_record;
          END LOOP;
          
          CLOSE emp_cursor;
          
          -- 동일 코드 활용
          FOR eid IN v_emp_table.FIRST .. v_emp_table.LAST LOOP
                    IF v_emp_table.EXISTS(eid) THEN
                              DBMS_OUTPUT.PUT(v_emp_table(eid).employee_id || ', ');
                              DBMS_OUTPUT.PUT(v_emp_table(eid).last_name || ', ');
                              DBMS_OUTPUT.PUT_LINE(v_emp_table(eid).hire_date);
                    END IF;
          END LOOP;    
END;
/



--
DECLARE
          CURSOR emp_dept_cursor IS
                    SELECT employee_id, last_name, job_id
                    FROM employees
                    WHERE department_id = &부서번호;
                    
          v_emp_info emp_dept_cursor%ROWTYPE;
BEGIN
          -- 1) 해당 부서에 속한 사원의 정보를 출력
          OPEN emp_dept_cursor;
          
          LOOP
                    -- (1번) %ROWCOUNT 위치 : LOOP문 안쪽 => 몇번째 행
                    DBMS_OUTPUT.PUT_LINE('1번 : ' || emp_dept_cursor%ROWCOUNT);
                    
                    FETCH emp_dept_cursor INTO v_emp_info;
                    EXIT WHEN emp_dept_cursor%NOTFOUND;
                    
                    DBMS_OUTPUT.PUT(v_emp_info.employee_id);
                    DBMS_OUTPUT.PUT_LINE(', ' || v_emp_info.last_name);
          END LOOP;
          
          -- (2번) %ROWCOUNT 위치 : LOOP문 바깥쪽 => 현재 커서의 데이터 총 갯수
          DBMS_OUTPUT.PUT_LINE('2번 : ' || emp_dept_cursor%ROWCOUNT);
          
          -- 2) 해당 부서에 속한 사원이 없는 경우, '해당 부서에 소속된 직원이 없습니다.'라는 메세지 출력
          IF emp_dept_cursor%ROWCOUNT = 0 THEN
                    DBMS_OUTPUT.PUT_LINE('해당 부서에 소속된 직원이 없습니다.');
          END IF;
          
          CLOSE emp_dept_cursor;
END;
/



-- 문제 1. 모든 사원의 사원번호, 이름, 부서이름 출력
DECLARE
          CURSOR emp_cursor IS
                    SELECT employee_id eid, last_name ename, department_name dept_name
                    FROM employees e LEFT OUTER JOIN departments d
                    ON e.department_id = d.department_id;
          
          v_emp_info emp_cursor%ROWTYPE;
BEGIN
          OPEN emp_cursor;
          
          LOOP
                    FETCH emp_cursor INTO v_emp_info;
                    EXIT WHEN emp_cursor%NOTFOUND;
                    
                    DBMS_OUTPUT.PUT_LINE(v_emp_info.eid || ', ' || v_emp_info.ename || ', ' || v_emp_info.dept_name);
          END LOOP;
          
          CLOSE emp_cursor;
END;
/



-- 문제 2. 부서번호가 50이거나 80인 사원들의 사원이름, 급여, 연봉 출력
DECLARE
          CURSOR emp_cursor IS
                    SELECT *
                    FROM employees e JOIN departments d
                    ON e.department_id = d.department_id
                    WHERE e.department_id IN (50, 80);
          
          v_emp_info emp_cursor%ROWTYPE;
          v_annual v_emp_info.salary%TYPE;
BEGIN
          OPEN emp_cursor;
          
          LOOP
                    FETCH emp_cursor INTO v_emp_info;
                    EXIT WHEN emp_cursor%NOTFOUND;
                    
                    v_annual := v_emp_info.salary * (1 + NVL(v_emp_info.commission_pct, 0)) * 12;
                    DBMS_OUTPUT.PUT_LINE(v_emp_info.last_name || ', ' || v_emp_info.salary || ', ' || v_annual);
          END LOOP;
          
          CLOSE emp_cursor;
END;
/

























