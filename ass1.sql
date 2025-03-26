create database Techshop;
use Techshop;

create table customer(
customerid int primary key identity(1,1)  ,
firstname varchar(50),
lastname varchar(50),
Email varchar(100),
phone int ,
customeraddress varchar(100)
);

insert into customer values('akila','s','akilas@gmail.com',123456789,'podanur');
insert into customer values('anu','p','anu12@gmail.com',987654321,'thekallur');
insert into customer values('arthi','s','arthi@gmail.com',234567891,'karumathampatti');
insert into customer values('divya','v','divyav@gmail.com',345678912,'somanur');
insert into customer values('bhoomi','s','bhoomika@gmail.com',456789123,'sellur');
insert into customer values('pooja','k','poojak@gmail.com',567891234,'othakada');
insert into customer values('aarthi','kc','aarthikc@gmail.com',678912345,'kongu main road');
insert into customer values('akshaya','p','akshaya@gmail.com',789123456,'ms nagar');
insert into customer values('kaviya','G','kaviyag@gmail.com',891234567,'kaniyur');
insert into customer values('parvathi','c','parvathi@gmail.com',912345678,'snvs layout ');
select * from customer;

create table products(
product_id int  primary key identity(11,1),
product_name varchar(50),
product_detail varchar(100),
price int
);
select*from products;

insert into products values('watch','Galaxy Fit3 (Bluetooth, 4.0 cm)',5000);
insert into products values('phone','Galaxy S25 Ultra',50000);
insert into products values('laptop','HP Laptop 39.6 cm (15.6) 15-fd0111TU, Silver',60000);
insert into products values('USB','SanDisk 128 GB ultra dual luxe type',1000);
insert into products values('headphones','boAt Rockerz 550 Over Ear Bluetooth Headphones with Upto 20H Playback',3000);
insert into products values('computer','Lenovo IdeaCentre AIO All-in-One 3i Intel Core i3 12th Gen Windows 11 Home Desktop PC,',70000);
insert into products values('TV','LG 80 cm HD Ready Smart LED TV',30000);
insert into products values('charger','Samsung 45W Original Charger Adapter Ultra Fast Charging',800);
insert into products values('microwave oven','samsung 23 L Quick Defrost Solo Microwave Oven MS23A3513AK',15000);
insert into products values('electric kettle','Pigeon Favourite Electric Kettle  (1.2 L, Silver, Black)',1500);
select * from products;

create table orders(
order_id int primary key identity(100,1),
order_date date,
total_amt int,
customerid int constraint FJ_customer_id Foreign key references customer (customerid) on delete cascade
);


 insert into orders values('2025-01-23',5000,1);
 insert into orders values('2025-02-11',50000,2);
 insert into orders values('2025-02-24',60000,3);
 insert into orders values('2025-02-27',1000,4);
 insert into orders values('2025-03-04',3000,5);
 insert into orders values('2025-03-13',70000,6);
 insert into orders values('2025-03-18',30000,7);
 insert into orders values('2025-03-21',800,8);
 insert into orders values('2025-03-27',15000,9);
 insert into orders values('2025-03-30',1500,10);
 select * from orders;

 create table orderDetails(
 orderdetail_id  int identity(200,1) primary key ,
 quantity int,
 order_id int constraint FJ_order_id Foreign key references orders (order_id) on delete cascade,
 product_id int constraint FJ_product_id Foreign key references products (product_id) on delete cascade
 );
  
  insert into orderDetails values(1,100,11)
  insert into orderDetails values(1,101,12)
  insert into orderDetails values(1,102,13)
  insert into orderDetails values(1,103,14)
  insert into orderDetails values(1,104,15)
  insert into orderDetails values(1,105,16)
  insert into orderDetails values(1,106,17)
  insert into orderDetails values(1,107,18)
  insert into orderDetails values(1,108,19)
  insert into orderDetails values(1,109,20)

  select *from orderDetails

  create table inventory(
  inventory_id int primary key identity(300,1),
  quantityinstock int,
  laststockup int,
  product_id int constraint FJ_productid Foreign key references products (product_id) on delete cascade
  );

  insert into inventory values(10,9,11)
  insert into inventory values(5,4,12)
  insert into inventory values(6,5,13)
  insert into inventory values(7,8,14)
  insert into inventory values(3,2,15)
  insert into inventory values(12,11,16)
  insert into inventory values(9,8,17)
  insert into inventory values(8,7,18)
  insert into inventory values(14,13,19)
  insert into inventory values(17,16,20)
  select * from inventory
