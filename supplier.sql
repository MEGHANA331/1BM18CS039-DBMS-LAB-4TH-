create databasesupdb ;
use supdb;
create table Supplier(
sid int,
sname varchar(30),
city varchar(30),
primary key(sid));
desc Supplier;
create table Parts(
pid int,
pname varchar(30),
color varchar(30),
primary key(pid));
create table Catalog(
sid int,
pid int,
cost int,
primary key(sid,pid),
foreign key (sid) references Supplier(sid),
foreign key (pid) references Parts(pid));
insert into Supplier values(10001,'Acme Widget','Bangalore'),(10002,'Johns','Kolkata'),(10003,'Vimal','Mumbai'),(10004,'Reliance','Delhi');
insert into Parts values(20001,'Book','Red'),(20002,'Pen','Red'),(20003,'pencil','Green'),(20004,'Mobile','Green'),(20005,'Charger','Black');
insert into Catalog values(10001,20001,10),(10001,20002,10),(10001,20003,30),(10001,20004,10),(10001,20005,10),(10002,20001,10),(10002,20002,20),(10003,20003,30),(10004,20003,40);
select distinct Supplier.sid 
from Supplier,Parts,Catalog
where Supplier.sid=Catalog.sid AND Parts.pid=Catalog.pid AND (Parts.color='Red' OR Parts.color='Green');
select distinct Supplier.sid
from Supplier,Parts,Catalog
where Supplier.city='Bangalore' OR (Supplier.sid=Catalog.sid AND Parts.pid=Catalog.pid AND Parts.color='Red');
select distinct C1.sid,C2.sid
from Catalog C1, Catalog C2
where C1.pid=C2.pid AND C1.cost>C2.cost AND C1.sid<>C2.sid;
select distinct Supplier.sid 
from Supplier,Parts,Catalog
where Supplier.sid=Catalog.sid AND Parts.pid=Catalog.pid AND Parts.color='Red';
select * from Supplier;
select * from Parts;
select * from Catalog;
