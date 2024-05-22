-- Intermediate:

-- Join the necessary tables to find the total quantity of each pizza category ordered.
select p.category, sum(o.quantity) as quantity
from pizza_types as p inner join pizzas 
on p.pizza_type_id = pizzas.pizza_type_id
inner join order_details as o on pizzas.pizza_id = o.pizza_id
group by p.category order by quantity desc;

-- Determine the distribution of orders by hour of the day.
select hour(order_time) as hour, count(order_id) as order_count
from orders group by hour;

-- Join relevant tables to find the category-wise distribution of pizzas.
select category, count(name) from pizza_types group by category;

-- Group the orders by date and calculate the average number of pizzas ordered per day.
select round(avg(quantity),0) as avg_pizza_ordered_per_day from 
(select orders.order_date, sum(order_details.quantity) as quantity
from orders join order_details on orders.order_id = order_details.order_id
group by orders.order_date) as order_quantity;

-- Determine the top 3 most ordered pizza types based on revenue.
select p.name, sum(o.quantity*pizzas.price) as revenue
from pizza_types as p join pizzas on p.pizza_type_id = pizzas.pizza_type_id
join order_details as o on o.pizza_id = pizzas.pizza_id 
group by p.name order by revenue desc limit 3;
