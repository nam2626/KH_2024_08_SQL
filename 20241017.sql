--조인
-- 여러개의 테이블에서 필요한 데이터를 조회하기위해
-- 테이블 결합해서 조회하기 위한 연산.
-- 조인을 할려면 테이블 끼리 연결 될 수있는 동일한 데이터를 가지고 있는 컬럼이 있어야됨
CREATE TABLE A(
	CODE CHAR(1),
	VAL NUMBER(1)
);
CREATE TABLE B(
	CODE CHAR(1),
	UNIT CHAR(1)
);
INSERT INTO A VALUES('A',1);
INSERT INTO A VALUES('B',2);
INSERT INTO A VALUES('C',3);
INSERT INTO A VALUES('D',4);

INSERT INTO B VALUES('A','+');
INSERT INTO B VALUES('B','-');
INSERT INTO B VALUES('C','*');
INSERT INTO B VALUES('F','/');

SELECT * FROM A;
SELECT * FROM B;

--동일 조인
-- 같은 값을 기준으로 결합
SELECT A.CODE, A.VAL, B.CODE, B.UNIT 
FROM A, B
WHERE A.CODE = B.CODE; 

--INNER JOIN
--   조인 조건을 만족하는 모든 행을 결합
SELECT A.CODE, A.VAL, B.CODE, B.UNIT 
FROM A INNER JOIN B ON A.CODE <> B.CODE;

SELECT A.CODE, A.VAL, B.CODE, B.UNIT 
FROM A JOIN B ON A.CODE = B.CODE;

--자연조인(NATURAL JOIN)
--자동으로 똑같은 컬럼을 찾아서 조인하고 중복된 컬럼을 제거해서 조회
SELECT * FROM A NATURAL JOIN B;

--교차 조인(CROSS JOIN)
--두 테이블의 모든 조합을 조회
SELECT * FROM A CROSS JOIN B;

--학생 테이블에 학과명만 중복없이 조회
SELECT DISTINCT STD_MAJOR FROM STUDENT;
--학과명, 행번호
SELECT 
	TO_CHAR(ROWNUM,'FM00') AS MAJOR_NO, 
	STD_MAJOR AS MAJOR_NAME 
FROM (SELECT DISTINCT STD_MAJOR FROM STUDENT);
--학과 테이블 생성
CREATE TABLE MAJOR
AS
SELECT 
	TO_CHAR(ROWNUM,'FM00') AS MAJOR_NO, 
	STD_MAJOR AS MAJOR_NAME 
FROM (SELECT DISTINCT STD_MAJOR FROM STUDENT);
--학생 테이블에 학과 번호 컬럼을 추가
ALTER TABLE STUDENT ADD MAJOR_NO VARCHAR2(3);
--학생 테이블에 학과 번호 업데이트
UPDATE STUDENT
SET MAJOR_NO = 
	(SELECT MAJOR_NO FROM MAJOR WHERE MAJOR_NAME = STD_MAJOR);

SELECT * FROM STUDENT;
--학생 테이블에서 학과명 컬럼 삭제
ALTER TABLE STUDENT DROP COLUMN STD_MAJOR;

--학생 정보 조회시
--학번 이름 학과명 평점 조회
SELECT S.STD_NO, S.STD_NAME, M.MAJOR_NAME, S.STD_SCORE
FROM STUDENT S JOIN MAJOR M ON S.MAJOR_NO = M.MAJOR_NO;

SELECT * FROM STUDENT NATURAL JOIN MAJOR;

--제품 정보 조회시 
-- 제품번호, 제품명, 제조사명, 금액
SELECT 
	P.PRODUCT_ID, P.PRODUCT_NAME, M.MANUFACTURER_NAME,
	P.PRICE 
FROM PRODUCT P JOIN MANUFACTURER M 
ON P.MANUFACTURER_ID = M.MANUFACTURER_ID; 

SELECT 
	P.PRODUCT_ID, P.PRODUCT_NAME, M.MANUFACTURER_NAME,
	P.PRICE 
FROM PRODUCT P , MANUFACTURER M
WHERE P.MANUFACTURER_ID = M.MANUFACTURER_ID; 

--장학금 테이블
CREATE TABLE STUDENT_SCHOLARSHIP(
    SCHOLARSHIP_NO NUMBER,
    STD_NO CHAR(8),
    MONEY NUMBER
);

--샘플 데이터 30건
--student_money.csv로 추가

--장학금을 받는 학생 정보만 조회
SELECT 
	S.STD_NO, S.STD_NAME, S.STD_SCORE, S.STD_GENDER, SS.MONEY 
FROM 
STUDENT S JOIN STUDENT_SCHOLARSHIP SS 
ON S.STD_NO = SS.STD_NO;
--장학금을 받는 학생 정보만 조회
--	학번, 이름, 학과명, 평점, 성별, 받은 금액
SELECT 
	S.STD_NO, S.STD_NAME, S.STD_SCORE, 
	S.STD_GENDER, SS.MONEY, M.MAJOR_NAME 
FROM 
STUDENT_SCHOLARSHIP SS JOIN STUDENT S  
ON S.STD_NO = SS.STD_NO
JOIN MAJOR M ON S.MAJOR_NO = M.MAJOR_NO;

--학과 테이블 데이터를 2건 추가
INSERT INTO MAJOR VALUES('A9', '국어국문학과');
INSERT INTO MAJOR VALUES('B2', '생활체육학과');

--외부 조인(Outter Join)
--조인 조건에 맞지 않는 행도 결과에 포함시킬때 사용하는 조인
SELECT A.*, B.*
FROM A LEFT OUTER JOIN B ON A.CODE = B.CODE;

SELECT A.*, B.*
FROM A RIGHT OUTER JOIN B ON A.CODE = B.CODE;

SELECT A.*, B.*
FROM A FULL OUTER JOIN B ON A.CODE = B.CODE;

-- 학생 정보 출력시 학생테이블, 학과 테이블에 있는 모든 데이터를 조회
-- 모든 컬럼 조회, 연결되지 않는 학과도 전부 조회
SELECT S.*, M.*
FROM STUDENT S RIGHT OUTER JOIN MAJOR M
ON S.MAJOR_NO = M.MAJOR_NO;
-- 학생이 한명도 없는 학과를 조회
-- 일치하지 않는 데이터를 조회 --> 불일치 쿼리
SELECT M.*, S.STD_NO 
FROM MAJOR M LEFT OUTER JOIN STUDENT S 
ON M.MAJOR_NO = S.MAJOR_NO
WHERE S.STD_NO IS NULL;

--장학금을 받지 못한 학생들의 정보를 조회
SELECT S.*
FROM STUDENT S LEFT OUTER JOIN STUDENT_SCHOLARSHIP SS
ON S.STD_NO = SS.STD_NO
WHERE SS.SCHOLARSHIP_NO IS NULL;
--학과명도 추가해서 조회
SELECT 
	S.STD_NO ,S.STD_NAME ,S.STD_SCORE ,
	S.STD_GENDER , M.MAJOR_NAME
FROM STUDENT S LEFT OUTER JOIN STUDENT_SCHOLARSHIP SS
ON S.STD_NO = SS.STD_NO
JOIN MAJOR M ON S.MAJOR_NO = M.MAJOR_NO
WHERE SS.SCHOLARSHIP_NO IS NULL;
--학과별로 장학금을 받은 학생들의 학과별, 성별을 기준으로 인원수, 최대 평점, 최저 평점
SELECT 
	M.MAJOR_NAME, S.STD_GENDER, 
	COUNT(*) AS STD_COUNT, 
	MAX(S.STD_SCORE) AS MAX_SCORE,
	MIN(S.STD_SCORE) AS MIN_SCORE 
FROM STUDENT S JOIN MAJOR M ON S.MAJOR_NO = M.MAJOR_NO
JOIN STUDENT_SCHOLARSHIP SS ON S.STD_NO = SS.STD_NO
GROUP BY M.MAJOR_NAME, S.STD_GENDER;

SELECT 
	M.MAJOR_NAME, S.STD_GENDER, 
	COUNT(*) AS STD_COUNT, 
	MAX(S.STD_SCORE) AS MAX_SCORE,
	MIN(S.STD_SCORE) AS MIN_SCORE 
FROM STUDENT S , MAJOR M, STUDENT_SCHOLARSHIP SS
WHERE S.MAJOR_NO = M.MAJOR_NO AND S.STD_NO = SS.STD_NO
GROUP BY M.MAJOR_NAME, S.STD_GENDER;

--학과별로 장학금을 못받은 학생들 숫자를 조회
--학과명, 학생수 만 출력
SELECT M.MAJOR_NAME, COUNT(*) AS STD_COUNT
FROM STUDENT S JOIN MAJOR M ON S.MAJOR_NO = M.MAJOR_NO
LEFT OUTER JOIN STUDENT_SCHOLARSHIP SS ON S.STD_NO = SS.STD_NO
WHERE SS.SCHOLARSHIP_NO IS NULL
GROUP BY M.MAJOR_NAME;

--제조사 코드 형식 AA-0-000
SELECT DBMS_RANDOM.STRING('X',2) || '-' ||
	TRUNC(DBMS_RANDOM.VALUE(0,10),0) || '-' ||
	TRUNC(DBMS_RANDOM.VALUE(100,1000),0)
FROM DUAL;

--자동차 판매 테이블
CREATE TABLE CAR_SELL(
    CAR_SELL_NO NUMBER PRIMARY KEY,
    CAR_ID VARCHAR2(10),
    CAR_SELL_EA NUMBER(3),
    CAR_SELL_PRICE NUMBER(10),
    CAR_SELL_DATE DATE DEFAULT SYSDATE
);

--자동차 제조사만 조회 - 중복된 내용 제거
SELECT DISTINCT CAR_MAKER FROM CAR;

--자동차 제조사 코드, 자동차 제조사명
SELECT 
DBMS_RANDOM.STRING('X',2) || '-' ||
	TRUNC(DBMS_RANDOM.VALUE(0,10),0) || '-' ||
	TRUNC(DBMS_RANDOM.VALUE(100,1000),0) AS CAR_MARKER_CODE
,CAR_MAKER FROM (SELECT DISTINCT CAR_MAKER FROM CAR);

--자동차 제조사 테이블 생성
CREATE TABLE CAR_MAKER
AS 
SELECT 
DBMS_RANDOM.STRING('X',2) || '-' ||
	TRUNC(DBMS_RANDOM.VALUE(0,10),0) || '-' ||
	TRUNC(DBMS_RANDOM.VALUE(100,1000),0) AS CAR_MARKER_CODE
,CAR_MAKER AS CAR_MAKER_NAME
FROM (SELECT DISTINCT CAR_MAKER FROM CAR);

--자동차 테이블에 제조사 코드 컬럼 추가
ALTER TABLE CAR ADD CAR_MARKER_CODE VARCHAR2(10);

--자동차 테이블에 제조사 코드 컬럼 수정
UPDATE CAR C SET C.CAR_MARKER_CODE = 
(SELECT CM.CAR_MARKER_CODE 
	FROM CAR_MAKER CM
	WHERE C.CAR_MAKER = CM.CAR_MAKER_NAME);
--자동차 테이블에 제조사명 컬럼을 삭제
ALTER TABLE CAR DROP COLUMN CAR_MAKER;

--자동차 정보 조회시 자동차 번호, 자동차 모델명, 제조사명, 제조년도, 금액
SELECT
	C.CAR_ID,C.CAR_NAME,
	CM.CAR_MAKER_NAME,C.CAR_MAKE_YEAR,C.CAR_PRICE 
FROM CAR C JOIN CAR_MAKER CM 
ON C.CAR_MARKER_CODE = CM.CAR_MARKER_CODE;

--자동차 제조사별 자동차 제품 개수, 평균가, 최고가, 최소가 조회
SELECT
	CM.CAR_MAKER_NAME, COUNT(*) AS CAR_EA, 
	TRUNC(AVG(C.CAR_PRICE)) AS AVG_PRICE,
	MAX(C.CAR_PRICE) AS MAX_PRICE,
	MIN(C.CAR_PRICE) AS MAX_PRICE
FROM CAR C JOIN CAR_MAKER CM 
ON C.CAR_MARKER_CODE = CM.CAR_MARKER_CODE
GROUP BY CM.CAR_MAKER_NAME;

--자동차 제조사별, 제조년도별, 출시된 제품 개수를 조회 
--단, 금액이 30000이상인 것들만 대상으로 잡음
SELECT
	CM.CAR_MAKER_NAME, C.CAR_MAKE_YEAR, COUNT(*) AS CAR_EA 
FROM CAR C JOIN CAR_MAKER CM 
ON C.CAR_MARKER_CODE = CM.CAR_MARKER_CODE
WHERE C.CAR_PRICE >= 30000
GROUP BY CM.CAR_MAKER_NAME, C.CAR_MAKE_YEAR ;

--자동차 판매 정보 조회
--판매 번호, 판매된 모델명, 판매일, 판매개수, 판매금액
SELECT 
	CS.CAR_SELL_NO, C.CAR_NAME, CS.CAR_SELL_DATE, 
	CS.CAR_SELL_EA, CS.CAR_SELL_PRICE 
FROM CAR C JOIN CAR_SELL CS ON C.CAR_ID = CS.CAR_ID;
--한번도 판매되지 않은 자동차 목록 조회
--자동차 번호, 자동차 모델명, 제조사명, 제조년도, 금액
SELECT 
	C.CAR_ID, C.CAR_NAME, CM.CAR_MAKER_NAME, 
	C.CAR_MAKE_YEAR ,C.CAR_PRICE
FROM CAR C LEFT OUTER JOIN CAR_SELL CS ON C.CAR_ID = CS.CAR_ID 
JOIN CAR_MAKER CM ON C.CAR_MARKER_CODE = CM.CAR_MARKER_CODE 
WHERE CS.CAR_SELL_NO IS NULL;
--판매 연도별, 제조사별, 판매 대수 총합, 판매금액 총합, 판매금액 평균을 조회

--판매 연도/월별, 제조사별, 판매 대수 총합, 판매금액 총합, 판매금액 평균을 조회










