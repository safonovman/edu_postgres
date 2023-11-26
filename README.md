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

---Команда сохранения вывода терминала
\s aircrafts1-history

---Создание таблицы "Места"
CREATE TABLE seats1
(
    aircraft_code char( 3 )     NOT NULL,
    seat_no       varchar( 4 )  NOT NULL,
    fare_conditions varchar( 10 ) NOT NULL,
    CHECK
    ( fare_conditions IN ( 'Economy', 'Comfort', 'Business' )
    ),
    PRIMARY KEY (aircraft_code, seat_no ),
    FOREIGN KEY (aircraft_code)
        REFERENCES aircrafts1 (aircraft_code )
        ON DELETE CASCADE  
);
---
INSTER INTO seats1 VALUES ( '123', '1A', 'Business');

INSERT INTO seats1 VALUES
    ( 'SU9', '1A', 'Business' ),
    ( 'SU9', '1B', 'Business' ),
    ( 'SU9', '10A', 'Economy' ),
    ( 'SU9', '10B', 'Economy' ),
    ( 'SU9', '10F', 'Economy' ),
    ( 'SU9', '20F', 'Economy' );

SELECT aircraft_code, count ( * ) FROM seats
    GROUP BY aircraft_code
    ORDER BY count;    

SELECT aircraft_code, fare_conditions, count( * ) 
GROUP BY aircraft_code, fare_conditions
FROM seats
ORDER BY aircraft_code, fare_conditions;

INSERT INTO aircrafts
    VALUES ( 'SU9', 'Sukhoi SuperJet-100', 3000 );

---Получение текущей временной метки
SELECT current_timestamp;

SELECT '1 year 2 months ago'::interval;
---Вычисление интервала и приведению даты к типу timestemp
SELECT ('2016-09-16'::TIMESTAMP - '2016-09-01'::TIMESTAMP)::interval;
----Получение текщей временной отметки
SELECT ( date_trunc( 'hour', CURRENT_TIMESTAMP  ) );

SELECT EXTRACT( 'mon' FROM TIMESTAMP '1999-11-27 12:34:56.123459');

----Создадим таблицу и добавив внее значения тип boolean
CREATE TABLE DATABASES ( is_open_source_ boolean, dbms_name text );
INSERT INTO DATABASES VALUES (TRUE, 'PostgreSQL' );
INSERT INTO DATABASES VALUES (FALSE, 'Oracle' );
INSERT INTO DATABASES VALUES (TRUE, 'MySQL' );
INSERT INTO DATABASES VALUES (FALSE, 'MS SQL Server' );

--- Теперь обратимся к ней с запросом Select *
select * from databases;

