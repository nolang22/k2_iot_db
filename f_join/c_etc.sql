### f_join >>> c_etc ###

/*	3. 상호 조인 (CROSS JOIN)
	: 두 테이블의 모든 조합을 반환하는 조인
    - A CROSS JOIN B는 A의 각 행과 B의 각 행을 모두 조합
		> 결과 행수 : A의 행수 X B의 행수
        
	cf) ON 절이 필요 X
		-WHERE 절로 필터링하지 않을 경우 모든 조합이 출력되어 결과량이 많아질 수 있음
        
	cf) 더미 데이터 생산이 사용
*/
USE `korea_db`;

# 모든 회원과 모든 구매 정보 조합
SELECT M.NAME, P.PRODUCT_CODE, P.AMOUNT
FROM
	`MEMBERS` M
	CROSS JOIN `PURCHASES` P;
        
# 필터 조건과 함계 사용
# > 회원의 MEMBER_ID와 구매의 MEMBER_ID가 일치하는 경우 필터링
# > 내부 조인과 같은 결과
SELECT M.NAME, P.PRODUCT_CODE, P.AMOUNT
FROM
	`MEMBERS` M
	CROSS JOIN `PURCHASES` P
WHERE
	M.MEMBER_ID = P.MEMBER_ID;

/*	4. 자체 조인(SELF JOIN)
	: 자기 자신을 기준으로 한 조인
	- 실제 테이블은 자기 자신 하나이지만
		, 테이블을 두번 사용하는 것처럼 별칭(alias)을 부여 하여 조인
*/

# 같은 지역에 사는 회원끼리 묶기
# area_code
SELECT
	A.NAME AS '회원1', B.NAME AS '회원2', A.AREA_CODE
FROM
		`MEMBERS` A
        JOIN `MEMBERS` B
        ON A.AREA_CODE = B.AREA_CODE
WHERE
	-- 중복 제거
    A.MEMBER_ID < B.MEMBER_ID;
    
# 등급이 같은 회원끼리 묶기 #
SELECT
	A.NAME '회원1', B.NAME '회원2', A.GRADE
FROM
	`MEMBERS` A
    JOIN `MEMBERS` B
    ON A.GRADE = B.GRADE
WHERE
	A.MEMBER_ID < B.MEMBER_ID;