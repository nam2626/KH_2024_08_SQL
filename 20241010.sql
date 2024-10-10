-- 학생 테이블 생성
-- 학번, 이름, 학과명, 평점
CREATE TABLE STUDENT(
	STD_NO CHAR(8),
	STD_NAME VARCHAR2(50),
	MAJOR_NAME VARCHAR2(50),
	STD_SCORE NUMBER(3,2)
);
-- 데이터 추가
INSERT INTO 
STUDENT(STD_NO,STD_NAME,MAJOR_NAME,STD_SCORE)
VALUES('20203333','김첤후','컴퓨터공학과',3.24);

-- 학생 테이블의 데이터를 전체 조회
SELECT * FROM STUDENT;
SELECT STD_NO, STD_NAME FROM STUDENT;

-- DDL : Data Definition Language, 데이터 정의어
-- 	데이터베이스 구성요소를 정의, 변경, 삭제하는 사용됨
--	CREATE : 데이터베이스 구성 요소를 생성(테이블, 인덱스, 시퀸스, 사용자....) 
--	ALTER : 생성된 데이터베이스 구성 요소를 변경할 때 사용
--	DROP : 생성된 데이터베이스 구성 요소를 삭제할 때 사용
--	TRUNCATE : 테이블의 모든 데이터를 빠르게 삭제하고, 공간을 해제, 구조는 유지함

-- 테이블 생성
CREATE TABLE 테이블_이름(
	컬럼명1 데이터타입 [NULL | NOT NULL],
	컬럼명2 데이터타입 DEFAULT 기본값,
	컬럼명3 데이터타입,
	...
	CONSTRAINT 제약조건이름 PRIMARY KEY(컬럼명) 
);
CREATE TABLE 테이블_이름(
	컬럼명1 데이터타입 PRIMARY KEY,
	컬럼명2 데이터타입 DEFAULT 기본값,
	컬럼명3 데이터타입,
	...
);
-- 데이터 타입
-- 문자열 : CHAR(2000까지 지원), VARCHAR2(4000), CLOB(128TB)
-- 숫자 : NUMBER(자리수, 소수점개수) -> 최대 38, FLOAT(128)
-- 날짜 시간 : DATE(날짜/시간), TIMESTAMP(소수점까지 저장 가능 최대 9자리)

-- PERSON 테이블
-- 		이름 -> 문자열
--		나이 -> 숫자
CREATE TABLE PERSON(
	PNAME VARCHAR2(30),
	PAGE NUMBER(3)
);

--데이터 5건 넣는 SQL문
INSERT INTO PERSON(PNAME,PAGE) VALUES('John',25);
INSERT INTO PERSON(PNAME,PAGE) VALUES('Emma',30);
INSERT INTO PERSON(PNAME,PAGE) VALUES('Michael',40);
INSERT INTO PERSON(PNAME,PAGE) VALUES('Sophia',20);
--테이블에 모든 컬럼에 데이터를 저장, 테이블 생성시 작성한 컬럼 순서대로 데이터 작성
INSERT INTO PERSON VALUES('김철수',35);

--PERSON 테이블에 있는 모든 데이터를 조회
SELECT * FROM PERSON;

--나이가 4자리인 PERSON 데이터 추가
INSERT INTO PERSON VALUES('김철수',3500);

--PERSON 테이블 삭제 구문 --> 삭제시 모든 데이터가 날아간다.
DROP TABLE PERSON;

--컬럼에 기본값 설정
CREATE TABLE PERSON(
	PNAME VARCHAR2(30),
	PAGE NUMBER(3) DEFAULT 30
);
--PAGE에 데이터를 않넣었기 때문에 기본값 지정한 30이 저장됨
INSERT INTO PERSON(PNAME) VALUES('김철수');
INSERT INTO PERSON(PNAME, PAGE) VALUES('김철수', NULL);

--PERSON 테이블 데이터 삭제
TRUNCATE TABLE PERSON;

--학생 테이블 삭제
DROP TABLE STUDENT;

--학생 테이블
-- 학번, 이름, 학과명, 평점
CREATE TABLE STUDENT(
	STD_NO CHAR(8) PRIMARY KEY, --기본키 설정을 할때
	STD_NAME VARCHAR2(30) NOT NULL, --데이터를 반드시 입력을 받아야할 때
	MAJOR_NAME VARCHAR2(30),
	--데이터가 안들어 왔을때 기본값 0으로 설정, NULL이 올 수 없게끔 처리
	STD_SCORE NUMBER(3,2) DEFAULT 0 NOT NULL  
);
DROP TABLE STUDENT;
--학생 데이터 5건 저장
INSERT INTO STUDENT (STD_NO, STD_NAME, MAJOR_NAME, STD_SCORE) 
VALUES ('20240001', '홍길동', '컴퓨터 공학', 3.5);
--NOT NULL에 데이터를 않넣은 경우
INSERT INTO STUDENT (STD_NO, MAJOR_NAME, STD_SCORE) 
VALUES ('20240002', '컴퓨터 공학', 3.5);
--DEFAULT와 NOT NULL이 지정된 곳에 데이터를 않넣었을때
INSERT INTO STUDENT (STD_NO, STD_NAME, MAJOR_NAME) 
VALUES ('20240002', '김영희', '컴퓨터 공학');
--DEFAULT와 NOT NULL이 있으면 데이터를 넣지않으면 기본값이 저장
--단, NULL 값을 직접 저장할려고하면 안됨
INSERT INTO STUDENT (STD_NO, STD_NAME, MAJOR_NAME, STD_SCORE) 
VALUES ('20240003', '김영희', '컴퓨터 공학', NULL);

INSERT INTO STUDENT (STD_NO, STD_NAME, MAJOR_NAME, STD_SCORE) 
VALUES ('20240003', '이영희', '기계 공학', 4.0);

INSERT INTO STUDENT (STD_NO, STD_NAME, MAJOR_NAME, STD_SCORE) 
VALUES ('20240004', '박민수', '경영학', 2.8);

INSERT INTO STUDENT (STD_NO, STD_NAME, MAJOR_NAME, STD_SCORE) 
VALUES ('20240005', '최지훈', '경제학', 3.2);

INSERT INTO STUDENT (STD_NO, STD_NAME, MAJOR_NAME, STD_SCORE) 
VALUES ('20240006', '정수진', '물리학', 3.9);

INSERT INTO STUDENT (STD_NO, STD_NAME, MAJOR_NAME, STD_SCORE) 
VALUES ('20240007', '김하늘', '화학', 2.5);

INSERT INTO STUDENT (STD_NO, STD_NAME, MAJOR_NAME, STD_SCORE) 
VALUES ('20240008', '이준호', '생명과학', 3.1);

INSERT INTO STUDENT (STD_NO, STD_NAME, MAJOR_NAME, STD_SCORE) 
VALUES ('20240009', '김다은', '심리학', 3.8);

INSERT INTO STUDENT (STD_NO, STD_NAME, MAJOR_NAME, STD_SCORE) 
VALUES ('20240010', '오지민', '철학', 3.0);

INSERT INTO STUDENT (STD_NO, STD_NAME, MAJOR_NAME, STD_SCORE) 
VALUES ('20240011', '서현우', '사회학', 2.9);

INSERT INTO STUDENT (STD_NO, STD_NAME, MAJOR_NAME, STD_SCORE) 
VALUES ('20240012', '한소라', '컴퓨터 공학', 4.1);

INSERT INTO STUDENT (STD_NO, STD_NAME, MAJOR_NAME, STD_SCORE) 
VALUES ('20240013', '박서준', '전자 공학', 3.4);

INSERT INTO STUDENT (STD_NO, STD_NAME, MAJOR_NAME, STD_SCORE) 
VALUES ('20240014', '이지은', '기계 공학', 3.6);

INSERT INTO STUDENT (STD_NO, STD_NAME, MAJOR_NAME, STD_SCORE) 
VALUES ('20240015', '한지민', '경영학', 2.7);

INSERT INTO STUDENT (STD_NO, STD_NAME, MAJOR_NAME, STD_SCORE) 
VALUES ('20240016', '김민재', '경제학', 3.3);

INSERT INTO STUDENT (STD_NO, STD_NAME, MAJOR_NAME, STD_SCORE) 
VALUES ('20240017', '이정민', '물리학', 3.9);

INSERT INTO STUDENT (STD_NO, STD_NAME, MAJOR_NAME, STD_SCORE) 
VALUES ('20240018', '정호연', '화학', 2.6);

INSERT INTO STUDENT (STD_NO, STD_NAME, MAJOR_NAME, STD_SCORE) 
VALUES ('20240019', '최예진', '생명과학', 3.0);

INSERT INTO STUDENT (STD_NO, STD_NAME, MAJOR_NAME, STD_SCORE) 
VALUES ('20240020', '박준영', '심리학', 3.5);

INSERT INTO STUDENT (STD_NO, STD_NAME, MAJOR_NAME, STD_SCORE) 
VALUES ('2024000', '이영수', '물리학', 2.9);

--학생 데이터 검색
SELECT * FROM STUDENT WHERE STD_NO = '20230001';
SELECT * FROM STUDENT WHERE STD_NO = '2024000';
--CHAR 고정길이 문자열이라서 공간이 남으면 뒤에 공백으로 채움
SELECT * FROM STUDENT WHERE STD_NO LIKE '2024000';
SELECT * FROM STUDENT WHERE STD_NO LIKE '2024000 ';
--평점이 3.0 이상인 데이만 조회
SELECT * FROM STUDENT WHERE STD_SCORE >= 3.0;

--테이블 컬럼 추가
ALTER TABLE STUDENT ADD STD_GENDER NUMBER(1) DEFAULT 0 NOT NULL;

--테이블 컬럼을 변경
ALTER TABLE STUDENT 
MODIFY STD_GENDER CHAR(1) DEFAULT 'M' NOT NULL;
ALTER TABLE STUDENT 
MODIFY STD_GENDER CHAR(1) DEFAULT 'M';
ALTER TABLE STUDENT MODIFY STD_GENDER NUMBER(1) DEFAULT 0 NULL;

UPDATE STUDENT SET STD_GENDER = NULL;

--테이블 컬럼 삭제
ALTER TABLE STUDENT DROP COLUMN STD_GENDER; 

--테이블 컬럼 이름 변경
ALTER TABLE STUDENT RENAME COLUMN STD_NAME TO STD_NEW_NAME;

--테이블 이름 변경
ALTER TABLE STUDENT RENAME TO NEW_STUDENT;

--날짜 컬럼 추가 및 데이터 추가
ALTER TABLE PERSON ADD BIRTH DATE;

--PERSON 데이터 추가
INSERT INTO PERSON(PNAME, PAGE, BIRTH)
VALUES('박명운', 22, '1999-04-29');
INSERT INTO PERSON(PNAME, PAGE, BIRTH)
VALUES('박명운', 22, '1999/04/29');
INSERT INTO PERSON(PNAME, PAGE, BIRTH)
VALUES('박명운', 22, '99/04/29');

SELECT * FROM PERSON;

--현재 날짜 시간 확인 방법
SELECT SYSDATE FROM DUAL;

INSERT INTO PERSON(PNAME, PAGE, BIRTH)
VALUES('박명운', 22, SYSDATE);






