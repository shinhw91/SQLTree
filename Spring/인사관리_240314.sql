--------------------------------------------------------
--  파일이 생성됨 - 목요일-3월-14-2024   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table BOARD
--------------------------------------------------------

  CREATE TABLE "BOARD" 
   (	"BOARD_NO" NUMBER, 
	"TITLE" VARCHAR2(100), 
	"CONTENT" VARCHAR2(500), 
	"WRITER" VARCHAR2(50), 
	"WRITE_DATE" DATE DEFAULT SYSDATE, 
	"CLICK_CNT" NUMBER DEFAULT 0, 
	"IMAGE" VARCHAR2(100)
   ) ;
REM INSERTING into BOARD
SET DEFINE OFF;
Insert into BOARD (BOARD_NO,TITLE,CONTENT,WRITER,WRITE_DATE,CLICK_CNT,IMAGE) values (41,'첫번째 글','JSP 너무 어려워요','홍길동',to_date('24/01/08','RR/MM/DD'),0,null);
Insert into BOARD (BOARD_NO,TITLE,CONTENT,WRITER,WRITE_DATE,CLICK_CNT,IMAGE) values (42,'오늘은 금요일','불코딩','김박사',to_date('24/01/08','RR/MM/DD'),1,null);
Insert into BOARD (BOARD_NO,TITLE,CONTENT,WRITER,WRITE_DATE,CLICK_CNT,IMAGE) values (43,'우리반 화이팅','열심히 공부해요','김막내',to_date('24/01/08','RR/MM/DD'),0,null);
Insert into BOARD (BOARD_NO,TITLE,CONTENT,WRITER,WRITE_DATE,CLICK_CNT,IMAGE) values (1,'첫번째 글','ㅠㅠ','홍길동',to_date('23/12/22','RR/MM/DD'),560,null);
Insert into BOARD (BOARD_NO,TITLE,CONTENT,WRITER,WRITE_DATE,CLICK_CNT,IMAGE) values (2,'오늘은 금요일','불코딩','김박사',to_date('23/12/22','RR/MM/DD'),29,null);
Insert into BOARD (BOARD_NO,TITLE,CONTENT,WRITER,WRITE_DATE,CLICK_CNT,IMAGE) values (3,'우리반 화이팅','cccccccccccc','김막내',to_date('23/12/22','RR/MM/DD'),12,null);
Insert into BOARD (BOARD_NO,TITLE,CONTENT,WRITER,WRITE_DATE,CLICK_CNT,IMAGE) values (61,'첫번째 글','JSP 너무 어려워요','홍길동',to_date('24/01/15','RR/MM/DD'),0,null);
Insert into BOARD (BOARD_NO,TITLE,CONTENT,WRITER,WRITE_DATE,CLICK_CNT,IMAGE) values (62,'오늘은 금요일','불코딩','김박사',to_date('24/01/15','RR/MM/DD'),0,null);
Insert into BOARD (BOARD_NO,TITLE,CONTENT,WRITER,WRITE_DATE,CLICK_CNT,IMAGE) values (63,'우리반 화이팅','열심히 공부해요','김막내',to_date('24/01/15','RR/MM/DD'),0,null);
Insert into BOARD (BOARD_NO,TITLE,CONTENT,WRITER,WRITE_DATE,CLICK_CNT,IMAGE) values (81,'첫번째 글','JSP 너무 어려워요','홍길동',to_date('24/01/15','RR/MM/DD'),0,null);
Insert into BOARD (BOARD_NO,TITLE,CONTENT,WRITER,WRITE_DATE,CLICK_CNT,IMAGE) values (82,'오늘은 금요일','불코딩','김박사',to_date('24/01/15','RR/MM/DD'),0,null);
Insert into BOARD (BOARD_NO,TITLE,CONTENT,WRITER,WRITE_DATE,CLICK_CNT,IMAGE) values (83,'우리반 화이팅','열심히 공부해요','김막내',to_date('24/01/15','RR/MM/DD'),0,null);
Insert into BOARD (BOARD_NO,TITLE,CONTENT,WRITER,WRITE_DATE,CLICK_CNT,IMAGE) values (16,'dd','ddd','홍길동',to_date('23/12/27','RR/MM/DD'),13,'사과6.jpg');
Insert into BOARD (BOARD_NO,TITLE,CONTENT,WRITER,WRITE_DATE,CLICK_CNT,IMAGE) values (8,'추가확인','추가됩니다','추가자',to_date('23/12/22','RR/MM/DD'),8,null);
Insert into BOARD (BOARD_NO,TITLE,CONTENT,WRITER,WRITE_DATE,CLICK_CNT,IMAGE) values (10,'테스트','입력내용','홍길동',to_date('23/12/26','RR/MM/DD'),3,null);
Insert into BOARD (BOARD_NO,TITLE,CONTENT,WRITER,WRITE_DATE,CLICK_CNT,IMAGE) values (13,'집에 보내주세요','냉무','홍길동',to_date('23/12/27','RR/MM/DD'),6,null);
Insert into BOARD (BOARD_NO,TITLE,CONTENT,WRITER,WRITE_DATE,CLICK_CNT,IMAGE) values (9,'추가확인','추가됩니다','추가자',to_date('23/12/22','RR/MM/DD'),5,null);
Insert into BOARD (BOARD_NO,TITLE,CONTENT,WRITER,WRITE_DATE,CLICK_CNT,IMAGE) values (12,'aa','aaaaa','홍길동',to_date('23/12/26','RR/MM/DD'),1,null);
Insert into BOARD (BOARD_NO,TITLE,CONTENT,WRITER,WRITE_DATE,CLICK_CNT,IMAGE) values (14,'김철수가 썼어요','ㅎㅎ','김철수',to_date('23/12/27','RR/MM/DD'),43,null);
Insert into BOARD (BOARD_NO,TITLE,CONTENT,WRITER,WRITE_DATE,CLICK_CNT,IMAGE) values (21,'첫번째 글','JSP 너무 어려워요','홍길동',to_date('24/01/05','RR/MM/DD'),0,null);
Insert into BOARD (BOARD_NO,TITLE,CONTENT,WRITER,WRITE_DATE,CLICK_CNT,IMAGE) values (22,'오늘은 금요일','불코딩','김박사',to_date('24/01/05','RR/MM/DD'),1,null);
Insert into BOARD (BOARD_NO,TITLE,CONTENT,WRITER,WRITE_DATE,CLICK_CNT,IMAGE) values (23,'우리반 화이팅','열심히 공부해요','김막내',to_date('24/01/05','RR/MM/DD'),0,null);
--------------------------------------------------------
--  DDL for Index SYS_C007199
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C007199" ON "BOARD" ("BOARD_NO") 
  ;
--------------------------------------------------------
--  Constraints for Table BOARD
--------------------------------------------------------

  ALTER TABLE "BOARD" ADD PRIMARY KEY ("BOARD_NO") ENABLE;
  ALTER TABLE "BOARD" MODIFY ("WRITER" NOT NULL ENABLE);
  ALTER TABLE "BOARD" MODIFY ("CONTENT" NOT NULL ENABLE);
  ALTER TABLE "BOARD" MODIFY ("TITLE" NOT NULL ENABLE);

commit;

alter table employees add photo varchar2(100);