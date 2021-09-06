 CREATE TABLE "MVCBOARD" (	
    "IDX" NUMBER(*,0) NOT NULL, 
	"NAME" CHAR(20 BYTE) NOT NULL, 
	"SUBJECT" VARCHAR2(200 BYTE) NOT NULL, 
	"CONTENT" VARCHAR2(2000 BYTE) NOT NULL, 
	"REF" NUMBER(*,0), 
	"LEV" NUMBER(*,0), 
	"SEQ" NUMBER(*,0), 
	"HIT" NUMBER(*,0) DEFAULT 0, 
	"WRITEDATE" TIMESTAMP (6) DEFAULT sysdate, 
	 CONSTRAINT "MVCBOARD_PK" PRIMARY KEY ("IDX")
);

delete from mvcboard;
drop sequence mvcboard_idx_seq;
create sequence mvcboard_idx_seq;
commit;

select * from mvcboard;
select count(*) from mvcboard;
select * from mvcboard order by ref desc, seq asc

insert into mvcboard (idx, name, subject, content, ref, lev, seq)
		values (mvcboard_idx_seq.nextval, 'ȫ�浿', '1��', '1���Դϴ�', mvcboard_idx_seq.currval, 0, 0);
insert into mvcboard (idx, name, subject, content, ref, lev, seq)
		values (mvcboard_idx_seq.nextval, '�Ӳ���', '2��', '2���Դϴ�', mvcboard_idx_seq.currval, 0, 0);
insert into mvcboard (idx, name, subject, content, ref, lev, seq)
		values (mvcboard_idx_seq.nextval, '����', '3��', '3���Դϴ�', mvcboard_idx_seq.currval, 0, 0);
insert into mvcboard (idx, name, subject, content, ref, lev, seq)
		values (mvcboard_idx_seq.nextval, '������', '4��', '4���Դϴ�', mvcboard_idx_seq.currval, 0, 0);