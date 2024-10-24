--PL/SQL
--	데이터베이스에서 사용되는 절차적 언어
--	프로시저, 함수, 트리거 등의 형태로 작성을 할 수 있음
--	데이터 조작 및 비지니스 로직을 데이터베이스 내에서 직접 처리할 수 있음
-------------------------------------------------------
-- 함수
CREATE OR REPLACE FUNCTION GET_ODD_EVEN(N IN NUMBER)
RETURN VARCHAR2
IS 
	--함수에서 사용할 변수을 선언 영역
	MSG VARCHAR2(100);
BEGIN
	--실행 영역
	IF N = 0 THEN
		MSG := '0입니다.';
	ELSIF MOD(N, 2) = 0 THEN
		MSG := '짝수입니다.';
	ELSE
		MSG := '홀수입니다.';
	END IF;
	RETURN MSG;	
END;

SELECT
	GET_ODD_EVEN(10),
	GET_ODD_EVEN(11),
	GET_ODD_EVEN(0)
FROM
	DUAL;

CREATE OR REPLACE FUNCTION GET_SCORE_GRADE(SCORE IN NUMBER)
RETURN VARCHAR2
IS 
	MSG VARCHAR2(100);
	USER_EXCEPTION EXCEPTION;
BEGIN
	IF SCORE < 0 THEN
		RAISE USER_EXCEPTION;
	END IF;
	
	IF SCORE >= 90 THEN
		MSG := 'A';
	ELSIF SCORE >= 80 THEN
		MSG := 'B';
	ELSIF SCORE >= 70 THEN
		MSG := 'C';
	ELSIF SCORE >= 60 THEN
		MSG := 'D';
	ELSE
		MSG := 'F';
	END IF;
	RETURN MSG;
EXCEPTION
	WHEN USER_EXCEPTION THEN
		RETURN '점수는 0이상 입력해야합니다.';
	WHEN OTHERS THEN
		RETURN '알수 없는 에러 발생';
END;

SELECT
	GET_SCORE_GRADE(85),
	GET_SCORE_GRADE(-85)
FROM
	DUAL;





