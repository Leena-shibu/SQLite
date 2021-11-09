CREATE TABLE `sandwich` (
  `sid` varchar(10) primary key,
  `name` varchar(30) DEFAULT NULL,
  `filling` varchar(30) DEFAULT NULL,
  `bread` varchar(30) DEFAULT NULL,
  `price` int DEFAULT NULL) ;
  
insert into sandwich values('s1',	'san-chicken',	'chicken',	'White',	50);
insert into sandwich values('s2',	'san-chicken',	'chicken',	'Brown',	55);
insert into sandwich values('s3',	'san-veggie',	'mixed veg',	'Brown',	50);
insert into sandwich values('s4',	'san-veggie',	'mixed veg',	'multi grain',	55);
insert into sandwich values('s5',	'san-aloo tikki',	'potato',	'Rye',	25);
insert into sandwich values('s6','san-mexican veg', 'veg  mayonnaise','White',45);
insert into sandwich values('s7',	'san-mixed cheese',	'cheese veg',	'White',	60);

select * from sandwich;
CREATE TABLE `sandwichorder` (
  `sid` varchar(10) references sandwich(sid),
  qty integer ) ;
  
  insert into sandwichorder values('s1',2),('s2',3),('s3',4);
  insert into sandwichorder values(null,1);
  --1. Display sandwich name and qty ordered
  
  --2.Display sandwich name which were ordered and not ordered
  
  --3. Display all the  orders with or without sandwich names
