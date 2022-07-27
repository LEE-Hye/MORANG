
insert into note(title, content, id)
values('스프링 게시판', '방가방가','아이디는 뭐냐');


select * from diary3;

use morang;
select * from mr_user;
select * from 
select * from note;

use morang;

select *from mr_user where u_id='11'

delete from mr_user 

select * from mr_community

create table mot(
	content varchar(100)
);

select * from mot

SELECT content FROM mot ORDER BY RAND() LIMIT 1


create table chatbotEmotion(
	u_id VARCHAR(20) ,
	chatday datetime ,
	fear float,
	surprise float,
	angry float,
	sadness float,
	neutral float,
	happiness float,
	disgust float
);
SELECT DATE_FORMAT(NOW(),'%Y-%m-%d');

select * from chatbotEmotion
insert into chatbotEmotion values('11',CURDATE() - INTERVAL 1 DAY,1,2,3,4,5,6,7)
insert into chatbotEmotion values('11',CURDATE() ,1,2,3,4,5,6,7)
drop table chatbotEmotion
delete from chatbotEmotion where u_id='11'
select * from chatbotEmotion where u_id='11' and DATE_FORMAT(chatday,'%Y-%m-%d')=DATE_FORMAT(NOW()- INTERVAL 1 DAY,'%Y-%m-%d');


select * from diary3 where u_id='11'


