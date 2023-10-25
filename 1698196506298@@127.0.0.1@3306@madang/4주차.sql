-- Active: 1693963762825@@127.0.0.1@3306@madang

SELECT bookname, publisher from book
where price <= 8000; # 도서이름, 출판사를 가격이 8000원 미만인것만 가지고온다.ADD

SELECT bookname, publisher from book
where price <=8000
UNION all
SELECT bookname, publisher from book
where price <=8000;

SELECT bookname as title from book
UNION
SELECT name as title from customer where name like '%연%';
# %연% = ()연() 인 글자를 모두 가지고온다

SELECT orders.orderid, customer.name, saleprice,customer.custid from customer inner join orders on customer.custid = orders.custid
where customer.name ='박지성'

SELECT bookname,price from book; # 모든 도서의 / 이름과 / 가격을 불러와라


SELECT price,bookname from book;

SELECT bookid,bookname,publisher,price from book;

SELECT * from book;

SELECT publisher from book;

SELECT DISTINCT publisher from book; #DISTINCT = 중복값을 제외시킴

SELECT bookname,price from book where price <=20000;

-- 대시 두개는 주석처리
SELECT * from book where price BETWEEN 10000 and 20000;

SELECT * from book where publisher in ('굿스포츠','대한미디어');

SELECT * from book where publisher = '굿스포츠' or publisher = '대한미디어';
SELECT * from book where publisher not in ('굿스포츠','대한미디어');

SELECT bookname,publisher from book where bookname like'축구의 역사';

SELECT bookname,publisher from book where bookname like'%축구%';

SELECT * from book where bookname like '_구%';

SELECT * from book ORDER BY price;

SELECT * from book ORDER BY price,bookname;

SELECT * from book ORDER BY price DESC;
-- DESC 내림차순 , ASC 오름차순
SELECT * from book ORDER BY price;
SELECT * from book ORDER BY price ASC; # DEFAULT가 ASC 임

SELECT SUM(saleprice) from orders;

SELECT SUM(saleprice) as 총매출 from orders;

SELECT phone from customer where phone is not null;
SELECT count(phone) from customer where phone !='';

SELECT round(AVG(price)) from book;

SELECT COUNT(orderid) from book inner join orders on book.bookid = orders.bookid where price < 10000;

SELECT SUM(book.price) from book inner join orders on book.bookid = orders.bookid where price < 10000;

SELECT sum(saleprice) as total, avg(saleprice) as average, min(saleprice) as min, max(saleprice) as max from orders;

SELECT orders.custid,customer.name, COUNT(*) ,sum(saleprice), sum(saleprice)*100 , sum(saleprice) from orders
inner join customer on orders.custid = customer.custid
group by orders.custid;

--가격이 8,000원 이상인 도서를 구매한 고객에 대하여 고객별 주문 도서의 총 수량을 구하시오. 단, 두 권 이상 구매한 고객만 구한다.
SELECT custid,count(*) FROM orders where saleprice >= 8000 group by custid having count(*) >= 2;

SELECT custid FROM orders where saleprice GROUP BY custid having count(*) >= 3;


SELECT * FROM book  LIMIT 1,5; -- 1번부터 5개씩 보여줌

SELECT custid,bookid,sum(saleprice) FROM orders GROUP BY custid,bookid;

