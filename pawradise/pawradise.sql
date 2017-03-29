drop table board;
create table board (
    seq number(10),
    name varchar2(20),
    password varchar2(20),
    title varchar2(500),
    content varchar2(4000),
    filename varchar2(100),
    regdate date default sysdate,
    readcount number(10),
    reply number(10)
);

c
create sequence board_seq start with 1 increment by 1;


drop table comment_t;
create table comment_t(
    seq number(10),
    c_seq number(10),
    name varchar2(20) not null,
    c_content varchar2(4000)not null,
    regdate date default sysdate
);

select * from comment_t where seq=1 order by c_seq desc;
drop sequence comment_seq;
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
password VARCHAR2(100) NOT NULL,
EMAIL VARCHAR2(255) NOT NULL,
petName VARCHAR2(255),
phone VARCHAR2(255),
ADDRESS VARCHAR2(255),
regdate date default sysdate,
CONSTRAINT PK_USERS PRIMARY KEY(userNum)
);

create sequence member_seq start with 1 increment by 1;
