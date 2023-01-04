--1 ȸ�� ���� ���̺�
create table memberBoard(
no number(10) primary key
,name varchar2(100) not null
,email varchar2(100) not null unique
,pw number(10) not null
,phone varchar2(100) not null
,addr varchar2(100) not null
,rankNo number(10) default 0
)



--2 ȸ�� ��� ���̺�
create table memberRank(
rankNo number(10) primary key
,type       varchar2(100)
)


--3 �������� �Խ���
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

--4 �����Խ���
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
--5 ���ǰԽ���
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
--6 ���ǰԽ��� �۸Ӹ� ����
create table askHeader(
headerNo number(10)    primary key
,headerName varchar2(100)
)


--7 ���ֹ��� ����
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

--8 �Ű�Խ���
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
--�������  ( �Ű�Խ����� ������ȣ, �Ű����, �Ű���ȸ����ȣ, �Ű����̸���, �Ű���ѱ� ȸ����ȣ, �Ű���ѱ� �̸���, �Խ��Ǳ��й�ȣ,
--�Ű���ѱ��� �ִ� �Խ��ǿ����� �������ִ� ������ȣ)




--9 �Խ��� ����
create table boardNo(
partNo number(10)        primary key
,name        varchar2(100)
)

insert into boardNo values ( 0 , '�������� �Խ���' );
insert into boardNo values ( 1 , '�����Խ���' );
insert into boardNo values ( 2 , '���ǰԽ���' );
insert into boardNo values ( 3 , '���ֹ�������' );
insert into boardNo values ( 4 , '�Ű�Խ���' );

--10 �������̺�
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

insert into tool values ( 1 , 1, '��������ġ' , ''             , 1, 0 ,'��������', 0 );
insert into tool values ( 2 , 2, '�����帱'  ,'���ӻ�_BL18M605' , 0, 1 ,'��������', 0 );
insert into tool values ( 3 , 3, '���Ȱ�'    ,'���Ȱ�'          , 3, 7 ,'�ٴٴٴ�', 0 );


--11 ���� ��з� ����
create table bigSort(
no    number(10) primary key
,name varchar2(100)
)


insert into bigSort values ( 0 , '��������');
insert into bigSort values ( 1 , '�Ϲݰ���');
insert into bigSort values ( 2 , '��Ȱ��ǰ');
insert into bigSort values ( 3 , '��Ÿ����');


--12 ���� �Һз� ����
create table smallSort(
no     number(10) primary key
,name varchar2(100)
,bigSortNo  number(10)
)

insert into smallSort values ( 0 , '�����帱'         , 0);
insert into smallSort values ( 1 , '�ظӵ帱'         , 0);
insert into smallSort values ( 2 , '�׶��δ�'         , 0);
insert into smallSort values ( 3 , '����/����'        , 0);
insert into smallSort values ( 4 , '��������/��/����'  , 0);
insert into smallSort values ( 5 , '��Ű/��ġ/���г�'   , 1);
insert into smallSort values ( 6 , '������Ʈ'         , 1);
insert into smallSort values ( 7 , '����/��ġ/�ö��̾�' , 1);
insert into smallSort values ( 8 , '����̹�'         , 1);
insert into smallSort values ( 9 , '��ġ/�Ը�/�嵵��'   , 1);
insert into smallSort values ( 10 , '�繫����'        , 2);
insert into smallSort values ( 11 , '�̿밡��'        , 2);
insert into smallSort values ( 12 , '�����а���'       , 2);
insert into smallSort values ( 13 , '�������'        , 2);
insert into smallSort values ( 14 , 'ķ�ο�ǰ'        , 2);
insert into smallSort values ( 15 , '��Ÿ����'        , 3);




--13 ����
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
insert into jijum values ( 1 , '����2�� ����������','���� 9�� ~ ���� 6��', '02-218-1576', '010-2518-5221', '����Ư���� ���� ������ 27�� 31-6', 5);
insert into jijum values ( 2 , '����2�� �����뿩��','���� 9�� ~ ���� 6��', '02-268-2945', '010-2397-8897', '���� ���α� ������16���� 17', 4);
insert into jijum values ( 3 , '����1�� �ֹμ��� �����뿩��','���� 9�� ~ ���� 6��', '02-379-5887', '010-9987-5461', '����Ư���� ������ ������ 660-7', 1);





--14 ���� ����
create table location(
no number(10) primary key
,name varchar2(100)
)

insert into location values ( 0, '������' );
insert into location values ( 1, '������' );
insert into location values ( 2, '���ϱ�' );
insert into location values ( 3, '������' );
insert into location values ( 4, '���α�' );
insert into location values ( 5, '����' );


--15 ���� �뿩�� ���̺�
create table onRental(
no            number(10)        primary key
, name         varchar2(100)        not null
, rentalDate      date                not null
, returnDate    date                not null
, toolNo        number(10)        not null unique
, jijumNo     number(10)            not null unique
, toolName    varchar2(100)        not null
)


--16 ���� ������ ���̺�
create table onBooking (
no         number(10) primary key
,name        varchar2(100)   not null
,bookingDate date            not null
,toolNo      number(10)
,jijumNo     number(10)
,toolName    varchar2(100)   not null
)

--17 �ݳ��Ϸ� ���̺�
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