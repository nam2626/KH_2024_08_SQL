--그룹함수
--	테이블에 있는 데이터를 특정 컬럼을 기준으로 통계값을 구하는 함수
--	윈도우 함수의 PARTITION 처럼 특정 컬럼에 동일한 데이터들을 묶어서 통계값 구함
--	예> 학생 테이블에서 학과별 평점의 평균, 학과별 인원수
--	SUM, AVG, COUNT, MAX, MIN, STDDEV, VARIANCE
--학과별 평점의 총합을 조회
SELECT MAJOR_NAME, SUM(STD_SCORE)
FROM STUDENT
GROUP BY MAJOR_NAME;
--학과별 평점의 평균을 조회
SELECT MAJOR_NAME, TRUNC(AVG(STD_SCORE),2) AS AVG_SCORE
FROM STUDENT
GROUP BY MAJOR_NAME;
-- 학과별 평점의 최대값, 최소값을 조회
SELECT 
	MAJOR_NAME, MAX(STD_SCORE), MIN(STD_SCORE), COUNT(*) 
FROM STUDENT 
GROUP BY MAJOR_NAME;

-- 학과별 인원수를 조회, 평점이 3.0 이상인 학생들만 조회
SELECT MAJOR_NAME, COUNT(*)
FROM STUDENT
WHERE STD_SCORE >= 3.0
GROUP BY MAJOR_NAME;

--학과별 인원수 조회시 학과 평균 점수가 3.5 이하인 학과만 조회
SELECT MAJOR_NAME, COUNT(*), AVG(STD_SCORE)
FROM STUDENT
GROUP BY MAJOR_NAME HAVING AVG(STD_SCORE) <= 3.5;
--현재 학생 테이블에 있는 데이터를 기준으로 학과별, 인원수를 조회
--단 조회하는 인원수가 3명 이상인 학과만 조회
SELECT MAJOR_NAME, COUNT(*)
FROM STUDENT
GROUP BY MAJOR_NAME HAVING COUNT(*) >= 3;










