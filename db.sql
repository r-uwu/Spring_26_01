SHOW DATABASES;
CREATE DATABASE Servlet_AM_26_01;

CREATE DATABASE Spring_26_01;

USE Spring_26_01;



CREATE TABLE MEMBER (
 id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
 regDate DATETIME NOT NULL,
 updateDate DATETIME NOT NULL,
 loginId CHAR(30) NOT NULL,
 loginPw CHAR(100) NOT NULL,
 `authLevel` SMALLINT(2) UNSIGNED DEFAULT 3 COMMENT '권한 레벨 (3=일반,7=관리자)',
 `name` CHAR(20) NOT NULL,
 nickname CHAR(20) NOT NULL,
 cellphoneNum CHAR(20) NOT NULL,
 email CHAR(20) NOT NULL,
 delStatus TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '탈퇴 여부 (0=탈퇴 전, 1=탈퇴 후)',
 delDate DATETIME COMMENT '탈퇴 날짜'
)

SHOW TABLES

INSERT INTO MEMBER (userId, userPw, userName) VALUES
('tempId1','tempPw','첫번째회원');

INSERT INTO MEMBER (userId, userPw, userName) VALUES
('tempId2','tempPw','두번째회원'),
('tempId3','tempPw','333'),
('tempId4','tempPw','444');

INSERT INTO MEMBER (userId, userPw, userName) VALUES
('asdf','asdfasdf','테스트용 asdf');

DELETE 

USE Servlet_AM_26_01;
SHOW TABLES;

SELECT * FROM MEMBER;

SELECT userId FROM MEMBER



CREATE TABLE article (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    BODY TEXT,
    regDate DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO article (title, BODY) VALUES
('첫 번째 글', '내용입니다.'),
('두 번째 글', '두 번째 내용');

INSERT INTO article (title, BODY) VALUES
('세 번째 글', '세 번째 내용');

SHOW COLUMNS FROM article;

SELECT * FROM article;


INSERT INTO article (title, BODY) VALUES
('제목4', '내용4');

UPDATE article
SET title = '제목1',
`body` = 'ㅇㅅㅇ'
WHERE id = 1;

UPDATE article
SET title = '세 번째 글',
`body` = 'ㅇㅅㅁㄴㅇㄻㅇㄻㅇㄹ'
WHERE id = 3;




INSERT INTO article
SET
title = CONCAT('제목', SUBSTRING(RAND() * 1000 FROM 1 FOR 2)),
`body` = CONCAT('내용', SUBSTRING(RAND() * 1000 FROM 1 FOR 2));

DELETE FROM article
WHERE userPw = 'asdf';

DELETE FROM MEMBER
WHERE userPw = "asdf";

ALTER TABLE article
ADD COLUMN writer CHAR(20) NOT NULL;

SELECT * FROM article


INSERT INTO article (title, BODY, writer) VALUES
('작성자추가2','ㅁㅇㄹ','작성자이름2');

ALTER TABLE article
ADD COLUMN userId CHAR(20) NOT NULL;


INSERT INTO article (title, BODY, writer) VALUES
('작성자추가2','ㅁㅇㄹ','작성자이름2');

SELECT * FROM article
WHERE userId = ""

UPDATE article
SET
writer = "작성자 없음"
WHERE writer = "";





