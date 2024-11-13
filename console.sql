CREATE DATABASE Student_marks_2; #Создание БД

USE Student_marks_2; #Запуск использования БД
# Создание таблицы с данными студентов
CREATE TABLE Student_marks_2 (
                               StudentID INT PRIMARY KEY AUTO_INCREMENT,
                               FullName VARCHAR(255) NOT NULL,
                               City VARCHAR(100),
                               Country VARCHAR(100),
                               DateOfBirth DATE,
                               Email VARCHAR(150),
                               ContactPhone VARCHAR(20),
                               GroupName VARCHAR(100),
                               AverageYearGrade DECIMAL(4, 2),
                               MinSubjectName VARCHAR(100),
                               MinAverageGrade DECIMAL(4, 2),
                               MaxSubjectName VARCHAR(100),
                               MaxAverageGrade DECIMAL(4, 2)
);

# Вставка данных студентов в таблицу
INSERT INTO Student_marks_2 (FullName, City, Country, DateOfBirth, Email, ContactPhone, GroupName, AverageYearGrade, MinSubjectName, MinAverageGrade, MaxSubjectName, MaxAverageGrade)
VALUES
    ('Ivan Vazov', 'Odesa', 'Ukraine', '2000-01-15', 'van.vaz@gd.com', '380667775533', 'Biology2023', 4.75, 'Chemistry', 2.8, 'Mathematics', 4.5),
    ('Katya Hodr', 'Kyiv', 'Norway', '1999-05-23', 'kate.hdr@gd.com', '380667745454', 'Physics2023', 4.20, 'History', 3.1, 'Physics', 4.9),
    ('Leonid Fastov', 'Lviv', 'USA', '2001-07-14', 'len.fast@gd.com', '380667778953', 'Chemistry2023', 4.50, 'Biology', 2.9, 'Chemistry', 4.3),
    ('Darya Gobu', 'Kherson', 'England', '2002-09-30', 'dasha.gb@gd.com', '38066722558', 'Mathematics2023', 4.00, 'Geography', 3.2, 'Mathematics', 4.8);

SELECT * FROM Student_marks_2; #Выбор и отображение всех строк с данными о студентах

#Отображение ФИО всех студентов
SELECT FullName
FROM Student_marks_2;

#Отображение всех средних оценок
SELECT AVG(AverageYearGrade) AS average_grade
FROM Student_marks_2;

#Показать страны студентов
SELECT DISTINCT country
FROM Student_marks_2;

#Показать города студентов
SELECT DISTINCT city
FROM Student_marks_2;
SELECT AVG(AverageYearGrade) AS average_grade
FROM Student_marks_2;
#Показать названия групп
SELECT DISTINCT GroupName
FROM Student_marks_2;