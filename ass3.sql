use Techshop
alter table products
add category varchar(50);
select * from products
update products
set category = 
  case 
    when product_name ='watch'then 'wearable'
    when product_name = 'phone' then 'smartphone'
    when product_name = 'laptop' then 'laptop'  
    when product_name = 'usb' then 'storage'
    when product_name = 'headphones' then 'audio'
    when product_name = 'computer' then 'computer'  
    when product_name = 'tv' then 'tv'
    when product_name = 'charger' then 'accessory'
    when product_name = 'microwave oven' then 'home appliance'
    when product_name = 'electric kettle' then 'home appliance'
    when product_name ='tablet' then 'Tablet'
end;
  select * from products
  select * from orderDetails
  
  update orderDetails set quantity=3 where order_id=100

  --1. Write an SQL query to retrieve a list of all orders along with customer information (e.g.,
--customer name) for each order.
select o.order_id, o.order_date, o.total_amt, c.firstname, c.lastname, c.email, c.phone, c.customeraddress from orders o
join customer c on o.customerid = c.customerid;

--2. Write an SQL query to find the total revenue generated by each electronic gadget product.
--Include the product name and the total revenue.
select p.product_name, sum(o.total_amt) AS total_revenue from  products p
join orderDetails od on p.product_id = od.product_id
join orders o on od.order_id = o.order_id
group by p.product_name;

--3. Write an SQL query to list all customers who have made at least one purchase. Include their names and contact information.
select distinct c.customerid, c.firstname, c.lastname, c.email, c.phone, c.customeraddress from customer c
join orders o on c.customerid = o.customerid;

--4. Write an SQL query to find the most popular electronic gadget, which is the one with the highest
--total quantity ordered. Include the product name and the total quantity ordered.

select top 1  p.product_name, sum(od.quantity) AS total_qnty from orderDetails od
join products p on od.product_id = p.product_id
group by p.product_name
order by total_qnty desc

--5. Write an SQL query to retrieve a list of electronic gadgets along with their corresponding categories.
select product_name, category from products;


--6. Write an SQL query to calculate the average order value for each customer. Include the customer's name and their average order value.

select c.customerid, c.firstname, c.lastname, avg(o.total_amt) AS avgval from customer c
join orders o on c.customerid = o.customerid
group by c.customerid, c.firstname, c.lastname;

--7. Write an SQL query to find the order with the highest total revenue. Include the order ID, customer information, and the total revenue.
select  top 1 o.order_id,o.total_amt  ,firstname from orders o
join customer c on o.customerid= c.customerid
order by o.total_amt desc

select * from customer
select * from orders
select * from products
select * from orderDetails

--8. Write an SQL query to list electronic gadgets and the number of times each product has been ordered.
select  p.product_name,sum(quantity) as qnty from  orderDetails od
join products p on od.product_id=p.product_id
join orders o on od.order_id=o.order_id
group by p.product_name
order by qnty desc

--9. Write an SQL query to find customers who have purchased a specific electronic gadget product.Allow users to input the product name as a parameter.
declare @gadget ='watch'

select c.firstname from customer c
join orders o on o.customerid=o.customerid
join products p on od.product_id=p.product_id


--10. Write an SQL query to calculate the total revenue generated by all orders placed within a
--specific time period. Allow users to input the start and end dates as parameters.

declare @start_date date = '2025-01-23';   
declare @end_date date = '2025-2-27';     

select sum(total_amt) as total_revenue  
from orders  
where order_date between @start_date and @end_date; 

--subquery
--1. Write an SQL query to find out which customers have not placed any orders.
select c.customerid, c.firstname, c.lastname, c.email, c.phone from customer c
where c.customerid NOT IN (select distinct  customerid from orders);

--2. Write an SQL query to find the total number of products available for sale. 
select * from inventory
select p.product_name, sum(i.quantityinstock) as stocks  
from inventory i  
join products p on i.product_id = p.product_id  
group by p.product_name  
order by stocks desc;

--3 Write an SQL query to calculate the total revenue generated by TechShop.
select sum(total_amt) as total from orders

--4 4. Write an SQL query to calculate the average quantity ordered for products in a specific category.
--Allow users to input the category name as a parameter.

declare @category_name varchar(50) = 'watch';    

select avg(od.quantity) as average_quantity  
from orderDetails od  
join products p on od.product_id = p.product_id  
where p.category = @category_name; 

--5 Write an SQL query to calculate the total revenue generated by a specific customer. Allow users
--to input the customer ID as a parameter
declare @customerid int=3

select c.firstname, sum(o.total_amt) from customer c
join orders o on o.customerid=c.customerid
where c.customerid=@customerid
group by c.firstname

--6. Write an SQL query to find the customers who have placed the most orders. List their names
select count(od.order_id) as total,c.firstname from orderDetails od
join orders o  on od.order_id=o.order_id
join customer c on c.customerid=o.customerid
group by c.firstname
order by total desc

--7. Write an SQL query to find the most popular product category, which is the one with the highest
--total quantity ordered across all orders.
select top 1 p.category, sum(od.quantity) as total from orderDetails od
join products p on od.product_id = p.product_id
group by p.category
order by total desc

--8  Write an SQL query to find the customer who has spent the most money (highest total revenue)
--on electronic gadgets. List their name and total spending.

select top 1 c.firstname, sum(o.total_amt) as total from customer c
join orders o on o.customerid=c.customerid
group by c.firstname
order by total desc

--9. Write an SQL query to calculate the average order value (total revenue divided by the number of
--orders) for all customers.
select c.firstname,sum(o.total_amt) / count(o.order_id) as avg_order_value
from orders o
join customer c on o.customerid = c.customerid
group by c.firstname, c.lastname;

--10. Write an SQL query to find the total number of orders placed by each customer and list their
--names along with the order count.
select  c.firstname,count(o.order_id) as total from customer c
join orders o on c.customerid=o.customerid
group by c.firstname
order by total asc




select * from customer
select * from orders
select * from products
select * from orderDetails