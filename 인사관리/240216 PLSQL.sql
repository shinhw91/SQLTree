SET SERVEROUTPUT ON

-- Ŀ�� FOR LOOP
DECLARE
          CURSOR emp_cursor IS
                    SELECT employee_id, last_name
                    FROM employees
                    WHERE employee_id = 0;
BEGIN
          FOR emp_record IN emp_cursor LOOP
                    DBMS_OUTPUT.PUT('NO. : ' || emp_cursor%ROWCOUNT);
                    DBMS_OUTPUT.PUT(', �����ȣ : ' || emp_record.employee_id);
                    DBMS_OUTPUT.PUT_LINE(', ����̸� : ' || emp_record.last_name);
          END LOOP; -- CLOSE; �Բ� ����
--          DBMS_OUTPUT.PUT_LINE('Total : ' || emp_cursor%ROWCOUNT);    -- Ŀ�� �ۿ��� %ROWCOUNT, %NOTFOUND ��� �Ұ�
          
          FOR dept_info IN (SELECT * FROM departments) LOOP
                    DBMS_OUTPUT.PUT(', �μ���ȣ : ' || dept_info.department_id);
                    DBMS_OUTPUT.PUT_LINE(', �μ��̸� : ' || dept_info.department_name);
          END LOOP;
END;
/



-- 1) ��� ����� �����ȣ, �̸�, �μ��̸� ���
DECLARE
          CURSOR emp_cursor IS
                    SELECT employee_id, last_name, department_name
                    FROM employees e LEFT OUTER JOIN departments d
                    ON e.department_id = d.department_id;
BEGIN
          FOR emp_record IN emp_cursor LOOP
                    DBMS_OUTPUT.PUT('�����ȣ : ' || emp_record.employee_id);
                    DBMS_OUTPUT.PUT(', �̸� : ' || emp_record.last_name);
                    DBMS_OUTPUT.PUT_LINE(', �μ��̸� : ' || emp_record.department_name);                    
          END LOOP;

END;
/

-- 2) �μ���ȣ�� 50�̰ų� 80�� ������� ����̸�, �޿�, ���� ���
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
                    DBMS_OUTPUT.PUT('����̸� : ' || emp_record.last_name);
                    DBMS_OUTPUT.PUT(', �޿� : ' || emp_record.salary);
                    
                    v_annual := emp_record.salary * (1 + NVL(emp_record.commission_pct, 0)) * 12;
                    DBMS_OUTPUT.PUT_LINE(', ���� : ' || v_annual);            
          END LOOP;

END;
/



-- �Ű�����
DECLARE
          CURSOR emp_cursor
                    (p_mgr employees.manager_id%TYPE) IS
                    SELECT *
                    FROM employees
                    WHERE manager_id = p_mgr;
                    
          v_emp_info emp_cursor%ROWTYPE;
BEGIN
          -- �⺻
          OPEN emp_cursor(100);
          
          LOOP
                    FETCH emp_cursor INTO v_emp_info;
                    EXIT WHEN emp_cursor%NOTFOUND;
                    
                    DBMS_OUTPUT.PUT(v_emp_info.employee_id || ', ');
                    DBMS_OUTPUT.PUT_LINE(v_emp_info.last_name || ', ');       
          END LOOP;
                    DBMS_OUTPUT.PUT_LINE('========================');  
          
          CLOSE emp_cursor;
          
          -- Ŀ�� FOR LOOP
          FOR v_emp_info IN emp_cursor(149) LOOP
                    DBMS_OUTPUT.PUT(v_emp_info.employee_id || ', ');
                    DBMS_OUTPUT.PUT_LINE(v_emp_info.last_name || ', ');                
          END LOOP;

END;
/



-- ���� 1
-- ���̺� ����(test01, test02)
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
          

-- 2015��(����) ���� �Ի� => test01
-- 2015�� ���� �Ի� => test02
DECLARE
          CURSOR emp_cursor IS
                    SELECT employee_id, last_name, hire_date
                    FROM employees;
                    
          emp_record emp_cursor%ROWTYPE;
BEGIN
          -- �⺻ LOOP
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
          
          -- Ŀ�� FOR LOOP
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



-- ���� 2
DECLARE
          CURSOR emp_cursor IS
                    SELECT last_name, hire_date, department_name
                    FROM employees e JOIN departments d
                    ON e.department_id = d.department_id
                    WHERE d.department_id = &�μ���ȣ;
          
          emp_record emp_cursor%ROWTYPE;
BEGIN
          OPEN emp_cursor;
          
          LOOP
                    FETCH emp_cursor INTO emp_record;
                    EXIT WHEN emp_cursor%NOTFOUND;
                    
                    DBMS_OUTPUT.PUT('����̸� : ' || emp_record.last_name);
                    DBMS_OUTPUT.PUT(', �Ի����� : ' || emp_record.hire_date);
                    DBMS_OUTPUT.PUT_LINE(', �μ��� : ' || emp_record.department_name);
          END LOOP;
          
          CLOSE emp_cursor;
END;
/

-- �Ű�����
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
                    DBMS_OUTPUT.PUT_LINE('========== ���� �μ� ���� : ' || dept_info.department_name || '==========');

                    OPEN emp_cursor(dept_info.department_id);
                    
                    LOOP
                              FETCH emp_cursor INTO emp_record;
                              EXIT WHEN emp_cursor%NOTFOUND;
                              
                              DBMS_OUTPUT.PUT('����̸� : ' || emp_record.last_name);
                              DBMS_OUTPUT.PUT(', �Ի����� : ' || emp_record.hire_date);
                              DBMS_OUTPUT.PUT_LINE(', �μ��� : ' || emp_record.department_name);
                    END LOOP;
                    
                    IF emp_cursor%ROWCOUNT = 0 THEN
                              DBMS_OUTPUT.PUT_LINE('���� �Ҽӵ� ����� �����ϴ�.');
                    END IF;
                    
                    CLOSE emp_cursor;
          END LOOP;
END;
/


-- ����ó��
-- 1) ����Ŭ ���� ����(�̸� ����)
-- EXCEPTION �ۼ� : WHEN ~ THEN

-- 2) ����Ŭ ���� ����(�̸� ������, �ڵ� ����)
-- DECLARE �ۼ�
--        : �̸� EXCEPTION;
--        PRAGMA EXCEPTION INIT(�̸�, �����ڵ�);
-- EXCEPTION �ۼ� : WHEN ~ THEN

-- 3) ����� ���� ����
-- DECLARE �ۼ� : �̸� EXCEPTION
-- BEGIN �ۼ� : RAISE �̸�
-- EXCEPTION �ۼ� : WHEN ~ THEN


-- 1) Oracle�� �����ϰ� �̸��� �����ϴ� ���
DECLARE
          v_ename employees.last_name%TYPE;
BEGIN
          SELECT last_name
          INTO v_ename
          FROM employees
          WHERE department_id = &�μ���ȣ;
          
          DBMS_OUTPUT.PUT_LINE(v_ename);
EXCEPTION
          WHEN TOO_MANY_ROWS THEN       -- PL/SQL ����� �ϳ��� ��� ����
                    DBMS_OUTPUT.PUT_LINE('�ش� �μ����� �������� ����� �����մϴ�.');
          WHEN NO_DATA_FOUND THEN
                    DBMS_OUTPUT.PUT_LINE('�ش� �μ��� �������� �ʽ��ϴ�.');
-- �ڵ� ������ ���� �̱���
--          WHEN OTHERS THEN
--                    DBMS_OUTPUT.PUT_LINE('��Ÿ ���ܰ� �߻��߽��ϴ�.');
--                    
--          DBMS_OUTPUT.PUT_LINE('EXCEPTION ���� ����Ǿ����ϴ�.');    -- OTHERS ����
END;
/



-- 2) Oracle�� �����ϰ� �̸��� �������� �ʴ� ���
DECLARE
          e_emps_remaining EXCEPTION;
          PRAGMA EXCEPTION_INIT(e_emps_remaining, -02292);
BEGIN
          DELETE FROM departments
          WHERE department_id = &�μ���ȣ;  -- ��������(FK), ������Ÿ�� (��, 0�� ������ ���� �ƴ�)
EXCEPTION
          WHEN e_emps_remaining THEN
                    DBMS_OUTPUT.PUT_LINE('�ٸ� ���̺��� ����ϰ� �ֽ��ϴ�.');
END;
/



-- 3) ����ڰ� �����ϴ� ���ܻ���
-- ����Ŭ ������ �ƴ����� �̿��ڿ��� �ȳ�
DECLARE
          e_emp_del_fail EXCEPTION;
BEGIN
          DELETE FROM test_employees
          WHERE employee_id = &�����ȣ;
          
          IF SQL%ROWCOUNT = 0 THEN
                    RAISE e_emp_del_fail;
          END IF;
EXCEPTION
          WHEN e_emp_del_fail THEN
                    DBMS_OUTPUT.PUT_LINE('�ش� ����� �������� �ʽ��ϴ�.');
END;
/



-- ���� Ʈ�� �Լ�(SQLCODE, SQLERRM)
DECLARE
    e_too_many EXCEPTION;
    
    v_ex_code NUMBER;
    v_ex_msg VARCHAR2(1000);
    emp_info employees%ROWTYPE;
BEGIN
    SELECT *
    INTO emp_info
    FROM employees
    WHERE department_id = &�μ���ȣ;
    
    IF emp_info.salary < (emp_info.salary * emp_info.commission_pct + 10000) THEN
        RAISE e_too_many;
    END IF;
EXCEPTION
    WHEN e_too_many THEN
        DBMS_OUTPUT.PUT_LINE('����� ���� ���� �߻�!');
    WHEN OTHERS THEN
        v_ex_code := SQLCODE;
        v_ex_msg := SQLERRM;
        DBMS_OUTPUT.PUT_LINE('ORA ' || v_ex_code);
        DBMS_OUTPUT.PUT_LINE(' - ' || v_ex_msg);
END;
/



-- 1) test_employees ���̺��� ����Ͽ� ���õ� ����� �����ϴ� PL/SQL �ۼ�
-- ���� 1) ġȯ���� ���
-- ���� 2) ����� �������� �ʴ� ���, '�ش� ����� �������� �ʽ��ϴ�.'��� �޼����� ���
-- => ����� ���� ���� Ȱ��

DECLARE
          e_no_data EXCEPTION;
BEGIN
          DELETE FROM test_employees
          WHERE employee_id = &�����ȣ;
          
          IF SQL%ROWCOUNT = 0 THEN
                    RAISE e_no_data;
          END IF;
EXCEPTION
          WHEN e_no_data THEN
                    DBMS_OUTPUT.PUT_LINE('�ش� ����� �������� �ʽ��ϴ�.');
END;
/



-- PROCEDURE
-- ġȯ���� ��� �� �� �����Ǿ� �̱���
-- ���� �� ���� �Ұ�, �� �ȿ��� ���� ����
CREATE PROCEDURE test_pro
IS
-- ����� : ���ο��� ����ϴ� ����, Ŀ��, Ÿ��, ���� ����
-- DECLARE �ܾ ����
          v_msg VARCHAR2(1000) := 'Excute Procedure';
BEGIN
          DELETE FROM test_employees
          WHERE department_id = 50;

          DBMS_OUTPUT.PUT_LINE(v_msg);
EXCEPTION
          WHEN INVALID_CURSOR THEN
                    DBMS_OUTPUT.PUT_LINE('����� �� ���� Ŀ���Դϴ�.');
END;
/


-- ���ν��� ���� 1)
BEGIN
          test_pro;
END;
/

--���ν��� ���� 2) ������ ���� �� ����
EXECUTE test_pro;



-- 1. ���ν��� �Ű����� (IN)
-- IN : PROCEDURE ���ο��� ����� �ν�
DROP PROCEDURE raise_salary;

CREATE PROCEDURE raise_salary
(p_eid IN employees.employee_id%TYPE)
IS

BEGIN
--          p_eid := 100;     -- �Է� �Ұ�
          
          UPDATE employees
          SET salary = salary * 1.1
          WHERE employee_id = p_eid;
END;
/


-- ���ν��� ���� �� �Ű����� ����
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



-- 2. ���ν��� �Ű����� (OUT)???????????????????
-- OUT : PROCEDURE ���ο��� �ʱ�ȭ���� ���� ����
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
          
          v_eid NUMBER := &�����ȣ;
BEGIN
          select_emp(v_eid, v_name, v_sal, v_comm);
          
          DBMS_OUTPUT.PUT('�����ȣ : ' || v_eid);
          DBMS_OUTPUT.PUT(', ����̸� : ' || v_name);
          DBMS_OUTPUT.PUT(', �޿� : ' || v_sal);
          DBMS_OUTPUT.PUT_LINE(', Ŀ�̼� : ' || v_comm);
END;
/



-- 3. ���ν��� �Ű����� (IN OUT)
-- IN OUT �Ű�����
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


-- �⺻Ű ���� ����(PLSQL ���� �ƴ�)
CREATE TABLE var_pk_tbl
(
          no VARCHAR2(1000) PRIMARY KEY,
          name VARCHAR2(4000) DEFAULT 'anony'
);

SELECT no, name
FROM var_pk_tbl;


-- ������ �ԷµǴ� �ڵ尪
-- 'TEMP240215101'  -- TEMP + yyMMdd + ����(3�ڸ�)
SELECT 'TEMP' || TO_CHAR(sysdate, 'yyMMdd') || LPAD(NVL(SUBSTR(no, -3)), 0) + 1, 3, '0')
FROM var_pk_tbl
WHERE SUBSTR(no, 5, 6) = TO_CHAR(sysdate, 'yyMMdd');



/*
1.
�ֹε�Ϲ�ȣ�� �Է��ϸ� 
������ ���� ��µǵ��� yedam_ju ���ν����� �ۼ��Ͻÿ�.

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
�����ȣ�� �Է��� ���
�����ϴ� TEST_PRO ���ν����� �����Ͻÿ�.
��, �ش����� ���� ��� "�ش����� �����ϴ�." ���
��) EXECUTE TEST_PRO(176)
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
                    DBMS_OUTPUT.PUT_LINE('�ش����� �����ϴ�.');
          
END;
/

EXECUTE TEST_PRO(100);



/*
3.
������ ���� PL/SQL ����� ������ ��� 
�����ȣ�� �Է��� ��� ����� �̸�(last_name)�� ù��° ���ڸ� �����ϰ��
'*'�� ��µǵ��� yedam_emp ���ν����� �����Ͻÿ�.

����) EXECUTE yedam_emp(176)
������) TAYLOR -> T*****  <- �̸� ũ�⸸ŭ ��ǥ(*) ���
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
�μ���ȣ�� �Է��� ��� 
�ش�μ��� �ٹ��ϴ� ����� �����ȣ, ����̸�(last_name)�� ����ϴ� get_emp ���ν����� �����Ͻÿ�. 
(cursor ����ؾ� ��)
��, ����� ���� ��� "�ش� �μ����� ����� �����ϴ�."��� ���(exception ���)
����) EXECUTE get_emp(30)
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
                    DBMS_OUTPUT.PUT_LINE('�ش� �μ����� ����� �����ϴ�.');
END;
/

EXECUTE get_emp(0);



/*
5.
�������� ���, �޿� ����ġ�� �Է��ϸ� Employees���̺� ���� ����� �޿��� ������ �� �ִ� y_update ���ν����� �ۼ��ϼ���. 
���� �Է��� ����� ���� ��쿡�� ��No search employee!!����� �޽����� ����ϼ���.(����ó��)
����) EXECUTE y_update(200, 10)
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