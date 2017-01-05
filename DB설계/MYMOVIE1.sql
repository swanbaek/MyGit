/* system�������� ������ ��
alter session set "_oracle_script"=true;

create user mymovie identified by tiger;

grant connect,resource,create 
, create synonym to mymovie;

alter user mymovie quota unlimited on users;
*/

--�帣
ALTER TABLE MOVIE_GENGRE
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

DROP INDEX PK_MOVIE_GENGRE;

/* �帣 */
DROP TABLE MOVIE_GENRE 
	CASCADE CONSTRAINTS;

/* �帣 */
CREATE TABLE MOVIE_GENRE (
	genrecode NUMBER(8) NOT NULL, /* �帣�ڵ� */
	genrename VARCHAR2(15) NOT NULL /* �帣�� */
);
CREATE UNIQUE INDEX PK_MOVIE_GENRE
	ON MOVIE_GENRE (
		genrecode ASC
	);
ALTER TABLE MOVIE_GENRE
	ADD
		CONSTRAINT PK_MOVIE_GENGRE
		PRIMARY KEY (
			genrecode
		);

CREATE SEQUENCE MOVIE_GENRE_CODE_SEQ NOCACHE;
INSERT INTO MOVIE_GENRE VALUES(MOVIE_GENRE_CODE_SEQ.NEXTVAL,
'�ִϸ��̼�');

commit;

select * from movie_genre;
-------------------------------------------------------------------
ALTER TABLE MOVIE_GRADE
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

DROP INDEX PK_MOVIE_GRADE;

/* ��� */
DROP TABLE MOVIE_GRADE 
	CASCADE CONSTRAINTS;

/* ��� */
CREATE TABLE MOVIE_GRADE (
	gradecode NUMBER(8) NOT NULL, /* ����ڵ� */
	gradename VARCHAR2(20), /* ��޸� */
	gradeimage VARCHAR2(50) /* ����̹��� */
);

CREATE UNIQUE INDEX PK_MOVIE_GRADE
	ON MOVIE_GRADE (
		gradecode ASC
	);

ALTER TABLE MOVIE_GRADE
	ADD
		CONSTRAINT PK_MOVIE_GRADE
		PRIMARY KEY (
			gradecode
		);

CREATE SEQUENCE MOVIE_GRADE_CODE_SEQ  NOCACHE;


INSERT INTO MOVIE_GRADE
VALUES(MOVIE_GRADE_CODE_SEQ.NEXTVAL,
'0','allgrade.png');
INSERT INTO MOVIE_GRADE
VALUES(MOVIE_GRADE_CODE_SEQ.NEXTVAL,
'12','12grade.png');
INSERT INTO MOVIE_GRADE
VALUES(MOVIE_GRADE_CODE_SEQ.NEXTVAL,
'15','15grade.png');

INSERT INTO MOVIE_GRADE
VALUES(MOVIE_GRADE_CODE_SEQ.NEXTVAL,
'19','19grade.png');

commit;

select * from movie_grade;
-------------------------------------------------------------------
--MOVIE (��ȭ )
ALTER TABLE MOVIE_FILM
	DROP
		CONSTRAINT FK_MOVIE_GENRE_TO_MOVIE_FILM
		CASCADE;

ALTER TABLE MOVIE_FILM
	DROP
		CONSTRAINT FK_MOVIE_GRADE_TO_MOVIE_FILM
		CASCADE;

ALTER TABLE MOVIE_FILM
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

DROP INDEX PK_MOVIE_FILM;

/* ��ȭ */
DROP TABLE MOVIE_FILM 
	CASCADE CONSTRAINTS;

/* ��ȭ */
CREATE TABLE MOVIE_FILM (
	movie_code NUMBER(8) NOT NULL, /* ��ȭ�ڵ� */
	movie_title VARCHAR2(100), /* ��ȭ���� */
  subtitle varchar2(100),/*��ȭ �ο� ���� ����*/
	genrecode NUMBER(8), /* �帣�ڵ� */
	gradecode NUMBER(8), /* ����ڵ� */
	director VARCHAR2(30), /* ��ȭ���� */
	story VARCHAR2(2000), /* �ٰŸ� */
	runtime NUMBER, /* �󿵽ð� */
	opendate DATE, /* ������ */
	poster1 VARCHAR2(50), /* ������1 */
	poster2 VARCHAR2(50), /* ������2 */
	actor VARCHAR2(50), /* �ֿ���� */
	producer VARCHAR2(50), /* ���ۻ� */
	makeYear char(4), /* ���۳⵵ */
	makeCountry VARCHAR2(30), /* ���۱��� */
	supplier VARCHAR2(50), /* ���޾�ü */
	release_status NUMBER, /* ��ȭ�������±��� */
	movie_site VARCHAR2(50), /* ��ȭ���Ļ���Ʈ */
  rate number(5,2) default 0.0
);

CREATE UNIQUE INDEX PK_MOVIE_FILM
	ON MOVIE_FILM (
		movie_code ASC
	);

ALTER TABLE MOVIE_FILM
	ADD
		CONSTRAINT PK_MOVIE_FILM
		PRIMARY KEY (
			movie_code
		);

ALTER TABLE MOVIE_FILM
	ADD
		CONSTRAINT FK_MOVIE_GENRE_TO_MOVIE_FILM
		FOREIGN KEY (
			genrecode
		)
		REFERENCES MOVIE_GENRE (
			genrecode
		);

ALTER TABLE MOVIE_FILM
	ADD
		CONSTRAINT FK_MOVIE_GRADE_TO_MOVIE_FILM
		FOREIGN KEY (
			gradecode
		)
		REFERENCES MOVIE_GRADE (
			gradecode
		);
    
create sequence movie_film_code nocache;
insert into movie_film values(
movie_film_code.nextval,'��� �ű� �־� �ٷ���','��մ� ��ȭ',2,2,'ȫ����','��վ��',
111,'2016-12-12','you1.png','you2.png','������','A���ۻ�','2016',
'���ѹα�','������޻�',1,'http://��Űű��־��ٷ���.kr',1);

select * from movie_genre;
select * from movie_grade;

insert into movie_film values(
movie_film_code.nextval,'��-Sing','���� ������� ���۵ȴ�.',7,1,'������','���� ������� ���۵ȴ�.',
106,'2016-12-21','sing1.png','sing2.png','ĳ����','B���ۻ�','2016',
'�̱�','�ٶ��޻�',1,'http://sing.co.kr',1);

insert into movie_film values(
movie_film_code.nextval,'������','�Ѱ� �ѱ�� ���� ���',7,1,'������','\"���� �Ӹ� �̹��� �� �� �߶󳽴�\"

ȭ���� ��, ����� ��Ȥ�ϴ� ���, �����踦 �ѳ���� �θ�����
���� �� ȸ���鿡�� ��⸦ ġ�� �½��屸�� �� ����Ʈ��ũ ����ȸ�塯(�̺���).
�ݳⰣ �׸� ������ �� ���ɹ��˼������� �������(������)�� ��ȸ���� �������� �����屺��(����)�� �й��Ѵ�. ����Ʈ��ũ ����� ��ġ�� ��ȸ���� �κ� ��θ� �ѱ��� ��. �پ ���α׷��� �Ƿ°� ���� �γ��� ����Ʈ��ũ�� Ű�� �� �극�� ���屺�� ��ȹ�� ������ ���� ���� �������� ������ �Ӹ��� ������ �����Ѵ�.
��ȸ���� ���� ���� �ڿ� ���� �Ƿ±��� ������ ��� ���� �������� �������� ���, ������ �� ��ȸ�� ƴŸ ���� ì��� ������ �йڿ����� ��� ��ȹ�� ����� �屺. ������ ��ȸ���� ���� �߿� ����ڰ� ������ ��ġä��, ���ο� �÷��� �����ϴµ���
.',
143,'2016-12-21','master1.png','master2.png','�̺���','C���ۻ�','2016',
'���ѹα�','���ٹ�޻�',1,'http://master.co.kr',1.2);

commit;
    
------------------------------------------------------------------    
--�帣�� ��� movie_film���̺��� �����Ͽ� ���� �� ����
create or replace view movieView
as
select mf.*, mg.genrename, gr.gradename, gr.gradeimage
from movie_genre mg join movie_film mf
on mg.genrecode= mf.genrecode
join movie_grade gr 
on mf.gradecode =gr.gradecode;

select * from movieView;
--------------------------------------------------------------------------
--����(��ȭ�� ����) ���̺�
ALTER TABLE LOC
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

DROP INDEX PK_LOC;

/* ���� */
DROP TABLE LOC 
	CASCADE CONSTRAINTS;

/* ���� */
CREATE TABLE LOC (
	loc_code NUMBER NOT NULL, /* �����ڵ� */
	loc_name VARCHAR2(50) NOT NULL /* ������ */
);

CREATE UNIQUE INDEX PK_LOC
	ON LOC (
		loc_code ASC
	);

ALTER TABLE LOC
	ADD
		CONSTRAINT PK_LOC
		PRIMARY KEY (
			loc_code
		);
CREATE SEQUENCE LOC_CODE_SEQ NOCACHE;

INSERT INTO LOC VALUES(LOC_CODE_SEQ.NEXTVAL,'����');
INSERT INTO LOC VALUES(LOC_CODE_SEQ.NEXTVAL,'��⵵');
INSERT INTO LOC VALUES(LOC_CODE_SEQ.NEXTVAL,'��û/����');

--------------------------------------------------------------
--����
ALTER TABLE THEATER
	DROP
		CONSTRAINT FK_LOC_TO_THEATER
		CASCADE;

ALTER TABLE THEATER
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

DROP INDEX PK_THEATER;

/* �󿵰� */
DROP TABLE THEATER 
	CASCADE CONSTRAINTS;

/* �󿵰� */
CREATE TABLE THEATER (
	theater_code NUMBER NOT NULL, /* �󿵰��ڵ� */
	theater_name VARCHAR2(50) NOT NULL, /* �󿵰��� */
	theater_seatTotal NUMBER, /* �¼��� */
	theater_addr VARCHAR2(100), /* ��ġ */
	loc_code NUMBER /* �����ڵ� */
);

CREATE UNIQUE INDEX PK_THEATER
	ON THEATER (
		theater_code ASC
	);

ALTER TABLE THEATER
	ADD
		CONSTRAINT PK_THEATER
		PRIMARY KEY (
			theater_code
		);

ALTER TABLE THEATER
	ADD
		CONSTRAINT FK_LOC_TO_THEATER
		FOREIGN KEY (
			loc_code
		)
		REFERENCES LOC (
			loc_code
		);

CREATE SEQUENCE THEATER_CODE_SEQ NOCACHE;    
    
INSERT INTO THEATER
VALUES(THEATER_CODE_SEQ.NEXTVAL,'���������',100,'���� ���α� ��������д��� 1����',1);
INSERT INTO THEATER
VALUES(THEATER_CODE_SEQ.NEXTVAL,'����',200,'���� ������ 1����',1);
INSERT INTO THEATER
VALUES(THEATER_CODE_SEQ.NEXTVAL,'�Ǵ��Ա�',300,'���� ������ ������ 1����',1);
INSERT INTO THEATER
VALUES(THEATER_CODE_SEQ.NEXTVAL,'ȫ���Ա�',200,'���� ������ ������ 1����',1);

INSERT INTO THEATER
VALUES(THEATER_CODE_SEQ.NEXTVAL,'�˴�',200,'��⵵ ��õ�� 1����',2);

INSERT INTO THEATER
VALUES(THEATER_CODE_SEQ.NEXTVAL,'����(��ȭ��)',250,'�������ҽ� ������ȭ�� 1����',3);
INSERT INTO THEATER
VALUES(THEATER_CODE_SEQ.NEXTVAL,'����',150,'��û�� ���� 1����',3);


select * from loc;

select a.*,(select count(*) from theater where loc_code=a.loc_code) cnt  from loc a

--------------------------------------------------------------------------------
--�� ������
ALTER TABLE SCHEDULE
	DROP
		CONSTRAINT FK_MOVIE_FILM_TO_SCHEDULE
		CASCADE;

ALTER TABLE SCHEDULE
	DROP
		CONSTRAINT FK_THEATER_TO_SCHEDULE
		CASCADE;

ALTER TABLE SCHEDULE
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

DROP INDEX PK_SCHEDULE;

/* �󿵽����� */
DROP TABLE SCHEDULE 
	CASCADE CONSTRAINTS;

/* �󿵽����� */
CREATE TABLE SCHEDULE (
	sche_num NUMBER NOT NULL, /* �����ٹ�ȣ */
	sche_date DATE, /* �����ٳ�¥ */
	movie_code NUMBER(8), /* ��ȭ�ڵ� */
	theater_code NUMBER /* �󿵰��ڵ� */
);

CREATE UNIQUE INDEX PK_SCHEDULE
	ON SCHEDULE (
		sche_num ASC
	);

ALTER TABLE SCHEDULE
	ADD
		CONSTRAINT PK_SCHEDULE
		PRIMARY KEY (
			sche_num
		);

ALTER TABLE SCHEDULE
	ADD
		CONSTRAINT FK_MOVIE_FILM_TO_SCHEDULE
		FOREIGN KEY (
			movie_code
		)
		REFERENCES MOVIE_FILM (
			movie_code
		);

ALTER TABLE SCHEDULE
	ADD
		CONSTRAINT FK_THEATER_TO_SCHEDULE
		FOREIGN KEY (
			theater_code
		)
		REFERENCES THEATER (
			theater_code
		);
    
create sequence sche_num_seq nocache;    
insert into schedule 
values(sche_num_seq.nextval,sysdate,4,6);

select a.movie_title, 
(select gradeimage from movie_grade where gradecode=a.gradecode) 
gradeimage,b.theater_code
from movie_film a join schedule b
on a.movie_code=b.movie_code and b.theater_code=1;
--------------------------------------------------------
--�󿵽ð� (runtime)
ALTER TABLE RUNTIME
	DROP
		CONSTRAINT FK_SCHEDULE_TO_RUNTIME
		CASCADE;

ALTER TABLE RUNTIME
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

DROP INDEX PK_RUNTIME;

/* �󿵽ð� */
DROP TABLE RUNTIME 
	CASCADE CONSTRAINTS;

/* �󿵽ð� */
CREATE TABLE RUNTIME (
	run_code NUMBER(8) NOT NULL, /* �󿵽ð��ڵ� */
	run_startTime timestamp, /* �󿵽��۽ð� */
	run_endTime timestamp, /* �������ð� */
	run_num NUMBER, /* ��ȸ�� */
	sche_num NUMBER /* �����ٹ�ȣ */
);

drop sequence runtime_run_code_seq;
create sequence runtime_run_code_seq nocache;


CREATE UNIQUE INDEX PK_RUNTIME
	ON RUNTIME (
		run_code ASC
	);

ALTER TABLE RUNTIME
	ADD
		CONSTRAINT PK_RUNTIME
		PRIMARY KEY (
			run_code
		);

ALTER TABLE RUNTIME
	ADD
		CONSTRAINT FK_SCHEDULE_TO_RUNTIME
		FOREIGN KEY (
			sche_num
		)
		REFERENCES SCHEDULE (
			sche_num
		);

insert into runtime
values(runtime_run_code_seq.nextval,
to_date('09:30','HH:MI'),to_date('11:00','hh:mi'),1,6);

insert into runtime
values(runtime_run_code_seq.nextval,
to_date('11:40','HH24:MI'),to_date('13:00','hh24:mi'),2,7);

insert into runtime
values(runtime_run_code_seq.nextval,
to_date('13:40','HH24:MI'),to_date('15:00','hh24:mi'),3,2);
insert into runtime
values(runtime_run_code_seq.nextval,
to_date('15:40','HH24:MI'),to_date('17:00','hh24:mi'),4,2);

commit;



insert into runtime
values(runtime_run_code_seq.nextval,
to_date('09:00','HH:MI'),to_date('11:00','hh:mi'),1,1);
---------------
select a.movie_title, 
(select gradeimage from movie_grade where gradecode=a.gradecode) 
gradeimage,b.theater_code, c.* 
from movie_film a join schedule b
on a.movie_code=b.movie_code join runtime c
on b.sche_num=c.sche_num where b.theater_code=1;
-------------------
--���ż� ��ȭ���� ��������
select a.*, 
(select gradeimage from movie_grade where gradecode=a.gradecode) gradeimage
from movie_film a order by rate desc;
/*==============================    */
select a.movie_code, a.movie_title,
(select loc_name from loc where loc_code= c.loc_code)
from movie_film a
 join schedule b
on a.movie_code = b.movie_code
join theater c
on b.theater_code= c.theater_code
and a.movie_code=1;


select distinct a.movie_code, a.movie_title,d.*
--(select loc_name from loc where loc_code= c.loc_code) loc_name, c.loc_code
from movie_film a
 join schedule b
on a.movie_code = b.movie_code
join theater c
on b.theater_code= c.theater_code
join loc d 
on c.loc_code=d.loc_code
and a.movie_code=3;

select loc_name, a.*
from loc k join 
(select  loc_code, count(*) cnt
from theater c join schedule b on
c.theater_code =b.theater_code join movie_film a
on a.movie_code=b.movie_code and a.movie_code=3
group by c.loc_code) a
on k.loc_code=a.loc_code;



select * from theater;