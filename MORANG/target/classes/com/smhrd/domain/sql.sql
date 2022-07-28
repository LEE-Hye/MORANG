
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

select dategroup as diary_date, avg(avgpos)as diary_pos,avg(avgneg) as diary_neg
from
(SELECT DATE_FORMAT(diary_date,'%d') as dategroup, avg(diary_pos) as avgpos ,avg(diary_neg) as avgneg
FROM diary3
where u_id = '11'
group by diary_date
having MONTH(diary_date) = MONTH(CURRENT_DATE())
AND YEAR(diary_date) = YEAR(CURRENT_DATE())
order by diary_date) c
group by dategroup

select * from diary3
where MONTH(diary_date) = MONTH(CURRENT_DATE())
AND YEAR(diary_date) = YEAR(CURRENT_DATE())

SELECT DATE_FORMAT(diary_date,'%Y-%m-%d'), avg(diary_pos),avg(diary_neg)
FROM diary3
where

insert into chatbotEmotion values('11',CURDATE() - INTERVAL 1 DAY,10,20,30,40,50,60,70)

select Max(cmt_seq) from mr_comment 
select * from mr_comment 


insert into mr_comment(cmt_seq,c_seq,cmt_content, u_id )
		values(4,62,'혜빈아 롤하자','morang')

delete from mr_comment where cmt_seq=123


insert into diary3(diary_title, diary_content, u_id,diary_date,weather,diary_pos,diary_neg)
          values('수현이가 테스트중', '오늘은 무엇을 할가?','11',CURDATE() - INTERVAL 1 DAY,'sun',62.73,37.27)