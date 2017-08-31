/* system�������� ������ ��
alter session set "_oracle_script"=true;

create user mymovie identified by tiger;

grant connect,resource,create view, create synonym to mymovie;

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


select mf.*, mg.genrename, gr.gradename, gr.gradeimage
from movie_genre mg join movie_film mf
on mg.genrecode= mf.genrecode
join movie_grade gr 
on mf.gradecode =gr.gradecode;



