use Techno
select * from customer
select * from products
select * from orders

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

