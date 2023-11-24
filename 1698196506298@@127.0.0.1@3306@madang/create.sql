-- Active: 1700809661554@@127.0.0.1@3306@madang

-- NEWBOOK 만드는 CREATE 문
CREATE TABLE NEWBOOK (
bookid INTEGER,
bookname VARCHAR(20),
publisher VARCHAR(20),
price INTEGER
);
-- newbook에서 bookid 를 pk로 지정하고싶을때
CREATE TABLE newbook (
bookid INTEGER PRIMARY KEY,
bookname VARCHAR(20),
publisher VARCHAR(20),
price INTEGER
);
-- newbook bookname,publisher가 기본키가 되는 복합키 지정
CREATE TABLE NEWBOOK (
bookname VARCHAR(20),
publisher VARCHAR(20),
price INTEGER,
PRIMARY KEY (bookname, publisher)
);

-- bookname = not null , publisher = UNIQUE , price DEFAULT = 100000 & 최소가격 1000 , PK = bookname, publisher
CREATE TABLE newbook (
    bookname VARCHAR(20) NOT NULL,
    publisher VARCHAR(20) UNIQUE,
    price INTEGER DEFAULT 100000 CHECK(price > 1000),
    PRIMARY KEY (bookname,publisher)
);

-- 다음과 같은 속성을 가진 NEWORDERS 테이블을 생성하시오.
-- • orderid(주문번호) - INTEGER, 기본키
-- • custid(고객번호) - INTEGER, NOT NULL 제약조건, 외래키(NEWCUSTOMER.custid, 연쇄
-- 삭제)
-- • bookid(도서번호) - INTEGER, NOT NULL 제약조건
-- • saleprice(판매가격) - INTEGER
-- • orderdate(판매일자) – DATE
CREATE TABLE NEWORDERS (
orderid INTEGER,
custid INTEGER NOT NULL,
bookid INTEGER NOT NULL,
saleprice INTEGER,
orderdate DATE,
PRIMARY KEY (orderid),
FOREIGN KEY (custid) REFERENCES NEWCUSTOMER(custid) ON DELETE CASCADE );

--newbook 테이블에 varchar(13)의 자료형을 가진 isbn 속성을 추가하시오.
ALTER TABLE newbook ADD isbn VARCHAR(13);

--newbook 테이블의 isbn 속성의 데이터 타입을 interger 형으로 변경하시오.
ALTER TABLE newbook MODIFY isbn INTEGER;

--newbook 테이블의 isbn 속성을 삭제하시오
ALTER TABLE newbook DROP COLUMN isbn;

--newbook 테이블의 bookid 속성에 not null 제약조건을 적용하시오
ALTER TABLE newbook MODIFY bookid INTEGER NOT NULL;

--newbook 테이블의 bookid 속성을 기본키로 변경하시오
ALTER Table newbook ADD PRIMARY KEY(bookid);

--newbook 테이블을 삭제하시오
DROP Table newbook;

--newcustomer 테이블을 삭제하시오. 만약 삭제가 거절되면 원일을 파악 후 관련된 테이블 같이 삭제
DROP Table customer;