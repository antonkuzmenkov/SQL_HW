
-- 1. Создайте таблицу logs типа Archive. Пусть при каждом создании записи в таблицах users, 
-- catalogs и products в таблицу logs помещается время и дата создания записи, название таблицы,
-- идентификатор первичного ключа и содержимое поля name.


dROP TABLE IF EXISTS logs;
CREATE TABLE logs (
	created_at timestamp NOT NULL,
	table_name VARCHAR(40) NOT NULL,
	str_id INT(10) NOT NULL,
	name_value VARCHAR(40) NOT NULL
) ENGINE = ARCHIVE;


-- users 
DROP TRIGGER IF EXISTS log_users;

CREATE TRIGGER log_users AFTER INSERT ON users
FOR EACH ROW
BEGIN
	INSERT INTO logs (created_at, table_name, str_id, name_value)
	VALUES (NOW(), 'users', NEW.id, NEW.name);
END


-- catalogs  
DROP TRIGGER IF EXISTS log_catalogs;

CREATE TRIGGER log_catalogs AFTER INSERT ON catalogs
FOR EACH ROW
BEGIN
	INSERT INTO logs (created_at, table_name, str_id, name_value)
	VALUES (NOW(), 'catalogs', NEW.id, NEW.name);
END 


-- products  

CREATE TRIGGER log_products AFTER INSERT ON products
FOR EACH ROW
BEGIN
	INSERT INTO logs (created_at, table_name, str_id, name_value)
	VALUES (NOW(), 'products', NEW.id, NEW.name);
END 

-- 1. В базе данных Redis подберите коллекцию для подсчета посещений с определенных IP-адресов.

SADD ip '127.0.0.1' 

SMEMBERS ip

SCARD ip

-- 2. При помощи базы данных Redis решите задачу поиска имени пользователя по электронному адресу
-- и наоброт, поиск электронного адреса пользователя по его имени.

set ant@mail.ru anton
set anton ant@mail.ru

get ant@mail.ru 
get anton

