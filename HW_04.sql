
-- Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.
SELECT 
	us.id AS user_id, u.name,
	od.id AS order_id
FROM 
	users AS us
RIGHT JOIN
	orders AS od
ON
	us.id = od.user_id;
	
-- Выведите список товаров products и разделов catalogs, который соответствует товару

SELECT 
	pr.id, pr.name, pr.price,
	ca.id AS cat_id,
	ca.name AS catalog
FROM
	products AS pr
JOIN
	catalogs AS ca
ON 
	p.catalog_id = c.id