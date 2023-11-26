--SQL запросы:
--Добавление нового продукта
INSERT INTO shop."Products"(
	"ProductName", "Description", "Price", "QuantityInStock")
	VALUES ('Яблоки', 'весовой', 100.50, 1000.9594);
--Обновление цены продукта
Update shop."Products"
set "Price" = 123.45
where "ProductID" = 1;
--Выбор всех заказов определенного пользователя
SELECT "OrderID", "UserID", "OrderDate", "Status"
	FROM shop."Orders"
	where "UserID" = 1;
--Расчет общей стоимости заказа
SELECT sum("TotalCost")
	FROM shop."OrderDetails"
	where "OrderID" = 1;
--Подсчет количества товаров на складе
SELECT "ProductName",sum("QuantityInStock")
	FROM shop."Products"
	group by "ProductName"

--Получение 5 самых дорогих товаров
SELECT "ProductName","Price"
	FROM shop."Products"
	order by "Price" desc limit 5
--Список товаров с низким запасом (менее 5 штук)
SELECT "ProductName","QuantityInStock"
	FROM shop."Products"
	where "QuantityInStock" < 5
	order by "QuantityInStock" 