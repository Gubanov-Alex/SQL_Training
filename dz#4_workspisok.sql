create database dz_4;#Создание БД
use dz_4;#Запуск использования БД

CREATE TABLE Country #Создание таблицы с данными
(
    Id Int AUTO_INCREMENT PRIMARY KEY,
    Name NVARCHAR(20) NOT NULL,
    ContinentId Int DEFAULT 0,
    Capital NVARCHAR(20) NOT NULL,
    Territory DECIMAL(10, 2) NOT NULL,
    CurrencyID Int DEFAULT 0,
    Debut Int DEFAULT 0,
    Champion Int DEFAULT 0,
    FOREIGN KEY (ContinentId) REFERENCES Continent(Id),
    FOREIGN KEY (CurrencyID) REFERENCES Currency(Id)
);
CREATE TABLE CountryLanguage #Создание таблицы с данными
(
    Id Int AUTO_INCREMENT PRIMARY KEY,
    CountryId Int DEFAULT 0,
    LanguageID Int DEFAULT 0,
    FOREIGN KEY (CountryId) REFERENCES Country(Id),
    FOREIGN KEY (LanguageID) REFERENCES Language(Id)
);
CREATE TABLE Language #Создание таблицы с данными
(
    Id Int AUTO_INCREMENT PRIMARY KEY,
    Name NVARCHAR(20) NOT NULL
);
CREATE TABLE Continent #Создание таблицы с данными
(
    Id Int AUTO_INCREMENT PRIMARY KEY,
    Name NVARCHAR(20) NOT NULL
);
CREATE TABLE Currency #Создание таблицы с данными
(
    Id Int AUTO_INCREMENT PRIMARY KEY,
    Name NVARCHAR(50) NOT NULL
);


ALTER TABLE Currency MODIFY COLUMN Name VARCHAR(50) NOT NULL; #Модификация кол-ва знаков

DROP TABLE currency; #Удаление таблицы
DROP TABLE country;
DROP TABLE countrylanguage;
DROP TABLE Continent;
DROP TABLE language;

INSERT Language (Name) VALUES #Вставка значений
                           (N'украинский'),
                           (N'французский'),
                           (N'арабский'),
                           (N'английский'),
                           (N'немецкий'),
                           (N'португальский'),
                           (N'японский'),
                           (N'испанский'),
                           (N'итальянский'),
                           (N'корейский'),
                           (N'польский'),
                           (N'шведский'),
                           (N'сербский'),
                           (N'нидерландский'),
                           (N'персидский'),
                           (N'чешский'),
                           (N'хорватский');




INSERT Currency (Name) VALUES #Вставка значений
                           (N'евро'),
                           (N'костариканский колон'),
                           (N'злотый'),
                           (N'доллар США'),
                           (N'фунт стерлингов'),
                           (N'гуарани'),
                           (N'доллар Тринидад и Тобаго'),
                           (N'шведская крона'),
                           (N'аргентинский песо'),
                           (N'франк'),
                           (N'динар'),
                           (N'мексиканский песо'),
                           (N'риал'),
                           (N'кванза'),
                           (N'чеди'),
                           (N'чешская крона'),
                           (N'бразильский реал'),
                           (N'швейцарский франк'),
                           (N'куна'),
                           (N'австралийский доллар'),
                           (N'иена'),
                           (N'вона'),
                           (N'гривня'),
                           (N'тунисский динар'),
                           (N'саудовский риал');



INSERT INTO CountryLanguage (CountryId, LanguageId) VALUES #Вставка значений
                                                   (29, 4),
                                                   (19, 4),
                                                   (4, 6),
                                                   (11, 8),
                                                   (6, 6),
                                                   (31, 4),
                                                   (10, 5),
                                                   (28, 15),
                                                   (7, 8),
                                                   (8, 9),
                                                   (14, 8),
                                                   (24, 2),
                                                   (23, 8),
                                                   (25, 14),
                                                   (12, 8),
                                                   (15, 11),
                                                   (17, 6),
                                                   (18, 3),
                                                   (30, 13),
                                                   (16, 4),
                                                   (27, 2),
                                                   (9, 4),
                                                   (3, 2),
                                                   (3, 3),
                                                   (1, 1),
                                                   (2, 2),
                                                   (22, 17),
                                                   (32, 16),
                                                   (26, 9),
                                                   (26, 5),
                                                   (26, 2),
                                                   (20, 12),
                                                   (21, 8),
                                                   (13, 10),
                                                   (5, 7);



INSERT Continent (Name) VALUES #Вставка значений
                            (N'Европа'),
                            (N'Африка'),
                            (N'Азия'),
                            (N'Южная Америка'),
                            (N'Центральная Америка'),
                            (N'Северная Америка'),
                            (N'Австралия');





INSERT INTO Country (Name, ContinentId, Capital, Territory, CurrencyId, Debut, Champion) VALUES #Вставка значений
                                                                                             (N'Украина', 1, N'Киев', 603.70, 23, 1, 0),
                                                                                       (N'Франция', 1, N'Париж', 545.63, 1, 0, 1),
                                                                                             (N'Тунис', 2, N'Тунис', 155.36, 24, 0, 0),
                                                                                             (N'Ангола', 2, N'Луанда', 1246.70, 14, 1, 0),
                                                                                             (N'Япония', 3, N'Токио', 374.74, 21, 0, 0),
                                                                                             (N'Бразилия', 4, N'Бразилиа', 8456.51, 17, 0, 5),
                                                                                             (N'Испания', 1, N'Мадрид', 499.54, 1, 0, 0),
                                                                                             (N'Италия', 1, N'Рим', 294.02, 1, 0, 4),
                                                                                             (N'Тринидад и Тобаго', 5, N'Порт-оф-Спейн', 5.10, 7, 1, 0),
                                                                                             (N'Германия', 1, N'Берлин', 349.22, 1, 0, 3),
                                                                                             (N'Аргентина', 4, N'Буэнос-Айрес', 2736.69, 9, 0, 2),
                                                                                             (N'Парагвай', 4, N'Асунсьон', 397.30, 6, 0, 0),
                                                                                             (N'Южная Корея', 3, N'Сеул', 98.19, 22, 0, 0),
                                                                                             (N'Коста-Рика', 5, N'Сан-Хосе', 50.66, 2, 0, 0),
                                                                                             (N'Польша', 1, N'Варшава', 304.47, 3, 0, 0),
                                                                                             (N'США', 6, N'Вашингтон', 9158.96, 4, 0, 0),
                                                                                             (N'Португалия', 1, N'Лиссабон', 91.95, 1, 0, 0),
                                                                                             (N'Саудовская Аравия', 3, N'Эр-Рияд', 1960.58, 25, 0, 0),
                                                                                             (N'Англия', 1, N'Лондон', 129.63, 5, 0, 1),
                                                                                             (N'Швеция', 1, N'Стокгольм', 410.93, 8, 0, 0),
                                                                                             (N'Эквадор', 4, N'Кито', 276.84, 4, 0, 0),
                                                                                             (N'Хорватия', 1, N'Загреб', 56.41, 19, 0, 0),
                                                                                             (N'Мексика', 5, N'Мехико', 1923.04, 12, 0, 0),
                                                                                             (N'Кот-д-Ивуар', 2, N'Ямусукро', 322.50, 10, 1, 0),
                                                                                             (N'Нидерланды', 1, N'Амстердам', 41.50, 1, 0, 0),
                                                                                             (N'Швейцария', 1, N'Берн', 41.30, 18, 0, 0),
                                                                                             (N'Того', 2, N'Ломе', 56.60, 10, 1, 0),
                                                                                             (N'Иран', 3, N'Тегеран', 1650, 13, 0, 0),
                                                                                             (N'Австралия', 7, N'Канберра', 7700, 20, 0, 0),
                                                                                             (N'Сербия и Черногория', 1, N'Белград', 102.20, 11, 0, 0),
                                                                                             (N'Гана', 2, N'Аккра', 238.50, 15, 1, 0),
                                                                                             (N'Чехия', 1, N'Прага', 78.90, 16, 0, 0);


SELECT NAME FROM Country ORDER BY Champion  DESC LIMIT 1;#1)Brasil

SELECT c.ContinentId, ct.Name AS ContinentName, COUNT(*) AS CountryCount
FROM Country c
         JOIN Continent ct ON c.ContinentId = ct.Id
GROUP BY c.ContinentId, ct.Name;#2)

SELECT W.Name FROM Country W JOIN Country C ON W.Name = C.Name
WHERE C.ContinentID = 1
ORDER BY W.Champion DESC
LIMIT 1;#3) Italy

SELECT Name FROM Country ORDER BY Territory DESC LIMIT 1;#4)USA

SELECT Name FROM Country WHERE ContinentID = 1 ORDER BY Territory DESC LIMIT 1;#5)Ukraine

SELECT c.ContinentId, ct.Name AS ContinentName, COUNT(*) AS WorldChampionCount
FROM Country c
         JOIN Continent ct ON c.ContinentId = ct.Id
WHERE c.Champion > 0
GROUP BY c.ContinentId, ct.Name;#6)

SELECT ct.Id AS ContinentId, ct.Name AS ContinentName, SUM(c.Champion) AS TotalTitles
FROM dz_4.Country c
         JOIN dz_4.Continent ct ON c.ContinentId = ct.Id
GROUP BY ct.Id, ct.Name;#7)

SELECT c.ContinentId, ct.Name AS ContinentName, AVG(c.Territory) AS AverageArea
FROM Country c
         JOIN Continent ct ON c.ContinentId = ct.Id
GROUP BY c.ContinentId, ct.Name;#8)

SELECT c.ContinentId,ct.Name AS ContinentName, COUNT(CASE WHEN c.Debut = 1 THEN 1 END ) AS DebutCountryCount
FROM Country c
         JOIN Continent ct ON c.ContinentId = ct.Id
GROUP BY c.ContinentId, ct.Name;#9)

SELECT l.Name, COUNT(cl.CountryId) AS country_count
FROM
    language l
        JOIN
    countrylanguage cl ON l.Id = cl.LanguageID
        JOIN
    country c ON cl.CountryID = c.Id
GROUP BY
    l.Name;#10)

SELECT Name FROM Country WHERE ContinentId = 2 ORDER BY Territory ASC
LIMIT 1;#11)Togo

SELECT c.CurrencyId,ct.Name, COUNT(c.Name) AS CountryCount
FROM Country c
         JOIN Currency ct ON c.CurrencyId = ct.Id
GROUP BY c.CurrencyId, ct.Name;#12)

SELECT c.LanguageId,ct.Name, COUNT(c.LanguageID) AS CountryCount FROM countrylanguage c
         JOIN language ct ON c.LanguageID = ct.Id
GROUP BY c.LanguageId,ct.Name ORDER BY CountryCount DESC
LIMIT 1;#13)


SELECT C.ContinentId, CT.Name,SUM(C.Champion) AS Showresult
FROM Country C
         JOIN Continent CT ON C.ContinentId = CT.Id
GROUP BY C.ContinentId, CT.Name
ORDER BY SUM(C.Champion) DESC
LIMIT 2;#14)Europe

SELECT Name
FROM (
         SELECT l.Name, COUNT(*) AS cnt
         FROM Country c
                  JOIN CountryLanguage cl ON c.Id = cl.CountryId
                  JOIN Language l ON cl.LanguageID = l.Id
         WHERE c.ContinentId = 1 OR c.ContinentId = 2
         GROUP BY l.Name
         ORDER BY cnt DESC
     ) AS subquery
LIMIT 1;#15)

