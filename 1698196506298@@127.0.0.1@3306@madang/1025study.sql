-- Active: 1698196506298@@127.0.0.1@3306@madang
-- 부속질의
select custid, 
(select address from customer cs where cs.custid = od.custid) address,
(select name from customer cs where cs.custid = od.custid),
(select count(0) from book) as book_count,
sum(saleprice) from orders od 
GROUP BY custid;

select name, address from customer;

update orders set bookname = (select bookname from book where book.bookid=orders.bookid);

select cs.name, od.saleprice
from orders od, customer cs where cs.custid = od.custid;

SELECT cs.name, SUM(od.saleprice) ‘total’
FROM (SELECT custid, name
FROM Customer
WHERE custid <= 2) cs,
Orders od
WHERE cs.custid=od.custid
GROUP BY cs.name;

SELECT orderid, saleprice
FROM ORDERS
WHERE saleprice <= (SELECT AVG(saleprice) FROM Orders);

SELECT orderid, custid, saleprice
FROM ORDERS od
WHERE saleprice > (SELECT AVG(saleprice)
FROM ORDERS so WHERE od.custid=so.custid);

-- VIEW

CREATE view vorders as
select orderid, O.custid, name, O.bookid, bookname, saleprice, orderdate
from customer C, orders O, book B
where C.custid = O.custid and B.bookid = O.bookid;

select * from vorders;

drop view vorders;

