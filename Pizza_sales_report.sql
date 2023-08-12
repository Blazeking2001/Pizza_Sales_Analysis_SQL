-- SQL QUERY


-- Total Revenue 
SELECT sum(total_price) AS total_revenue FROM pizza_sales

-- Average Order value
SELECT (sum(total_price) / count(DISTINCT order_id)) AS avg_order_value
FROM pizza_sales 

-- Total Pizza Sold
SELECT sum(quantity) AS total_pizza_sold FROM pizza_sales

-- Total Order
SELECT count(disticnct order_id) AS total_order from pizza_sales

-- Average Pizza Per Order
SELECT (sum(quantity) / count(DISTINCT order_id)) FROM pizza_sales

-- Daily Trend Of Total Order
SELECT DATENAME(DW, order_date) as order-day, count(DISTINCT order_id) AS total_orders FROM pizza_sales
GROUP BY DATENAME(DW, order_date);

-- Monthly Trend For Total Order
SELECT DATENAME(month, order_date) as month_name, count(DISTINCT order_id) AS total_orders FROM pizza_sales
GROUP BY DATENAME(month,  order_date)
ORDER BY total_order DESC

-- Percentage of Sales by Pizza Category
select pizza_category, sum(total_price) * 100 / (select sum(total_price) from pizza_sales) as sales_percentage 
from pizza_sales
group by pizza_category;

-- Percentage of Sales by Pizza Size
select pizza_size, sum(total_price) * 100 / (select sum(total_price) from pizza_sales) as sales_percentage
from pizza_sales
group by pizza_size;

-- Total pizzas sold by pizza category
select pizza_category, count(quantity) as total_sold from pizza_sales
group by pizza_category
order by total_sold desc;

-- Top 5 best sellers by Revenue, Total Quantity and Total Orders
select pizza_name, sum(total_Price) as total_sales from pizza_sales
group by pizza_name
order by total_sales desc
limit 5;


select pizza_name, sum(quantity) as total_quantity from pizza_sales
group by pizza_name
order by total_quantity desc
limit 5;

select pizza_name, count(distinct order_id) as total_order from pizza_sales
group by pizza_name
order by total_order desc
limit 5;


-- Bottom 5 best sellers by Revenue, Total Quantity and Total Orders
select pizza_name, sum(total_Price) as total_sales from pizza_sales
group by pizza_name
order by total_sales asc
limit 5;

select pizza_name, sum(quantity) as total_quantity from pizza_sales
group by pizza_name
order by total_quantity asc
limit 5;

select pizza_name, count(distinct order_id) as total_order from pizza_sales
group by pizza_name
order by total_order asc
limit 5;
