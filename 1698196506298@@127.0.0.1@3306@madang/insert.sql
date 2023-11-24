-- Active: 1700809661554@@127.0.0.1@3306@madang


-- book테이블에 새로운 도서 '스포츠 의학'을 삽입하시오. 스포츠 의학은 한솔의학서적에서 출간했으며 가격은 90,000원이다.
INSERT INTO book(bookid, bookname, publisher, price)
    VALUES(11,'스포츠 의학','한솔의학서적',90000);

SELECT * FROM book;

--book 테이블에 새로운 도서 '스포츠 의학'을 삽입하시오. 스포츠 의학은 한솔의학서적에서 출간했으며 가격은 미정이다.
INSERT INTO book(bookid, bookname, publisher)
    VALUES(14,'스포츠 의학','한솔의학서적');

--수입도서 목록(imported_book)을 book테이블에 모두 삽입하시오. (imported_book 테이블은 스크립트 book 테이블과 같이 이미 만들어져 있음)
INSERT INTO book(bookid, bookname,price,publisher) SELECT bookid, bookname,price, publisher FROM imported_book;

--book 테이블에서 도서번호가 11인 도서를 삭제하시오.
DELETE FROM book where bookid = '11';

--모든 고객을 삭제하시오.
DELETE FROM customer;

