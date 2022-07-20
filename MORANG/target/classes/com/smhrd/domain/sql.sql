select * from mr_diary

CREATE TABLE diary
(
    `diary_seq`      INT UNSIGNED    NOT NULL    AUTO_INCREMENT COMMENT '일기 순번', 
    `diary_title`    VARCHAR(300)    NOT NULL    COMMENT '일기 제목', 
    `diary_content`  TEXT            NOT NULL    COMMENT '일기 내용', 
    `u_id`           VARCHAR(20)     NOT NULL    COMMENT '임산부 아이디', 
    `diary_date`     DATETIME        NOT NULL    DEFAULT NOW() COMMENT '일기 작성일자', 
     PRIMARY KEY (diary_seq)
);

insert into board(diary_title, diary_content, u_id)
values('스프링 게시판', '방가방가','아이디는 뭐냐');

select * from diary;

use morang;
select * from mr_user;

