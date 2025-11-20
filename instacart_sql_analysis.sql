--топ 10 самых покупаемых товаров
SELECT product_name, COUNT(*) AS purchases_count
FROM fact_orders
GROUP BY product_name
ORDER BY purchases_count DESC
LIMIT 10;


--количество заказов по дням недели
SELECT order_dow, COUNT(DISTINCT order_id) AS orders_count
FROM fact_orders
GROUP BY order_dow
ORDER BY order_dow;


--распределение заказов по времени суток
SELECT order_hour_of_day, COUNT(DISTINCT order_id) AS orders_count
FROM fact_orders
GROUP BY order_hour_of_day
ORDER BY order_hour_of_day;


--средний размер корзины
SELECT AVG(products_per_order) AS avg_basket_size
FROM (SELECT order_id, COUNT(*) AS products_per_order FROM fact_orders GROUP BY order_id) subquery;


--средняя доля повторных покупок по отделам
SELECT department, AVG(reordered) AS avg_reorder_rate
FROM fact_orders
GROUP BY department
ORDER BY avg_reorder_rate DESC;


--топ 20 пользователей по количеству заказов
SELECT user_id, COUNT(DISTINCT order_id) AS orders_count
FROM fact_orders
GROUP BY user_id
ORDER BY orders_count DESC
LIMIT 20;


--средний интервал между заказами
SELECT AVG(days_since_prior_order) AS avg_days_between_orders
FROM fact_orders
WHERE days_since_prior_order IS NOT NULL;


