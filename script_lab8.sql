create table if not exists Единицы_измерения (
	Наименование_единицы_измерения varchar(60) primary key
);

create table if not exists Товары (
	ID_товара serial primary key,
	Наименование_товара varchar(255),
	Цена_закупки money,
	Количество_закупленного_товара int,
	Дата_закупки date,
	Наименование_единицы_измерения varchar(60) references Единицы_измерения (Наименование_единицы_измерения)
);

create table if not exists Продавцы (
	ID_продавца serial primary key,
	Фамилия varchar(100) not null,
	Имя varchar(100) not null,
	Отчество varchar(100) null,
	Процент_комиссионных int,
	Телефон varchar(15),
	Email varchar(100),
	Адрес varchar(255)
);

create table if not exists Товары_Продавцы (
	ID_товара_продавца serial primary key,
	ID_товара int references Товары (ID_товара),
	ID_продавца int references Продавцы (ID_продавца)
);

create table if not exists Продажи (
	ID_продажи serial primary key,
	Цена_продажи money,
	Количество_проданного_товара int,
	Дата_продажи date,
	ID_товара_продавца int references Товары_Продавцы (ID_товара_продавца)
);


INSERT INTO Единицы_измерения (Наименование_единицы_измерения)
VALUES 
	('Миллиграмм'),
	('Грамм'),
	('Килограмм'),
	('Центнер'),
	('Тонна'),
	('Фунт'),
	('Миллиметр'),
	('Сантиметр'),
	('Дециметр'),
	('Метр'),
	('Километр'),
	('Дюйм'),
	('Фут'),
	('Ярд'),
	('Миля'),
    ('Миллилитр'),
    ('Литр'),
    ('Штука'),
    ('Штук');

INSERT INTO Товары (Наименование_товара, Цена_закупки, Количество_закупленного_товара, Дата_закупки, Наименование_единицы_измерения)
VALUES 
    ('Шоколад', 5.99, 100, '2023-11-26', 'Грамм'),
    ('Молоко', 2.49, 200, '2023-11-25', 'Литр'),
    ('Яйца', 1.99, 500, '2023-11-24', 'Штук'),
    ('Кофе', 8.79, 50, '2023-11-23', 'Грамм'),
    ('Хлеб', 1.29, 150, '2023-11-22', 'Штука'),
    ('Масло', 3.49, 80, '2023-11-21', 'Литр'),
    ('Сахар', 2.19, 120, '2023-11-20', 'Килограмм'),
    ('Рис', 4.99, 90, '2023-11-19', 'Килограмм'),
    ('Помидоры', 1.89, 300, '2023-11-18', 'Килограмм'),
    ('Картошка', 0.99, 400, '2023-11-17', 'Килограмм'),
    ('Макароны', 2.29, 120, '2023-11-16', 'Килограмм'),
    ('Яблоки', 3.69, 150, '2023-11-15', 'Килограмм'),
    ('Бананы', 2.99, 180, '2023-11-14', 'Килограмм'),
    ('Курица', 6.49, 70, '2023-11-13', 'Штука'),
    ('Говядина', 9.99, 40, '2023-11-12', 'Килограмм'),
    ('Свинина', 7.89, 60, '2023-11-11', 'Килограмм'),
    ('Огурцы', 2.79, 200, '2023-11-10', 'Килограмм'),
    ('Творог', 3.19, 100, '2023-11-09', 'Килограмм'),
    ('Сыр', 4.79, 80, '2023-11-08', 'Килограмм'),
    ('Колбаса', 5.49, 90, '2023-11-07', 'Килограмм'),
    ('Лук', 0.69, 300, '2023-11-06', 'Килограмм'),
    ('Чеснок', 1.29, 50, '2023-11-05', 'Штука'),
    ('Мандарины', 2.99, 120, '2023-11-04', 'Килограмм'),
    ('Апельсины', 3.49, 100, '2023-11-03', 'Килограмм'),
    ('Грейпфруты', 4.29, 80, '2023-11-02', 'Килограмм'),
    ('Морковь', 0.89, 200, '2023-11-01', 'Килограмм'),
    ('Брокколи', 1.79, 70, '2023-10-31', 'Килограмм'),
    ('Шпинат', 2.09, 60, '2023-10-30', 'Килограмм'),
    ('Сельдерей', 1.39, 80, '2023-10-29', 'Килограмм'),
    ('Персики', 3.99, 100, '2023-10-28', 'Килограмм'),
    ('Абрикосы', 4.49, 90, '2023-10-27', 'Килограмм'),
    ('Вишня', 5.29, 70, '2023-10-26', 'Килограмм'),
    ('Груши', 2.79, 120, '2023-10-25', 'Килограмм'),
    ('Киви', 1.99, 80, '2023-10-24', 'Штука'),
    ('Малина', 6.99, 40, '2023-10-23', 'Килограмм'),
    ('Арбуз', 2.49, 30, '2023-10-22', 'Килограмм'),
    ('Дыня', 2.99, 40, '2023-10-21', 'Килограмм'),
    ('Ананас', 4.79, 50, '2023-10-20', 'Штука'),
    ('Мороженое', 3.29, 60, '2023-10-19', 'Литр');

INSERT INTO Продавцы (Фамилия, Имя, Отчество, Процент_комиссионных, Телефон, Email, Адрес)
VALUES 
    ('Иванов', 'Петр', 'Сергеевич', 10, '123-456-789', 'ivanov@example.com', 'ул. Пушкина, д. 10'),
    ('Петров', 'Андрей', 'Иванович', 12, '987-654-321', 'petrov@example.com', 'ул. Лермонтова, д. 5'),
    ('Сидорова', 'Мария', 'Александровна', 8, '555-123-456', 'sidorova@example.com', 'ул. Гоголя, д. 15'),
    ('Николаев', 'Владимир', 'Дмитриевич', 15, '111-222-333', 'nikolaev@example.com', 'ул. Толстого, д. 7'),
    ('Коваленко', 'Ольга', 'Викторовна', 9, '777-888-999', 'kovalenko@example.com', 'ул. Чехова, д. 20'),
    ('Смирнов', 'Алексей', 'Павлович', 11, '444-555-666', 'smirnov@example.com', 'ул. Достоевского, д. 12'),
    ('Попова', 'Екатерина', 'Игоревна', 14, '999-000-111', 'popova@example.com', 'ул. Шекспира, д. 3'),
    ('Лебедев', 'Артем', 'Валентинович', 13, '777-111-333', 'lebedev@example.com', 'ул. Карамзина, д. 8'),
    ('Тимофеева', 'Светлана', 'Викторовна', 10, '222-333-444', 'timofeeva@example.com', 'ул. Тургенева, д. 9'),
    ('Козлов', 'Денис', 'Игоревич', 12, '555-777-999', 'kozlov@example.com', 'ул. Федорова, д. 6'),
    ('Волкова', 'Наталья', 'Сергеевна', 8, '888-999-000', 'volkova@example.com', 'ул. Пастернака, д. 11'),
    ('Белов', 'Григорий', 'Олегович', 15, '111-333-555', 'belov@example.com', 'ул. Лермантова, д. 25'),
    ('Григорьев', 'Виктор', 'Михайлович', 9, '333-555-777', 'grigoriev@example.com', 'ул. Пушкина, д. 18'),
    ('Сорокина', 'Елена', 'Александровна', 11, '666-888-000', 'sorokina@example.com', 'ул. Гоголя, д. 22'),
    ('Медведев', 'Игорь', 'Владимирович', 14, '777-000-111', 'medvedev@example.com', 'ул. Толстого, д. 13'),
    ('Андреев', 'Александр', 'Андреевич', 10, '222-444-666', 'andreev@example.com', 'ул. Лермонтова, д. 14'),
    ('Кузнецов', 'Евгений', 'Игоревич', 13, '555-777-999', 'kuznetsov@example.com', 'ул. Тургенева, д. 7'),
    ('Орлова', 'Валентина', 'Сергеевна', 12, '888-999-111', 'orlova@example.com', 'ул. Шекспира, д. 17'),
    ('Панов', 'Аркадий', 'Андреевич', 8, '111-333-555', 'panov@example.com', 'ул. Достоевского, д. 19'),
    ('Романов', 'Владислав', 'Петрович', 11, '333-555-777', 'romanov@example.com', 'ул. Карамзина, д. 16');

INSERT INTO Товары_Продавцы (ID_товара, ID_продавца)
VALUES 
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 10),
    (11, 11),
    (12, 12),
    (13, 13),
    (14, 14),
    (15, 15),
    (16, 16),
    (17, 17),
    (18, 18),
    (19, 19),
    (20, 1),
    (21, 3),
    (22, 5),
    (23, 7),
    (24, 9),
    (25, 11),
    (26, 13),
    (27, 15),
    (28, 17),
    (29, 19),
    (30, 1);

INSERT INTO Продажи (Цена_продажи, Количество_проданного_товара, Дата_продажи, ID_товара_продавца)
VALUES 
    (10.99, 5, '2023-11-26', 1),
    (25.49, 2, '2023-11-25', 2),
    (5.99, 10, '2023-11-24', 3),
    (15.29, 3, '2023-11-23', 4),
    (8.79, 7, '2023-11-22', 5),
    (3.49, 15, '2023-11-21', 6),
    (2.19, 20, '2023-11-20', 7),
    (12.99, 4, '2023-11-19', 8),
    (7.49, 8, '2023-11-18', 9),
    (6.99, 12, '2023-11-17', 10),
    (18.99, 6, '2023-11-16', 11),
    (14.59, 9, '2023-11-15', 12),
    (11.29, 11, '2023-11-14', 13),
    (9.79, 14, '2023-11-13', 14),
    (4.89, 18, '2023-11-12', 15),
    (22.49, 1, '2023-11-11', 16),
    (16.79, 5, '2023-11-10', 17),
    (13.39, 8, '2023-11-09', 18),
    (19.99, 3, '2023-11-08', 19),
    (17.29, 7, '2023-11-07', 20),
    (8.49, 13, '2023-11-06', 1),
    (9.99, 11, '2023-11-05', 2),
    (14.89, 9, '2023-11-04', 3),
    (6.59, 17, '2023-11-03', 4),
    (12.79, 4, '2023-11-02', 5),
    (20.19, 2, '2023-11-01', 6),
    (7.99, 10, '2023-10-31', 7),
    (16.49, 6, '2023-10-30', 8),
    (11.09, 8, '2023-10-29', 9),
    (14.29, 10, '2023-10-28', 10),
    (18.79, 5, '2023-10-27', 11),
    (9.19, 12, '2023-10-26', 12),
    (15.69, 7, '2023-10-25', 13),
    (13.09, 9, '2023-10-24', 14),
    (10.49, 11, '2023-10-23', 15),
    (5.89, 16, '2023-10-22', 16),
    (21.39, 3, '2023-10-21', 17),
    (8.09, 14, '2023-10-20', 18),
    (17.89, 5, '2023-10-19', 19),
    (14.09, 8, '2023-10-18', 20);



SELECT
    Продавцы.Фамилия,
    Продавцы.Имя,
    Продавцы.Отчество,
    SUM(Продажи.Количество_проданного_товара) AS Суммарное_число_продаж_продавца,
    SUM(Продажи.Цена_продажи) AS Общая_выручка_фирмы,
    SUM(Продажи.Цена_продажи * (Продавцы.Процент_комиссионных / 100.0)) AS Доход_продавца,
    (
    	SELECT 
			AVG(Суммарное_количество_проданного_товара)
		FROM (
			SELECT SUM(Продажи.Количество_проданного_товара) AS Суммарное_количество_проданного_товара
			FROM Продажи
			JOIN Товары_Продавцы ON Продажи.ID_товара_продавца = Товары_Продавцы.ID_товара_продавца 
			JOIN Продавцы ON Товары_Продавцы.ID_продавца = Продавцы.ID_продавца 
			GROUP BY Продавцы.ID_продавца 
		)
    ) AS Среднее_число_продаж_в_фирме
FROM 
    Продажи
JOIN 
    Товары_Продавцы ON Продажи.ID_товара_продавца = Товары_Продавцы.ID_товара_продавца 
JOIN 
    Продавцы ON Товары_Продавцы.ID_продавца = Продавцы.ID_продавца
GROUP BY 
    Продавцы.ID_продавца
HAVING
    SUM(Продажи.Количество_проданного_товара) > (
    	SELECT 
			AVG(Суммарное_количество_проданного_товара)
		FROM (
			SELECT SUM(Продажи.Количество_проданного_товара) AS Суммарное_количество_проданного_товара
			FROM Продажи
			JOIN Товары_Продавцы ON Продажи.ID_товара_продавца = Товары_Продавцы.ID_товара_продавца 
			JOIN Продавцы ON Товары_Продавцы.ID_продавца = Продавцы.ID_продавца 
			GROUP BY Продавцы.ID_продавца 
		)
    )
ORDER BY 
	Общая_выручка_фирмы DESC;