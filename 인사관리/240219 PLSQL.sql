SET SERVEROUTPUT ON

-- �� ���� : ~ �Լ�����

-- FUNCTION
CREATE FUNCTION test_fun
(p_msg IN VARCHAR2)
RETURN VARCHAR2
IS
          -- �����
BEGIN
          RETURN p_msg;
EXCEPTION
          WHEN NO_DATA_FOUND THEN
                    RETURN '�����Ͱ� �������� �ʽ��ϴ�.';
                    
END;
/



-- FUNCTION ������ (1)
-- ������ ���� �� ���� �ʿ�
DECLARE
          v_result VARCHAR2(1000);
BEGIN
          v_result := test_fun('�׽�Ʈ');
          DBMS_OUTPUT.PUT_LINE(v_result);
END;
/

-- ��ü ���� Ȯ��
SELECT *
FROM user_source
WHERE type IN ('PROCEDURE');



-- FUNCTION ������ (2) : ������ ���� Ȯ��
SELECT test_fun('SELECT������ ȣ��')
FROM dual;

-- ���ϱ�
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



-- FUNCTION Ȱ��
-- �����ȣ�� �������� ���ӻ�� �̸��� ���
-- *�������� ����!
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
                    RETURN '���� ��簡 �������� �ʽ��ϴ�.';   -- ������Ÿ�� ��ġ �ʿ�
END;
/

SELECT employee_id, last_name, get_mgr(employee_id) as manager
FROM employees;



/*

1.
�����ȣ�� �Է��ϸ� 
last_name + first_name �� ��µǴ� 
y_yedam �Լ��� �����Ͻÿ�.

����) EXECUTE DBMS_OUTPUT.PUT_LINE(y_yedam(174))
��� ��)  Abel Ellen

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

EXECUTE DBMS_OUTPUT.PUT_LINE(y_yedam(174));       -- FUNCTION ������ (3) : ���ν��� Ȱ��

SELECT employee_id, y_yedam(employee_id)
FROM   employees;



/*
2.
�����ȣ�� �Է��� ��� ���� ������ �����ϴ� ����� ��µǴ� ydinc �Լ��� �����Ͻÿ�.
- �޿��� 5000 �����̸� 20% �λ�� �޿� ���
- �޿��� 10000 �����̸� 15% �λ�� �޿� ���
- �޿��� 20000 �����̸� 10% �λ�� �޿� ���
- �޿��� 20000 �̻��̸� �޿� �״�� ���
����) SELECT last_name, salary, YDINC(employee_id)
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
          
          -- 2) salary�� ���� ������ �ٸ��� ����
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


-- SELECT + CASE��
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
�����ȣ�� �Է��ϸ� �ش� ����� ������ ��µǴ� yd_func �Լ��� �����Ͻÿ�.
->������� : (�޿�+(�޿�*�μ�Ƽ���ۼ�Ʈ))*12
����) SELECT last_name, salary, YD_FUNC(employee_id)
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
������ ���� ��µǴ� subname �Լ��� �ۼ��Ͻÿ�.
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