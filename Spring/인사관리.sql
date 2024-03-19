--------------------------------------------------------
--  ?????? ?????? - ?????-3??-14-2024   
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
Insert into BOARD (BOARD_NO,TITLE,CONTENT,WRITER,WRITE_DATE,CLICK_CNT,IMAGE) values (41,'???¡Æ ??','JSP ??? ???????','??øª',to_date('24/01/08','RR/MM/DD'),0,null);
Insert into BOARD (BOARD_NO,TITLE,CONTENT,WRITER,WRITE_DATE,CLICK_CNT,IMAGE) values (42,'?????? ?????','?????','????',to_date('24/01/08','RR/MM/DD'),1,null);
Insert into BOARD (BOARD_NO,TITLE,CONTENT,WRITER,WRITE_DATE,CLICK_CNT,IMAGE) values (43,'?¯C?? ?????','?????? ???????','????',to_date('24/01/08','RR/MM/DD'),0,null);
Insert into BOARD (BOARD_NO,TITLE,CONTENT,WRITER,WRITE_DATE,CLICK_CNT,IMAGE) values (1,'???¡Æ ??','?¬¶?','??øª',to_date('23/12/22','RR/MM/DD'),560,null);
Insert into BOARD (BOARD_NO,TITLE,CONTENT,WRITER,WRITE_DATE,CLICK_CNT,IMAGE) values (2,'?????? ?????','?????','????',to_date('23/12/22','RR/MM/DD'),29,null);
Insert into BOARD (BOARD_NO,TITLE,CONTENT,WRITER,WRITE_DATE,CLICK_CNT,IMAGE) values (3,'?¯C?? ?????','cccccccccccc','????',to_date('23/12/22','RR/MM/DD'),12,null);
Insert into BOARD (BOARD_NO,TITLE,CONTENT,WRITER,WRITE_DATE,CLICK_CNT,IMAGE) values (61,'???¡Æ ??','JSP ??? ???????','??øª',to_date('24/01/15','RR/MM/DD'),0,null);
Insert into BOARD (BOARD_NO,TITLE,CONTENT,WRITER,WRITE_DATE,CLICK_CNT,IMAGE) values (62,'?????? ?????','?????','????',to_date('24/01/15','RR/MM/DD'),0,null);
Insert into BOARD (BOARD_NO,TITLE,CONTENT,WRITER,WRITE_DATE,CLICK_CNT,IMAGE) values (63,'?¯C?? ?????','?????? ???????','????',to_date('24/01/15','RR/MM/DD'),0,null);
Insert into BOARD (BOARD_NO,TITLE,CONTENT,WRITER,WRITE_DATE,CLICK_CNT,IMAGE) values (81,'???¡Æ ??','JSP ??? ???????','??øª',to_date('24/01/15','RR/MM/DD'),0,null);
Insert into BOARD (BOARD_NO,TITLE,CONTENT,WRITER,WRITE_DATE,CLICK_CNT,IMAGE) values (82,'?????? ?????','?????','????',to_date('24/01/15','RR/MM/DD'),0,null);
Insert into BOARD (BOARD_NO,TITLE,CONTENT,WRITER,WRITE_DATE,CLICK_CNT,IMAGE) values (83,'?¯C?? ?????','?????? ???????','????',to_date('24/01/15','RR/MM/DD'),0,null);
Insert into BOARD (BOARD_NO,TITLE,CONTENT,WRITER,WRITE_DATE,CLICK_CNT,IMAGE) values (16,'dd','ddd','??øª',to_date('23/12/27','RR/MM/DD'),13,'???6.jpg');
Insert into BOARD (BOARD_NO,TITLE,CONTENT,WRITER,WRITE_DATE,CLICK_CNT,IMAGE) values (8,'??????','???????','?????',to_date('23/12/22','RR/MM/DD'),8,null);
Insert into BOARD (BOARD_NO,TITLE,CONTENT,WRITER,WRITE_DATE,CLICK_CNT,IMAGE) values (10,'????','??©ø???','??øª',to_date('23/12/26','RR/MM/DD'),3,null);
Insert into BOARD (BOARD_NO,TITLE,CONTENT,WRITER,WRITE_DATE,CLICK_CNT,IMAGE) values (13,'???? ?????????','???','??øª',to_date('23/12/27','RR/MM/DD'),6,null);
Insert into BOARD (BOARD_NO,TITLE,CONTENT,WRITER,WRITE_DATE,CLICK_CNT,IMAGE) values (9,'??????','???????','?????',to_date('23/12/22','RR/MM/DD'),5,null);
Insert into BOARD (BOARD_NO,TITLE,CONTENT,WRITER,WRITE_DATE,CLICK_CNT,IMAGE) values (12,'aa','aaaaa','??øª',to_date('23/12/26','RR/MM/DD'),1,null);
Insert into BOARD (BOARD_NO,TITLE,CONTENT,WRITER,WRITE_DATE,CLICK_CNT,IMAGE) values (14,'??????? ????','????','?????',to_date('23/12/27','RR/MM/DD'),43,null);
Insert into BOARD (BOARD_NO,TITLE,CONTENT,WRITER,WRITE_DATE,CLICK_CNT,IMAGE) values (21,'???¡Æ ??','JSP ??? ???????','??øª',to_date('24/01/05','RR/MM/DD'),0,null);
Insert into BOARD (BOARD_NO,TITLE,CONTENT,WRITER,WRITE_DATE,CLICK_CNT,IMAGE) values (22,'?????? ?????','?????','????',to_date('24/01/05','RR/MM/DD'),1,null);
Insert into BOARD (BOARD_NO,TITLE,CONTENT,WRITER,WRITE_DATE,CLICK_CNT,IMAGE) values (23,'?¯C?? ?????','?????? ???????','????',to_date('24/01/05','RR/MM/DD'),0,null);
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