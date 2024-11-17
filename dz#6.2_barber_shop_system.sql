DROP DATABASE IF EXISTS BarberShop;
CREATE DATABASE BarberShop;

USE BarberShop;

CREATE TABLE Workers_Barber(
                        Id int AUTO_INCREMENT PRIMARY KEY,
                        FirstName varchar(15) NOT NULL,
                        LastName varchar(25) NOT NULL,
                        Sex varchar(3) NOT NULL,
                        Rank_Barber varchar(20) NOT NULL,
                        Procedure_Index int NOT NULL,
                        Status_Barber varchar(10) NOT NULL
);

CREATE TABLE Client_Barber(
                        Id int AUTO_INCREMENT PRIMARY KEY,
                        FirstName varchar(15) NOT NULL,
                        LastName varchar(25) NOT NULL,
                        Sex varchar(3) NOT NULL
);

CREATE TABLE Workers_Contact(
                        Id int AUTO_INCREMENT PRIMARY KEY,
                        Id_Barber int NOT NULL,
                        Tel_Barber varchar(25),
                        Email_Barber varchar(100) NOT NULL UNIQUE,
                        FOREIGN KEY (Id_Barber) REFERENCES Workers_Barber(Id)
);

CREATE TABLE Client_Contact(
                                Id int AUTO_INCREMENT PRIMARY KEY,
                                Id_Client int NOT NULL,
                                Tel_Client varchar(25),
                                Email_Client varchar(100) NOT NULL UNIQUE,
                                FOREIGN KEY (Id_Client) REFERENCES Client_Barber(Id)
);

CREATE TABLE Workers_Info(
                                Id int AUTO_INCREMENT PRIMARY KEY,
                                Id_Barber int NOT NULL,
                                Date_birth_Barber DATE NOT NULL,
                                Date_work_begin_Barber DATE NOT NULL,
                                FOREIGN KEY (Id_Barber) REFERENCES Workers_Barber(Id)
);

CREATE TABLE Client_Feedback(
                             Id int AUTO_INCREMENT PRIMARY KEY,
                             Id_Client int NOT NULL,
                             Id_Barber int NOT NULL,
                             Rating_Barber int NOT NULL,
                             Inform_Feedback varchar(500) NOT NULL,
                             Date_Feedback DATE NOT NULL
);

CREATE TABLE Procedure_table(
                                Id int AUTO_INCREMENT PRIMARY KEY,
                                Procedure_Name varchar(30) NOT NULL,
                                Procedure_Price int NOT NULL,
                                Procedure_Time int NOT NULL,
                                Procedure_Index int NOT NULL
);

CREATE TABLE Schedule_Time(
                               Id int AUTO_INCREMENT PRIMARY KEY,
                               Id_Barber int NOT NULL,
                               Id_Client  int DEFAULT 0,
                               Procedure_ID int DEFAULT 0,
                               AvailableDate DATE,
                               AvailableTime TIME,
                               ID_Feedback  Int DEFAULT 0

);
CREATE TABLE Schedule_Time_Archive (
                                       Id int AUTO_INCREMENT PRIMARY KEY,
                                       Id_Barber int NOT NULL,
                                       Id_Client int NOT NULL,
                                       Procedure_ID int NOT NULL,
                                       AvailableDate DATE,
                                       AvailableTime TIME,
                                       ID_Feedback int DEFAULT 0,
                                       ArchivedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);




DELIMITER //


#Moving to the archive table

CREATE TRIGGER after_delete_schedule_time
    AFTER DELETE ON Schedule_Time
    FOR EACH ROW
BEGIN
    INSERT INTO Schedule_Time_Archive (Id_Barber,
                                       Id_Client,
                                       Procedure_ID ,
                                       AvailableDate,
                                       AvailableTime,
                                       ID_Feedback
                                       )
    VALUES (Old.Id_Barber,
            Old.Id_Client,
            Old.Procedure_ID ,
            Old.AvailableDate,
            Old.AvailableTime,
            Old.ID_Feedback );
END //

#Updating to the archive table

CREATE TRIGGER after_update_schedule_time
    AFTER UPDATE ON Schedule_Time
    FOR EACH ROW
BEGIN
    INSERT INTO Schedule_Time_Archive (Id_Barber,
                                       Id_Client,
                                       Procedure_ID ,
                                       AvailableDate,
                                       AvailableTime,
                                       ID_Feedback
    )
    VALUES (Old.Id_Barber,
            Old.Id_Client,
            Old.Procedure_ID ,
            Old.AvailableDate,
            Old.AvailableTime,
            Old.ID_Feedback );
END //


DROP TRIGGER IF EXISTS Procedure_Insert_Check;

CREATE TRIGGER Procedure_Insert_Check
    BEFORE UPDATE ON schedule_time
    FOR EACH ROW
BEGIN
    DECLARE barber_index INT;
    DECLARE assigned_proc_index INT;

    IF OLD.Procedure_ID <> NEW.Procedure_ID THEN
        SELECT Procedure_Index
        INTO barber_index
        FROM workers_barber
        WHERE Id = NEW.Id_Barber
        LIMIT 1;

        SELECT Procedure_Index
        INTO assigned_proc_index
        FROM procedure_table
        WHERE Id = NEW.Procedure_ID
        LIMIT 1;

        IF barber_index < assigned_proc_index THEN
            SIGNAL SQLSTATE '45000'
                SET MESSAGE_TEXT = 'Procedure index for barber is too low for the assigned procedure!';
        END IF;
    END IF;
END//

# Age Barber Checking(21)
CREATE TRIGGER check_barber_age
    BEFORE INSERT ON Workers_Info
    FOR EACH ROW
BEGIN
    DECLARE age INT;
    SET age = TIMESTAMPDIFF(YEAR, NEW.Date_birth_Barber, CURDATE());
    IF age < 21 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Barber must be at least 21 years old.';
    END IF;
END //

DELIMITER ;


INSERT INTO Workers_Barber (FirstName, LastName, Sex, Rank_Barber, Procedure_Index, Status_Barber)
VALUES
    ('John', 'Smith', 'M', 'Chief', 3, 'Active'),
    ('Emily', 'Jones', 'F', 'Middle', 2, 'Active'),
    ('Michael', 'Brown', 'M', 'Middle', 2, 'Active'),
    ('Sarah', 'Davis', 'F', 'Middle', 2, 'Active'),
    ('David', 'Wilson', 'M', 'Junior', 1, 'Active'),
    ('Sophia', 'Miller', 'F', 'Junior', 1, 'Active'),
    ('Daniel', 'Taylor', 'M', 'Junior', 1, 'Active');


INSERT INTO Client_Barber (FirstName, LastName, Sex)
VALUES
    ('Alice', 'Smith', 'F'),
    ('Bob', 'Johnson', 'M'),
    ('Carol', 'Williams', 'F'),
    ('David', 'Brown', 'M'),
    ('Eve', 'Jones', 'F'),
    ('Frank', 'Garcia', 'M'),
    ('Grace', 'Martinez', 'F'),
    ('Hank', 'Davis', 'M'),
    ('Ivy', 'Lopez', 'F'),
    ('Jack', 'Wilson', 'M');


INSERT INTO Workers_Contact (Id_Barber, Tel_Barber, Email_Barber)
VALUES
    (1, 1234567890, 'john.smith@example.com'),
    (2, 2345678901, 'emily.jones@example.com'),
    (3, 3456789012, 'michael.brown@example.com'),
    (4, 4567890123, 'sarah.davis@example.com'),
    (5, 5678901234, 'david.wilson@example.com'),
    (6, 6789012345, 'sophia.miller@example.com'),
    (7, 7890123456, 'daniel.taylor@example.com');


INSERT INTO Client_Contact (Id_Client, Tel_Client, Email_Client)
VALUES
    (1, 1987654321, 'alice.smith@example.com'),
    (2, 2987654321, 'bob.johnson@example.com'),
    (3, 3987654321, 'carol.williams@example.com'),
    (4, 4987654321, 'david.brown@example.com'),
    (5, 5987654321, 'eve.jones@example.com'),
    (6, 6987654321, 'frank.garcia@example.com'),
    (7, 7987654321, 'grace.martinez@example.com'),
    (8, 8987654321, 'hank.davis@example.com'),
    (9, 9987654321, 'ivy.lopez@example.com'),
    (10, 1087654321, 'jack.wilson@example.com');


INSERT INTO Workers_Info (Id_Barber, Date_birth_Barber, Date_work_begin_Barber)
VALUES
    (1, '1990-01-15', '2010-03-01'),
    (2, '1985-05-25', '2012-06-15'),
    (3, '1980-08-10', '2011-09-20'),
    (4, '1987-03-30', '2014-12-05'),
    (5, '1991-11-05', '2016-04-07'),
    (6, '1989-07-18', '2015-02-19'),
    (7, '1992-09-22', '2018-10-11');


INSERT INTO Client_Feedback (Id_Client, Id_Barber, Rating_Barber, Inform_Feedback, Date_Feedback) VALUES
                                                                                                      (1,  1,  5, 'Отличная работа, очень доволен!', '2023-01-01'),
                                                                                                      (2,  2,  4, 'Неплохо, но могло быть лучше.', '2023-01-02'),
                                                                                                      (3,  3,  5, 'Лучший барбер в городе!', '2023-01-03'),
                                                                                                      (4,  1,  3, 'Средний уровень, не впечатлил.', '2023-01-04'),
                                                                                                      (5,  4,  4, 'Хорошо, но можно улучшить качество услуг.', '2023-01-05'),
                                                                                                      (1,  2,  2, 'Не понравилось, будет искать другой салон.', '2023-01-06'),
                                                                                                      (6,  5,  5, 'Замечательный мастер, приду еще!', '2023-01-07'),
                                                                                                      (2,  3,  4, 'Хороший специалист, но слегка задержался.', '2023-01-08'),
                                                                                                      (4,  2,  3, 'Ожидания не оправданы, уровень низковат.', '2023-01-09'),
                                                                                                      (7,  1,  5, 'Великолепный стиль, всем рекомендую!', '2023-01-10'),
                                                                                                      (8,  4,  4, 'Доволен результатом, вернусь снова.', '2023-01-11'),
                                                                                                      (3,  5,  4, 'Добротная стрижка, все понравилось.', '2023-01-12'),
                                                                                                      (1,  4,  2, 'К сожалению, не мой стиль.', '2023-01-13'),
                                                                                                      (5,  3,  5, 'Лучший мастер по мужским стрижкам!', '2023-01-14'),
                                                                                                      (6,  2,  4, 'Хорошая работа, оставить чаевые.', '2023-01-15'),
                                                                                                      (7,  5,  5, 'Идеально подошел для меня.', '2023-01-16'),
                                                                                                      (2,  1,  3, 'Нормально, но есть куда расти.', '2023-01-17'),
                                                                                                      (3,  4,  4, 'Произвел хорошее впечатление.', '2023-01-18'),
                                                                                                      (8,  3,  5, 'Высший класс, оценка 5 звезд!', '2023-01-19'),
                                                                                                      (5,  2,  3, 'Среднее качество, но терпимо.', '2023-01-20');




INSERT INTO Procedure_table (Procedure_Name, Procedure_Price, Procedure_Time, Procedure_Index)
VALUES
    ('Haircut', 1500, 60, '1'),
    ('Trim', 1000, 30, '1'),
    ('Shave', 700, 30, '2'),
    ('Beard Styling', 1200, 60, '2'),
    ('Hair Coloring', 3000, 60, '2'),
    ('Facial', 2500, 30, '3'),
    ('Scalp Massage', 800, 30, '3');



#Filling the archive, for example
INSERT INTO Schedule_Time_Archive (Id_Barber, Id_Client, Procedure_ID, AvailableDate, AvailableTime, ID_Feedback)
SELECT
    FLOOR(1 + (RAND() * 7)),
    CB.Id,
    FLOOR(1 + (RAND() * 7)),
    CURDATE() - INTERVAL FLOOR(RAND() * 30) DAY,
    SEC_TO_TIME(FLOOR(RAND() * 86400)),
    FLOOR(1 + (RAND() * 12))
FROM
    Client_Barber CB
ORDER BY
    RAND()
LIMIT 2500;


#Creating Scheduling for barbers

DELIMITER //

CREATE PROCEDURE GenerateSchedule()
BEGIN
    DECLARE startDate DATE DEFAULT '2023-09-25';
    DECLARE endDate DATE DEFAULT '2023-09-29';
    DECLARE startTime TIME DEFAULT '09:00:00';
    DECLARE endTime TIME DEFAULT '18:00:00';
    DECLARE barberId INT DEFAULT 1;
    DECLARE currentDate DATE;
    DECLARE currentTime TIME;


    WHILE barberId <= 7 DO
            SET currentDate = startDate;
            WHILE currentDate <= endDate DO
                    SET currentTime = startTime;
                    WHILE currentTime < endTime DO
                            INSERT INTO Schedule_Time (Id_Barber, AvailableDate, AvailableTime)
                            VALUES (barberId, currentDate, currentTime);
                            SET currentTime = ADDTIME(currentTime, SEC_TO_TIME(30 * 60));
                        END WHILE;
                    SET currentDate = DATE_ADD(currentDate, INTERVAL 1 DAY);
                END WHILE;
            SET barberId = barberId + 1;
        END WHILE;
END
//


CALL GenerateSchedule();

-- Update entries with client and procedure information

CREATE PROCEDURE UpdateSchedule(
    IN barber_id INT,
    IN client_id INT,
    IN Procedure_client INT,
    IN Date_visit DATETIME,
    IN Time_visit TIME
)
BEGIN
    DECLARE schedule_id INT;
    SELECT id INTO schedule_id
    FROM schedule_time
    WHERE barber_id = Id_Barber AND Date_visit = AvailableDate AND Time_visit=AvailableTime
    LIMIT 1;

    IF schedule_id IS NOT NULL THEN
        UPDATE schedule_time
        SET Id_Client = client_id, Procedure_ID = Procedure_client
        WHERE id = schedule_id;
    ELSE
        INSERT INTO Schedule_time (Id_Barber, Id_Client, Procedure_id, AvailableDate,AvailableTime)
        VALUES (barber_id, client_id, Procedure_client, Date_visit, Time_visit);
    END IF;
END //

DELIMITER ;

CALL  UpdateSchedule(2,4,3,'2023-09-25','10:00:00');
CALL  UpdateSchedule(7,5,7,'2023-09-25','13:30:00');



INSERT INTO Workers_Barber (FirstName, LastName, Sex, Rank_Barber, Procedure_Index, Status_Barber)
VALUES
    ('Alex', 'Smith', 'M', 'Chief', 3, 'Active');

INSERT INTO Workers_Info (Id_Barber, Date_birth_Barber, Date_work_begin_Barber)
VALUES (8,'1990-09-27','2022-09-27');


DELETE FROM Schedule_time
WHERE id = 570;

DELETE FROM workers_barber WHERE id = 4;


#1)Повернути ПІБ всіх барберів салону

SELECT CONCAT(FirstName, ' ', LastName) AS ПІБ
FROM workers_barber;

#2)Повернути інформацію про всіх синьйор-барберів

SELECT * FROM workers_barber
WHERE Rank_Barber = 'Chief';

#3)Повернути інформацію про всіх барберів, які можуть надати послугу
# традиційного гоління бороди.

CREATE PROCEDURE GetBarbersByService(IN serviceName VARCHAR(100))
BEGIN
    SELECT b.Id, b.FirstName, b.LastName, b.Rank_Barber
    FROM `workers_barber` b
             JOIN `procedure_table` ps ON b.Procedure_Index >= ps.Procedure_Index
    WHERE ps.Procedure_Name = serviceName;
END;

CALL GetBarbersByService('Beard Styling');

#4)Повернути інформацію про всіх барберів, які можуть надати конкретну послугу.
# Інформація про потрібну послугу надається як параметр.

CREATE PROCEDURE GetBarbersByService(IN serviceName VARCHAR(100))
BEGIN
    SELECT b.Id, b.FirstName, b.LastName, b.Rank_Barber
    FROM `workers_barber` b
             JOIN `procedure_table` ps ON b.Procedure_Index >= ps.Procedure_Index
    WHERE ps.Procedure_Name = serviceName;
END;

CALL GetBarbersByService('Trim');

#5) Повернути інформацію про всіх барберів, які працюють понад зазначену кількість років.
# Кількість років передається як параметр.

CREATE PROCEDURE GetBarbersWithExperience(IN num_years INT)
BEGIN
SELECT wb.*, wi.*
FROM workers_barber wb
         JOIN workers_info wi ON wb.id = wi.id
WHERE DATEDIFF(CURDATE(), wi.Date_work_begin_Barber) / 365 > num_years;
END;

CALL GetBarbersWithExperience(4);

#6)Повернути кількість синьйор-барберів та кількість джуніор-барберів.

SELECT
    SUM(CASE WHEN Rank_Barber = 'Chief' THEN 1 ELSE 0 END) AS senior_barbers,
    SUM(CASE WHEN Rank_Barber = 'Junior' THEN 1 ELSE 0 END) AS junior_barbers
FROM
    workers_barber;

#7)Повернути інформацію про постійних клієнтів. Критерій постійного клієнта: був у салоні задану кількість разів.
# Кількість передається як параметр.
drop procedure GetRegularClients;
CREATE PROCEDURE GetRegularClients(IN min_visits INT)
BEGIN
    SELECT
        c.Id,
        c.FirstName,
        c.LastName,
        c.Sex,
        COUNT(st.ID_client) AS visit_count
    FROM
        client_barber c
            JOIN
        schedule_time_archive st ON c.Id = st.Id_Client
    GROUP BY
        c.Id, c.FirstName, c.LastName, c.Sex
    HAVING
        visit_count >= min_visits;
END;


CALL GetRegularClients(3);

#8)Заборонити можливість видалення інформації про чиф-барбер,
# якщо не додано другий чиф-барбер.

CREATE TRIGGER before_chiefbarber_delete
    BEFORE DELETE ON Workers_Barber
    FOR EACH ROW
BEGIN
    DECLARE chiefbarber_count INT;
    IF OLD.Rank_Barber = 'Chief-barber' THEN
        SELECT COUNT(*) INTO chiefbarber_count FROM Workers_Barber;
        IF chiefbarber_count <= 1 THEN
            SIGNAL SQLSTATE '45000'
                SET MESSAGE_TEXT = 'It is impossible to remove the last chief barber. First add the chief barber.';
        END IF;
    END IF;
END ;

#9)Заборонити додавати барберів молодше 21 року

CREATE TRIGGER check_barber_age
    BEFORE INSERT ON Workers_Info
    FOR EACH ROW
BEGIN
    DECLARE age INT;
    SET age = TIMESTAMPDIFF(YEAR, NEW.Date_birth_Barber, CURDATE());
    IF age < 21 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Barber must be at least 21 years old.';
    END IF;
END ;

