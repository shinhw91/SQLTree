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