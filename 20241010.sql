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

--학생 데이터 5건 저장









