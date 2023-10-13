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