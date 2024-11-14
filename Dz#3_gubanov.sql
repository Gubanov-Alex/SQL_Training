CREATE DATABASE WorldCup;
USE WorldCup;
CREATE TABLE Teams(
    id int AUTO_INCREMENT PRIMARY KEY NOT NULL,
    country nvarchar(50) NULL,
    Continent nvarchar(50) NULL,
    Capital nvarchar(50) NULL,
    Territory float NULL,
    Currency nvarchar(50) NULL,
    Language nvarchar(50) NULL,
    Debut bit NULL,
    Champion int NULL
    );

INSERT Teams (country, Continent, Capital, Territory, Currency, Language, Debut, Champion)
VALUES ('Украина', 'Европа', 'Киев', 603.7, 'гривна', 'украинский', 1, 0),
    ('Франция', 'Европа', 'Париж', 545.63, 'евро', 'французский', 0, 1),
    ('Тунис', 'Африка', 'Тунис', 155.36, 'тунисский динар', 'арабский', 0, 0),
    ('Ангола', 'Африка', 'Луанда', 1246.7, 'кванза', 'португальский', 1, 0),
    ('Япония', 'Азия', 'Токио', 374.744, 'иена', 'японский', 0, 0),
    ('Бразилия', 'Южная Америка', 'Бразилиа', 8456.51, 'бразильский реал', 'португальский', 0, 5),
    ('Испания', 'Европа', 'Мадрид', 499.542, 'евро', 'испанский', 0, 0),
    ('Италия', 'Европа', 'Рим', 294.02, 'евро', 'итальянский', 0, 4),
    ('Тринидад и Тобаго', 'Центральная Америка', 'Порт-оф-Спейн', 5.1, 'доллар Тринидад и Тобаго', 'английский', 1, 0),
    ('Германия', 'Европа', 'Берлин', 349.223, 'евро', 'немецкий', 0, 3),
    ('Аргентина', 'Южная Америка', 'Буэнос-Айрес', 2736.69, 'аргентинский песо', 'испанский', 0, 2),
    ('Парагвай', 'Южная Америка', 'Асунсьон', 397.3, 'гуарани', 'испанский', 0, 0),
    ('Южная Корея', 'Азия', 'Сеул', 98.19, 'вона', 'корейский', 0, 0),
    ('Коста-Рика', 'Центральная Америка', 'Сан-Хосе', 50.66, 'колон', 'испанский', 0, 0),
    ('Польша', 'Европа', 'Варшава', 304.465, 'злотый', 'польский', 0, 0),
    ('США', 'Северная Америка', 'Вашингтон', 9158.96, 'доллар США', 'английский', 0, 0),
    ('Португалия', 'Европа', 'Лиссабон', 91.951, 'евро', 'португальский', 0, 0),
    ('Саудовская Аравия', 'Азия', 'Эр-Рияд', 1960.582, 'саудовский риал', 'арабский', 0, 0),
    ('Англия', 'Европа', 'Лондон', 129.634, 'фунт стерлингов', 'английский', 0, 1),
    ('Швеция', 'Европа', 'Стокгольм', 410.934, 'шведская крона', 'шведский', 0, 0),
    ('Эквадор', 'Южная Америка', 'Кито', 276.84, 'доллар США', 'испанский', 0, 0),
    ('Хорватия', 'Европа', 'Загреб', 56.414, 'куна', 'хорватский', 0, 0),
    ('Мексика', 'Центральная Америка', 'Мехико', 1923.04, 'мексиканский песо', 'испанский', 0, 0),
    ('Кот-д''Ивуар', 'Африка', 'Ямусукро', 322.5, 'франк', 'французский', 1, 0),
    ('Нидерланды', 'Европа', 'Амстердам', 41.5, 'евро', 'нидерландский', 0, 0),
    ('Швейцария', 'Европа', 'Берн', 41.3, 'швейцарский франк', 'немецкий', 0, 0),
    ('Того', 'Африка', 'Ломе', 56.6, 'франк', 'французский', 1, 0),
    ('Иран', 'Азия', 'Тегеран', 1650, 'риал', 'персидский', 0, 0),
    ('Австралия', 'Австралия', 'Канберра', 7700, 'австралийский доллар', 'английский', 0, 0),
    ('Сербия и Черногория', 'Европа', 'Белград', 102.2, 'динар', 'сербский', 0, 0),
    ('Гана', 'Африка', 'Аккра', 238.5, 'седи', 'английский', 1, 0),
    ('Чехия', 'Европа', 'Прага', 78.9, 'крона', 'чешский', 0, 0);

--    ----------------------
-- Обязательно: выполнить любые 5 запросов
-- Дополнительно: выполнить все 10 запросов

-- 1. Определить количество стран-участниц чемпионата мира.
-- 2. Определить количество стран, становившихся чемпионами мира.
-- 3. Определить количество стран-участниц чемпионата мира, в которых официальным языком является испанский язык.
-- 4. Определить количество дебютантов чемпионата мира.
-- 5. Определить наибольшую территорию из всех стран-участниц. (2 варианта)
-- 6. Определить наибольшую территорию из всех европейских стран-участниц. (2 варианта)
-- 7. Определить суммарное количество чемпионских титулов, выигранных странами участницами.
-- 8. Определить суммарное количество чемпионских титулов, выигранных европейскими странами участницами.
-- 9. Определить наименьшую территорию из всех американских стран-участниц. (2 варианта)
-- 10. Определить среднее значение территории среди африканских стран.0


#Number of countries participating in the World Cup
SELECT COUNT(DISTINCT country) AS participant_countries FROM worldcup.teams;

#Number of countries that became world champions
SELECT COUNT(DISTINCT Champion) AS champion_countries FROM worldcup.teams WHERE Champion IS NOT NULL;

#The number of countries participating in the World Cup in which the official language is Spanish.
SELECT COUNT(DISTINCT country) AS spanish_speaking_countries
FROM worldcup.teams t
WHERE t.language = 'испанский';

#The number of debutants at the World Championship
SELECT COUNT(country) AS debutant_countries
FROM worldcup.teams
WHERE Debut = 1;


#The largest territory of all participating countries.

#Variant 1
SELECT MAX(t.Territory) AS largest_area
FROM worldcup.teams t;

#Variant 2
SELECT t1.country, t1.Territory AS largest_area
FROM worldcup.teams t1
WHERE t1.Territory = (
    SELECT MAX(t2.Territory)
    FROM worldcup.teams t2
    WHERE t2.country = t1.country
)
ORDER BY t1.Territory DESC
LIMIT 1;;


#The largest territory of all European participating countries

#Variant 1
SELECT MAX(t.Territory) AS largest_area
FROM worldcup.teams t
WHERE t.Continent = 'Европа';

#Variant 2
SELECT country, MAX(Territory) AS largest_area
FROM WorldCup.teams
WHERE TRIM(continent) = 'Европа'
GROUP BY country
ORDER BY largest_area DESC
LIMIT 1;

#The total number of championship titles won by the participating countries.
SELECT sum(Champion) AS total_titles
FROM worldcup.teams
WHERE Champion != 0;

#The total number of championship titles won by the European participating countries.
SELECT sum(Champion) AS european_titles
FROM worldcup.teams
WHERE Champion !=0 AND teams.continent = 'Европа';


#The smallest territory of all American member countries
#Variant 1
SELECT MIN(Territory) AS smallest_area
FROM worldcup.teams
WHERE Continent IN ('Южная Америка', 'Центральная Америка', 'Северная Америка') ;

#Variant 2
SELECT country, MIN(Territory) AS smallest_area
FROM worldcup.teams
WHERE Continent IN ('Южная Америка', 'Центральная Америка', 'Северная Америка')
GROUP BY country
ORDER BY smallest_area ASC
LIMIT 1;


#The average territory among African countries
SELECT AVG(Territory) AS average_african_area
FROM worldcup.teams
WHERE continent = 'Африка';







