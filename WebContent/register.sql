CREATE TABLE "REGISTER" (
    "USERID" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"USERPASSWORD" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"USERNAME" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"USERAGE" NUMBER(*,0) NOT NULL ENABLE, 
	"USERGENDER" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"USEREMAIL" VARCHAR2(50 BYTE) NOT NULL ENABLE, 
	 CONSTRAINT "REGISTER_PK" PRIMARY KEY ("USERID")
 );
 
 delete from register;
 commit;
 
 select * from register;
 