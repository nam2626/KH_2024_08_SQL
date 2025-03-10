-- 관리자 계정으로 진행 - root
-- DB 생성
CREATE DATABASE SCOTT DEFAULT CHARACTER SET UTF8MB4 COLLATE UTF8MB4_GENERAL_CI;
SHOW DATABASES;
DROP DATABASE SCOTT;
#DB 문자코드 변경
ALTER DATABASE 디비명 DEFAULT CHARACTER SET UTF8MB4 COLLATE UTF8MB4_GENERAL_CI;

# 계정생성
CREATE USER 'SCOTT'@'%' IDENTIFIED BY '123456';
#모든 권한 부여
GRANT ALL PRIVILEGES ON SCOTT.* TO 'SCOTT'@'%';
#권한 회수 방법
REVOKE ALL PRIVILEGES ON SCOTT.* FROM 'SCOTT'@'%';

#DB 선택
USE SCOTT;

#학생 테이블
CREATE TABLE STUDENT(
	STD_NO CHAR(8) PRIMARY KEY,
	STD_NAME VARCHAR(30),
	MAJOR_NO DECIMAL(2) DEFAULT 0,
	STD_SCORE FLOAT(3,2)
);

INSERT INTO STUDENT VALUES('20201111','홍길동',3,2.4);
INSERT INTO STUDENT VALUES('20202222','김철수',1,3.4);
INSERT INTO STUDENT VALUES('20203333','황보원',4,4.4);
INSERT INTO STUDENT VALUES('20204444','이인수',5,1.5);
INSERT INTO STUDENT VALUES('20205555','박철수',2,3.6);

SELECT * FROM STUDENT;

