--함수
--DUAL : 임시 테이블, 값을 확인하는 용도(함수 결과값, 계산 결과 값)
--SYSDATE : 현재 날짜 시간값
SELECT 'HELLO', 10 + 2 FROM DUAL;
SELECT SYSDATE FROM DUAL;

--문자열 데이터
--INITCAP : 각 단어별 첫글자는 대문자로 변환, 나머지는 소문자로 변환
SELECT INITCAP('hello world') FROM DUAL;
SELECT INITCAP('HELLO WORLD') FROM DUAL;
--LOWER : 알파벳 전부 소문자로 변경
--UPPER : 알파벳 전부 대문자로 변경
SELECT LOWER('Hello World'), UPPER('Hello World') FROM DUAL;
--LENGTH : 글자 개수
SELECT LENGTH('Hello'), LENGTH('안녕하세요') FROM DUAL;
--LENGTHB : 글자의 바이트 수
SELECT LENGTHB('Hello'), LENGTHB('안녕하세요') FROM DUAL;
--PERSON 테이블에 이름의 글자개수와 글자개수의 바이트수를 출력
--김철수 3 9
SELECT PNAME, LENGTH(PNAME), LENGTHB(PNAME) FROM PERSON;
--INSTR : 문자열 검색, 검색결과가 있으면 0보다 큰값, 검색 결과가 없으면 0
SELECT INSTR('ABCDEFG','CD') FROM DUAL;
SELECT INSTR('ABCDEFG','CDF') FROM DUAL;
--문자열 공백 체크
SELECT INSTR('HELLO WORLD', ' ') FROM DUAL;
--테이블에 NAME 컬럼에 공백을 넣지 않는 조건
CREATE TABLE PERSON(
	PNAME VARCHAR2(30),
	PAGE NUMBER(3),
	CONSTRAINT CHK_NAME CHECK(INSTR(PNAME, ' ') = 0),
	CONSTRAINT CHK_AGE CHECK(PAGE > 0)
);
DROP TABLE PERSON;
INSERT INTO PERSON VALUES('김철수',10);
INSERT INTO PERSON VALUES('김 철수',10);
INSERT INTO PERSON VALUES('김철수',0);
SELECT * FROM USER_CONSTRAINTS;
-- REPLACE : 문자열 바꾸기 
SELECT REPLACE('AAAAAAABBBBBCCCC','B','F') FROM DUAL;
--학생 테이블에 학과명을 '공학'을 '학'으로 변경하는 UPDATE문을 작성
--학과명에 '공학'이 있는 경우에만 동작하게끔 처리
UPDATE STUDENT 
SET MAJOR_NAME = REPLACE(MAJOR_NAME,'공학','학')
WHERE INSTR(MAJOR_NAME,'공학') <> 0 

SELECT * FROM STUDENT;

--LPAD, RPAD : 원하는 문자열 개수만큼 남은 부분에 지정한 문자열로 채워주는 함수
SELECT LPAD('991122-1',14,'*') FROM DUAL;
SELECT RPAD('991122-1',14,'*') FROM DUAL;

SELECT LPAD('ABC',10,'1234') FROM DUAL;
SELECT RPAD('ABC',10,'1234') FROM DUAL;

--TRIM : 필요없는 좌우 공백을 제거
SELECT TRIM('      A   B   C       '),
	'      A   B   C       ' FROM DUAL;
SELECT LENGTH(TRIM('      A   B   C       ')),
LENGTH('      A   B   C       ') FROM DUAL;
--LTRIM, RTRIM : 좌우에 지정한 문자열을 제거
SELECT LTRIM('AAAABBBBBCCCCCDDDDDDAAAAA','A') FROM DUAL;
SELECT RTRIM('AAAABBBBBCCCCCDDDDDDAAAAA','A') FROM DUAL;
SELECT LTRIM('AABAACBBBBBCCCCCDDDDDDAAAAA','ABC') FROM DUAL;
SELECT RTRIM('AAABACBBBBBCCCCCDDDDDDAACABAA','ABC') FROM DUAL;
--CONCAT : 두 문자열을 하나로 합치기
SELECT CONCAT('HELLO', 'WORLD') FROM DUAL; 
SELECT 'HELLO' || 'WORLD' || 1234 FROM DUAL; 
--전화번호 데이터가 '010' '1111' '1234'를 CONCAT 함수를 이용해서 하나의 문자열로 합치기
SELECT CONCAT(CONCAT('010','1111'),'1234') FROM DUAL; 
SELECT CONCAT(CONCAT('010',1111),1234) FROM DUAL; 
-- || : 양쪽의 데이터를 하나의 문자열로 합쳐줌
SELECT '010' || '1111' || '1234' FROM DUAL;
SELECT '010' || 1111 || '1234' FROM DUAL;
--PERSON 테이블의 내용을 김철수-20 이런 형식으로 조회
SELECT PNAME || '-' || AGE AS RESULT FROM PERSON;

SELECT * FROM USER_TABLES;
--모든 테이블 DROP SQL문 작성
SELECT 'DROP TABLE ' || TABLE_NAME || ';' FROM USER_TABLES;

--문자열 추출
--SUBSTR : 문자열 부분 추출(문자 기준으로 추출)
SELECT SUBSTR('1234567890',5,4) FROM DUAL;
SELECT SUBSTR('안녕하세요',2,3) FROM DUAL;

--주민등록번호 '841113-1246121' --> '841113-1******' 마스킹 처리
SELECT SUBSTR('841113-1246121',1,8) || '******' FROM DUAL;
--PERSON 테이블의 전체 데이터 조회시 이름 가운에데 * 마스킹 처리해서 조회
--SUBSTR, LENGTH
SELECT SUBSTR(PNAME,1,1) || '*' || SUBSTR(PNAME,LENGTH(PNAME),1) AS PNAME,
	PAGE FROM PERSON;

--바이트 단위로 문자열 추출
SELECT SUBSTRB('안녕하세요',2,3) FROM DUAL;
SELECT SUBSTRB('ABCDEFG',2,3) FROM DUAL;

-----------------------------------------------------------------
----ROUND  : 원하는 자리수에서 반올림
--    -2 -1   0 1 2
--	1  2  3 . 4 5 6
SELECT ROUND(123.456,-2) FROM DUAL;
SELECT ROUND(123.456,-1) FROM DUAL;
SELECT ROUND(123.456,0) FROM DUAL;
SELECT ROUND(123.456,1) FROM DUAL;
SELECT ROUND(123.456,2) FROM DUAL;
--올림 : CEIL, 내림 : FLOOR
SELECT CEIL(123.456), FLOOR(123.456) FROM DUAL;
--TRUNC : 원하는 자리수에서 데이터를 자름
SELECT TRUNC(123.456,-2) FROM DUAL;
SELECT TRUNC(123.456,-1) FROM DUAL;
SELECT TRUNC(123.456,0) FROM DUAL;
SELECT TRUNC(123.456,1) FROM DUAL;
SELECT TRUNC(123.456,2) FROM DUAL;

-- MOD : 나머지 나누는 함수 - 6 % 4
SELECT MOD(6,4) FROM DUAL;
--POWER(N,M) : N의 M승
SELECT POWER(2,10) FROM DUAL;
--TO_NUMBER('문자열') : 문자열을 숫자로 바꿔주는 함수
SELECT 123 + '123', '123' / '3' FROM DUAL;
SELECT TO_NUMBER('123') / '3' FROM DUAL;
-----------------------------------------------
--날짜시간
SELECT SYSDATE FROM DUAL;
--오라클에서 지정된 현재 날짜 시간의 출력 포멧을 변경 - 현재 연결된 세션에서만 가능
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
ALTER SESSION SET NLS_DATE_FORMAT = 'YY/MM/DD';
--TO_CHAR(데이터, '형식') 문자열로 변환
SELECT TO_CHAR(SYSDATE,'YYYY-MM-DD HH:MI:SS'),
TO_CHAR(SYSDATE,'YYYY-MM-DD HH24:MI:SS') FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'MON MONTH DY DAY') FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'MON MONTH DY DAY','NLS_DATE_LANGUAGE=ENGLISH') FROM DUAL;
SELECT TO_CHAR(SYSDATE,'YYYY-MM-DD HH:MI:SS AM') FROM DUAL;
SELECT TO_CHAR(TO_DATE('2024-10-15 15:00:11',
							'YYYY-MM-DD HH24:MI:SS'),
				'Q YYYY-MM-DD HH:MI:SS AM') 
FROM DUAL;
--숫자 포멧
-- 9 : 숫자 한자리, 자리가 없으면 공백으로 채움
-- 0 : 숫자 한자리, 자리가 없으면 0으로 채움
SELECT TO_CHAR(1234567.89,'99999999.000') FROM DUAL; 
-- L : 통화 기호(지역 설정 기준)
SELECT TO_CHAR(1234567.89,'L99999999.000') FROM DUAL;
-- $ : 통화 기호(달러)
SELECT TO_CHAR(1234567.89,'$99999999.000') FROM DUAL;
-- , : 천단위 구분 기호,  . : 소수점
SELECT TO_CHAR(1234567.89,'$99,999,999.000') FROM DUAL;
SELECT TO_CHAR(1234567.89,'L99,999,999.000') FROM DUAL;

-- G : 천단위 구분 기호, D: 소수점 기호
SELECT TO_CHAR(1234567.89,'L99G999G999D000') FROM DUAL;

-- FM : 불필요한 공백 제거
SELECT TO_CHAR(1234567.89,'99999999.000') FROM DUAL;
SELECT TO_CHAR(1234567.89,'FML99999999.000') FROM DUAL;
-- PR : - 일때 <> 묶어서 숫자 표현, S : + - 부호 표시
SELECT TO_CHAR(-1234567,'S9,999,999'),
	   TO_CHAR(1234567,'S9,999,999'),
	   TO_CHAR(-1234567,'9,999,999PR'),
	   TO_CHAR(1234567,'9,999,999PR')
FROM DUAL; 
--문자열을 날짜로 변경
SELECT TO_DATE('2020-11-11','YYYY-MM-DD') FROM DUAL;

--오늘 날짜부터 지정된 날짜까지 남은 개월 수
SELECT ABS(MONTHS_BETWEEN(SYSDATE,'2024-12-31')) FROM DUAL; 
--지정 날짜부터 몇 개월 후 날짜
SELECT ADD_MONTHS(SYSDATE,2) FROM DUAL;
--주어진 날짜 기준으로 돌아오는 날짜(원하는 요일)
SELECT NEXT_DAY(SYSDATE,'월') FROM DUAL;
--주어진 날짜 기준으로 날짜가 속한 달의 마지막 날
SELECT LAST_DAY(SYSDATE) FROM DUAL;
--내일 날짜 출력
SELECT SYSDATE + 1 FROM DUAL;
-- D-DAY 올해 수능날까지 D-DAY 출력 : 30
SELECT CEIL(TO_DATE('2024-11-14','YYYY-MM-DD') - SYSDATE) FROM DUAL;

--윈도우 함수
--OVER, PARTITION BY, ORDER BY
--순위
SELECT RANK() OVER(ORDER BY PAGE) AS RANK, P.* FROM PERSON P;
SELECT RANK() OVER(ORDER BY PAGE DESC) AS RANK, P.* FROM PERSON P;
SELECT DENSE_RANK() OVER(ORDER BY PAGE) AS RANK, P.* FROM PERSON P;
SELECT DENSE_RANK() OVER(ORDER BY PAGE DESC) AS RANK, P.* FROM PERSON P;
--줄번호
SELECT ROW_NUMBER() OVER(ORDER BY PAGE) AS RW, P.* FROM PERSON P;
SELECT ROW_NUMBER() OVER(ORDER BY PAGE DESC) AS RW, P.* FROM PERSON P;

SELECT ROW_NUMBER() OVER(ORDER BY PAGE DESC) AS RW,
RANK() OVER(ORDER BY PAGE ASC) AS RANK,
P.* FROM PERSON P;

--현재 행을 기준으로 다음 위치에 해당하는 값을 읽어오는 함수
SELECT P.*, 
	LEAD(PNAME) OVER(ORDER BY PAGE) AS NEXT_PNAME 
FROM PERSON P;

SELECT P.*, 
	LEAD(PNAME,2) OVER(ORDER BY PAGE) AS NEXT_PNAME 
FROM PERSON P;

SELECT P.*, 
	LEAD(PNAME,2,'데이터 없음') OVER(ORDER BY PAGE) AS NEXT_PNAME 
FROM PERSON P;
-- 현재 행을 기준으로 이전 위치에 해당하는 값을 읽어오는 함수
SELECT P.*, 
	LAG(PNAME) OVER(ORDER BY PAGE) AS PREV_PNAME 
FROM PERSON P;

SELECT P.*, 
	LAG(PNAME,2) OVER(ORDER BY PAGE) AS PREV_PNAME 
FROM PERSON P;

SELECT P.*, 
	LAG(PNAME,2,'데이터 없음') OVER(ORDER BY PAGE) AS PREV_PNAME 
FROM PERSON P;

-- 학생 테이블의 평점을 기준으로 성적 순위를 출력
-- 성적순은 내림차순으로 처리, 순위는 건너뛰지 않음
SELECT 
	DENSE_RANK() OVER(ORDER BY S.STD_SCORE DESC) AS RANK_SOCORE,
	S.*
FROM STUDENT S;

SELECT 
	DENSE_RANK() OVER(PARTITION BY S.MAJOR_NAME ORDER BY S.STD_SCORE DESC) AS RANK_SOCORE,
	S.*
FROM STUDENT S;

--학생 테이블에서 학생정보 조회시 
--학번의 경우 앞에 4자리만 표현하고 나머지 4자리는 마스킹 처리 해서 조회
SELECT SUBSTR(STD_NO,1,4) || '****',
	STD_NEW_NAME , MAJOR_NAME ,STD_SCORE 
FROM STUDENT;
SELECT RPAD(SUBSTR(STD_NO,1,4),8,'*'),
	STD_NEW_NAME , MAJOR_NAME ,STD_SCORE 
FROM STUDENT;
SELECT CONCAT(SUBSTR(STD_NO,1,4), '****'),
	STD_NEW_NAME , MAJOR_NAME ,STD_SCORE 
FROM STUDENT;
--사원 테이블에서 데이터 조회시 연봉 순위를 조회, 입사일은 입사년도만 출력
--연봉을 출력시 천단위 기호가 붙게끔 처리, 순위는 건너뛰지 않습니다.
SELECT
	DENSE_RANK() OVER(ORDER BY EMP_SALARY DESC) AS SALARY_RANK,
 	EMP_NO, EMP_NAME ,
 	TO_CHAR(EMP_COURSE_DATE, 'YYYY') AS COURSE_YEAR,
 	TO_CHAR(EMP_SALARY,'FM999,999,999,999') AS SALARY 	
FROM EMPLOYEE;

--학생 테이블에서 성씨별로 점수 순위를 내림 차순 기준으로 조회하시오.
--출력 형태는 아래와 같이 조회하세요. 순위는 건너뛰지 않습니다.
--순위 학번 성씨 학과명 평점
SELECT 
	DENSE_RANK() OVER(PARTITION BY SUBSTR(S.STD_NEW_NAME,1,1) 
		ORDER BY S.STD_SCORE) AS SCORE_RANK ,S.*
FROM STUDENT S
--WHERE S.STD_SCORE >= 3
;
--입학한 년도 별로 순위 구하기
SELECT 
	DENSE_RANK() OVER(PARTITION BY SUBSTR(S.STD_NO,1,4) 
		ORDER BY S.STD_SCORE) AS SCORE_RANK ,S.*
FROM STUDENT S;







