CREATE SCHEMA shop
    AUTHORIZATION postgres;


--Таблица "Products" (Продукты):
CREATE TABLE shop."Products"
(
    "ProductID" bigint NOT NULL GENERATED ALWAYS AS IDENTITY,
    "ProductName" character varying NOT NULL,
    "Description" character varying,
    "Price" numeric(15, 2) NOT NULL,
    "QuantityInStock" numeric(15, 4) NOT NULL,
    PRIMARY KEY ("ProductID")
);

ALTER TABLE IF EXISTS shop."Products"
    OWNER to postgres;

COMMENT ON TABLE shop."Products"
    IS 'Продукты';

--Таблица "Users" (Пользователи):
CREATE TABLE shop."Users"
(
    "UserID" bigint NOT NULL GENERATED ALWAYS AS IDENTITY,
    "UserName" character varying NOT NULL,
    "Email" character varying,
    "RegistrationDate" date NOT NULL,
    PRIMARY KEY ("UserID")
);

ALTER TABLE IF EXISTS shop."Users"
    OWNER to postgres;

COMMENT ON TABLE shop."Users"
    IS 'Пользователи';

--Таблица "Orders" (Заказы):
CREATE TABLE shop."Orders"
(
    "OrderID" bigint NOT NULL GENERATED ALWAYS AS IDENTITY,
    "UserID" bigint NOT NULL,
    "OrderDate" date NOT NULL,
    "Status" character varying(20) NOT NULL,
    PRIMARY KEY ("OrderID")
);

ALTER TABLE IF EXISTS shop."Orders"
    OWNER to postgres;

COMMENT ON TABLE shop."Orders"
    IS 'Заказы';

--Таблица "OrderDetails" (Детали заказа):
CREATE TABLE shop."OrderDetails"
(
    "OrderDetailID" bigint NOT NULL GENERATED ALWAYS AS IDENTITY,
    "OrderID" bigint NOT NULL,
    "ProductID" bigint NOT NULL,
    "Quantity" numeric(15, 4) NOT NULL,
    "TotalCost" numeric(15, 2) NOT NULL,
    PRIMARY KEY ("OrderDetailID")
);

ALTER TABLE IF EXISTS shop."OrderDetails"
    OWNER to postgres;

COMMENT ON TABLE shop."OrderDetails"
    IS 'Детали заказа';

--Установление связей

--Связь между "Users" и "Orders"
ALTER TABLE IF EXISTS shop."Orders"
    ADD CONSTRAINT "UserID_fKey" FOREIGN KEY ("UserID")
    REFERENCES shop."Users" ("UserID") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;
--Связь между "Orders" и "OrderDetails"
ALTER TABLE IF EXISTS shop."OrderDetails"
    ADD CONSTRAINT "OrderID_fKey" FOREIGN KEY ("OrderID")
    REFERENCES shop."Orders" ("OrderID") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;
--Связь между "Products" и "OrderDetails"
ALTER TABLE IF EXISTS shop."OrderDetails"
    ADD CONSTRAINT "ProductID_fKey" FOREIGN KEY ("ProductID")
    REFERENCES shop."Products" ("ProductID") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;