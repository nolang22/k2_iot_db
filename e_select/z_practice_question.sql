### e_select >>> z_practice_question ###

use `korea_db`;
# members, purchases 테이블 사용
SELECT * FROM `MEMBERS`;
SELECT * FROM `PURCHASES`;

-- 1. 모든 회원의 이름, 연락처, 회원등급을 조회하시오.
SELECT NAME, CONTACT, GRADE
FROM `MEMBERS`;

-- 2. 'SEOUL'에 거주하는 회원의 이름과 회원등급을 조회하시오.
SELECT 
	NAME, GRADE
FROM
	`MEMBERS`
WHERE
	AREA_CODE = 'SEOUL';
    
-- 3. 회원등급이 'Gold' 이상인 회원의 이름과 가입일을 조회하시오.
SELECT
	NAME, JOIN_DATE
FROM
	`MEMBERS`
WHERE
	GRADE NOT IN('BRONZE', 'SILVER');

-- 4. 2023년도에 가입한 회원의 이름과 가입일을 조회하시오.
SELECT
	NAME, JOIN_DATE
FROM
	`MEMBERS`
WHERE
	YEAR(JOIN_DATE) = 2023;

-- 5. 100포인트 이상을 가진 회원의 이름과 포인트를 조회하시오.
SELECT
	NAME, POINTS
FROM
	`MEMBERS`
WHERE
	POINTS >= 100;

-- 6. 'Male' 성별의 회원 중에서 'Gold' 등급 이상의 회원을 조회하시오.
SELECT *
FROM
	`MEMBERS`
WHERE
	GENDER = 'MALE'
AND GRADE NOT IN ('BRONZE', 'SILVER');

-- 7. 최근에 구매한 회원과 구매일을 조회하시오. (가장 최근 구매일 기준 상위 3명)
-- group by, 집계함수, order by, limit
SELECT 
	MEMBER_ID, MAX(PURCHASE_DATE) AS LAST_PURCHASE_DATE
FROM
	`PURCHASES`
GROUP BY
	MEMBER_ID	
ORDER BY
	MAX(PURCHASE_DATE) DESC
LIMIT 3;
	

-- 8. 회원별로 구매한 총 금액(amount의 합)을 조회하시오.
-- group by, 집계함수
SELECT 
	MEMBER_ID, SUM(AMOUNT * QUANTITY)
FROM
	`PURCHASES` 
GROUP BY
	MEMBER_ID;
    