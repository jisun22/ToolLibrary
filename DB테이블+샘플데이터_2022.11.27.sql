--1 회원 정보 테이블
create table memberBoard(
no number(10) primary key
,name varchar2(100) not null
,email varchar2(100) not null unique
,pw number(10) not null
,phone varchar2(100) not null
,addr varchar2(100) not null
,rankNo number(10) default 0
)



--2 회원 등급 테이블
create table memberRank(
rankNo number(10) primary key
,type       varchar2(100)
)


--3 공지사항 게시판
create table notice(
no           number(10)    primary key
,email        varchar2(100)   not null
,title        varchar2(100)   not null
,content      varchar2(500)
,readCnt    number(10)      default 0
,regDate      date            default sysdate
,reportCnt  number(10)      default 0
,commentCnt number(10)      default 0
,isSecret     number(10)      default 0
,partNo       number(10)      default 0
)

--4 자유게시판
create table free(
 no              number(10)        primary key
, email         varchar2(100)     not null unique
, title             varchar2(100)    not null
, content        varchar2 (500)
, readCount        number (10)        default 0
, regDate        date            default sysdate
, reportCount    number(10)        default 0
, commentCount    number(10)         default 0
, isSecret        number(10)        default 0
, partNo        number(10)        default 0
)
--5 문의게시판
create table ask (
no           number(10)    primary key
,email        varchar2(100)   not null
,title        varchar2(100)   not null
,content      varchar2(500)
,readCount    number(10)      default 0
,regDate      date            default sysdate
,reportCount  number(10)      default 0
,commentCount number(10)      default 0
,isSecret     number(10)      default 0
,header       varchar2(100)
,partNo       number(10)      default 0
)
--6 문의게시판 글머리 종류
create table askHeader(
headerNo number(10)    primary key
,headerName varchar2(100)
)


--7 자주묻는 질문
create table question(
no              number(10)        primary key
, email             varchar2(100)    not null unique
, title            varchar2(100)    not null
, content            varchar2(500)
, readCount          number(10)     default 0
, regDate             date            default sysdate
, reportCount        number(10)      default 0
, commentCount    number(10)      default 0
, isSecret            number(10)         default 0
, partNo                 number(10)         default 0
)

--8 신고게시판
create table report (
reportNo           number(10)    primary key
,reason        varchar2(100)   not null
,reporterNo           number(10)
,reporterEmail    varchar2(100)
,writerNo        number(10)
,writerEmail        varchar2(100)
,partNo        number(10)
,postNo        varchar2(100)
)
--순서대로  ( 신고게시판의 고유번호, 신고사유, 신고자회원번호, 신고자이메일, 신고당한글 회원번호, 신고당한글 이메일, 게시판구분번호,
--신고당한글이 있던 게시판에서의 가지고있던 고유번호)




--9 게시판 종류
create table boardNo(
partNo number(10)        primary key
,name        varchar2(100)
)

insert into boardNo values ( 0 , '공지사항 게시판' );
insert into boardNo values ( 1 , '자유게시판' );
insert into boardNo values ( 2 , '문의게시판' );
insert into boardNo values ( 3 , '자주묻는질문' );
insert into boardNo values ( 4 , '신고게시판' );

--10 공구테이블
create table tool(
no        number(10)        primary key
, tpyeNo     number(10)         not null
, name     varchar2(100)    not null
, brand     varchar2(100)
, bigSortNo    number(10)    not null
, smallSortNo     number(10)    not null
, jijumName     varchar2(100)
, nowStatus     number(10)        default 0
)

insert into tool values ( 1 , 1, '파이프랜치' , ''             , 1, 0 ,'가가가가', 0 );
insert into tool values ( 2 , 2, '전동드릴'  ,'아임삭_BL18M605' , 0, 1 ,'나나나나', 0 );
insert into tool values ( 3 , 3, '보안경'    ,'보안경'          , 3, 7 ,'다다다다', 0 );


--11 공구 대분류 종류
create table bigSort(
no    number(10) primary key
,name varchar2(100)
)


insert into bigSort values ( 0 , '전동공구');
insert into bigSort values ( 1 , '일반공구');
insert into bigSort values ( 2 , '생활용품');
insert into bigSort values ( 3 , '기타공구');


--12 공구 소분류 종류
create table smallSort(
no     number(10) primary key
,name varchar2(100)
,bigSortNo  number(10)
)

insert into smallSort values ( 0 , '전동드릴'         , 0);
insert into smallSort values ( 1 , '해머드릴'         , 0);
insert into smallSort values ( 2 , '그라인더'         , 0);
insert into smallSort values ( 3 , '샌더/대패'        , 0);
insert into smallSort values ( 4 , '전동절단/톱/직소'  , 0);
insert into smallSort values ( 5 , '몽키/렌치/스패너'   , 1);
insert into smallSort values ( 6 , '공구세트'         , 1);
insert into smallSort values ( 7 , '니퍼/펜치/플라이어' , 1);
insert into smallSort values ( 8 , '드라이버'         , 1);
insert into smallSort values ( 9 , '망치/함마/장도리'   , 1);
insert into smallSort values ( 10 , '사무가전'        , 2);
insert into smallSort values ( 11 , '미용가전'        , 2);
insert into smallSort values ( 12 , '디지털가전'       , 2);
insert into smallSort values ( 13 , '재봉공구'        , 2);
insert into smallSort values ( 14 , '캠핑용품'        , 2);
insert into smallSort values ( 15 , '기타공구'        , 3);




--13 지점
create table jijum (
no            number(10)        primary key
,name         varchar2(100)   not null
,time       varchar2(100)
,phone        varchar2(100)      not null
,managePhone  varchar2(100)      not null
,addr        varchar2(100)
,locationNo     number(10)      not null
)
select * from jijum
delete from jijum
insert into jijum values ( 1 , '갈현2동 공구도서관','오전 9시 ~ 오후 6시', '02-218-1576', '010-2518-5221', '서울특별시 은평구 연서로 27길 31-6', 5);
insert into jijum values ( 2 , '개봉2동 공구대여소','오전 9시 ~ 오후 6시', '02-268-2945', '010-2397-8897', '서울 구로구 개봉로16가길 17', 4);
insert into jijum values ( 3 , '개포1동 주민센터 공구대여소','오전 9시 ~ 오후 6시', '02-379-5887', '010-9987-5461', '서울특별시 강남구 개포동 660-7', 1);





--14 지역 종류
create table location(
no number(10) primary key
,name varchar2(100)
)

insert into location values ( 0, '강남구' );
insert into location values ( 1, '강동구' );
insert into location values ( 2, '강북구' );
insert into location values ( 3, '강서구' );
insert into location values ( 4, '구로구' );
insert into location values ( 5, '은평구' );


--15 현재 대여중 테이블
create table onRental(
no            number(10)        primary key
, name         varchar2(100)        not null
, rentalDate      date                not null
, returnDate    date                not null
, toolNo        number(10)        not null unique
, jijumNo     number(10)            not null unique
, toolName    varchar2(100)        not null
)


--16 현재 예약중 테이블
create table onBooking (
no         number(10) primary key
,name        varchar2(100)   not null
,bookingDate date            not null
,toolNo      number(10)
,jijumNo     number(10)
,toolName    varchar2(100)   not null
)

--17 반납완료 테이블
create table return(
no number(10)    primary key
,name         varchar2(100)        not null
, returnDate         date                not null
, rentalDate         date                not null
, toolNo        number(10)                not null unique
, jijumNo         number(10)            not null unique
, toolName        varchar2(100)        not null
)



commit