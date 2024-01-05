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

select * from tab;

create table member (
               id varchar2 (20) primary key,
               pw varchar2 (10) not null,
               name varchar2 (100) not null,
               responsibility varchar2 (10) default 'User'  -- Admin / User
);

insert into member values ('user1', '1111', 'ȫ�浿', 'User');
insert into member values ('user2', '2222', '��ö��', 'User');
insert into member values ('user3', '3333', '������', 'Admin');
commit;

create table product (
 product_code char(8) primary key, -- P2023-01
 product_name varchar2(100) not null,
 product_desc varchar2(300) not null,
 origin_price number not null,
 sale_price number,
 like_it number default 3, --��õ��
 image varchar2(35)
);

insert into product values('P2023-01', '���׸��� ����', '���׸���� �����Դϴ�.', 5000, 4500, 5, '���׸���.jpg');
insert into product values('P2023-02', '��ī�󱸾� ��ġ', '��ī�󱸾� ��ġ ���ִ� Ŀ���Դϴ�.', 5500, 4500, 3, '��ī�󱸾� ��ġ.jpg');
insert into product values('P2023-03', '��������佺', '��������佺 ���ִ� Ŀ���Դϴ�.', 6000, 5000, 5, '��������佺.jpg');
insert into product values('P2023-04', '��Ƽ���Ǿ� ����ü��', '��Ƽ���Ǿ� ����ü�� ���ִ� Ŀ���Դϴ�.', 4000, 3500, 2, '��Ƽ���Ǿ� ����ü��.jpg');
insert into product values('P2023-05', '�ɳ� ��ũ�����', '�ɳ� ��ũ����� ���ִ� Ŀ���Դϴ�.', 4500, 3000, 4, '�ɳ� ��ũ�����.jpg');
insert into product values('P2023-06', '�ڽ�Ÿ��ī ������', '�ڽ�Ÿ��ī ������ ���ִ� Ŀ���Դϴ�.', 3000, 2500, 5, '�ڽ�Ÿ��ī ������.jpg');

select *
from product;

drop table product;

commit;

-- ���(��۹�ȣ, �Խñ۹�ȣ, ����, �ۼ���, �ۼ��Ͻ�)
create table reply (
               reply_no number primary key,
               board_no number not null,
               reply varchar2 (100) not null,
               replyer varchar2 (30) not null,
               reply_date date default sysdate
);

create sequence reply_seq;
select * from reply;

drop table reply;
drop sequence reply_seq;

insert into reply values(reply_seq.nextval, 1, '�򰥷���1', 'uesr1', '2023-01-05');
insert into reply values(reply_seq.nextval, 1, '�򰥷���2', 'uesr2', '2023-01-06');
insert into reply values(reply_seq.nextval, 1, '�򰥷���3', 'uesr3', '2023-01-07');
insert into reply values(reply_seq.nextval, 2, '�򰥷���4', 'uesr1', '2023-01-05');
insert into reply values(reply_seq.nextval, 2, '�򰥷���5', 'uesr2', '2023-01-06');
insert into reply values(reply_seq.nextval, 2, '�򰥷���6', 'uesr3', '2023-01-07');
insert into reply values(reply_seq.nextval, 3, '�򰥷���7', 'uesr1', '2023-01-05');
insert into reply values(reply_seq.nextval, 3, '�򰥷���8', 'uesr2', '2023-01-06');
insert into reply values(reply_seq.nextval, 3, '�򰥷���9', 'uesr3', '2023-01-07');

select * from reply where board_no = 1;
select * from reply where board_no = 2;
select * from reply where board_no = 3;

commit;

-- ��� ����¡
select b. * from
(select rownum rn, a. * from
(select r.*, m.name name
from reply r
join member m
on r.replyer = m.id
where board_no = 1
order by 1
) a ) b
--where b.rn > (1-1)*5 and b.rn <=  1*5;
where b.rn > (2-1)*5 and b.rn <=  2*5;