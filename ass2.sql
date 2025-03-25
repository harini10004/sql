
create database ass2;
use ass2;


create table customer(
    customer_id int primary key identity(1,1),
    firstname varchar(50),
    lastname varchar(50),
    email varchar(100),
    phone bigint, 
    customer_address varchar(100)
);


insert into customer  values('akila', 's', 'akilas@gmail.com', 1234567890, 'podanur')
insert into customer  values('anu', 'p', 'anu12@gmail.com', 9876543210, 'thekallur')
insert into customer  values('arthi', 's', 'arthi@gmail.com', 2345678910, 'karumathampatti')
insert into customer  values('divya', 'v', 'divyav@gmail.com', 3456789120, 'somanur')
insert into customer  values('bhoomi', 's', 'bhoomika@gmail.com', 4567891230, 'sellur')
insert into customer  values('pooja', 'k', 'poojak@gmail.com', 5678912340, 'othakada')
insert into customer  values('aarthi', 'kc', 'aarthikc@gmail.com', 6789123450, 'kongu main road')
insert into customer  values('akshaya', 'p', 'akshaya@gmail.com', 7891234560, 'ms nagar')
insert into customer  values('kaviya', 'g', 'kaviyag@gmail.com', 8912345670, 'kaniyur')
insert into customer  values('parvathi', 'c', 'parvathi@gmail.com', 9123456780, 'snvs layout')

select * from customer;


create table products(
    product_id int primary key identity(1,1),
    product_name varchar(50),
   product_details varchar(100),
    price int
);

insert into products values('watch', 'galaxy fit3 (bluetooth, 4.0 cm)', 5000)
insert into products values('phone', 'galaxy s25 ultra', 50000)
insert into products values('laptop', 'hp laptop 15-fd0111tu, silver', 60000)
insert into products values('usb', 'sandisk 128 gb ultra dual luxe type', 1000)
insert into products values('headphones', 'boat rockerz 550 over ear bluetooth headphones', 3000)
insert into products values('computer', 'lenovo ideacentre aio all-in-one 3i intel core i3', 70000)
insert into products values('tv', 'lg 80 cm hd ready smart led tv', 30000)
insert into products values('charger', 'samsung 45w ultra fast charging', 800)
insert into products values('microwave oven', 'samsung 23l quick defrost solo microwave oven', 15000)
insert into products values('electric kettle', 'pigeon favourite electric kettle', 1500)

select * from products;


create table orders(
    order_id int primary key identity(101,1),
    order_date date,
    total_amount int,
    customer_id int constraint FJ_customer_id Foreign key references customer (customer_id)
);

insert into orders values('2025-02-11', 5000, 1)
insert into orders values('2025-02-15', 50000, 2)
insert into orders values('2025-02-24', 60000, 3)
insert into orders values('2025-02-28', 1000, 4)
insert into orders values('2025-03-04', 3000, 5)
insert into orders values('2025-03-13', 70000, 6)
insert into orders values('2025-03-20', 30000, 7)
insert into orders values('2025-03-25', 800, 8)
insert into orders values('2025-03-28', 15000, 9)
insert into orders values('2025-03-30', 1500, 10)

select * from orders;


create table order_details(
   orderdetail_id  int primary key identity(201,1),
    quantity int,
    order_id int constraint FJ_order_id Foreign key references orders (order_id),
    product_id int constraint FJ_product_id Foreign key references products (product_id)
);

insert into order_details  values(1, 101, 1)
insert into order_details  values(1, 102, 2)
insert into order_details  values(1, 103, 3)
insert into order_details  values(1, 104, 4)
insert into order_details  values(1, 105, 5)
insert into order_details  values(1, 106, 6)
insert into order_details  values(1, 107, 7)
insert into order_details  values(1, 108, 8)
insert into order_details  values(1, 109, 9)
insert into order_details  values(1, 110, 10)

select * from order_details;

 --1. Write an SQL query to retrieve the names and emails of all customers.  
 select firstname ,lastname,Email from customer

 --2. Write an SQL query to list all orders with their order dates and corresponding customer name
 select order_id as orderid, orders.order_date, customer.firstname, customer.lastname 
from orders  join customer on orders.customer_id = customer.customer_id;

--3. Write an SQL query to insert a new customer record into the "Customers" table. Include customer information such as name, email, and address.
 insert into customer values ('priya', 'k', 'priya@gmail.com', 9876543210, 'kulikadu');

 --4. Write an SQL query to update the prices of all electronic gadgets in the "Products" table by increasing them by 10%.
 update products set price = price * 1.10 where product_name in ('watch','phone', 'laptop', 'usb', 'headphones', 'computer', 'tv', 'charger', 'microwave oven', 'electric kettle');
 
 --5. Write an SQL query to delete a specific order and its associated order details from the
--"Orders" and "OrderDetails" tables. Allow users to input the order ID as a parameter.
declare @order_id int = 101;  

delete from order_details where orderdetail_id = @order_id;
delete from orders where order_id = @order_id;

--6. Write an SQL query to insert a new order into the "Orders" table. Include the customer ID, order date, and any other necessary information.
insert into orders values ('2025-04-01', 12000, 3);

--7. Write an SQL query to update the contact information (e.g., email and address) of a specific customer in the "Customers" table. Allow users to input the customer ID and new contact
--information
declare @customer_id int = 2;  
declare @new_email varchar(100) = 'anup@gmail.com';
declare @new_address varchar(100) = '123 thekkallur';

update customer set email = @new_email, customer_address = @new_address where customer_id = @customer_id;

--8. Write an SQL query to recalculate and update the total cost of each order in the "Orders" table based on the prices and quantities in the "OrderDetails" table.
update orders set total_amount = ( select sum(p.price * od.quantity) from order_details od join products p on od.product_id = p.product_id 
    where od.order_id = orders.order_id
)

--9. Write an SQL query to delete all orders and their associated order details for a specific customer from the "Orders" and "OrderDetails" tables. Allow users to input the customer ID as a parameter.
declare @customers_id int = 3; 

delete from order_details where order_id in (select order_id from orders where customer_id = @customers_id);
delete from orders where customer_id = @customers_id;

--10. Write an SQL query to insert a new electronic gadget product into the "Products" table, including product name, category, price, and any other relevant details.
insert into products values ('tablet', 'samsung galaxy tab s9, 128gb', 45000);

