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





