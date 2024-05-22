-- Basic questions

-- Retrieve the total number of orders placed.
select count(order_id) from pizza_hut.orders;

-- Calculate the total revenue generated from pizza sales.
select round(sum(o.quantity*p.price),2) as total_revenue from order_details as o
inner join pizzas as p on o.pizza_id = p.pizza_id;

-- Identify the highest-priced pizza.
select pizza_types.name, pizzas.price
from pizza_types inner join pizzas on pizza_types.pizza_type_id = pizzas.pizza_type_id
order by pizzas.price desc limit 1;

-- Identify the most common pizza size ordered.
select p.size, count(o.order_details_id) as order_count
from pizzas as p inner join order_details as o
on p.pizza_id = o.pizza_id group by p.size order by order_count desc limit 1;

-- List the top 5 most ordered pizza types along with their quantities.
select p.name, sum(o.quantity) as quantity
from pizza_types as p inner join pizzas 
on p.pizza_type_id = pizzas.pizza_type_id
inner join order_details as o on pizzas.pizza_id = o.pizza_id
group by p.name order by quantity desc limit 5;