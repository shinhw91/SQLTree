-- 6��
--DROP TABLE employee;
--DROP TABLE department;

CREATE TABLE department (
               deptid         NUMBER(10)     PRIMARY KEY,
               deptname       VARCHAR2(10),
               location       VARCHAR2(10),
               tel            VARCHAR2(15));
               
DESC department;

-- (��1) FK �߰�

CREATE TABLE employee (
               empid          NUMBER(10)     PRIMARY KEY,
               empname        VARCHAR2(10),
               hiredate       DATE,
               addr           VARCHAR2(12),
               tel            VARCHAR(15),
               deptid         NUMBER(10)     REFERENCES     department (deptid));

-- (��2) FK �߰�
CREATE TABLE employee (
               empid          NUMBER(10)     PRIMARY KEY,
               empname        VARCHAR2(10),
               hiredate       DATE,
               addr           VARCHAR2(12),
               tel            VARCHAR(15),
               deptid NUMBER(10),
               CONSTRAINT     emp_dept_deptid_FK            FOREIGN KEY (deptid)
               REFERENCES     department (deptid));
               
DESC employee;




-- 7��
ALTER TABLE employee ADD birthday DATE;
-- MODIFY, DROP
-- ���������� ���� �Ұ�(��, NOT NULL�� MODIFY ����)




-- 8��
INSERT INTO department VALUES (1001, '�ѹ���', '��101ȣ', '053-777-8777');
INSERT INTO department VALUES (1002, 'ȸ����', '��102ȣ', '053-888-9999');
INSERT INTO department VALUES (1003, '������', '��103ȣ', '053-222-3333');

SELECT * FROM department;

INSERT INTO employee (empid, empname, hiredate, addr, tel, deptid)
VALUES (20121945, '�ڹμ�', '20120302', '�뱸', '010-1111-1234', 1001);
INSERT INTO employee (empid, empname, hiredate, addr, tel, deptid)
VALUES (20101812, '���ؽ�', '20100901', '���', '010-2222-1234', 1003);
INSERT INTO employee (empid, empname, hiredate, addr, tel, deptid)
VALUES (20122245, '���ƶ�', '20120302', '�뱸', '010-3333-1222', 1002);
INSERT INTO employee (empid, empname, hiredate, addr, tel, deptid)
VALUES (20121729, '�̹���', '20110302', '����', '010-3333-4444', 1001);
INSERT INTO employee (empid, empname, hiredate, addr, tel, deptid)
VALUES (20121646, '������', '20120901', '�λ�', '010-1234-2222', 1003);
-- TO_DATE('12/03/02', 'YY/MM/DD') ��� ����

SELECT * FROM employee;




-- 9��
ALTER TABLE employee MODIFY empname NOT NULL;
-- ������ ���� NULL�� ���� ���, NOT NULL �������� �߰� �Ұ�




-- 10��
-- ����Ŭ ����
SELECT e.empname, e.hiredate, d.deptname
FROM department d, employee e
WHERE d.deptid = e.deptid
AND d.deptname = '�ѹ���';

-- ANSI ����
SELECT empname, hiredate, deptname
FROM employee
JOIN department USING (deptid)
WHERE deptname = '�ѹ���';

SELECT e.empname, e.hiredate, d.deptname
FROM employee e
               INNER JOIN department d
               ON (e.deptid = d.deptid)
WHERE d.deptname = '�ѹ���';
-- (INNER) JOIN : ������
-- OUTER JOIN : NULL�� ����(LEFT, RIGHT, FULL ����)




-- 11��
DELETE FROM employee
WHERE addr='�뱸';




-- 12��
UPDATE employee
SET deptid = (SELECT deptid
                              FROM department
                              WHERE deptname='ȸ����')
WHERE deptid = (SELECT deptid
                              FROM department
                              WHERE deptname='������');




-- 13��
SELECT e.empid,  e.empname, e.birthday, d.deptname
FROM employee e
               INNER JOIN department d
               ON (e.deptid = d.deptid)
WHERE e.hiredate > (SELECT hiredate
                              FROM employee
                              WHERE empid = 20121729);
                              
                              
                              
                              
-- 14��
-- ������ ���� �ο� �ʿ�
GRANT CREATE VIEW TO dev;

--DROP VIEW emp_vu;

--CREATE OR REPLACE VIEW emp_vu
CREATE VIEW emp_vu
AS
               SELECT e.empname,
                              e.addr,
                              d.deptname
               FROM employee e
                              JOIN department d
                              ON (d.deptid = e.deptid)
               WHERE d.deptname = '�ѹ���';

SELECT * FROM emp_vu;




-- ����¡ ó��