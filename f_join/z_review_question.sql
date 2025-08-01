### f_join >>> z_review_question ###

USE `KOREA_DB`;

SELECT * FROM `MEMBERS`;
SELECT * FROM `PURCHASES`;


--  문제 1
-- 	모든 회원의 이름, 등급, 구매한 상품 코드, 구매일, 구매 금액(amount)을 조회하세요.
-- 	구매 기록이 없는 회원도 모두 포함되도록 하세요.
-- 	단, 구매일이 오래된 순으로 정렬하세요.
SELECT 
	M.NAME, M.GRADE, P.PRODUCT_CODE, P.PURCHASE_DATE, P.AMOUNT
FROM
	`MEMBERS` M
    JOIN `PURCHASES` P
    ON M.MEMBER_ID = P.MEMBER_ID
ORDER BY
	PURCHASE_DATE;

-- 	문제 2
-- 	2023년 이후 가입한 회원 중 구매 총액이 30000원 이상인 
--  회원의 이름, 지역코드, 총 구매금액을 조회하세요.
SELECT 
	M.NAME, M.AREA_CODE, SUM(P.AMOUNT * P.QUANTITY)
FROM
	`MEMBERS` M
    JOIN `PURCHASES` P
    ON M.MEMBER_ID = P.MEMBER_ID
WHERE
	M.JOIN_DATE > 2023
GROUP BY
	M.MEMBER_ID
HAVING
	SUM(P.AMOUNT * P.QUANTITY) >= 30000;

-- 	문제 3
-- 	회원 등급별로 구매 총액 평균을 구하고,
-- 	회원 등급(grade), 구매건수(COUNT), 구매총액합계(SUM), 구매평균(AVG)을 모두 출력하세요.
--  단, 구매가 한 건도 없는 등급은 제외하세요.
SELECT 
	M.GRADE, COUNT(P.AMOUNT * P.QUANTITY) AS '갯수', SUM(P.AMOUNT * P.QUANTITY), AVG(P.AMOUNT * P.QUANTITY)
