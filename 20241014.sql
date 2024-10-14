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






