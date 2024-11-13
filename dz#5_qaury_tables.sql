DROP DATABASE IF EXISTS Library;
CREATE DATABASE Library;

USE Library;

CREATE TABLE Authors(
                        Id int AUTO_INCREMENT PRIMARY KEY,
                        FirstName nvarchar(15) NOT NULL,
                        LastName nvarchar(25) NOT NULL
);

CREATE TABLE Books(
                      Id int AUTO_INCREMENT PRIMARY KEY,
                      Name nvarchar(100) NOT NULL,
                      Pages int NOT NULL,
                      YearPress int NOT NULL,
                      Id_Themes int NOT NULL,
                      Id_Catery int NOT NULL,
                      Id_Author int NOT NULL,
                      Id_Press int NOT NULL,
                      Comment nvarchar(50) NULL,
                      Quantity int NOT NULL
);

CREATE TABLE Cateries(
                         Id int AUTO_INCREMENT PRIMARY KEY,
                         Name nvarchar(30) NOT NULL
);


CREATE TABLE Departments(
                            Id int AUTO_INCREMENT PRIMARY KEY,
                            Name nvarchar(40) NOT NULL
);

CREATE TABLE Faculties(
                          Id int AUTO_INCREMENT PRIMARY KEY,
                          Name nvarchar(20) NOT NULL
);


CREATE TABLE Subgroup(
                         Id int AUTO_INCREMENT PRIMARY KEY,
                         Name nvarchar(10) NOT NULL,
                         Id_Faculty int NOT NULL
);


CREATE TABLE Libs(
                     Id int AUTO_INCREMENT PRIMARY KEY,
                     FirstName nvarchar(15) NOT NULL,
                     LastName nvarchar(25) NOT NULL
);


CREATE TABLE Press(
                      Id int AUTO_INCREMENT PRIMARY KEY,
                      Name nvarchar(30) NOT NULL
);

CREATE TABLE S_Cards(
                        Id int AUTO_INCREMENT PRIMARY KEY,
                        Id_Student int NOT NULL,
                        Id_Book int NOT NULL,
                        DateOut datetime NOT NULL,
                        DateIn datetime NULL,
                        Id_Lib int NOT NULL
);

CREATE TABLE Students(
                         Id int AUTO_INCREMENT PRIMARY KEY,
                         FirstName nvarchar(15) NOT NULL,
                         LastName nvarchar(25) NOT NULL,
                         Id_Group int NOT NULL,
                         Term int NOT NULL
);

CREATE TABLE T_Cards(
                        Id int AUTO_INCREMENT PRIMARY KEY,
                        Id_Teacher int NOT NULL,
                        Id_Book int NOT NULL,
                        DateOut datetime NOT NULL,
                        DateIn datetime NULL,
                        Id_Lib int NOT NULL
);

CREATE TABLE Teachers(
                         Id int AUTO_INCREMENT PRIMARY KEY,
                         FirstName nvarchar(15) NOT NULL,
                         LastName nvarchar(25) NOT NULL,
                         Id_Dep int NOT NULL
);

CREATE TABLE Themes(
                       Id int AUTO_INCREMENT PRIMARY KEY,
                       Name nvarchar(30) NOT NULL
);

INSERT Authors (Id, FirstName, LastName) VALUES (1, N'Джеймс Р.', N'Грофф');
INSERT Authors (Id, FirstName, LastName) VALUES (2, N'Сергей', N'Никольский');
INSERT Authors (Id, FirstName, LastName) VALUES (3, N'Михаил', N'Маров');
INSERT Authors (Id, FirstName, LastName) VALUES (4, N'Борис', N'Карпов');
INSERT Authors (Id, FirstName, LastName) VALUES (5, N'Алексей', N'Архангельский');
INSERT Authors (Id, FirstName, LastName) VALUES (6, N'Владимир', N'Король');
INSERT Authors (Id, FirstName, LastName) VALUES (7, N'Евангелос', N'Петрусос');
INSERT Authors (Id, FirstName, LastName) VALUES (8, N'Маркус', N'Херхагер');
INSERT Authors (Id, FirstName, LastName) VALUES (9, N'Павел', N'Гарбар');
INSERT Authors (Id, FirstName, LastName) VALUES (10, N'Александр', N'Матросов');
INSERT Authors (Id, FirstName, LastName) VALUES (11, N'Людмила', N'Омельченко');
INSERT Authors (Id, FirstName, LastName) VALUES (12, N'Кевин', N'Рейчард');
INSERT Authors (Id, FirstName, LastName) VALUES (13, N'Ольга', N'Кокорева');
INSERT Authors (Id, FirstName, LastName) VALUES (14, N'Марк', N'Браун');
INSERT Books (Id, Name, Pages, YearPress, Id_Themes, Id_Catery, Id_Author, Id_Press, Comment, Quantity) VALUES (1, N'SQL', 816, 2001, 1, 1, 1, 2, N'2-е издание', 2);;
INSERT Books (Id, Name, Pages, YearPress, Id_Themes, Id_Catery, Id_Author, Id_Press, Comment, Quantity) VALUES (2, N'3D Studio Max 3', 640, 2000, 3, 6, 3, 3, N'Учебный курс', 3);
INSERT Books (Id, Name, Pages, YearPress, Id_Themes, Id_Catery, Id_Author, Id_Press, Comment, Quantity) VALUES (3, N'100 компонентов общего назначения библиотеки Delphi 5', 272, 1999, 2, 4, 5, 4, N'Компоненты', 1);;
INSERT Books (Id, Name, Pages, YearPress, Id_Themes, Id_Catery, Id_Author, Id_Press, Comment, Quantity) VALUES (4, N'Visual Basic 6', 416, 2000, 2, 5, 4, 3, N'Специальный справочник', 1);;
INSERT Books (Id, Name, Pages, YearPress, Id_Themes, Id_Catery, Id_Author, Id_Press, Comment, Quantity) VALUES (5, N'Курс математического анализа', 328, 1990, 4, 2, 2, 5, N'1-й том', 1);;
INSERT Books (Id, Name, Pages, YearPress, Id_Themes, Id_Catery, Id_Author, Id_Press, Comment, Quantity) VALUES (6, N'Библиотека C++ Builder 5: 70 компонентов ввода/вывода информации', 288, 2000, 2, 3, 5, 4, N'Компоненты', 1);;
INSERT Books (Id, Name, Pages, YearPress, Id_Themes, Id_Catery, Id_Author, Id_Press, Comment, Quantity) VALUES (7, N'Интегрированная среда разработки', 272, 2000, 2, 3, 5, 4, N'Среда разработки', 2);;
INSERT Books (Id, Name, Pages, YearPress, Id_Themes, Id_Catery, Id_Author, Id_Press, Comment, Quantity) VALUES (8, N'Русская справка (Help) по Delphi 5 и  Object Pascal', 32, 2000, 2, 4, 5, 4, N'Справочник', 1);;
INSERT Books (Id, Name, Pages, YearPress, Id_Themes, Id_Catery, Id_Author, Id_Press, Comment, Quantity) VALUES (9, N'Visual Basic 6.0 for Application', 488, 2000, 2, 5, 6, 6, N'Справочник с примерами', 3);
INSERT Books (Id, Name, Pages, YearPress, Id_Themes, Id_Catery, Id_Author, Id_Press, Comment, Quantity) VALUES (10, N'Visual Basic 6', 576, 2000, 2, 5, 7, 2, N'Руководство разработчика 1-й том', 1);;
INSERT Books (Id, Name, Pages, YearPress, Id_Themes, Id_Catery, Id_Author, Id_Press, Comment, Quantity) VALUES (11, N'Mathcad 2000', 416, 2000, 5, 7, 8, 2, N'Полное руководство', 1);;
INSERT Books (Id, Name, Pages, YearPress, Id_Themes, Id_Catery, Id_Author, Id_Press, Comment, Quantity) VALUES (12, N'Novell GroupWise 5.5 система электронной почты и коллективной работы', 480, 2000, 6, 8, 9, 2, N'Сетевые пакеты', 2);;
INSERT Books (Id, Name, Pages, YearPress, Id_Themes, Id_Catery, Id_Author, Id_Press, Comment, Quantity) VALUES (13, N'Реестр Windows 2000', 352, 2000, 9, 12, 13, 2, N'Руководство для профессионалов', 4);
INSERT Books (Id, Name, Pages, YearPress, Id_Themes, Id_Catery, Id_Author, Id_Press, Comment, Quantity) VALUES (14, N'Unix справочник', 384, 1999, 9, 13, 12, 3, N'Справочное руководство', 1);;
INSERT Books (Id, Name, Pages, YearPress, Id_Themes, Id_Catery, Id_Author, Id_Press, Comment, Quantity) VALUES (15, N'Самоучитель Visual FoxPro 6.0', 512, 1999, 1, 11, 11, 2, N'Самоучитель', 1);;
INSERT Books (Id, Name, Pages, YearPress, Id_Themes, Id_Catery, Id_Author, Id_Press, Comment, Quantity) VALUES (16, N'Самоучитель FrontPage 2000', 512, 1999, 7, 10, 11, 2, N'Самоучитель', 1);;
INSERT Books (Id, Name, Pages, YearPress, Id_Themes, Id_Catery, Id_Author, Id_Press, Comment, Quantity) VALUES (17, N'Самоучитель Perl', 432, 2000, 2, 9, 10, 2, N'Самоучитель', 2);;
INSERT Books (Id, Name, Pages, YearPress, Id_Themes, Id_Catery, Id_Author, Id_Press, Comment, Quantity) VALUES (18, N'HTML 3.2', 1040, 2000, 7, 14, 14, 2, N'Руководство', 5);
INSERT Cateries (Id, Name) VALUES (1, N'Язык SQL');
INSERT Cateries (Id, Name) VALUES (2, N'Математический анализ');
INSERT Cateries (Id, Name) VALUES (3, N'C++ Builder');
INSERT Cateries (Id, Name) VALUES (4, N'Delphi');
INSERT Cateries (Id, Name) VALUES (5, N'Visual Basic');
INSERT Cateries (Id, Name) VALUES (6, N'3D Studio Max');
INSERT Cateries (Id, Name) VALUES (7, N'Mathcad');
INSERT Cateries (Id, Name) VALUES (8, N'Novell');
INSERT Cateries (Id, Name) VALUES (9, N'Perl');
INSERT Cateries (Id, Name) VALUES (10, N'FrontPage');
INSERT Cateries (Id, Name) VALUES (11, N'Visual FoxPro');
INSERT Cateries (Id, Name) VALUES (12, N'Windows 2000');
INSERT Cateries (Id, Name) VALUES (13, N'Unix');
INSERT Cateries (Id, Name) VALUES (14, N'HTML');
INSERT Departments (Id, Name) VALUES (1, N'Программерства');
INSERT Departments (Id, Name) VALUES (2, N'Графики и Дизайна');
INSERT Departments (Id, Name) VALUES (3, N'Железа и Администрирования');
INSERT Faculties (Id, Name) VALUES (1, N'Программирования');
INSERT Faculties (Id, Name) VALUES (2, N'Веб-дизайна');
INSERT Faculties (Id, Name) VALUES (3, N'Администрирования');
INSERT Subgroup (Id, Name, Id_Faculty) VALUES (2, N'9П1', 1);;
INSERT Subgroup (Id, Name, Id_Faculty) VALUES (3, N'9П2', 1);;
INSERT Subgroup (Id, Name, Id_Faculty) VALUES (4, N'9А', 3);
INSERT Subgroup (Id, Name, Id_Faculty) VALUES (5, N'9Д', 2);;
INSERT Subgroup (Id, Name, Id_Faculty) VALUES (6, N'14А', 3);
INSERT Subgroup (Id, Name, Id_Faculty) VALUES (7, N'19П1', 1);;
INSERT Subgroup (Id, Name, Id_Faculty) VALUES (8, N'18П2', 1);;
INSERT Subgroup (Id, Name, Id_Faculty) VALUES (9, N'18А', 3);
INSERT Subgroup (Id, Name, Id_Faculty) VALUES (10, N'19Д', 2);;
INSERT Libs (Id, FirstName, LastName) VALUES (1, N'Сергей', N'Максименко');
INSERT Libs (Id, FirstName, LastName) VALUES (2, N'Дмитрий', N'Чеботарев');
INSERT Press (Id, Name) VALUES (1, N'DiaSoft');
INSERT Press (Id, Name) VALUES (2, N'BHV');
INSERT Press (Id, Name) VALUES (3, N'Питер');
INSERT Press (Id, Name) VALUES (4, N'Бином');
INSERT Press (Id, Name) VALUES (5, N'Наука');
INSERT Press (Id, Name) VALUES (6, N'Кудиц-Образ');
INSERT Press (Id, Name) VALUES (7, N'Диалектика');
INSERT S_Cards (Id, Id_Student, Id_Book, DateOut, DateIn, Id_Lib) VALUES (1, 2, 1, CAST(N'2001-05-17 00:00:00.000' AS DateTime), CAST(N'2001-06-12 00:00:00.000' AS DateTime), 1);;
INSERT S_Cards (Id, Id_Student, Id_Book, DateOut, DateIn, Id_Lib) VALUES (2, 17, 18, CAST(N'2000-05-18 00:00:00.000' AS DateTime), NULL, 1);;
INSERT S_Cards (Id, Id_Student, Id_Book, DateOut, DateIn, Id_Lib) VALUES (3, 6, 3, CAST(N'2001-04-21 00:00:00.000' AS DateTime), NULL, 2);;
INSERT S_Cards (Id, Id_Student, Id_Book, DateOut, DateIn, Id_Lib) VALUES (4, 21, 4, CAST(N'2001-03-26 00:00:00.000' AS DateTime), NULL, 2);;
INSERT S_Cards (Id, Id_Student, Id_Book, DateOut, DateIn, Id_Lib) VALUES (5, 3, 1, CAST(N'2000-05-07 00:00:00.000' AS DateTime), CAST(N'2001-04-12 00:00:00.000' AS DateTime), 1);;
INSERT S_Cards (Id, Id_Student, Id_Book, DateOut, DateIn, Id_Lib) VALUES (6, 7, 11, CAST(N'2001-06-02 00:00:00.000' AS DateTime), NULL, 2);;
INSERT S_Cards (Id, Id_Student, Id_Book, DateOut, DateIn, Id_Lib) VALUES (7, 16, 14, CAST(N'2001-04-05 00:00:00.000' AS DateTime), NULL, 1);;
INSERT S_Cards (Id, Id_Student, Id_Book, DateOut, DateIn, Id_Lib) VALUES (8, 11, 6, CAST(N'2001-05-05 00:00:00.000' AS DateTime), NULL, 2);;
INSERT S_Cards (Id, Id_Student, Id_Book, DateOut, DateIn, Id_Lib) VALUES (9, 17, 2, CAST(N'2001-10-01 00:00:00.000' AS DateTime), NULL, 2);;
INSERT S_Cards (Id, Id_Student, Id_Book, DateOut, DateIn, Id_Lib) VALUES (10, 10, 13, CAST(N'2001-05-05 00:00:00.000' AS DateTime), NULL, 1);;
INSERT Students (Id, FirstName, LastName, Id_Group, Term) VALUES (2, N'Вячеслав', N'Зезик', 8, 2);
INSERT Students (Id, FirstName, LastName, Id_Group, Term) VALUES (3, N'Ольга', N'Мантуляк', 8, 2);
INSERT Students (Id, FirstName, LastName, Id_Group, Term) VALUES (4, N'Ольга', N'Хренова', 8, 2);
INSERT Students (Id, FirstName, LastName, Id_Group, Term) VALUES (5, N'Ольга', N'Медведева', 8, 2);
INSERT Students (Id, FirstName, LastName, Id_Group, Term) VALUES (6, N'Галина', N'Инащенко', 8, 2);
INSERT Students (Id, FirstName, LastName, Id_Group, Term) VALUES (7, N'Юрий', N'Минаев', 8, 2);
INSERT Students (Id, FirstName, LastName, Id_Group, Term) VALUES (8, N'Юрий', N'Домовесов', 8, 2);
INSERT Students (Id, FirstName, LastName, Id_Group, Term) VALUES (9, N'Руслан', N'Ярмолович', 8, 2);
INSERT Students (Id, FirstName, LastName, Id_Group, Term) VALUES (10, N'Игорь', N'Удовик', 8, 2);
INSERT Students (Id, FirstName, LastName, Id_Group, Term) VALUES (11, N'Петр', N'Кацевич', 8, 2);
INSERT Students (Id, FirstName, LastName, Id_Group, Term) VALUES (12, N'Евгений', N'Бурцев', 3, 2);
INSERT Students (Id, FirstName, LastName, Id_Group, Term) VALUES (13, N'Флора', N'Побирская', 3, 2);
INSERT Students (Id, FirstName, LastName, Id_Group, Term) VALUES (14, N'Наталья', N'Гридина', 3, 2);
INSERT Students (Id, FirstName, LastName, Id_Group, Term) VALUES (15, N'Елена', N'Акусова', 3, 2);
INSERT Students (Id, FirstName, LastName, Id_Group, Term) VALUES (16, N'Светлана', N'Горшкова', 9, 2);
INSERT Students (Id, FirstName, LastName, Id_Group, Term) VALUES (17, N'Александр', N'Любенко', 10, 2);
INSERT Students (Id, FirstName, LastName, Id_Group, Term) VALUES (18, N'Евгения', N'Цимбалюк', 10, 2);
INSERT Students (Id, FirstName, LastName, Id_Group, Term) VALUES (19, N'Ольга', N'Болячевская', 5, 2);
INSERT Students (Id, FirstName, LastName, Id_Group, Term) VALUES (20, N'Станислав', N'Плешаков', 7, 2);
INSERT Students (Id, FirstName, LastName, Id_Group, Term) VALUES (21, N'Елена', N'Таран', 4, 2);
INSERT Students (Id, FirstName, LastName, Id_Group, Term) VALUES (22, N'Денис', N'Рогачевский', 6, 2);
INSERT Students (Id, FirstName, LastName, Id_Group, Term) VALUES (23, N'Оксана', N'Тихонова', 6, 2);
INSERT Students (Id, FirstName, LastName, Id_Group, Term) VALUES (24, N'Петр', N'Максимов', 3, 2);
INSERT Students (Id, FirstName, LastName, Id_Group, Term) VALUES (25, N'Ирина', N'Стогнеева', 5, 2);
INSERT T_Cards (Id, Id_Teacher, Id_Book, DateOut, DateIn, Id_Lib) VALUES (1, 2, 13, CAST(N'2000-01-01 00:00:00.000' AS DateTime), CAST(N'2001-07-04 00:00:00.000' AS DateTime), 1);
INSERT T_Cards (Id, Id_Teacher, Id_Book, DateOut, DateIn, Id_Lib) VALUES (2, 10, 2, CAST(N'2000-03-03 00:00:00.000' AS DateTime), NULL, 1);
INSERT T_Cards (Id, Id_Teacher, Id_Book, DateOut, DateIn, Id_Lib) VALUES (3, 6, 12, CAST(N'2000-06-04 00:00:00.000' AS DateTime), NULL, 2);
INSERT T_Cards (Id, Id_Teacher, Id_Book, DateOut, DateIn, Id_Lib) VALUES (4, 3, 1, CAST(N'2000-09-05 00:00:00.000' AS DateTime), NULL, 1);
INSERT T_Cards (Id, Id_Teacher, Id_Book, DateOut, DateIn, Id_Lib) VALUES (5, 8, 8, CAST(N'2000-05-05 00:00:00.000' AS DateTime), NULL, 2);
INSERT T_Cards (Id, Id_Teacher, Id_Book, DateOut, DateIn, Id_Lib) VALUES (6, 5, 18, CAST(N'2001-02-02 00:00:00.000' AS DateTime), NULL, 2);
INSERT T_Cards (Id, Id_Teacher, Id_Book, DateOut, DateIn, Id_Lib) VALUES (7, 12, 17, CAST(N'2001-03-04 00:00:00.000' AS DateTime), NULL, 1);
INSERT T_Cards (Id, Id_Teacher, Id_Book, DateOut, DateIn, Id_Lib) VALUES (8, 4, 18, CAST(N'2000-07-02 00:00:00.000' AS DateTime), NULL, 1);
INSERT Teachers (Id, FirstName, LastName, Id_Dep) VALUES (1, N'Григорий', N'Ящук', 1);
INSERT Teachers (Id, FirstName, LastName, Id_Dep) VALUES (2, N'Алекс', N'Туманов', 1);
INSERT Teachers (Id, FirstName, LastName, Id_Dep) VALUES (3, N'Сергей', N'Максименко', 2);
INSERT Teachers (Id, FirstName, LastName, Id_Dep) VALUES (4, N'Дмитрий', N'Боровский', 2);
INSERT Teachers (Id, FirstName, LastName, Id_Dep) VALUES (5, N'Виктор', N'Бровар', 2);
INSERT Teachers (Id, FirstName, LastName, Id_Dep) VALUES (6, N'Вадим', N'Ткаченко', 3);
INSERT Teachers (Id, FirstName, LastName, Id_Dep) VALUES (7, N'Вячеслав', N'Калашников', 3);
INSERT Teachers (Id, FirstName, LastName, Id_Dep) VALUES (8, N'Руслан', N'Кучеренко', 1);
INSERT Teachers (Id, FirstName, LastName, Id_Dep) VALUES (9, N'Андрей', N'Тендюк', 1);
INSERT Teachers (Id, FirstName, LastName, Id_Dep) VALUES (10, N'Анатолий', N'Выклюк', 2);
INSERT Teachers (Id, FirstName, LastName, Id_Dep) VALUES (11, N'Олег', N'Резниченко', 3);
INSERT Teachers (Id, FirstName, LastName, Id_Dep) VALUES (12, N'Александр', N'Артемов', 1);
INSERT Themes (Id, Name) VALUES (1, N'Базы данных');
INSERT Themes (Id, Name) VALUES (2, N'Программирование');
INSERT Themes (Id, Name) VALUES (3, N'Графические пакеты');
INSERT Themes (Id, Name) VALUES (4, N'Высшая математика');
INSERT Themes (Id, Name) VALUES (5, N'Математические пакеты');
INSERT Themes (Id, Name) VALUES (6, N'Сети');
INSERT Themes (Id, Name) VALUES (7, N'Web-дизайн');
INSERT Themes (Id, Name) VALUES (8, N'Windows 2000');
INSERT Themes (Id, Name) VALUES (9, N'Операционные системы');
ALTER TABLE Books ADD  CONSTRAINT Books_FK00 FOREIGN KEY(Id_Author)
    REFERENCES Authors (Id)
    ON UPDATE CASCADE
    ON DELETE CASCADE;

ALTER TABLE Books ADD CONSTRAINT Books_FK01 FOREIGN KEY(Id_Catery)
    REFERENCES Cateries (Id)
    ON UPDATE CASCADE
    ON DELETE CASCADE;

ALTER TABLE Books ADD  CONSTRAINT Books_FK02 FOREIGN KEY(Id_Press)
    REFERENCES Press (Id)
    ON UPDATE CASCADE
    ON DELETE CASCADE;

ALTER TABLE Books   ADD  CONSTRAINT Books_FK03 FOREIGN KEY(Id_Themes)
    REFERENCES Themes (Id)
    ON UPDATE CASCADE
    ON DELETE CASCADE;

ALTER TABLE Subgroup   ADD  CONSTRAINT Subgroup_FK00 FOREIGN KEY(Id_Faculty)
    REFERENCES Faculties (Id)
    ON UPDATE CASCADE
    ON DELETE CASCADE;

ALTER TABLE S_Cards   ADD  CONSTRAINT S_Cards_FK00 FOREIGN KEY(Id_Book)
    REFERENCES Books (Id)
    ON UPDATE CASCADE
    ON DELETE CASCADE;

ALTER TABLE S_Cards   ADD  CONSTRAINT S_Cards_FK01 FOREIGN KEY(Id_Lib)
    REFERENCES Libs (Id)
    ON UPDATE CASCADE
    ON DELETE CASCADE;

ALTER TABLE S_Cards   ADD  CONSTRAINT S_Cards_FK02 FOREIGN KEY(Id_Student)
    REFERENCES Students (Id)
    ON UPDATE CASCADE
    ON DELETE CASCADE;

ALTER TABLE Students   ADD  CONSTRAINT Students_FK00 FOREIGN KEY(Id_Group)
    REFERENCES Subgroup (Id)
    ON UPDATE CASCADE
    ON DELETE CASCADE;

ALTER TABLE T_Cards   ADD  CONSTRAINT T_Cards_FK00 FOREIGN KEY(Id_Book)
    REFERENCES Books (Id)
    ON UPDATE CASCADE
    ON DELETE CASCADE;

ALTER TABLE T_Cards   ADD  CONSTRAINT T_Cards_FK01 FOREIGN KEY(Id_Lib)
    REFERENCES Libs (Id)
    ON UPDATE CASCADE
    ON DELETE CASCADE;

ALTER TABLE T_Cards  ADD  CONSTRAINT T_Cards_FK02 FOREIGN KEY(Id_Teacher)
    REFERENCES Teachers (Id)
    ON UPDATE CASCADE
    ON DELETE CASCADE;

ALTER TABLE Teachers ADD  CONSTRAINT Teachers_FK00 FOREIGN KEY(Id_Dep)
    REFERENCES Departments (Id)
    ON UPDATE CASCADE
    ON DELETE CASCADE;

