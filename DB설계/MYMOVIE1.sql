/* system계정으로 접속한 뒤
alter session set "_oracle_script"=true;

create user mymovie identified by tiger;

grant connect,resource,create 
, create synonym to mymovie;

alter user mymovie quota unlimited on users;
*/

--장르
ALTER TABLE MOVIE_GENGRE
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

DROP INDEX PK_MOVIE_GENGRE;

/* 장르 */
DROP TABLE MOVIE_GENRE 
	CASCADE CONSTRAINTS;

/* 장르 */
CREATE TABLE MOVIE_GENRE (
	genrecode NUMBER(8) NOT NULL, /* 장르코드 */
	genrename VARCHAR2(15) NOT NULL /* 장르명 */
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
'애니메이션');

commit;

select * from movie_genre;
-------------------------------------------------------------------
ALTER TABLE MOVIE_GRADE
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

DROP INDEX PK_MOVIE_GRADE;

/* 등급 */
DROP TABLE MOVIE_GRADE 
	CASCADE CONSTRAINTS;

/* 등급 */
CREATE TABLE MOVIE_GRADE (
	gradecode NUMBER(8) NOT NULL, /* 등급코드 */
	gradename VARCHAR2(20), /* 등급명 */
	gradeimage VARCHAR2(50) /* 등급이미지 */
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
--MOVIE (영화 )
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

/* 영화 */
DROP TABLE MOVIE_FILM 
	CASCADE CONSTRAINTS;

/* 영화 */
CREATE TABLE MOVIE_FILM (
	movie_code NUMBER(8) NOT NULL, /* 영화코드 */
	movie_title VARCHAR2(100), /* 영화제목 */
  subtitle varchar2(100),/*영화 부연 설명 제목*/
	genrecode NUMBER(8), /* 장르코드 */
	gradecode NUMBER(8), /* 등급코드 */
	director VARCHAR2(30), /* 영화감독 */
	story VARCHAR2(2000), /* 줄거리 */
	runtime NUMBER, /* 상영시간 */
	opendate DATE, /* 개봉일 */
	poster1 VARCHAR2(50), /* 포스터1 */
	poster2 VARCHAR2(50), /* 포스터2 */
	actor VARCHAR2(50), /* 주연배우 */
	producer VARCHAR2(50), /* 제작사 */
	makeYear char(4), /* 제작년도 */
	makeCountry VARCHAR2(30), /* 제작국가 */
	supplier VARCHAR2(50), /* 공급업체 */
	release_status NUMBER, /* 영화개봉상태구분 */
	movie_site VARCHAR2(50), /* 영화공식사이트 */
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
movie_film_code.nextval,'당신 거기 있어 줄래요','재밌는 영화',2,2,'홍지영','재밌어요',
111,'2016-12-12','you1.png','you2.png','김윤석','A제작사','2016',
'대한민국','가나배급사',1,'http://당신거기있어줄래요.kr',1);

select * from movie_genre;
select * from movie_grade;

insert into movie_film values(
movie_film_code.nextval,'씽-Sing','꿈의 오디션이 시작된다.',7,1,'리차드','꿈의 오디션이 시작된다.',
106,'2016-12-21','sing1.png','sing2.png','캐릭터','B제작사','2016',
'미국','다라배급사',1,'http://sing.co.kr',1);

insert into movie_film values(
movie_film_code.nextval,'마스터','쫓고 쫓기는 수사 드라마',7,1,'리차드','\"썩은 머리 이번에 싹 다 잘라낸다\"

화려한 언변, 사람을 현혹하는 재능, 정관계를 넘나드는 인맥으로
수만 명 회원들에게 사기를 치며 승승장구해 온 원네트워크 ‘진회장’(이병헌).
반년간 그를 추적해 온 지능범죄수사팀장 ‘김재명’(강동원)은 진회장의 최측근인 ‘박장군’(김우빈)을 압박한다. 원네트워크 전산실 위치와 진회장의 로비 장부를 넘기라는 것. 뛰어난 프로그래밍 실력과 명석한 두뇌로 원네트워크를 키워 온 브레인 박장군은 계획에 차질이 생긴 것을 감지하자 빠르게 머리를 굴리기 시작한다.
진회장은 물론 그의 뒤에 숨은 권력까지 모조리 잡기 위해 포위망을 좁혀가는 재명, 오히려 이 기회를 틈타 돈도 챙기고 경찰의 압박에서도 벗어날 계획을 세우는 장군. 하지만 진회장은 간부 중에 배신자가 있음을 눈치채고, 새로운 플랜을 가동하는데…
.',
143,'2016-12-21','master1.png','master2.png','이병헌','C제작사','2016',
'대한민국','마바배급사',1,'http://master.co.kr',1.2);

commit;
    
------------------------------------------------------------------    
--장르와 등급 movie_film테이블을 조인하여 만든 뷰 생성
create or replace view movieView
as
select mf.*, mg.genrename, gr.gradename, gr.gradeimage
from movie_genre mg join movie_film mf
on mg.genrecode= mf.genrecode
join movie_grade gr 
on mf.gradecode =gr.gradecode;

select * from movieView;
--------------------------------------------------------------------------
--지역(영화관 관련) 테이블
ALTER TABLE LOC
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

DROP INDEX PK_LOC;

/* 지역 */
DROP TABLE LOC 
	CASCADE CONSTRAINTS;

/* 지역 */
CREATE TABLE LOC (
	loc_code NUMBER NOT NULL, /* 지역코드 */
	loc_name VARCHAR2(50) NOT NULL /* 지역명 */
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

INSERT INTO LOC VALUES(LOC_CODE_SEQ.NEXTVAL,'서울');
INSERT INTO LOC VALUES(LOC_CODE_SEQ.NEXTVAL,'경기도');
INSERT INTO LOC VALUES(LOC_CODE_SEQ.NEXTVAL,'충청/대전');

--------------------------------------------------------------
--극장
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

/* 상영관 */
DROP TABLE THEATER 
	CASCADE CONSTRAINTS;

/* 상영관 */
CREATE TABLE THEATER (
	theater_code NUMBER NOT NULL, /* 상영관코드 */
	theater_name VARCHAR2(50) NOT NULL, /* 상영관명 */
	theater_seatTotal NUMBER, /* 좌석수 */
	theater_addr VARCHAR2(100), /* 위치 */
	loc_code NUMBER /* 지역코드 */
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
VALUES(THEATER_CODE_SEQ.NEXTVAL,'가산디지털',100,'서울 구로구 가산디지털단지 1번지',1);
INSERT INTO THEATER
VALUES(THEATER_CODE_SEQ.NEXTVAL,'강동',200,'서울 강동구 1번지',1);
INSERT INTO THEATER
VALUES(THEATER_CODE_SEQ.NEXTVAL,'건대입구',300,'서울 강동구 성내동 1번지',1);
INSERT INTO THEATER
VALUES(THEATER_CODE_SEQ.NEXTVAL,'홍대입구',200,'서울 마포구 서교동 1번지',1);

INSERT INTO THEATER
VALUES(THEATER_CODE_SEQ.NEXTVAL,'검단',200,'경기도 인천시 1번지',2);

INSERT INTO THEATER
VALUES(THEATER_CODE_SEQ.NEXTVAL,'대전(백화점)',250,'대전직할시 대전백화점 1번지',3);
INSERT INTO THEATER
VALUES(THEATER_CODE_SEQ.NEXTVAL,'서산',150,'충청도 서삽 1번지',3);


select * from loc;

select a.*,(select count(*) from theater where loc_code=a.loc_code) cnt  from loc a

--------------------------------------------------------------------------------
--상영 스케줄
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

/* 상영스케쥴 */
DROP TABLE SCHEDULE 
	CASCADE CONSTRAINTS;

/* 상영스케쥴 */
CREATE TABLE SCHEDULE (
	sche_num NUMBER NOT NULL, /* 스케줄번호 */
	sche_date DATE, /* 스케줄날짜 */
	movie_code NUMBER(8), /* 영화코드 */
	theater_code NUMBER /* 상영관코드 */
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
--상영시간 (runtime)
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

/* 상영시간 */
DROP TABLE RUNTIME 
	CASCADE CONSTRAINTS;

/* 상영시간 */
CREATE TABLE RUNTIME (
	run_code NUMBER(8) NOT NULL, /* 상영시간코드 */
	run_startTime timestamp, /* 상영시작시간 */
	run_endTime timestamp, /* 상영종류시간 */
	run_num NUMBER, /* 상영회차 */
	sche_num NUMBER /* 스케줄번호 */
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
--예매순 영화정보 가져오기
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