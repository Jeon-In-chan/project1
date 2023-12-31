--------------------------------------------------------
--  파일이 생성됨 - 금요일-9월-22-2023   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence ORDERS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "SCOTT"."ORDERS_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence PRODUCT_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "SCOTT"."PRODUCT_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 22 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SHOPPINGBASKET_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "SCOTT"."SHOPPINGBASKET_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table ADMIN
--------------------------------------------------------

  CREATE TABLE "SCOTT"."ADMIN" 
   (	"A_ID" VARCHAR2(20 BYTE), 
	"A_PW" VARCHAR2(100 BYTE), 
	"A_NAME" VARCHAR2(20 BYTE), 
	"A_P_NUMBER" VARCHAR2(20 BYTE), 
	"A_EMAIL" VARCHAR2(50 BYTE), 
	"A_AUTHORITY" VARCHAR2(20 BYTE), 
	"A_REGDATE" DATE DEFAULT SYSDATE, 
	"A_MODDATE" DATE DEFAULT SYSDATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table ORDERS
--------------------------------------------------------

  CREATE TABLE "SCOTT"."ORDERS" 
   (	"O_NO" NUMBER(10,0), 
	"O_ID" VARCHAR2(20 BYTE), 
	"O_REGDATE" DATE DEFAULT sysdate
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table PRODUCT
--------------------------------------------------------

  CREATE TABLE "SCOTT"."PRODUCT" 
   (	"P_NO" NUMBER(5,0), 
	"P_NAME" VARCHAR2(100 BYTE), 
	"P_TYPE" CHAR(1 BYTE), 
	"P_PRODUCER" VARCHAR2(50 BYTE), 
	"P_SIZE" NUMBER(3,0) DEFAULT 90, 
	"PRICE" NUMBER(7,0) DEFAULT 0, 
	"P_CONTENT" VARCHAR2(1000 BYTE) DEFAULT null, 
	"STOCK" NUMBER(7,0) DEFAULT 0, 
	"SALE" CHAR(1 BYTE) DEFAULT 'y', 
	"REGDATE" DATE DEFAULT SYSDATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table PRODUCTIMAGE
--------------------------------------------------------

  CREATE TABLE "SCOTT"."PRODUCTIMAGE" 
   (	"UUID" VARCHAR2(100 BYTE), 
	"UPLOADPATH" VARCHAR2(200 BYTE), 
	"FILENAME" VARCHAR2(100 BYTE), 
	"FILETYPE" CHAR(1 BYTE) DEFAULT 'I', 
	"P_NO" NUMBER(10,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table SHOPPINGBASKET
--------------------------------------------------------

  CREATE TABLE "SCOTT"."SHOPPINGBASKET" 
   (	"B_NO" NUMBER(5,0), 
	"U_ID" VARCHAR2(20 BYTE), 
	"P_NO" NUMBER(5,0), 
	"QUANTITY" NUMBER(5,0) DEFAULT 1, 
	"B_REGDATE" DATE DEFAULT sysdate
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table USERS
--------------------------------------------------------

  CREATE TABLE "SCOTT"."USERS" 
   (	"U_ID" VARCHAR2(20 BYTE), 
	"U_PW" VARCHAR2(100 BYTE), 
	"U_NAME" VARCHAR2(20 BYTE), 
	"U_P_NUMBER" VARCHAR2(20 BYTE), 
	"U_EMAIL" VARCHAR2(50 BYTE), 
	"U_ADDRESS" VARCHAR2(100 BYTE), 
	"U_REGDATE" DATE DEFAULT SYSDATE, 
	"U_MODDATE" DATE DEFAULT SYSDATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for View EMPIDX_OVER15K
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "SCOTT"."EMPIDX_OVER15K" ("EMPNO", "ENAME", "JOB", "DEPTNO", "SAL", "COMM") AS 
  (SELECT EMPNO, ENAME, JOB, DEPTNO, SAL, NVL2(COMM, 'O', 'X') COMM FROM EMPIDX WHERE SAL> 1500)
;
REM INSERTING into SCOTT.ADMIN
SET DEFINE OFF;
Insert into SCOTT.ADMIN (A_ID,A_PW,A_NAME,A_P_NUMBER,A_EMAIL,A_AUTHORITY,A_REGDATE,A_MODDATE) values ('admin0','pw0','admin0','010-000-0000','admon@gmail.com','admin',to_date('23/09/22','RR/MM/DD'),to_date('23/09/22','RR/MM/DD'));
REM INSERTING into SCOTT.ORDERS
SET DEFINE OFF;
Insert into SCOTT.ORDERS (O_NO,O_ID,O_REGDATE) values (1,'user0',to_date('23/09/22','RR/MM/DD'));
REM INSERTING into SCOTT.PRODUCT
SET DEFINE OFF;
Insert into SCOTT.PRODUCT (P_NO,P_NAME,P_TYPE,P_PRODUCER,P_SIZE,PRICE,P_CONTENT,STOCK,SALE,REGDATE) values (2,'와이셔츠(그레이)','1','모른',95,19800,'캐쥬얼한 와이셔츠',100,'y',to_date('23/09/22','RR/MM/DD'));
Insert into SCOTT.PRODUCT (P_NO,P_NAME,P_TYPE,P_PRODUCER,P_SIZE,PRICE,P_CONTENT,STOCK,SALE,REGDATE) values (1,'연습상품','1','나이키',100,19800,'연습 제품',30,'y',to_date('23/09/22','RR/MM/DD'));
REM INSERTING into SCOTT.PRODUCTIMAGE
SET DEFINE OFF;
REM INSERTING into SCOTT.SHOPPINGBASKET
SET DEFINE OFF;
Insert into SCOTT.SHOPPINGBASKET (B_NO,U_ID,P_NO,QUANTITY,B_REGDATE) values (2,'user0',1,10,to_date('23/09/22','RR/MM/DD'));
REM INSERTING into SCOTT.USERS
SET DEFINE OFF;
Insert into SCOTT.USERS (U_ID,U_PW,U_NAME,U_P_NUMBER,U_EMAIL,U_ADDRESS,U_REGDATE,U_MODDATE) values ('user0','pw0','user0','010-000-0000','user@gmail.com','서울 어딘가',to_date('23/09/22','RR/MM/DD'),to_date('23/09/22','RR/MM/DD'));
REM INSERTING into SCOTT.EMPIDX_OVER15K
SET DEFINE OFF;
--------------------------------------------------------
--  DDL for Index PK_IMAGE
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCOTT"."PK_IMAGE" ON "SCOTT"."PRODUCTIMAGE" ("UUID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C007360
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCOTT"."SYS_C007360" ON "SCOTT"."PRODUCT" ("P_NO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C007366
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCOTT"."SYS_C007366" ON "SCOTT"."USERS" ("U_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C007368
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCOTT"."SYS_C007368" ON "SCOTT"."SHOPPINGBASKET" ("B_NO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C007376
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCOTT"."SYS_C007376" ON "SCOTT"."ORDERS" ("O_NO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Procedure PRO_DEPT_IN
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "SCOTT"."PRO_DEPT_IN" 
(
out_deptno in out dept.deptno%type,
out_dname out  dept.dname%type,
out_loc out  dept.loc%type
)
is
begin
select deptno, dname, loc into out_deptno,out_dname,out_loc
from dept where deptno=out_deptno;
end;


/
--------------------------------------------------------
--  DDL for Procedure PRO_ERR
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "SCOTT"."PRO_ERR" 
IS
   err_no NUMBER;
BEGIN
   err_no = 100;
   DBMS_OUTPUT.PUT_LINE('err_no : ' || err_no);
END pro_err;


/
--------------------------------------------------------
--  DDL for Procedure PRO_PARAM_IN
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "SCOTT"."PRO_PARAM_IN" (
    PARAM1 IN NUMBER,
    PARAM2 NUMBER,
    PARAM3 NUMBER := 3,
    PARAM4 NUMBER DEFAULT 4
    )
    IS
BEGIN
   DBMS_OUTPUT.PUT_LINE('PARAM1 : ' || PARAM1);
   DBMS_OUTPUT.PUT_LINE('PARAM2 : ' || PARAM2);
   DBMS_OUTPUT.PUT_LINE('PARAM3 : ' || PARAM3);
   DBMS_OUTPUT.PUT_LINE('PARAM4 : ' || PARAM4);
END;


/
--------------------------------------------------------
--  DDL for Procedure PRO_PARAM_INOUT
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "SCOTT"."PRO_PARAM_INOUT" 
(
   inout_no IN OUT NUMBER
)
IS

BEGIN
   inout_no := inout_no * 2;
END;


/
--------------------------------------------------------
--  DDL for Procedure PRO_PARAM_OUT
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "SCOTT"."PRO_PARAM_OUT" 
(
   in_empno IN EMP.EMPNO%TYPE,
   out_ename OUT EMP.ENAME%TYPE,
   out_sal OUT EMP.SAL%TYPE
)
IS

BEGIN
   SELECT ENAME, SAL INTO out_ename, out_sal
     FROM EMP
    WHERE EMPNO = in_empno;
END pro_param_out;


/
--------------------------------------------------------
--  DDL for Package PKG_OVERLOAD
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "SCOTT"."PKG_OVERLOAD" 
    IS
        PROCEDURE PRO_EMP(IN_EMPNO IN EMP.EMPNO%TYPE);
        PROCEDURE PRO_EMP(IN_ENAME IN EMP.ENAME%TYPE);
END;


/
--------------------------------------------------------
--  DDL for Function FUNC_AFTERTAX
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "SCOTT"."FUNC_AFTERTAX" (
    SAL IN NUMBER
    )
    RETURN NUMBER
    IS
        TAX NUMBER := 0.05;
BEGIN
    RETURN (ROUND(SAL-(SAL*TAX)));
END /*FUNC_AFTERTAX*/;


/
--------------------------------------------------------
--  DDL for Function FUNC_DATE_KOR
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "SCOTT"."FUNC_DATE_KOR" (
hiredate in date
)
return varchar2
is
begin
 return to_char(hiredate, 'yyyy"년"mm"월"dd"일"');
end;


/
--------------------------------------------------------
--  Constraints for Table ADMIN
--------------------------------------------------------

  ALTER TABLE "SCOTT"."ADMIN" MODIFY ("A_AUTHORITY" NOT NULL ENABLE);
  ALTER TABLE "SCOTT"."ADMIN" MODIFY ("A_EMAIL" NOT NULL ENABLE);
  ALTER TABLE "SCOTT"."ADMIN" MODIFY ("A_P_NUMBER" NOT NULL ENABLE);
  ALTER TABLE "SCOTT"."ADMIN" MODIFY ("A_NAME" NOT NULL ENABLE);
  ALTER TABLE "SCOTT"."ADMIN" MODIFY ("A_PW" NOT NULL ENABLE);
  ALTER TABLE "SCOTT"."ADMIN" MODIFY ("A_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ORDERS
--------------------------------------------------------

  ALTER TABLE "SCOTT"."ORDERS" ADD PRIMARY KEY ("O_NO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table PRODUCT
--------------------------------------------------------

  ALTER TABLE "SCOTT"."PRODUCT" ADD PRIMARY KEY ("P_NO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SCOTT"."PRODUCT" MODIFY ("P_PRODUCER" NOT NULL ENABLE);
  ALTER TABLE "SCOTT"."PRODUCT" MODIFY ("P_NAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PRODUCTIMAGE
--------------------------------------------------------

  ALTER TABLE "SCOTT"."PRODUCTIMAGE" ADD CONSTRAINT "PK_IMAGE" PRIMARY KEY ("UUID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SCOTT"."PRODUCTIMAGE" MODIFY ("FILENAME" NOT NULL ENABLE);
  ALTER TABLE "SCOTT"."PRODUCTIMAGE" MODIFY ("UPLOADPATH" NOT NULL ENABLE);
  ALTER TABLE "SCOTT"."PRODUCTIMAGE" MODIFY ("UUID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SHOPPINGBASKET
--------------------------------------------------------

  ALTER TABLE "SCOTT"."SHOPPINGBASKET" ADD PRIMARY KEY ("B_NO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SCOTT"."SHOPPINGBASKET" MODIFY ("U_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table USERS
--------------------------------------------------------

  ALTER TABLE "SCOTT"."USERS" ADD PRIMARY KEY ("U_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SCOTT"."USERS" MODIFY ("U_ADDRESS" NOT NULL ENABLE);
  ALTER TABLE "SCOTT"."USERS" MODIFY ("U_EMAIL" NOT NULL ENABLE);
  ALTER TABLE "SCOTT"."USERS" MODIFY ("U_P_NUMBER" NOT NULL ENABLE);
  ALTER TABLE "SCOTT"."USERS" MODIFY ("U_NAME" NOT NULL ENABLE);
  ALTER TABLE "SCOTT"."USERS" MODIFY ("U_PW" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table ORDERS
--------------------------------------------------------

  ALTER TABLE "SCOTT"."ORDERS" ADD CONSTRAINT "FK_ORDER_ID" FOREIGN KEY ("O_ID")
	  REFERENCES "SCOTT"."USERS" ("U_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PRODUCTIMAGE
--------------------------------------------------------

  ALTER TABLE "SCOTT"."PRODUCTIMAGE" ADD CONSTRAINT "FK_PRODUCT_IMAGE" FOREIGN KEY ("P_NO")
	  REFERENCES "SCOTT"."PRODUCT" ("P_NO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table SHOPPINGBASKET
--------------------------------------------------------

  ALTER TABLE "SCOTT"."SHOPPINGBASKET" ADD CONSTRAINT "FK_PRODUCT_NO" FOREIGN KEY ("P_NO")
	  REFERENCES "SCOTT"."PRODUCT" ("P_NO") ENABLE;
  ALTER TABLE "SCOTT"."SHOPPINGBASKET" ADD CONSTRAINT "FK_USER_ID" FOREIGN KEY ("U_ID")
	  REFERENCES "SCOTT"."USERS" ("U_ID") ENABLE;
