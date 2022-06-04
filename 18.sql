USE College

-- 1. Посчитать общую зарплату преподавателей
SELECT SUM(Salary) 'Общая зарплата преподавателей' FROM Teacher

-- 2. Посчитать общую зарплату преподавателей, родившихся раньше 2000-го года
SELECT SUM(Salary) 'Общая зарплата' FROM Teacher
	WHERE Birth_Date < '2000-01-01'

-- 3. Посчитать общее количество часов преподавания одной дисциплины в разных группах
SELECT ID_Discipline, SUM(Number_Hours) 'Общее количество часов' FROM Study_Plan
	GROUP BY ID_Discipline

-- 4. Вывести минимальную и максимальную зарплату среди преподавателей
SELECT MIN(Salary) 'Минимальная зарплата', MAX(Salary) 'Максимальная зарплата' FROM Teacher

-- 5. Вывести дисциплины и наибольшее число часов, по которым они преподаются в группах
SELECT ID_Discipline 'Код дисциплины', MAX(Number_Hours) 'Наибольшее количество часов' FROM Study_Plan
	WHERE ID_Group != 101
	GROUP BY ID_Discipline

-- 6. Вывести минимальные зарплаты преподавателей, родившихся раньше 2000-го года, сгруппировав их по стажу работы
SELECT Work_Experience, MIN(Salary) FROM Teacher
	WHERE Birth_Date < '2000-01-01'
	GROUP BY Work_Experience

-- 7. Вывести минимальную и максимальную длину фамилии, имени, и отчества среди студентов
SELECT MIN(LEN(LName)) 'Минимальная длина фамилии',
	   MAX(LEN(LName)) 'Максимальная длина фамилии',
	   MIN(LEN(FName)) 'Минимальная длина имени',
	   MAX(LEN(FName)) 'Максимальная длина имени',
	   MIN(LEN(Patronymic)) 'Минимальная длина отчества',
	   MAX(LEN(Patronymic)) 'Максимальная длина отчества'
FROM Student

-- 8. Посчитать среднюю зарплату среди преподавателей со стажем работы более 5-ти лет
SELECT AVG(Salary) 'Средняя зарплата' From Teacher
	WHERE Work_Experience > 5

-- 9. Посчитать среднее количество часов по каждой дисциплине в учебном плане
SELECT ID_Discipline, AVG(Number_Hours) 'Среднее количество часов' FROM Study_Plan
	GROUP BY ID_Discipline

-- 10. Посчитать, сколько преподавателей родились раньше 2000-го года
SELECT COUNT(ID_Teacher) 'Число преподавателей' From Teacher
	WHERE Birth_Date < '2000-01-01'

-- 11. Сосчитать число дисциплин, по которым среднее число часов больше 100
SELECT ID_Discipline 'Код дисциплины', COUNT(ID_Discipline) 'Количество дисциплин' From Study_Plan
	GROUP BY ID_Discipline
	HAVING AVG(Number_Hours) > 100

-- 12. Посчитать число студентов, длина фамилии, имени и отчества которых равна
SELECT COUNT(ID_Student) FROM Student
	WHERE (LEN(FName) = LEN(LName)) AND (LEN(LName) = LEN(Patronymic))

7.	3 запроса с использованием нескольких функций и добавлением разных параметров (WHERE, GROUP BY, HAVING); 

-- 13. Выбрать тех преподавателей, оклад которых больше 70000, сгруппировать по стажу работы, и отобрать группы, группы со стажем более 5 лет
SELECT LName, FName, Salary, Work_Experience FROM Teacher
	WHERE Salary >= 70000
GROUP BY Work_Experience, LName, FName
HAVING Work_Experience > 5

-- 14. Найти преподавателей с датой рождения не раньше 1990-го года, сгруппировать их по стажу работы;
--     оставить только те группы, в которых более 2ух преподавателей
SELECT Work_Experience, Birth_Date, LName, FName FROM Teacher
	WHERE Birth_Date > '1900-01-01'
GROUP BY Work_Experience, Birth_Date, LName, FName
HAVING COUNT(ID_Teacher) > 2

-- 15. Выбрать студентов с фамилией, начинающейся на 'Х', сгруппировать по группе
SELECT x FROM Student
	WHERE LName LIKE 'Х%'
GROUP BY ID_Group
?
