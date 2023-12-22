SELECT *
FROM tab;

CREATE TABLE student (
               student_no     VARCHAR2 (10) PRIMARY KEY,
               student_name   VARCHAR2 (100) NOT NULL,
               eng            NUMBER DEFAULT 80,
               math           NUMBER DEFAULT 70);
               
-- ���
INSERT INTO student (student_no, student_name, eng, math)
VALUES ('23-001', 'ȫ�浿', 70, 75);
INSERT INTO student (student_no, student_name)
VALUES ('23-007', '��μ�');

SELECT *
FROM student;

-- ����
UPDATE student
SET eng = 85, math = 75
WHERE student_no = '23-002';

-- ����
DELETE FROM student
WHERE student_no = '23-002';

DELETE FROM student
WHERE student_name = '';

-- �ܰ���ȸ
SELECT *
FROM student
WHERE student_no = '23-002';

COMMIT;

CREATE TABLE book (
               book_code      VARCHAR2 (10) PRIMARY KEY,
               book_name      VARCHAR2 (100) NOT NULL,
               writer         VARCHAR2 (100),
               publisher       VARCHAR2 (100),
               price          NUMBER DEFAULT 1000);
               
-- ���
INSERT INTO book
VALUES ('A-001', 'å001', '����001', '���ǻ�001', 1000);
INSERT INTO book
VALUES ('A-002', 'å002', '����002', '���ǻ�002', 2000);
INSERT INTO book
VALUES ('A-003', 'å003', '����003', '���ǻ�003', 3000);

SELECT *
FROM book;

-- ����
UPDATE book
SET price = 10000
WHERE book_code = 'A-001';

-- ����
DELETE FROM book
WHERE book_code = 'A-001';

DELETE FROM book
WHERE book_name = '';

-- �ܰ���ȸ
SELECT *
FROM book
WHERE book_code = 'A-002';

COMMIT;


CREATE TABLE board (
               board_no       NUMBER PRIMARY KEY,
               title          VARCHAR2 (100) NOT NULL,
               content        VARCHAR2 (500) NOT NULL,
               writer         VARCHAR2 (50) NOT NULL,
               write_date     DATE DEFAULT SYSDATE,
               click_cnt      NUMBER DEFAULT 0,
               image          VARCHAR2 (100)
);

CREATE SEQUENCE board_seq;

INSERT INTO board (board_no, title, writer, content)
VALUES (board_seq.nextval, 'ù��° ��', 'ȫ�浿', 'JSP �ʹ� �������');
INSERT INTO board (board_no, title, writer, content)
VALUES (board_seq.nextval, '������ �ݿ���', '��ڻ�', '���ڵ�');
INSERT INTO board (board_no, title, writer, content)
VALUES (board_seq.nextval, '�츮�� ȭ����', '�踷��', '������ �����ؿ�');

select * from board order by 1;