--INDEX
--테이블에 있는 데이터를 빠르게 검색하기 위한 용도로 나온 데이터베이스 객체
--테이블에 하나 이상의 컬럼으로 인덱스를 만들 수 있음
--오라클에서는 기본적으로 테이블 기본키로 인덱스가 설정되어 있음
--생성한 모든 인덱스 객체 조회
SELECT * FROM USER_INDEXES;
--CREATE [UNIQUE] INDEX 인덱스명 ON 테이블명(컬럼1,컬럼2,....;)
--PERSON 테이블에 사람이름으로 인덱스 지정
CREATE INDEX PERSON_PNAME_IDX ON PERSON(PNAME);
CREATE UNIQUE INDEX PERSON_PNAME_IDX ON PERSON(PNAME);
INSERT INTO PERSON VALUES('0003','홍길동',33);
SELECT * FROM PERSON;

-- 인덱스 삭제
DROP INDEX PERSON_PNAME_IDX;

--리빌딩 작업
--데이터를 추가 삭제 수정등의 작업을 하다보면 트리가 한쪽로 치우쳐지는 현상이 나기 때문
ALTER INDEX PERSON_PNAME_IDX REBUILD;

--CAR_SELL 테이블에 판매날짜에 인덱스 적용
CREATE INDEX CAR_SELL_SELL_DATE_IDX ON CAR_SELL(CAR_SELL_DATE);

--사원 테이블에서 이름, 직급, 부서 인덱스를 적용
CREATE INDEX EMPLOYEE_IDX 
ON EMPLOYEE(EMP_NAME, POS_NO, DEPT_NO);













