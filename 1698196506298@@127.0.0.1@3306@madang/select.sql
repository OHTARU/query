-- Active: 1700809661554@@127.0.0.1@3306@madang

-- 가장 비싼 도서의 이름을 보이시오
SELECT bookname FROM book where price= (SELECT MAX(price) FROM book);

-- 도서를 구매한 적이 있는 고객의 이름을 검색하시오
SELECT name FROM customer where custid IN 
(SELECT custid FROM orders);

--대한미디어에서 출판한 도서를 구매한 고객의 이름을 보이시오.
SELECT name FROM customer WHERE custid IN 
(SELECT custid FROM orders WHERE bookid IN 
(SELECT bookid FROM book WHERE publisher="대한미디어"));

--출판사별로 출판사의 평균 도서 가격보다 비싼 도서를 구하시오.ADD
SELECT b1.bookname FROM book b1 WHERE b1.price > (SELECT avg(b2.price) FROM book b2 where b2.publisher = b1.publisher);

--대한민국에서 거주하는 고객의 이름과 도서를 주문한 고객의 이름을 보이시오
SELECT name FROM customer WHERE address LIKE '대한민국%'
UNION
SELECT name FROM customer WHERE custid IN (SELECT custid FROM orders);

--MINUS 연산 : 대한민국에서 거주하는 고객의 이름에서 도서를 주문한 고객의 이름 빼고 보이시오.(NOT IN 사용)
SELECT name
FROM CUSTOMER
WHERE address LIKE '대한민국%' AND name NOT IN 
(SELECT name FROM CUSTOMER WHERE custid IN (SELECT custid FROM ORDERS));


-- INTERSECT 연산 : 대한민국에서 거주하는 고객 중 도서를 주문한 고객의 이름 보이시오.(IN 사용)
SELECT name
FROM CUSTOMER
WHERE address LIKE '대한민국%' AND name IN 
(SELECT name FROM CUSTOMER WHERE custid IN (SELECT custid FROM ORDERS));

--주문이 있는 고객의 이름과 주소를 보이시오
SELECT name,address FROM customer cus WHERE EXISTS(SELECT * FROM orders od WHERE cus.custid = od.custid);