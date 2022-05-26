USE College

-- 1. Вывести информацию о первых пяти студентах
SELECT TOP 5 * FROM Student

-- 2. Вывести первые 20 % строк от всего числа строк таблицы Discipline
SELECT TOP 20 PERCENT * FROM Discipline

-- 3. Отсортировать по фамилии и вывести всех студентов
SELECT * FROM Student
	ORDER BY LName

-- 4. Отсортировать по фамилии, имени и вывести всех студентов, которые не учатся в группе 101
SELECT * FROM Student
	WHERE ID_Group != 101
	ORDER BY LName, FName

-- 5. Отсортировать по отчеству, фамилии и имени и вывести всех учителей, зарплата которых больше 60000
SELECT * FROM Teacher
	WHERE Salary >= 60000
	ORDER BY Patronymic, Fname, Lname

-- 6. Вывести все записи таблицы Study_Plan в порядке убывания количества часов по дисциплинам
SELECT * FROM Study_Plan
	ORDER BY Number_Hours DESC

-- 7. Вывести все записи таблицы Study_Plan, в которых количество часов по дисциплине находится в диапазоне [70;100]
SELECT * FROM Study_Plan
	WHERE Number_Hours BETWEEN 70 AND 100

-- 8. Вывести названия специальностей, которые содержат букву "С"
SELECT Name_Speciality FROM Speciality
	WHERE Name_Speciality LIKE '%С%'

-- 9. Вывести всех студентов, имена которых оканчиваются на "а или я"
SELECT * FROM Student
	WHERE FName LIKE '%[ая]'

-- 10. Вывести всех студентов, имена которых не оканчиваются на "а" или "я"
SELECT * FROM Student
	WHERE FName NOT LIKE '%[ая]'

-- 11. Вывести всех преподавателей и их квалификационные категории в зависимости от стажа работы
SELECT LName, FName,

CASE
	WHEN Work_Experience < 3 THEN 'IV категория'
	WHEN Work_Experience < 5 THEN 'III категория'
	WHEN Work_Experience < 10 THEN 'II категория'
	ELSE 'I категория'
END AS 'Категория'

FROM Teacher

-- 12. Вывести дисциплины и их тип
SELECT *,

CASE Name_Discipline
	WHEN 'История' THEN 'Гуманитарная'
	WHEN 'Психология общения' THEN 'Гуманитарная'
	WHEN 'Иностранный язык' THEN 'Гуманитарная'
	WHEN 'Введение в специальность' THEN 'Гуманитарная'
	ELSE 'Техническая'
END AS 'Тип дисциплины'

FROM Discipline
	
-- 13. Выбрать всех студентов, которые учатся в группе 101 и занести их во временную таблицу
SELECT *
INTO #StudentsFromGroup101
FROM Student
	WHERE ID_Group = 101

SELECT * FROM #StudentsFromGroup101

-- 14. 
SELECT LName, FName,
	Salary 'Зарплата',
	IIF(Work_Experience > 10, 10, 5) 'Премия',
	Salary * (IIF(Work_Experience > 10, 10, 5)) 'Зарплата с учетом премии'
FROM Teacher

-- 15. Вывести номера специальностей и номера групп, которые по ним обучаются, сгруппировать по специальности, исключая специальность с номером 1
SELECT ID_Speciality, ID_Group FROM [Group]
GROUP BY ID_Speciality, ID_Group
	HAVING ID_Speciality != 1