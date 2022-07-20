
insert into note(title, content, id)
values('스프링 게시판', '방가방가','아이디는 뭐냐');

select * from note;

use morang;

create table board
(
   idx int not null auto_increment,
   title varchar(100) not null,
   writer varchar(100) not null,
   content varchar(2000) not null,
   indate datetime default now(),
   count int default 0,
   
   primary key(idx)
   
);



