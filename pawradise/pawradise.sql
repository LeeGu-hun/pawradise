drop table board;
create table board (
    seq number(10),
    name varchar2(20),
    passwd varchar2(20),
    title varchar2(500),
    content varchar2(4000),
    filename varchar2(100),
    regdate date default sysdate,
    readcount number(10),
    reply number(10)
);
create table board (
    seq number(10),
    name varchar2(20),
    passwd varchar2(20),
    title varchar2(500),
    content varchar2(4000),
    filename varchar2(100),
    filename2 varchar2(100),
    filename3 varchar2(100),
    regdate date default sysdate,
    readcount number(10),
-- 답변인경우 어느글의 답변인지 상위글 번호,최상위글인 경우 자신의 글번호 동일,
-- 리스트보기에서 정렬시 우선  reply로 우선하게 된다.
    reply number(10)
-- 하나의 글 아래에 생기는 모든 답변들에 대해 순차적으로 1씩 증가
);

drop sequence board_seq;
create sequence board_seq start with 1 increment by 1;


drop table comment_t;
create table comment_t(
    c_seq number(10),
    name varchar2(20),
    comm varchar2(4000)
);

select * from comment;
create sequence comment_seq start with 1 increment by 1;

insert into board (seq, name, passwd, title, content, readcount, reply)
values (board_seq.NEXTVAL, 'aa', '1111', 'aaa', 'aaaaaaaaaaaaaaa', 0,0);

select * from board;

commit;

select * from (select rownum rnum, seq, name, title, 
					content, filename, regdate, readcount, reply from (select * from board order by seq desc)) where rnum>=1 and rnum<=10;


drop table member;

CREATE TABLE MEMBER(
userNum NUMBER,
ID VARCHAR2(100) NOT NULL,
NAME VARCHAR2(100) NOT NULL,
passwd VARCHAR2(100) NOT NULL,
EMAIL VARCHAR2(255) NOT NULL,
petName VARCHAR2(255),
ADDRESS VARCHAR2(255),
regdate date default sysdate,
CONSTRAINT PK_USERS PRIMARY KEY(userNum)
);
