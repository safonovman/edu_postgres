--Создаем таблицу aircrafts1 в базе demo
CREATE TABLE aircrafts1
( aircraft_code char( 3 ) NOT NULL,
model text NOT NULL,
range integer NOT NULL,
CHECK ( range > 0 ),
PRIMARY KEY ( aircraft_code )
);

--- Записываем данные в таблицу aircrafts1 базы demo
INSERT INTO aircrafts1 ( aircraft_code, model, range )
    VALUES ( 'SU9', 'Sukhoi SuperJet-100', 3000 );


--- Записываем данные 8 строк в таблицу aircrafts1 базы demo
    INSERT INTO aircrafts1 ( aircraft_code, model, range )
        VALUES  ( '773', 'Boeing 777-300', 11100 ),
                ( '763', 'Boeing 767-300', 7900 ),
                ( '733', 'Boeing 737-300', 4200 ),
                ( '320', 'Airbus A320-200', 5700 ),
                ( '321', 'Airbus A321-200', 5600 ),
                ( '319', 'Airbus A319-100', 6700 ),
                ( 'CN1', 'Cessna 208 Caravan', 1200 ),
                ( 'CN2', 'Bombardier CRJ-200', 2700 );

---- Упорядочим строки по значению атрибута model
SELECT model, aircraft_code, range
    FROM aircrafts1
    ORDER BY model;

---- Выборка моделей самолетов у которых максимальная дальность от 4 до 6 тыс.км
SELECT model, aircraft_code, range
    FROM aircrafts1
    WHERE range >= 4000 AND range <= 6000;


----Обновим таблицу с помощью команды UPDATE
UPDATE aircrafts1 SET range = 3500
    WHERE aircraft_code = 'SU9';

---Проверим что получилось
SELECT * 
FROM aircrafts1 
WHERE aircraft_code = 'SU9';

---Удалим строку таблицы aircrafts1
DELETE FROM aircrafts1 WHERE aircraft_code = 'CN1';

--- Удалим информацию о самолетах с дальностью полета более 10000 км а также с дальностью полета менее 3000 км.
DELETE from aircrafts1 WHERE range > 10000 OR range < 3000;

---Команда для удаления всех строк в таблице 
DELETE FROM aircrafts1;