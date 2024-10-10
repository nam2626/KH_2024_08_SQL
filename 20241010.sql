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









