--------------------------------------------------------
--  File created - Thursday-October-18-2018   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table EMPLOYEESHUBHAM
--------------------------------------------------------

  CREATE TABLE "TRAINING"."EMPLOYEESHUBHAM" 
   (	"ENAME" VARCHAR2(20 BYTE), 
	"EID" NUMBER(10,0), 
	"PASSWORD" VARCHAR2(20 BYTE), 
	"USERNAME" VARCHAR2(20 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "TRAINING" ;
REM INSERTING into TRAINING.EMPLOYEESHUBHAM
SET DEFINE OFF;
Insert into TRAINING.EMPLOYEESHUBHAM (ENAME,EID,PASSWORD,USERNAME) values ('Shubham',101,'water','shubham');
Insert into TRAINING.EMPLOYEESHUBHAM (ENAME,EID,PASSWORD,USERNAME) values ('Ayush',102,'ayush','ayush');
--------------------------------------------------------
--  DDL for Index SYS_C0094835
--------------------------------------------------------

  CREATE UNIQUE INDEX "TRAINING"."SYS_C0094835" ON "TRAINING"."EMPLOYEESHUBHAM" ("EID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "TRAINING" ;
--------------------------------------------------------
--  Constraints for Table EMPLOYEESHUBHAM
--------------------------------------------------------

  ALTER TABLE "TRAINING"."EMPLOYEESHUBHAM" ADD PRIMARY KEY ("EID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "TRAINING"  ENABLE;
