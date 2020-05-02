 
CREATE TABLE PUBLISHER 
(NAME VARCHAR2 (20) PRIMARY KEY, 
PHONE INTEGER, 
ADDRESS VARCHAR2 (20)); 

CREATE TABLE BOOK 
(BOOK_ID INTEGER PRIMARY KEY, 
TITLE VARCHAR2 (20), 
PUB_YEAR VARCHAR2 (20), 
PUBLISHER_NAME REFERENCES PUBLISHER (NAME) ON DELETE CASCADE);


CREATE TABLE BOOK_AUTHORS 
(AUTHOR_NAME VARCHAR2 (20), 
BOOK_ID REFERENCES BOOK (BOOK_ID) ON DELETE CASCADE, 
PRIMARY KEY (BOOK_ID, AUTHOR_NAME)); 

CREATE TABLE LIBRARY_BRANCH 
(BRANCH_ID INTEGER PRIMARY KEY, 
BRANCH_NAME VARCHAR2 (50), 
ADDRESS VARCHAR2 (50)); 


CREATE TABLE BOOK_COPIES 
(NO_OF_COPIES INTEGER, 
BOOK_ID REFERENCES BOOK (BOOK_ID) ON DELETE CASCADE, 
BRANCH_ID REFERENCES LIBRARY_BRANCH (BRANCH_ID) ON DELETE CASCADE, 
PRIMARY KEY (BOOK_ID, BRANCH_ID)); 


CREATE TABLE CARD 
(CARD_NO INTEGER PRIMARY KEY); 

CREATE TABLE BOOK_LENDING 
(DATE_OUT DATE, 
DUE_DATE DATE, 
BOOK_ID REFERENCES BOOK (BOOK_ID) ON DELETE CASCADE, 
BRANCH_ID REFERENCES LIBRARY_BRANCH (BRANCH_ID) ON DELETE CASCADE, 
CARD_NO REFERENCES CARD (CARD_NO) ON DELETE CASCADE, 
PRIMARY KEY (BOOK_ID, BRANCH_ID, CARD_NO));


Insertion of Values to Tables 
INSERT INTO PUBLISHER VALUES (‗MCGRAW-HILL‘, 9989076587, ‗BANGALORE‘); 
INSERT INTO PUBLISHER VALUES (‗PEARSON‘, 9889076565, ‗NEWDELHI‘); 
INSERT INTO PUBLISHER VALUES (‗RANDOM HOUSE‘, 7455679345, ‗HYDRABAD‘); 
INSERT INTO PUBLISHER VALUES (‗HACHETTE LIVRE‘, 8970862340, ‗CHENAI‘); 
INSERT INTO PUBLISHER VALUES (‗GRUPO PLANETA‘, 7756120238, ‗BANGALORE‘); 


INSERT INTO BOOK VALUES (1,‘DBMS‘,‘JAN-2017‘, ‗MCGRAW-HILL‘); 
INSERT INTO BOOK VALUES (2,‘ADBMS‘,‘JUN-2016‘, ‗MCGRAW-HILL‘); 
INSERT INTO BOOK VALUES (3,‘CN‘,‘SEP-2016‘, ‗PEARSON‘); 
INSERT INTO BOOK VALUES (4,‘CG‘,‘SEP-2015‘, ‗GRUPO PLANETA‘); 
INSERT INTO BOOK VALUES (5,‘OS‘,‘MAY-2016‘, ‗PEARSON‘); 

INSERT INTO BOOK_AUTHORS VALUES (‘NAVATHE‘, 1); 
INSERT INTO BOOK_AUTHORS VALUES (‘NAVATHE‘, 2); 
INSERT INTO BOOK_AUTHORS VALUES (‘TANENBAUM‘, 3); 
INSERT INTO BOOK_AUTHORS VALUES (‘EDWARD ANGEL‘, 4); 
INSERT INTO BOOK_AUTHORS VALUES (‘GALVIN‘, 5); 

INSERT INTO LIBRARY_BRANCH VALUES (10,‘RR NAGAR‘,‘BANGALORE‘); 
INSERT INTO LIBRARY_BRANCH VALUES (11,‘RNSIT‘,‘BANGALORE‘); 
INSERT INTO LIBRARY_BRANCH VALUES (12,‘RAJAJI NAGAR‘, ‘BANGALORE‘); 
INSERT INTO LIBRARY_BRANCH VALUES (13,‘NITTE‘,‘MANGALORE‘); 
INSERT INTO LIBRARY_BRANCH VALUES (14,‘MANIPAL‘,‘UDUPI‘); 

INSERT INTO BOOK_COPIES VALUES (10, 1, 10); 
INSERT INTO BOOK_COPIES VALUES (5, 1, 11); 
INSERT INTO BOOK_COPIES VALUES (2, 2, 12); 
INSERT INTO BOOK_COPIES VALUES (5, 2, 13); 
INSERT INTO BOOK_COPIES VALUES (7, 3, 14); 
INSERT INTO BOOK_COPIES VALUES (1, 5, 10); 
INSERT INTO BOOK_COPIES VALUES (3, 4, 11); 

INSERT INTO CARD VALUES (100); 
INSERT INTO CARD VALUES (101); 
INSERT INTO CARD VALUES (102); 
INSERT INTO CARD VALUES (103); 
INSERT INTO CARD VALUES (104);

INSERT INTO BOOK_LENDING VALUES (‘01-JAN-17‘,‘01-JUN-17‘, 1, 10, 101); 
INSERT INTO BOOK_LENDING VALUES (‘11-JAN-17‘,‘11-MAR-17‘, 3, 14, 101); 
INSERT INTO BOOK_LENDING VALUES (‘21-FEB-17‘,‘21-APR-17‘, 2, 13, 101); 
INSERT INTO BOOK_LENDING VALUES (‘15-MAR-17‘,‘15-JUL-17‘, 4, 11, 101); 
INSERT INTO BOOK_LENDING VALUES (‗12-APR-17‘,‘12-MAY-17‘, 1, 11, 104); 

SELECT *FROM PUBLISHER;
SELECT * FROM BOOK;
SELECT *FROM BOOK_AUTHORS;
SELECT *FROM BOOK_COPIES;
SELECT *FROM CARD;
SELECT *FROM BOOK_LENDING

1. Retrieve details of all books in the library – id, title, name of publisher, authors, number of copies in each branch, etc. 

SELECT B.BOOK_ID, B.TITLE, B.PUBLISHER_NAME, A.AUTHOR_NAME, C.NO_OF_COPIES, L.BRANCH_ID 
FROM BOOK B, BOOK_AUTHORS A, BOOK_COPIES C, LIBRARY_BRANCH L 
WHERE B.BOOK_ID=A.BOOK_ID 
AND B.BOOK_ID=C.BOOK_ID 
AND L.BRANCH_ID=C.BRANCH_ID;

2. Get the particulars of borrowers who have borrowed more than 3 books, but from Jan 2017 to Jun 2017. 
SELECT CARD_NO 
FROM BOOK_LENDING 
WHERE DATE_OUT BETWEEN ‘01-JAN-2017‘ AND ‘01-JUL-2017‘ 
GROUP BY CARD_NO 
HAVING COUNT (*)>3;

3. Delete a book in BOOK table. Update the contents of other tables to reflect this data manipulation operation. 
DELETE FROM BOOK 
WHERE BOOK_ID=3;

4. Partition the BOOK table based on year of publication. Demonstrate its working with a simple query. 
CREATE VIEW V_PUBLICATION AS 
SELECT PUB_YEAR 
FROM BOOK;

5. Create a view of all books and its number of copies that are currently available in the Library. 
CREATE VIEW V_BOOKS AS 
SELECT B.BOOK_ID, B.TITLE, C.NO_OF_COPIES 
FROM BOOK B, BOOK_COPIES C, LIBRARY_BRANCH L 
WHERE B.BOOK_ID=C.BOOK_ID 
AND C.BRANCH_ID=L.BRANCH_ID;

