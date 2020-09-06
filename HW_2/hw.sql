
-- 1. ѕусть в таблице users пол€ created_at и updated_at оказались незаполненными. «аполните их текущими датой и временем.
UPDATE products
    SET created_at = NULL where id = 3;

UPDATE products
    SET created_at = NULL where id = 1;

UPDATE products
    SET created_at = NOW() where created_at is NULL;

UPDATE products
    SET created_at = NOW() where id = 3;

-- 2.“аблица users была неудачно спроектирована. «аписи created_at и updated_at были заданы типом VARCHAR и в них долгое врем€ помещались значени€
-- в формате "20.10.2017 8:10". Ќеобходимо преобразовать пол€ к типу DATETIME, сохранив введеные ранее значени€.
ALTER TABLE products 
    CHANGE COLUMN `created_at` `created_at` VARCHAR(256) NULL,
    CHANGE COLUMN `updated_at` `updated_at` VARCHAR(256) NULL;

describe products;
SELECT created_at from products;

ALTER TABLE products 
    CHANGE COLUMN `created_at` `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
    CHANGE COLUMN `updated_at` `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

describe products;
SELECT created_at from products;


-- 3. ¬ таблице складских запасов storehouses_products в поле value могут встречатьс€ самые разные цифры: 0,
-- если товар закончилс€ и выше нул€, если на складе имеютс€ запасы. Ќеобходимо отсортировать записи таким образом,
-- чтобы они выводились в пор€дке увеличени€ значени€ value. Ќулевые запасы должны выводитьс€ в конце, после всех записей.
create table storehouses_products (
	id SERIAL PRIMARY KEY,
    storehouse_id INT unsigned,
    product_id INT unsigned,
    `value` INT unsigned COMMENT '«апас товарный позиции на складке',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = '«апасы на складе';