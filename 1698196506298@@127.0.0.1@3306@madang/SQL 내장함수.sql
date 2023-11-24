-- Active: 1700809661554@@127.0.0.1@3306@madang

-- -78과 +78의 절댓값을 구하시오.
SELECT ABS(-78),ABS(+78) FROM Dual;

-- 4.875를 소수 첫째 자리까지 반올림한 값을 구하시오.
SELECT ROUND(4.875,1) FROM dual;

-- 고객별 평균 주문 금액을 백 원 단위로 반올림한 값을 구하시오.
SELECT custid '고객번호', ROUND(SUM(saleprice)/COUNT(*),-2) '평균금액' FROM orders GROUP BY custid;

