-- 01-Which products generate the highest revenue? 
-- select distinct p.product_name,
-- p.product_category,
-- round(sum(o.quantity*o.unit_price),2) as total_revenue
-- from product_catalog p
-- join order_items o
-- on p.product_id=o.product_id
-- group by p.product_name,p.product_category
-- order by total_revenue desc
-- limit 5;

-- 02-Which products generate the highest profit? 
-- select distinct p.product_name,
-- p.product_category,
-- round(sum(o.profit),2) as total_profit
-- from product_catalog p
-- join order_items o
-- on p.product_id = o.product_id
-- group by p.product_name,p.product_category
-- order by total_profit desc
-- ;

-- 03-Which categories contribute the most to total sales?
-- select p.product_category,
-- concat(round(sum(o.gross_sales/1000000),2),"M") as total_sales
-- from product_catalog p
-- join order_items o
-- on p.product_id=o.product_id
-- group by p.product_category
-- order by total_sales desc;

--  04-Which customers generate the greatest business value?
-- select distinct(customer_name) as unique_customer,
--     ROUND(SUM(profit), 2)AS profit_value
-- from ecommeres_data
-- group by customer_name
-- order by profit_value desc;

--  05-How does discounting affect revenue and profitability?
-- select discount_amount,
-- sum(quantity*unit_price) as revenue ,
-- SUM((quantity * unit_price) - (quantity * unit_price * discount_amount)) AS net_revenue
-- from order_items
-- group by discount_amount
-- ;

--  06-Which acquisition channels perform best?
-- SELECT
--     marketing_channel,
--     COUNT(DISTINCT customer_id) AS customers_acquired,
--     ROUND(SUM(gross_sales), 2) AS revenue,
--     ROUND(SUM(profit), 2) AS profit,
--     ROUND((SUM(profit) / SUM(gross_sales)) * 100, 2) AS profit_margin
-- FROM ecommeres_data
-- GROUP BY marketing_channel
-- ORDER BY profit DESC;

--  07-Which regions generate the highest sales?
-- select region,
-- concat(round(sum(net_sales/1000000),2),"M") as highest_sales
-- from ecommeres_data
-- group by region
-- order by highest_sales desc
-- limit 1;

--  08-Which products have high sales but weak profit margins?
-- select p.product_name,
-- round(sum(o.net_sales),2) as total_sales,
-- round(sum(o.profit),2) as total_profit,
-- ROUND((SUM(o.profit) / SUM(o.net_sales)) * 100, 2) AS profit_margin
-- from product_catalog p
-- join order_items o
-- on p.product_id =o.product_id
-- group by p.product_name
-- order by profit_margin asc
-- limit 5;

-- 09-Does delivery performance relate to customer satisfaction?
-- SELECT
--     CASE
--         WHEN delivery_days <= estimated_delivery_days THEN 'On Time'
--         ELSE 'Late'
--     END AS delivery_performance,

--     COUNT(*) AS total_orders,
--     ROUND(AVG(customer_rating), 2) AS avg_rating

-- FROM ecommeres_data

-- GROUP BY
--     CASE
--         WHEN delivery_days <= estimated_delivery_days
--  THEN 'On Time'
--         ELSE 'Late'
--     END

-- ORDER BY avg_rating DESC;

--  10-Which products show strong demand?
-- select p.product_name,
--  case
-- 	when o.quantity >3 
--     then 'Strong_demand'
--     else 'Week_demand'
--     end as Strong_demand_product
-- from product_catalog p
-- join order_items o
-- on p.product_id =o.product_id
-- ;


--            Orders & Transaction Analytics
-- 01-Which months generate the highest sales?
-- select month_name,
-- concat(round(sum(net_sales /1000000),2),"M") as Total_Month_Sale
-- from ecommeres_data
-- group by month_name
-- order by Total_Month_Sale desc;


-- 			Customer Analytics & Customer Intelligence
-- 01-Who are the highest-value customers?
-- select customer_name,
-- max(customer_lifetime_value) as highest_value_customer
-- from ecommeres_data
-- group by customer_name
-- order by highest_value_customer desc
-- limit 1;

-- 02-Which customer groups generate the most revenue?
-- select gender,
-- concat(round(sum(net_sales / 1000000),2),"M") as revenue
-- from ecommeres_data
-- group by gender
-- order by revenue desc;

-- 			 Customer Segmentation & RFM Analysis
-- 01-Which products sell the most?
-- select p.product_name,
-- round(sum(o.net_sales),2) as total_sales
-- from product_catalog p
-- join order_items o
-- on p.product_id =o.product_id
-- group by p.product_name
-- order by total_sales desc
-- limit 1;

-- 02-Which products generate the highest revenue? 
--  select p.product_name,
-- round(sum(o.net_sales),2) as total_sales
-- from product_catalog p
-- join order_items o
-- on p.product_id =o.product_id
-- group by p.product_name
-- order by total_sales desc
-- limit 1


-- 			Regional E-Commerce Analysis
-- 02-Where are the highest-value customers located?
-- WITH highest_value_customer AS (
--     SELECT
--         customer_name,
--         customer_country,
--         region,
--         ROUND(SUM(customer_lifetime_value), 2) AS high_value
--     FROM ecommeres_data
--     GROUP BY
--         customer_name,
--         customer_country,
--         region
-- )
-- SELECT *
-- FROM highest_value_customer
-- ORDER BY high_value DESC
-- LIMIT 5;