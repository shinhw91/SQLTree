SET SERVEROUTPUT ON

DECLARE
          v_deptno departments.department_id%TYPE;
          v_comm employees.commission_pct%TYPE := .1;
BEGIN
          SELECT department_id
          INTO v_deptno
          FROM employees
          WHERE employee_id = &�����ȣ;
          
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
          
          -- ���� �ֱ��� SQL�� ����          
          IF SQL%ROWCOUNT = 0 THEN
                    DBMS_OUTPUT.PUT_LINE('���������� �������� �ʾҽ��ϴ�.');
          END IF;
END;
/


-- 1��
-- SQL�� �ۼ� -> PL/SQL �ۼ�
SELECT e.employee_id, e.last_name, d.department_name
FROM employees e JOIN departments d
          ON e.department_id = d.department_id
WHERE employee_id = &�����ȣ;

-- (��1) PL/SQL ��� �ۼ�(BEGIN -> DECLARE) : ����
DECLARE
          v_eid employees.employee_id%TYPE;
          v_ename employees.last_name%TYPE;
          v_deptname departments.department_name%TYPE;
BEGIN
          SELECT e.employee_id, e.last_name, d.department_name
          INTO v_eid, v_ename, v_deptname
          FROM employees e JOIN departments d
                    ON e.department_id = d.department_id
          WHERE employee_id = &�����ȣ;
          
           DBMS_OUTPUT.PUT_LINE('�����ȣ : ' || v_eid);
           DBMS_OUTPUT.PUT_LINE('����̸� : ' || v_ename);
           DBMS_OUTPUT.PUT_LINE('�μ� : ' || v_deptname);

END;
/

-- (��2) PL/SQL ��� �ۼ�(BEGIN -> DECLARE) : �̱���
DECLARE
          v_eid employees.employee_id%TYPE;
          v_ename employees.last_name%TYPE;
          v_deptid departments.department_id%TYPE;
          v_deptname departments.department_name%TYPE;
BEGIN
          -- JOIN �и�(1)                    
          SELECT employee_id, last_name, department_id
          INTO v_eid, v_ename, v_deptid
          FROM employees
          WHERE employee_id = &�����ȣ;
          
          -- JOIN �и�(2)                    
          SELECT department_name
          INTO v_deptname
          FROM departments
          WHERE department_id = v_deptid;
          
           DBMS_OUTPUT.PUT_LINE('�����ȣ : ' || v_eid);
           DBMS_OUTPUT.PUT_LINE('����̸� : ' || v_ename);
           DBMS_OUTPUT.PUT_LINE('�μ� : ' || v_deptname);

END;
/




-- 2��
SELECT last_name, salary, salary * 12 + (NVL(salary, 0) * NVL(commission_pct, 0) * 12) income
FROM employees
WHERE employee_id = &�����ȣ;

-- (��1) PL/SQL ��� �ۼ� : ����
DECLARE
          v_ename employees.last_name%TYPE;
          v_salary employees.salary%TYPE;
          v_income v_salary%TYPE;
BEGIN
          SELECT last_name, salary, salary * 12 + (NVL(salary, 0) * NVL(commission_pct, 0) * 12) income
          INTO v_ename, v_salary, v_income
          FROM employees
          WHERE employee_id = &�����ȣ;
          
          DBMS_OUTPUT.PUT_LINE('����̸� : ' || v_ename);
          DBMS_OUTPUT.PUT_LINE('�޿� : ' || v_salary);
          DBMS_OUTPUT.PUT_LINE('���� : ' || v_income);
END;
/

-- (��2) PL/SQL ��� �ۼ� : �̱���
DECLARE
          v_ename employees.last_name%TYPE;
          v_salary employees.salary%TYPE;
          v_income v_salary%TYPE;
          v_comm v_salary%TYPE;
BEGIN
          SELECT last_name, salary, commission_pct
          INTO v_ename, v_salary, v_comm
          FROM employees
          WHERE employee_id = &�����ȣ;
          
          v_income := (v_salary * 12 + (NVL(v_salary, 0) * NVL(v_comm, 0) * 12));
                    
          DBMS_OUTPUT.PUT_LINE('����̸� : ' || v_ename);
          DBMS_OUTPUT.PUT_LINE('�޿� : ' || v_salary);
          DBMS_OUTPUT.PUT_LINE('���� : ' || v_income);
END;
/


-- ���̺� ����(NULL�� ���� �������� ����)
CREATE TABLE test_employees
AS
          SELECT *
          FROM employees;
          
SELECT *
FROM test_employees
WHERE employee_id = 149;

-- �⺻ IF��
BEGIN
          DELETE FROM test_employees
          WHERE employee_id = &�����ȣ;
          
          IF SQL%ROWCOUNT = 0 THEN
                    DBMS_OUTPUT.PUT_LINE('���������� �������� �ʾҽ��ϴ�.');
                    DBMS_OUTPUT.PUT_LINE('�����ȣ�� Ȯ�����ּ���.');
          END IF;
END;
/



-- IF ~ ELSE�� : �ϳ��� ���ǽ�, ����� ���� ���� ����
DECLARE
          v_result NUMBER(4, 0);
BEGIN
          SELECT COUNT(employee_id)     -- NULL ����
          INTO v_result
          FROM employees
          WHERE manager_id = &�����ȣ;
          
          IF v_result  = 0 THEN
                    DBMS_OUTPUT.PUT_LINE('�Ϲ� ����Դϴ�.');
          ELSE
                    DBMS_OUTPUT.PUT_LINE('�����ڱ��Դϴ�.');
          END IF;
END;
/

SELECT employee_id
FROM employees
WHERE manager_id = 100;



-- IF ~ ELSIF ~ ELSE�� : ���� ���ǽ��� �ʿ�, ���� ���ó��
-- ������ ���ϴ� ����(�Ҽ��� ����)
SELECT employee_id, TRUNC (MONTHS_BETWEEN (sysdate, hire_date)/12)
FROM employees;

DECLARE
          v_hyear NUMBER(2, 0);
BEGIN
          SELECT TRUNC (MONTHS_BETWEEN (sysdate, hire_date)/12)
          INTO v_hyear
          FROM employees
          WHERE employee_id = &�����ȣ;
          
          IF v_hyear < 5 THEN
                    DBMS_OUTPUT.PUT_LINE('�Ի��� �� 5�� �̸��Դϴ�.');
          ELSIF v_hyear < 10 THEN
                    DBMS_OUTPUT.PUT_LINE('�Ի��� �� 5�� �̻� 10�� �̸��Դϴ�.');
          ELSIF v_hyear < 15 THEN
                    DBMS_OUTPUT.PUT_LINE('�Ի��� �� 10�� �̻� 15�� �̸��Դϴ�.');
          ELSIF v_hyear < 20 THEN
                    DBMS_OUTPUT.PUT_LINE('�Ի��� �� 15�� �̻� 20�� �̸��Դϴ�.');
          ELSE
                    DBMS_OUTPUT.PUT_LINE('�Ի��� �� 20�� �̻��Դϴ�.');
          END IF;
END;
/



-- 3-1��
--SELECT employee_id, TO_CHAR(hire_date, 'YYYY')
SELECT hire_date
FROM employees
WHERE employee_id = &�����ȣ;

DECLARE
          v_date employees.hire_date%TYPE;
BEGIN
          SELECT hire_date
          INTO v_date
          FROM employees
          WHERE employee_id = &�����ȣ;
          
--          IF TO_CHAR(v_date, 'YYYY') >= 2015 THEN
          IF v_date >= TO_DATE('2015-01-01', 'YYYY-MM-dd') THEN
                    DBMS_OUTPUT.PUT_LINE('New employee');
          ELSE
                    DBMS_OUTPUT.PUT_LINE('Career employee');
          END IF;
END;
/



-- ���ڸ� �Է� �� rr(1900���), yy(2000���)
SELECT TO_CHAR(TO_DATE('99/01/01', 'rr/MM/dd'), 'yyyy-MM-dd'),
          TO_CHAR(TO_DATE('99/01/01', 'yy/MM/dd'), 'yyyy-MM-dd')
FROM dual;



-- 3-2��
DECLARE
          v_date employees.hire_date%TYPE;
--          v_result VARCHAR2(100);
          v_result VARCHAR2(100) := 'Career employee';
BEGIN
          SELECT hire_date
          INTO v_date
          FROM employees
          WHERE employee_id = &�����ȣ;
          
          IF TO_CHAR(v_date, 'YYYY') >= 2015 THEN
                    v_result := 'New employee';
--          ELSE
--                    v_result := 'Career employee';
          END IF;
          
          DBMS_OUTPUT.PUT_LINE(v_result);
END;
/



-- 5��
SELECT last_name, salary
FROM employees
WHERE employee_id = &�����ȣ;

DECLARE
          v_ename employees.last_name%TYPE;
          v_salary employees.salary%TYPE;
          v_point NUMBER(4, 0);
          v_result v_salary%TYPE;
BEGIN
          SELECT last_name, salary
          INTO v_ename, v_salary
          FROM employees
          WHERE employee_id = &�����ȣ;
          
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
          
          DBMS_OUTPUT.PUT_LINE('����̸� : ' || v_ename);
          DBMS_OUTPUT.PUT_LINE('�޿� : ' || v_salary);
          DBMS_OUTPUT.PUT_LINE('�λ�� �޿� : ' || v_result);
END;
/

SELECT employee_id, salary
FROM employees;



-- �⺻ LOOP��
DECLARE
          v_num NUMBER(38) := 0;
BEGIN
          LOOP
                    v_num := v_num + 1;
                    DBMS_OUTPUT.PUT_LINE(v_num);
                    EXIT WHEN v_num > 10;         -- ��������
          END LOOP;
END;
/



-- WHILE LOOP��
DECLARE
          v_num NUMBER(38, 0) := 10;
BEGIN
          WHILE v_num < 5 LOOP          -- �ݺ�����
                    DBMS_OUTPUT.PUT_LINE(v_num);
                    v_num := v_num + 1;
          END LOOP;

END;
/



-- ���� 1 : 1���� 10���� �������� ��
-- 1) �⺻ LOOP
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



-- ���ǻ��� 1. ��������
-- 1) ���� : �ּҰ� -> �ִ밪
-- 2) �������� : REVERSE
BEGIN
          FOR idx IN REVERSE -10 .. 5 LOOP
                    IF MOD(idx, 2) <> 0 THEN
                              DBMS_OUTPUT.PUT_LINE(idx);
                    END IF;
          END LOOP;
END;
/



-- ���ǻ��� 2. ī����(counter)
-- ī���� �� ���� �Ұ�(���κ���, READONLY)
-- DECLARE ������� �ٸ��� ���� ����
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



-- ���� 1 : 1���� 10���� �������� ��
-- 3) FOR LOOP
DECLARE
          -- ������ : 1 ~ 10 => FOR LOOP ī���ͷ� ó��
          -- �հ�
          v_total NUMBER(2, 0) := 0;
BEGIN
          FOR num IN 1 .. 10 LOOP
                    v_total := v_total + num;
          END LOOP;
          DBMS_OUTPUT.PUT_LINE(v_total);
END;
/


-- ���� 1. ������ ���� ��µǵ��� �Ͻÿ�
-- *
-- **
-- ***
-- ****
-- *****
-- 1) �⺻ LOOP
DECLARE
          v_num NUMBER(2, 0) := 1;
          v_star VARCHAR2(100) := '';   -- NULL �ʱⰪ �̱���(���� �Ұ�)
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

-- ���� FOR LOOP
BEGIN
          FOR counter IN 1 .. 5 LOOP    -- ���° ��
                    FOR i IN 1 .. counter LOOP
                              DBMS_OUTPUT.PUT('*');         -- �ܵ���� �Ұ�(PUT_LINE �ʿ�)
                    END LOOP;
                    DBMS_OUTPUT.PUT_LINE('');
          END LOOP;
END;
/



















