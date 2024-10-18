-- 제약조건 
-- SELECT * FROM USER_CONSTRAINTS;
SELECT * FROM USER_CONSTRAINTS;
-- 기본키
--ALTER TABLE 테이블명 
--ADD CONSTRAINT 제약조건명 PRIMARY KEY(기본키로 지정할 컬럼)
DROP TABLE PERSON;
CREATE TABLE PERSON(	
    PID CHAR(4),
    PNAME VARCHAR2(30 BYTE), 
    AGE NUMBER(3,0)
);
ALTER TABLE PERSON ADD CONSTRAINT PERSON_PID_PK
PRIMARY KEY(PID);
SELECT * FROM USER_CONSTRAINTS;
CREATE TABLE PERSON(	
    PID CHAR(4),
    PNAME VARCHAR2(30 BYTE), 
    AGE NUMBER(3,0),
    CONSTRAINT PERSON_PID_PK PRIMARY KEY(PID)
);
--샘플데이터
INSERT INTO PERSON VALUES('0001','홍길동',20);
INSERT INTO PERSON VALUES('0002','김길동',30);
INSERT INTO PERSON VALUES('0003','이길동',40);
INSERT INTO PERSON VALUES('0004','박길동',50);
-- 외래키
--ALTER TABLE 테이블명 ADD CONSTRAINT 제약조건명 
--FOREIGN KEY(외래키 지정할 컬럼명) 
--REFERENCES 외래키로연결될테이블명(참조할 테이블의 기본키)
--[ON DELETE CASCADE] | [ON DELETE RESTRICT] | [ON DELETE SET NULL]
CREATE TABLE PERSON_ORDER(
	P_ORDER_NO NUMBER(5),
	P_ORDER_MEMO VARCHAR2(300),
	PID CHAR(4)
);
--PERSON_ORDER에 P_ORDER_NO를 기본키로 작성
ALTER TABLE PERSON_ORDER ADD CONSTRAINT PERSON_ORDER_PO_NO_PK
PRIMARY KEY(P_ORDER_NO);
SELECT * FROM USER_CONSTRAINTS;
--PERSON_ORDER에 PID를 외래키 설정, PERSON에 있는 PID와 연결
ALTER TABLE PERSON_ORDER ADD CONSTRAINT PERSON_ORDER_PID_FK
FOREIGN KEY(PID) REFERENCES PERSON(PID); -- ON DELETE RESTRICT

INSERT INTO PERSON_ORDER VALUES(1, '지시 내용', '0001');
INSERT INTO PERSON_ORDER VALUES(2, '지시 내용', '0002');
INSERT INTO PERSON_ORDER VALUES(3, '지시 내용', '0003');
--에러, PERSON 테이블에 해당 PID 값이 없을때 --> 참조 무결성
INSERT INTO PERSON_ORDER VALUES(4, '지시 내용', '0005');
--PERSON 테이블에 PID가 0001인 데이터를 삭제 -> RESTRICT는 자식 레코드가 있으면 멈춤
DELETE FROM PERSON WHERE PID LIKE '0001';
--부모 레코드를 지우기전에 자식 레코드를 먼저 삭제
DELETE FROM PERSON_ORDER WHERE PID LIKE '0001';
--PERSON_ORDER에 외래키 제약조건 삭제
ALTER TABLE PERSON_ORDER DROP CONSTRAINT PERSON_ORDER_PID_FK;
--외래키 지정시 ON DELETE CASCADE 지정 
ALTER TABLE PERSON_ORDER ADD CONSTRAINT PERSON_ORDER_PID_FK
FOREIGN KEY(PID) REFERENCES PERSON(PID) ON DELETE CASCADE;

SELECT * FROM PERSON_ORDER;
DELETE FROM PERSON WHERE PID LIKE '0002';

--외래키 지정시 ON DELETE SET NULL 지정 
ALTER TABLE PERSON_ORDER ADD CONSTRAINT PERSON_ORDER_PID_FK
FOREIGN KEY(PID) REFERENCES PERSON(PID) ON DELETE SET NULL;

SELECT * FROM PERSON_ORDER;
DELETE FROM PERSON WHERE PID LIKE '0003';

--PERSON 테이블 삭제
DROP TABLE PERSON CASCADE CONSTRAINTS;

--STUDENT 테이블의 학과번호를 외래키로 지정, MAJOR의 테이블의 학과번호로 지정
ALTER TABLE STUDENT ADD CONSTRAINT STUDENT_MAJOR_NO_FK
FOREIGN KEY(MAJOR_NO) REFERENCES MAJOR(MAJOR_NO) ON DELETE CASCADE; 

ALTER TABLE MAJOR ADD CONSTRAINT MAJOR_MAJOR_NO_PK
PRIMARY KEY(MAJOR_NO);

SELECT S.*, M.MAJOR_NO 
FROM STUDENT S LEFT OUTER JOIN MAJOR M ON S.MAJOR_NO = M.MAJOR_NO
WHERE M.MAJOR_NO IS NULL;

--장학금 테이블 학번 외래키 지정
ALTER TABLE STUDENT_SCHOLARSHIP 
ADD CONSTRAINT STUDENT_SCHOLARSHIP_STD_NO_FK
FOREIGN KEY(STD_NO) REFERENCES STUDENT(STD_NO) ON DELETE CASCADE;

--CHECK 제약조건
--컬럼에 들어올 값의 범위 및 제약 조건을 거는 방법
--ALTER TABLE 테이블명 ADD CONSTRAINT 제약조건명 CHECK(조건식);
SELECT * FROM PERSON;
DELETE FROM PERSON;
INSERT INTO PERSON VALUES('0002','홍길동',-50);
INSERT INTO PERSON VALUES('0001','홍길동',50);
--PERSON 테이블에 나이가 0보다 큰값만 저장되게끔 제약조건을 설정
ALTER TABLE PERSON ADD CONSTRAINT PERSON_AGE_CHK CHECK(AGE > 0);
--특정 제약 조건을 비활성화
ALTER TABLE PERSON DISABLE CONSTRAINT PERSON_AGE_CHK;
--특정 제약 조건을 활성화 -> 다시 활성화 할때 제약조건 다시 체크
ALTER TABLE PERSON ENABLE CONSTRAINT PERSON_AGE_CHK;
--제약 조건 삭제
ALTER TABLE PERSON DROP CONSTRAINT PERSON_AGE_CHK;
--PERSON 테이블에 데이터 추가시 이름에 공백이 들어가지 않도록 제약조건을 설정
ALTER TABLE PERSON DROP CONSTRAINT PERSON_PNAME_CHK;
ALTER TABLE PERSON ADD CONSTRAINT PERSON_PNAME_CHK
CHECK(NOT PNAME LIKE '% %');
ALTER TABLE PERSON ADD CONSTRAINT PERSON_PNAME_CHK
CHECK(INSTR(PNAME, ' ') = 0);
INSERT INTO PERSON VALUES('0002', '김 철수', 11);

--학생 테이블에 평점이 0.0~4.5까지만 저장되게끔 제약조건을 추가
ALTER TABLE STUDENT ADD CONSTRAINT STDUENT_SCORE_CHK
CHECK(STD_SCORE BETWEEN 0 AND 4.5);

--서브 쿼리(Sub Query)
--	하나의 SQL문에 또 다른 SQL문이 있는 형태
--	단일 행, 멀티 행, 다중 컬럼, 스칼라(컬럼에 서브쿼리가 들어가는 형태)

--조건식에 들어가는 서브쿼리
-- 평점이 최고점에 해당하는 학생 정보를 조회
SELECT * FROM STUDENT 
WHERE STD_SCORE = (SELECT MAX(STD_SCORE) FROM STUDENT);
-- 평점이 최저점인 학생 데이터를 삭제
SELECT MIN(STD_SCORE) FROM STUDENT;

DELETE FROM STUDENT 
WHERE STD_SCORE = (SELECT MIN(STD_SCORE) FROM STUDENT);

--평점이 최고점인 학생과, 최저점인 학생을 조회
--조회할 컬럼은 학번, 이름, 학과명, 평점, 성별
SELECT 
	S.STD_NO, S.STD_NAME, 
	M.MAJOR_NAME, S.STD_SCORE, S.STD_GENDER
FROM 
	STUDENT S JOIN MAJOR M ON S.MAJOR_NO = M.MAJOR_NO 
WHERE 
	STD_SCORE = (SELECT MAX(STD_SCORE) FROM STUDENT)
	OR 
	STD_SCORE = (SELECT MIN(STD_SCORE) FROM STUDENT);

SELECT 
	S.STD_NO, S.STD_NAME, 
	M.MAJOR_NAME, S.STD_SCORE, S.STD_GENDER
FROM 
	STUDENT S JOIN MAJOR M ON S.MAJOR_NO = M.MAJOR_NO 
WHERE 
	STD_SCORE IN((SELECT MAX(STD_SCORE) FROM STUDENT),
				 (SELECT MIN(STD_SCORE) FROM STUDENT));

--평균 이하인 학생들의 평점을 0.5점 증가
UPDATE STUDENT SET STD_SCORE = STD_SCORE + 0.5
WHERE STD_SCORE <= (SELECT AVG(STD_SCORE) FROM STUDENT);

--장학금을 받는 학생들만조회
--학번, 이름, 학과명, 평점
SELECT 
	S.STD_NO, S.STD_NAME, 
	M.MAJOR_NAME, S.STD_SCORE, S.STD_GENDER
FROM 
	STUDENT S JOIN MAJOR M ON S.MAJOR_NO = M.MAJOR_NO
WHERE 
	S.STD_NO IN(SELECT SS.STD_NO FROM STUDENT_SCHOLARSHIP SS);

--장학금을 받는 못하는 학생들만조회			
SELECT 
	S.STD_NO, S.STD_NAME, 
	M.MAJOR_NAME, S.STD_SCORE, S.STD_GENDER
FROM 
	STUDENT S JOIN MAJOR M ON S.MAJOR_NO = M.MAJOR_NO
WHERE 
	S.STD_NO NOT IN(SELECT SS.STD_NO FROM STUDENT_SCHOLARSHIP SS);

--학과별로 최고점을 가진 학생들을 조회
--1. 학과별로 최고점을 가진 점수를 조회, 학과 번호, 최고점 조회
SELECT MAJOR_NO, MAX(STD_SCORE) FROM STUDENT GROUP BY MAJOR_NO;
--2. 서브 쿼리를 이용해서 다중 컬럼 비교
SELECT * FROM STUDENT
WHERE (MAJOR_NO, STD_SCORE) 
	IN(	SELECT MAJOR_NO, MAX(STD_SCORE) 
		FROM STUDENT GROUP BY MAJOR_NO);
--3. 조인을 이용해서 조회
SELECT S.* FROM STUDENT S 
JOIN (SELECT MAJOR_NO, MAX(STD_SCORE) AS MAX_SCORE FROM STUDENT
GROUP BY MAJOR_NO) M
ON S.MAJOR_NO = M.MAJOR_NO AND S.STD_SCORE = M.MAX_SCORE;

--FROM 절에 들어가는 서브쿼리
--	학생정보 조회시 행번호, 학번, 이름, 학과명, 평점을 조회
--	평점을 기준으로 내림차순 정렬하여 조회
--  SELECT 후에 ORDER BY가 실행되기 때문에 ROWNUM이 뒤죽박죽 상태가 된다.
SELECT ROWNUM, S.STD_NO,S.STD_NAME,M.MAJOR_NAME,S.STD_SCORE 
FROM STUDENT S JOIN MAJOR M ON S.MAJOR_NO = M.MAJOR_NO
ORDER BY S.STD_SCORE DESC;
--이 것을 해결해기 위해 서브쿼리로 작업
SELECT ROWNUM, S.*
FROM
(SELECT S.STD_NO,S.STD_NAME,M.MAJOR_NAME,S.STD_SCORE 
FROM STUDENT S JOIN MAJOR M ON S.MAJOR_NO = M.MAJOR_NO
ORDER BY S.STD_SCORE DESC) S;

SELECT ROW_NUMBER() OVER(ORDER BY S.STD_SCORE DESC), 
S.STD_NO,S.STD_NAME,M.MAJOR_NAME,S.STD_SCORE 
FROM STUDENT S JOIN MAJOR M ON S.MAJOR_NO = M.MAJOR_NO;

--제일 위에 데이터 5건만 조회






