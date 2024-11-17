DROP DATABASE IF EXISTS Test_site;
CREATE DATABASE Test_site;
USE Test_site;

CREATE TABLE Authors(
                        Id int AUTO_INCREMENT PRIMARY KEY,
                        FirstName varchar(15) NOT NULL,
                        LastName varchar(25) NOT NULL
);

DELIMITER $$
#1)Функція користувача повертає вітання в стилі «Hello, ІМ'Я!» Де ІМ'Я передається як параметр. Наприклад, якщо
# передали Nick, то буде Hello, Nick!

CREATE FUNCTION greet_user(name VARCHAR(100))
    RETURNS VARCHAR(110)
    DETERMINISTIC
BEGIN
    RETURN CONCAT('Hello, ', name, '!');
END$$

SELECT greet_user('Nick');

#2)Функція користувача повертає інформацію про поточну кількість хвилин;
CREATE FUNCTION get_current_minute()
    RETURNS INT
    DETERMINISTIC
BEGIN
    RETURN MINUTE(CURRENT_TIME());
END$$

SELECT get_current_minute();

#3)Функція користувача повертає інформацію про поточний рік;

CREATE FUNCTION get_current_year()
    RETURNS INT
    DETERMINISTIC
BEGIN
    RETURN YEAR(CURRENT_DATE());
END$$

SELECT get_current_year();

#4) Функція користувача повертає інформацію про те: парний або непарний рік;

CREATE FUNCTION year_even(year INT)
    RETURNS VARCHAR(10)
    DETERMINISTIC
BEGIN
    If year % 2 = 0 THEN
        RETURN 'Even Year';
    ELSE
        RETURN 'Odd Year';
    END IF;
END$$

SELECT year_even(2098);

#5)Функція користувача приймає число і повертає yes,
# якщо число просте і no, якщо число не просте;

CREATE FUNCTION is_prime_number(i INT)
    RETURNS VARCHAR(3)
    DETERMINISTIC
BEGIN
    DECLARE n INT DEFAULT 2;
    DECLARE is_prime CHAR(3) DEFAULT 'yes';

    IF i <= 1 THEN
        SET is_prime = 'no';
    ELSE
        WHILE n <= SQRT(i) DO
                IF i % n = 0 THEN
                    SET is_prime = 'no';
                END IF;
                SET n = n + 1;
            END WHILE;
    END IF;
    RETURN is_prime;
END$$

SELECT is_prime_number(97);


#6)Функція користувача приймає як параметри п'ять чисел. Повертає суму мінімального та максимального значення з
# переданих п'яти параметрів;

CREATE FUNCTION sum_min_max(a INT, b INT, c INT, d INT, e INT)
    RETURNS INT
    DETERMINISTIC
BEGIN
    DECLARE min_val INT;
    DECLARE max_val INT;
    SET min_val = LEAST(a, b, c, d, e);
    SET max_val = GREATEST(a, b, c, d, e);
    RETURN min_val + max_val;
END$$

SELECT sum_min_max(3,5,6,7,87);

#7)Функція користувача показує всі парні або непарні числа в переданому діапазоні. Функція приймає три параметри:
# початок діапазону, кінець діапазону, парне чи непарне показувати.

CREATE FUNCTION show_even_odd_numbers(start_range INT, end_range INT, is_even BOOLEAN)
    RETURNS TEXT
    DETERMINISTIC
BEGIN
    DECLARE result TEXT DEFAULT '';
    DECLARE i INT;

    SET i = start_range;
    WHILE i <= end_range DO
            IF (is_even AND i % 2 = 0) OR (NOT is_even AND i % 2 != 0) THEN
                SET result = CONCAT(result, i, ', ');
            END IF;
            SET i = i + 1;
        END WHILE;
    IF LENGTH(result) > 0 THEN
        SET result = LEFT(result, LENGTH(result) - 2);
    END IF;
    RETURN result;
END$$

SELECT show_even_odd_numbers(15, 70, FALSE);

DELIMITER ;

######## Stored procedures #########

#1) Збережена процедура виводить «Hello, world!»;

DELIMITER //

CREATE PROCEDURE greet_world()
BEGIN
    SELECT 'Hello, world!' AS greeting;
END//

CALL greet_world();

#2)Збережена процедура повертає інформацію про поточний час;

CREATE PROCEDURE get_current_time()
BEGIN
    SELECT CURRENT_TIME();
END//

CALL get_current_time();

#3)Збережена процедура повертає інформацію про поточну дату

CREATE PROCEDURE get_current_date()
BEGIN
    SELECT CURRENT_DATE();
END//

CALL get_current_date();

#4)Збережена процедура приймає три числа і повертає їхню суму;

CREATE PROCEDURE CalculateSum (IN num1 INT, IN num2 INT, IN num3 INT, OUT result INT)
BEGIN
    SELECT num1 + num2 + num3 INTO result;
END//

SET @res = 0;
CALL CalculateSum(13,67,343,@res);
SELECT @res as result;


#5)Збережена процедура приймає три числа і повертає
# середньоарифметичне трьох чисел;

CREATE PROCEDURE CalculateAverage(IN num1 FLOAT, IN num2 FLOAT, IN num3 FLOAT, OUT average FLOAT)
BEGIN
    SELECT  (num1 + num2 + num3) / 3 INTO average;
END //

SET @average_value = 0;
CALL CalculateAverage(107, 65, 395, @average_value);
SELECT @average_value as AverageValue;

#6)Збережена процедура приймає три числа і повертає максимальне значення;

CREATE PROCEDURE GetMaxNumber(IN num1 INT,IN num2 INT,IN num3 INT,OUT maxNum INT)
BEGIN
    SET maxNum = GREATEST(num1, num2, num3);
END //

CALL GetMaxNumber(45, 3245, 443, @result);
SELECT @result ;

#7)Збережена процедура приймає три числа і повертає мінімальне значення;

CREATE PROCEDURE GetMinNumber(IN num1 INT, IN num2 INT, IN num3 INT, OUT minValue INT)
BEGIN
    SET minValue = LEAST(num1, num2, num3);
END //

CALL GetMinNumber(55, 562, 76, @result);
SELECT @result;


#8)Збережена процедура приймає число та символ. В результаті роботи збереженої процедури
# відображається лінія довжиною, що дорівнює числу. Лінія побудована із символу,
# вказаного у другому параметрі. Наприклад, якщо було передано 5 та #, ми отримаємо лінію такого виду #####;

CREATE PROCEDURE SuperLine(IN lineLength INT,IN lineChar CHAR(1))
BEGIN
    DECLARE resultLine VARCHAR(300) DEFAULT '';
    DECLARE counter INT DEFAULT 0;

    WHILE counter < lineLength DO
            SET resultLine = CONCAT(resultLine, lineChar);
            SET counter = counter + 1;
        END WHILE;
    SELECT resultLine;
END //

CALL SuperLine(12, '$');

#9)Збережена процедура приймає як параметр число і повертає його факторіал. Формула
# розрахунку факторіалу: n! = 1 * 2 * ... n. Наприклад, 3! = 1 * 2 * 3 = 6;

CREATE PROCEDURE FactorialCount(IN number INT,OUT factorial BIGINT)
BEGIN
    DECLARE result BIGINT DEFAULT 1;
    DECLARE counter INT DEFAULT 1;

    WHILE counter <= number DO
            SET result = result * counter;
            SET counter = counter + 1;
        END WHILE;

    SET factorial = result;
END //

CALL FactorialCount(7, @result);
SELECT @result;

#10)Збережена процедура приймає два числові параметри. Перший параметр – це число. Другий
# параметр – це ступінь. Процедура повертає число, зведене до ступеня.

CREATE PROCEDURE CalculatePower(IN num1 INT,IN num2 INT,OUT result INT)
BEGIN
    SET result = POW(num1, num2);
END //

CALL CalculatePower(5,4,@result);
SELECT @result;

DELIMITER ;