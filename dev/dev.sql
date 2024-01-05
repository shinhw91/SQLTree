SELECT *
FROM tab;

CREATE TABLE student (
               student_no     VARCHAR2 (10) PRIMARY KEY,
               student_name   VARCHAR2 (100) NOT NULL,
               eng            NUMBER DEFAULT 80,
               math           NUMBER DEFAULT 70);
               
-- 등록
INSERT INTO student (student_no, student_name, eng, math)
VALUES ('23-001', '홍길동', 70, 75);
INSERT INTO student (student_no, student_name)
VALUES ('23-007', '김민수');

SELECT *
FROM student;

-- 수정
UPDATE student
SET eng = 85, math = 75
WHERE student_no = '23-002';

-- 삭제
DELETE FROM student
WHERE student_no = '23-002';

DELETE FROM student
WHERE student_name = '';

-- 단건조회
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
               
-- 등록
INSERT INTO book
VALUES ('A-001', '책001', '저자001', '출판사001', 1000);
INSERT INTO book
VALUES ('A-002', '책002', '저자002', '출판사002', 2000);
INSERT INTO book
VALUES ('A-003', '책003', '저자003', '출판사003', 3000);

SELECT *
FROM book;

-- 수정
UPDATE book
SET price = 10000
WHERE book_code = 'A-001';

-- 삭제
DELETE FROM book
WHERE book_code = 'A-001';

DELETE FROM book
WHERE book_name = '';

-- 단건조회
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
VALUES (board_seq.nextval, '첫번째 글', '홍길동', 'JSP 너무 어려워요');
INSERT INTO board (board_no, title, writer, content)
VALUES (board_seq.nextval, '오늘은 금요일', '김박사', '불코딩');
INSERT INTO board (board_no, title, writer, content)
VALUES (board_seq.nextval, '우리반 화이팅', '김막내', '열심히 공부해요');

select * from board order by 1;

select * from tab;

create table member (
               id varchar2 (20) primary key,
               pw varchar2 (10) not null,
               name varchar2 (100) not null,
               responsibility varchar2 (10) default 'User'  -- Admin / User
);

insert into member values ('user1', '1111', '홍길동', 'User');
insert into member values ('user2', '2222', '김철수', 'User');
insert into member values ('user3', '3333', '관리자', 'Admin');
commit;

create table product (
 product_code char(8) primary key, -- P2023-01
 product_name varchar2(100) not null,
 product_desc varchar2(300) not null,
 origin_price number not null,
 sale_price number,
 like_it number default 3, --추천수
 image varchar2(35)
);

insert into product values('P2023-01', '과테말라 원두', '과테말라산 원두입니다.', 5000, 4500, 5, '과테말라.jpg');
insert into product values('P2023-02', '니카라구아 더치', '니카라구아 더치 맛있는 커피입니다.', 5500, 4500, 3, '니카라구아 더치.jpg');
insert into product values('P2023-03', '브라질산토스', '브라질산토스 맛있는 커피입니다.', 6000, 5000, 5, '브라질산토스.jpg');
insert into product values('P2023-04', '에티오피아 예가체프', '에티오피아 예가체프 맛있는 커피입니다.', 4000, 3500, 2, '에티오피아 예가체프.jpg');
insert into product values('P2023-05', '케냐 오크라톡신', '케냐 오크라톡신 맛있는 커피입니다.', 4500, 3000, 4, '케냐 오크라톡신.jpg');
insert into product values('P2023-06', '코스타리카 따라주', '코스타리카 따라주 맛있는 커피입니다.', 3000, 2500, 5, '코스타리카 따라주.jpg');

select *
from product;

drop table product;

commit;

-- 댓글(댓글번호, 게시글번호, 내용, 작성자, 작성일시)
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

insert into reply values(reply_seq.nextval, 1, '헷갈려요1', 'uesr1', '2023-01-05');
insert into reply values(reply_seq.nextval, 1, '헷갈려요2', 'uesr2', '2023-01-06');
insert into reply values(reply_seq.nextval, 1, '헷갈려요3', 'uesr3', '2023-01-07');
insert into reply values(reply_seq.nextval, 2, '헷갈려요4', 'uesr1', '2023-01-05');
insert into reply values(reply_seq.nextval, 2, '헷갈려요5', 'uesr2', '2023-01-06');
insert into reply values(reply_seq.nextval, 2, '헷갈려요6', 'uesr3', '2023-01-07');
insert into reply values(reply_seq.nextval, 3, '헷갈려요7', 'uesr1', '2023-01-05');
insert into reply values(reply_seq.nextval, 3, '헷갈려요8', 'uesr2', '2023-01-06');
insert into reply values(reply_seq.nextval, 3, '헷갈려요9', 'uesr3', '2023-01-07');

select * from reply where board_no = 1;
select * from reply where board_no = 2;
select * from reply where board_no = 3;

commit;

-- 댓글 페이징
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