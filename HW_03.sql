-- Агрегация данных

-- Проанализировать запросы, которые выполнялись на занятии, определить возможные 
-- корректировки и/или улучшения (JOIN пока не применять).

----min цена
select id, name, price FROM products ORDER BY price DESC LIMIT 1;

-- AVG() всей таблицы 
SELECT AVG(price) FROM products;

SELECT ROUND(AVG(price), 2) FROM products;

SELECT
    catalog_id,
    ROUND(AVG(price), 1)
FROM 
    products 
GROUP BY 
    catalog_id;

select DISTINCT catalog_id FROM products;
-- аналогично
select catalog_id FROM products GROUP BY catalog_id;

-- Определить кто больше поставил лайков (всего) - мужчины или женщины?

with cte as
(
SELECT 
	gender, count(name) name
FROM name1
group by gender
)
select max(name)
from cte