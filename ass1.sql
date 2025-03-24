create database Techshop;
use Techshop;

create table customer(
customerid int constraint PK_customerid primary key,
firstname varchar(50),
lastname varchar(50),
Email varchar(50),
phone int ,
customeraddress varchar(50)
);
insert into customer values(1,'akila','s','akilas@gmail.com',123456789,'podanur');
insert into customer values(2,'anu','p','anu12@gmail.com',987654321,'thekallur');
insert into customer values(3,'arthi','s','arthi@gmail.com',234567891,'karumathampatti');
insert into customer values(4,'divya','v','divyav@gmail.com',345678912,'somanur');
insert into customer values(5,'bhoomi','s','bhoomika@gmail.com',456789123,'sellur');
insert into customer values(6,'pooja','k','poojak@gmail.com',567891234,'othakada');
insert into customer values(7,'aarthi','kc','aarthikc@gmail.com',678912345,'kongu main road');
insert into customer values(8,'akshaya','p','akshaya@gmail.com',789123456,'ms nagar');
insert into customer values(9,'kaviya','G','kaviyag@gmail.com',891234567,'kaniyur');
insert into customer values(10,'parvathi','c','parvathi@gmail.com',912345678,'snvs layout ');
select * from customer;

create table products(
product_id int primary key,
product_name varchar(50),
product_detail varchar(100),
price int
);
select*from products;

insert into products values(11,'watch','Galaxy Fit3 (Bluetooth, 4.0 cm)',5000);
insert into products values(12,'phone','Galaxy S25 Ultra',50000);
insert into products values(13,'laptop','HP Laptop 39.6 cm (15.6) 15-fd0111TU, Silver',60000);
insert into products values(14,'USB','SanDisk 128 GB ultra dual luxe type',1000);
insert into products values(15,'headphones','boAt Rockerz 550 Over Ear Bluetooth Headphones with Upto 20H Playback',3000);
insert into products values(16,'computer','Lenovo IdeaCentre AIO All-in-One 3i Intel Core i3 12th Gen Windows 11 Home Desktop PC,',70000);
insert into products values(17,'TV','LG 80 cm HD Ready Smart LED TV',30000);
insert into products values(18,'charger','Samsung 45W Original Charger Adapter Ultra Fast Charging',800);
insert into products values(19,'microwave oven','samsung 23 L Quick Defrost Solo Microwave Oven MS23A3513AK',15000);
insert into products values(20,'electric kettle','Pigeon Favourite Electric Kettle  (1.2 L, Silver, Black)',1500);
select * from products;

create table orders(
order_id int primary key,
order_date varchar(100),
total_amt int,
customerid int constraint FJ_customer_id Foreign key references customer (customerid)
);
 insert into orders values(101,'11/2/2025',5000,1);
 insert into orders values(102,'15/2/2025',50000,2);
 insert into orders values(103,'24/2/2025',60000,3);
 insert into orders values(104,'28/2/2025',1000,4);
 insert into orders values(105,'4/3/2025',3000,5);
 insert into orders values(106,'13/3/2025',70000,6);
 insert into orders values(107,'20/3/2025',30000,7);
 insert into orders values(108,'25/3/2025',800,8);
 insert into orders values(109,'28/3/2025',15000,9);
 insert into orders values(110,'30/3/2025',1500,10);
 select * from orders;

 create table orderDetails(
 orderdetail_id  int  primary key ,
 quantity int,
 order_id int constraint FJ_order_id Foreign key references orders (order_id),
 product_id int constraint FJ_product_id Foreign key references products (product_id)
 );
  
  insert into orderDetails values(201,1,101,11)
  insert into orderDetails values(202,1,102,12)
  insert into orderDetails values(203,1,103,13)
  insert into orderDetails values(204,1,104,14)
  insert into orderDetails values(205,1,105,15)
  insert into orderDetails values(206,1,106,16)
  insert into orderDetails values(207,1,107,17)
  insert into orderDetails values(208,1,108,18)
  insert into orderDetails values(209,1,109,19)
  insert into orderDetails values(210,1,110,20)

  select *from orderDetails

  create table inventory(
  inventory_id int primary key,
  quantityinstock int,
  laststockup int,
  product_id int constraint FJ_productid Foreign key references products (product_id)
  );

  insert into inventory values(301,10,9,11)
  insert into inventory values(302,5,4,12)
  insert into inventory values(303,6,5,13)
  insert into inventory values(304,7,8,14)
  insert into inventory values(305,3,2,15)
  insert into inventory values(306,12,11,16)
  insert into inventory values(307,9,8,17)
  insert into inventory values(308,8,7,18)
  insert into inventory values(309,14,13,19)
  insert into inventory values(310,17,16,20)
  select * from inventory
