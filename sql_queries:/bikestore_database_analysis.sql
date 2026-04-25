#BIKESTORE WORKSHEET


-- QUESTION 1: Brand Based Turnover Analysis
-- This query calculates the total revenue that brands bring.

Select * from 
(select A.brand_name, SUM(C.quantity * C.list_price - (1 - C.discount)) as "Total" from 
brands A
left join products B on A.brand_id = B.brand_id
left join order_items C on C.product_id=B.product_id
Group by brand_name
Order by Total DESC)A;

-- QUESTION 2: Stock Status Analysis
-- Here we list products whose stock is at a critical level (less than 5).

Select * from
(select C.store_name as "Store Name",B.product_name as "Products" ,A.quantity as "How much of this product we have"
from 
stocks A 
left join products B on A.product_id = B.product_id 
left join stores C on A.store_id=C.store_id
WHERE quantity < 5
Order by a.quantity)B;

-- Question 3: Analysis of the Missing Customer
-- Analysis shows that every customer in the database has a recorded order. This 100% engagement rate reflects a successful sales policy and strong customer retention."

select * from
(
select A.customer_id,A.first_name, A.last_name,A.city from 
customers A left join orders B on A.customer_id = B.customer_id
Where B.order_id is NULL)
TABLE_C;

-- QUESTION 4: Personnel Based Sales Performance
select * from staffs;
select * from orders;

Select * from 
(select A.staff_id,A.first_name,A.last_name,COUNT(B.order_id) as Total_Order from
staffs A join orders B on A.staff_id = B.staff_id
Group by A.staff_id,A.first_name,A.last_name
ORDER BY Total_Order DESC)D;

-- QUESTION 5: Category-Based Sales Popularity
Select * from
(select c.category_name, SUM(o.quantity) as "Total Sale" from
categories c join products p on c.category_id = p.category_id
join order_items o on p.product_id=o.order_id
Group by c.category_name
Order by SUM(o.quantity) DESC)E;

-- QUESTION 6: Store-Based Ciro Analysis
select * from orders;
select * from order_items;
select a.store_name, a.state, a.city, SUM(c.list_price * c.quantity - (1-c.discount)) as ciro from 
stores a join orders b on a.store_id = b.store_id
join order_items c on c.order_id = b.order_id
Group by a.store_name, a.state, a.city
Order by ciro DESC;

















