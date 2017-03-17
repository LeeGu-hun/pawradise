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
    filename1 varchar2(100),
    filename2 varchar2(100),
    filename3 varchar2(100),
    regdate date default sysdate,
    readcount number(10),
-- 답변인경우 어느글의 답변인지 상위글 번호,최상위글인 경우 자신의 글번호 동일,
-- 리스트보기에서 정렬시 우선  reply로 우선하게 된다.
    reply number(10)
-- 하나의 글 아래에 생기는 모든 답변들에 대해 순차적으로 1씩 증가
);

drop table comment_t;
create table comment_t(
    seq number(10),
    name varchar2(20),
    comm varchar2(4000)
);
drop sequence board_seq;
create sequence board_seq start with 3 increment by 1;

insert into board (seq, name, passwd, title, content, readcount, reply)
values (1, '오라클자바1', '1111', '질문입니다', 'SQL을 배울 수 있는 과정이 뭐죠?', 0,0);

select * from board;

commit;

select * from (select rownum rnum, seq, name, title, content, filename, regdate, reply from 
(select * from board order by seq desc)) where rnum>=1 and rnum<=10 ;

select count(*) from board;
select count(*) from board where name like '%오%' ;
drop sequence board_seq;
create sequence board_seq start with 3 increment by 1;


create table board02(
  seq       varchar2(1000),
  name      varchar2(20) not null,
  passwd    varchar2(20) not null,
  title     varchar2(500)not null,
  content   clob         not null,
  filename  varchar2(100)not null,
  regdate   date         default sysdate,
  readcount number(10)   default 0,
  reply       varchar2(1000) not null,
  reply_step  number(10) default 0,
  reply_level number(10) default 0,

  constraint b_seq_pk primary key(seq)
);

create sequence sequence_board_seq
start with 1 increment by 1;

-- 코멘트
-- 코멘트 입력 번호, 코멘트 작성자, 코멘트 내용, 코멘트 입력된 게시글번호
create table comment_t02(
  comment_seq  varchar2(1000),
  comment_name varchar2(20)   not null,
  comment_comm varchar2(4000) not null,
  seq          varchar2(1000) not null,
  
  constraint comment_t_comment_seq_pk primary key(comment_seq),
  constraint comment_t_seq_fk foreign key(seq) references board02(seq)
);

create sequence sequence_comment_seq
start with 1 increment by 1;

commit;