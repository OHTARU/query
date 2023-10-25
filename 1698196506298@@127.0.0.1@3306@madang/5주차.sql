-- Active: 1693963762825@@127.0.0.1@3306@madang

SELECT custid,count(custid) as "수량" ,
(SELECT name from customer where customer.custid=orders.custid)
FROM orders GROUP BY custid;


SELECT saleprice,custid,sum(saleprice) as "합계" FROM orders GROUP BY custid,saleprice; #group by // select 한것 중에 group by를 해야함

SELECT * FROM book ORDER BY bookname DESC; # order by

SELECT name,sum(B.saleprice) FROM customer as A inner join orders as B on A.custid = B.custid # inner join 
GROUP BY A.name,A.custid
ORDER BY A.custid; 

SELECT * FROM customer as A inner join orders as B
on A.custid = B.custid;

SELECT name,saleprice from customer A left outer JOIN orders B on A.custid = B.custid;
--inner join book C on B.bookid = C.bookid;
--where price <= 10000;


SELECT * FROM orders;


SELECT bookname FROM book
where price = (SELECT max(price) from book); #한권 = // 여러권 in

SELECT bookname FROM book limit 3,5;

SELECT name from customer where custid in 
(SELECT custid from orders where bookid in(SELECT bookid from book))
and name like "%박%";

SELECT bookname FROM book A where A.price > (SELECT avg(price) from book B where A.publisher=B.publisher);

SELECT bookname,publisher,'' from book
UNION
SELECT name,custid,name from customer;

SELECT name FROM customer
where address like "대한민국%" and name in (
    SELECT name from customer WHERE custid in (SELECT custid FROM orders)
);

