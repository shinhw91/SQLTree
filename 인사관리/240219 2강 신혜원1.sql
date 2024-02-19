SET SERVEROUTPUT ON

-- 2번
DECLARE
          v_name departments.department_name%TYPE;
          v_job employees.job_id%TYPE;
          v_sal employees.salary%TYPE;
          v_comm employees.commission_pct%TYPE;
          v_annual employees.salary%TYPE;
          
BEGIN
          SELECT d.department_name, e.job_id, e.salary, e.commission_pct
          INTO v_name, v_job, v_sal, v_comm
          FROM employees e LEFT OUTER JOIN departments d
          ON e.department_id = d.department_id
          WHERE employee_id = &사원번호;
          
          v_annual := (NVL(v_sal, 0) * (1 + NVL(v_comm, 0))) * 12;
          
          DBMS_OUTPUT.PUT_LINE('부서이름 : ' || v_name);
          DBMS_OUTPUT.PUT_LINE('job_id : ' || v_job);
          DBMS_OUTPUT.PUT_LINE('급여 : ' || v_sal);
          DBMS_OUTPUT.PUT_LINE('연간 총 수입 : ' || v_annual);
          
END;
/



-- 3번
DECLARE
          v_date employees.hire_date%TYPE;
          
BEGIN
          SELECT hire_date
          INTO v_date
          FROM employees
          WHERE employee_id = &사원번호;
          
          IF TO_CHAR(v_date, 'YYYY') > 2015 THEN
                    DBMS_OUTPUT.PUT_LINE('New employee');
          ELSE
                    DBMS_OUTPUT.PUT_LINE('Career employee');
          END IF;

END;
/



-- 4번
DECLARE
          v_dan NUMBER(2, 0) := 1;
          v_num NUMBER(2, 0) :=1;
          v_result VARCHAR2(100);
          
BEGIN
          LOOP
                    IF MOD(v_dan, 2) <> 0 THEN
                              LOOP
                                        v_result := v_dan || ' * ' || v_num || ' = ' || v_dan * v_num;
                                        DBMS_OUTPUT.PUT_LINE(v_result);
                                        v_num := v_num + 1;
                                        EXIT WHEN v_num > 9;
                              END LOOP;
                              DBMS_OUTPUT.PUT_LINE('==========================');
                    END IF;
                    v_dan := v_dan + 1;
                    v_num := 1;
                    EXIT WHEN v_dan > 9;
          END LOOP;
END;
/



-- 5번
DECLARE
          CURSOR emp_cursor IS
                    SELECT *
                    FROM employees
                    WHERE department_id = &부서번호;
          
          v_emp_info emp_cursor%ROWTYPE;
          
BEGIN
          OPEN emp_cursor;
          
          LOOP
                    FETCH emp_cursor INTO v_emp_info;
                    EXIT WHEN emp_cursor%NOTFOUND;
                    
                    DBMS_OUTPUT.PUT_LINE(v_emp_info.employee_id || ', ' || v_emp_info.last_name || ', ' || v_emp_info.salary);
          END LOOP;
          
          CLOSE emp_cursor;
END;
/



-- 6번
DROP PROCEDURE emp_pro;

CREATE PROCEDURE emp_pro
(p_eid IN employees.employee_id%TYPE,
p_cmt IN NUMBER)
IS
          e_nodata EXCEPTION;
BEGIN
          UPDATE employees
          SET salary = salary * (1 + p_cmt/100)
          WHERE employee_id = p_eid;
          
          IF SQL%ROWCOUNT = 0 THEN
                    RAISE e_nodata;
          END IF;
          
EXCEPTION
          WHEN e_nodata THEN
                    DBMS_OUTPUT.PUT_LINE('NO search employee!!');
END;
/



-- 7번
-- 생년월까지 반영
CREATE PROCEDURE info_pro
(p_text IN VARCHAR2)
IS
          v_year VARCHAR2(100);
          v_month VARCHAR2(100);
          v_tyear VARCHAR2(100);
          v_tmonth VARCHAR2(100);
          v_age VARCHAR2(100);
          
          v_gender VARCHAR2(100);
          
BEGIN
          v_year := TO_CHAR(TO_DATE(SUBSTR(p_text, 1, 6), 'rr/MM/dd'), 'RRRR');
          v_month := TO_CHAR(TO_DATE(SUBSTR(p_text, 1, 6), 'rr/MM/dd'), 'MM');
          v_tyear := TO_CHAR(SYSDATE, 'RRRR');
          v_tmonth := TO_CHAR(SYSDATE, 'MM');
          
          IF v_month > v_tmonth THEN
                    v_age := v_tyear - v_year;
          ELSE
                    v_age := (v_tyear - v_year) - 1;
          END IF;
          
          
          v_gender := SUBSTR(p_text, 7, 1);
          IF v_gender IN (1, 3) THEN
                    v_gender := '남성';
          END IF;
                    v_gender := '여성';
         
         DBMS_OUTPUT.PUT_LINE(v_age || ', ' || v_gender);           
END;
/

EXECUTE info_pro('0004080000000');



-- 8번
CREATE FUNCTION year_fun
(p_eid employees.employee_id%TYPE)
RETURN NUMBER
IS
          v_year NUMBER(2, 0);
  
BEGIN
          SELECT TRUNC (MONTHS_BETWEEN (sysdate, hire_date)/12)
          INTO v_year
          FROM employees
          WHERE employee_id = p_eid;
          
          RETURN v_year;
END;
/



-- 9번
CREATE FUNCTION name_fun
(p_dname departments.department_name%TYPE)
RETURN VARCHAR2
IS
          p_name employees.last_name%TYPE;
BEGIN
          SELECT last_name
          INTO p_name
          FROM employees
          WHERE employee_id = (SELECT manager_id
                                        FROM departments
                                        WHERE department_name = p_dname);
                                        
          RETURN p_name;
END;
/



-- 10번
SELECT name, text
FROM user_source
WHERE type IN ('PROCEDURE', 'FUNCTION', 'PACKAGE', 'PACKAGE BODY');



-- 11번
DECLARE
          v_star VARCHAR2(100) := '**********';
          v_result VARCHAR2(100) := '';
BEGIN
          FOR num IN 1 .. 9 LOOP
                    v_result := LPAD(SUBSTR(v_star, 1, num), 10, '-');
                    DBMS_OUTPUT.PUT_LINE(v_result);
          END LOOP;

END;
/