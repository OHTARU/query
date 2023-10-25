-- Active: 1693963762825@@127.0.0.1@3306@madang

-- create table newbook2 (
--     bookid INTEGER,
--     bookname VARCHAR(20),
--     publisher CHAR(20),
--     price INTEGER,
--     PRIMARY KEY(bookid)
-- )

CREATE Table newbook4(
    bookname VARCHAR(20) not null,
    publisher VARCHAR(20) UNIQUE,
    price INTEGER DEFAULT 10000 check(price > 1000),
    PRIMARY KEY(bookname,publisher)
)

-- INSERT INTO newbook3 VALUES('database','한빛출판사','1001');

-- SELECT * from newbook3;

-- CREATE Table neworders(
--     orderid INTEGER not NULL AUTO_INCREMENT PRIMARY KEY, # AUTO_INCREMENT 란,
--     custid INTEGER not null,
--     bookid INTEGER not null,
--     saleprice INTEGER,
--     orderdate date,
--     Foreign Key (custid) REFERENCES customer(custid) on delete CASCADE
--     )

-- INSERT into neworders (orderid, custid,bookid,saleprice,orderdate) VALUES (2,1,1,1000,null);


-- delete from neworders where orderid=2;

-- select * from neworders;

ALTER table newbook add isbn VARCHAR(13);

ALTER table newbook MODIFY isbn INTEGER;

ALTER table newbook drop COLUMN isbn;

ALTER Table newbook MODIFY bookid INTEGER not null;

insert into newbook4 VALUES('database','한빛출판사1',1001);

select * from newbook4;

drop table newbook4;

drop table customer;

INSERT into book(bookid,bookname,publisher,price) VALUES (11,'스포츠의학','한솔의학서적',9000);

UPDATE book set publisher = (SELECT publisher from imported_book WHERE bookid = 1000)
where bookid = 14;

SELECT * from book where bookid =13;

DELETE from imported_book;