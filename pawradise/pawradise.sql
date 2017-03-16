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
    reply number(10),
    reply_step number(10),
    reply_level number(10)
)
 
create table comment_t(
    seq number(10),
    name varchar2(20),
    comm varchar2(4000)
)
 
drop sequence board_seq
create sequence board_seq start with 1 increment by 1
 
insert into board (seq, name, passwd, title, content, readcount, reply_step)
values (board_seq.nextval, '오라클자바커뮤니티', '1111', '질문입니다', 'SQL을 배울 수 있는 과정이 뭐죠?', 0, 0)
 
insert into board (seq, name, passwd, title, content, readcount, reply_step)
values (board_seq.nextval, '오라클자바커뮤니티2', '1111', 'Spring강좌질문', 과정 추천해 주세요?', 0, 0)
 
commit;