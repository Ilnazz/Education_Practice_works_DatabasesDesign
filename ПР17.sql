USE College

-- 1. Вывести информацию о первых пяти студентах
SELECT TOP 5 * FROM Student

-- 2. Вывести первые 20 % строк от всего числа строк таблицы Discipline
SELECT TOP 20 PERCENT * FROM Discipline

-- 3. Отсортировать по фамилии и вывести всех студентов
SELECT * FROM Student
	ORDER BY LName

-- 4. Отсортировать по имени и вывести всех студентов, которые не учатся в группе 101
SELECT * FROM Student
	WHERE ID_Group != 101
	ORDER BY FName

-- 5. Отсортировать по отчеству и вывести всех учителей, зарплата которых больше 60000
SELECT * FROM Teacher
	WHERE Salary >= 60000
	ORDER BY Patronymic

-- 6. Вывести все записи таблицы Study_Plan в порядке убывания количества часов по дисциплинам
SELECT * FROM Study_Plan
	ORDER BY Number_Hours DESC

-- 7. Вывести все записи таблицы Study_Plan, в которых количество часов по дисциплине находится в диапазоне [70;100]
SELECT * FROM Study_Plan
	WHERE Number_Hours BETWEEN 70 AND 100

-- 8. Вывести названия специальностей, которые содержат букву "С"
SELECT Name_Speciality FROM Speciality
	WHERE Name_Speciality LIKE '%С%'

-- 9. Вывести всех студентов-девочек
SELECT * FROM Student
	WHERE FName LIKE '%[ая]'

-- 10. Вывести всех студентов-мальчиков
SELECT * FROM Student
	WHERE FName NOT LIKE '%[ая]'

-- 11. Вывести всех преподавателей и их категории в зависимости от зарплаты
SELECT LName, FName,

CASE
	WHEN Salary < 60000 THEN 'I категория'
	ELSE 'Высшая категория'
END AS 'Категория'

FROM Teacher

-- 12. Вывести дисциплины и их тип
SELECT *,

CASE Name_Discipline
	WHEN 'История' THEN 'Гуманитарная'
	WHEN 'Психология общения' THEN 'Гуманитарная'
	ELSE 'Техническая'
END AS 'Тип дисциплины'

FROM Discipline
	
-- 13. Выбрать всех мальчиков-студентов и занести их во временную таблицу
SELECT *
INTO #StudentsBoys
FROM Student
	WHERE FName NOT LIKE '%[ая]'

-- 14. Вывести названия дисциплин с пометкой о курсе
SELECT Name_Discipline,
IIF(Name_Discipline LIKE '%[Оо]сновы%' OR Name_Discipline LIKE '%[Вв]едение%', 'Начальный курс', 'Продвинутый курс') AS 'Этап'
FROM Discipline

-- 15. Вывести номера специальностей и номера групп, которые по ним обучаются, сгруппировать по специальности, исключая специальность с номером 1
SELECT ID_Speciality, ID_Group FROM [Group]
GROUP BY ID_Speciality, ID_Group
	HAVING ID_Speciality != 1
