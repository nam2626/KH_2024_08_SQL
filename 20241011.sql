--사원 정보
--	사번, 이름, 직급명, 부서명, 연봉, 입사일
CREATE TABLE EMPLOYEE(
	EMP_NO CHAR(9) PRIMARY KEY,
	EMP_NAME VARCHAR2(30),
	EMP_POSITION VARCHAR2(30) DEFAULT '사원' NOT NULL,
	EMP_DEPARTMENT VARCHAR2(30),
	EMP_SALARY NUMBER(12) DEFAULT 0,
	EMP_COURSE_DATE DATE DEFAULT SYSDATE
);
-- 사원정보 샘플데이터 50건 저장
-- CSV로 만들어서 저장

--DML(Data Manipulation Language) : 데이터 조작어
--	 데이터를 조회, 삭제, 수정, 추가
--	 SELECT, DELETE, UPDATE, INSERT
CREATE TABLE PERSON(
	PNAME CHAR(30),
	PAGE NUMBER(3)
);
--INSERT : 추가
--	INSERT INTO 테이블명(컬럼1, 컬럼2, 컬럼3 ...)	
--	VALUES(데이터1, 데이터2, 데이터3....)
--	INSERT INTO 테이블명	
--	VALUES(데이터1, 데이터2, 데이터3....)
--	테이블 생성시 만든 모든 컬럼에 데이터를 저장
--	데이터 순서는 CREATE 작성시 만든 컬럼의 순서대로 작성 

--PERSON 테이블에 데이터 추가
INSERT INTO PERSON VALUES('홍길동', 20);
INSERT INTO PERSON(PNAME, PAGE) VALUES('이순신', 30);

--PERSON 데이터 5건 추가
INSERT ALL 
	INTO PERSON VALUES('김씨', 20)
	INTO PERSON VALUES('홍씨', 32)
	INTO PERSON VALUES('박씨', 44)
	INTO PERSON VALUES('정씨', 55)
	INTO PERSON VALUES('곽씨', 33)
SELECT * FROM DUAL;

--학생데이터 한건 추가하는 INSERT문 작성
INSERT INTO STUDENT(STD_NO,STD_NEW_NAME,MAJOR_NAME,STD_SCORE)
VALUES('20251111','김철수','게임학과',3.6);
--사원정보 1건 등록하는 INSERT문 작성 - 입사일 제외하고 추가
INSERT INTO 
EMPLOYEE(EMP_NO,EMP_NAME,EMP_POSITION,EMP_DEPARTMENT,EMP_SALARY)
VALUES('A20246666','김철수','사원','총무부',32000000);
--사원정보 1건 등록하는 INSERT문 작성 - 모든 항목 추가
INSERT INTO 
EMPLOYEE(EMP_NO,EMP_NAME,EMP_POSITION,
EMP_DEPARTMENT,EMP_SALARY,EMP_COURSE_DATE)
VALUES('A20236666','박영훈','주임','개발부',48000000,'2024-01-05');

--데이터 조회 : SELECT
--SELECT 조회할 컬럼1, 조회할 컬럼2, .....
--FROM 조회할 테이블1, 조회할 테이블2, .... 
--WHERE 조건절
--GROUP BY 그룹으로 묶을 컬럼1, 그룹으로 묶을 컬럼2, ... [HAVING 조건절] 
--ORDER BY 정렬할 기준 컬럼1 [ASC | DESC], 정렬할 기준 컬럼2 [ASC | DESC] ...
--전체 PERSON 데이터 조회
SELECT * FROM PERSON;
--조회할 컬럼을 다쓰는 SQL
SELECT PNAME, PAGE FROM PERSON;
--AS는 해당 컬럼의 별칭을 지정함, 함수나, 수식을 감추기 위해서
SELECT PNAME AS 이름, PAGE AS 나이 FROM PERSON;
SELECT PNAME, LENGTH(PNAME) AS PNAME_LENGTH FROM PERSON;
--학생 테이블에서 학과명만 조회
--DISTINCT : 중복된 내용 제거해서 조회
SELECT DISTINCT MAJOR_NAME FROM STUDENT;







