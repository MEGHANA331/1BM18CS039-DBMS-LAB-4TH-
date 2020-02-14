CREATE DATABASE Banking_Enterprise;
USE Banking_Enterprise;
CREATE TABLE Branch(
Branchname varchar(50),
Branchcity varchar(50),
Assets varchar(30),
PRIMARY KEY(Branchname)
);
INSERT INTO Branch(Branchname,Branchcity,Assets)
VALUES('SBI_Chamrajpet','Bangalore','50000');
INSERT INTO Branch(Branchname,Branchcity,Assets)
VALUES('SBI_RecidencyRoad','Bangalore','10000');
INSERT INTO Branch(Branchname,Branchcity,Assets)
VALUES('SBI_ShivajiRoad','Bombay','20000');
INSERT INTO Branch(Branchname,Branchcity,Assets)
VALUES('SBI_ParliamentRoad','Delhi','10000');
INSERT INTO Branch(Branchname,Branchcity,Assets)
VALUES('SBI_Jantarmantar','Delhi','20000');
SELECT * FROM Branch;
CREATE TABLE Bankaccount(
Accno int,
Branchname varchar(30),
Balance varchar(30),
PRIMARY KEY (Accno),
FOREIGN KEY (Branchname) REFERENCES Branch (Branchname)
);


INSERT INTO Bankaccount(Accno,Branchname,Balance)
VALUES(1,'SBI_Chamrajpet','2000');
INSERT INTO Bankaccount(Accno,Branchname,Balance)
VALUES(2,'SBI_ResidencyRoad','5000');
INSERT INTO Bankaccount(Accno,Branchname,Balance)
VALUES(3,'SBI_ShivajiRoad','6000');
INSERT INTO Bankaccount(Accno,Branchname,Balance)
VALUES(4,'SBI_ParliamentRoad','9000');
INSERT INTO Bankaccount(Accno,Branchname,Balance)
VALUES(5,'SBI_Jantarmantar','8000');

