-- Active: 1693963762825@@127.0.0.1@3306@madang
select * from customer;
SELECT * from book;
SELECT * from orders;

select * from customer where name='박지성' or name='박세리'; # 셀렉션

select name,address from customer; #프로젝션

select name,address as publisher from customer
UNION 
select bookname,publisher from book; # 합집합

SELECT * from customer inner join book on  customer.custid = book.bookid 
    inner join orders on book.bookid = orders.bookid; #조인 (동등조인)

SELECT bookname, publisher from book;

select * from book where price <= 8000 and bookid >= 3;

select * from book where price <= 8000 or bookid >= 3;

SELECT name,address,phone from customer; # 프로젝션


SELECT * from book UNION all select * from book;

SELECT * FROM book A inner join  book B on A.bookname = B.bookname and A.publisher = B.publisher;

SELECT * from customer inner join book; # 카티션곱
SELECT count(*) from customer inner join book;  # 카티션곱 카운트세기

SELECT A.NAME, a.address, B.saleprice, C.bookname from customer as A 
inner join orders as B on A.custid = B.custid
inner join book as C on B.bookid = C.bookid 
where A.name ='박지성';

SELECT * FROM customer as A right outer join orders as B on A.custid = B.custid; 

SELECT * FROM orders as A right outer join customer as B on A.custid = B.custid;

SELECT * FROM customer inner join orders on customer.custid = orders.custid;

SELECT custid,name from customer;

SELECT custid,count(custid) as "수량" ,
(SELECT name from customer where customer.custid=orders.custid)
FROM orders GROUP BY custid;

SELECT * FROM orders;