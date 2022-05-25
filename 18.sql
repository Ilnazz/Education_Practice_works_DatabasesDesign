USE College

-- 1. Посчитать общую зарплату преподавателей
SELECT SUM(Salary) 'Общая зарплата преподавателей' FROM Teacher

-- 2. Посчитать общую зарплату преподавателей-мужчин
SELECT SUM(Salary) 'Общая зарплата преподавателей-мужчин' FROM Teacher
	WHERE FName NOT LIKE '%[ая]'

-- 3. Посчитать общее количество часов по каждой дисциплине
SELECT ID_Discipline, SUM(Number_Hours) 'Общее количество часов' FROM Study_Plan
	GROUP BY ID_Discipline

4.	4 запроса на функции MIN и MAX   с использованием условий и группировок; 

-- 4. Вывести минимальную и максимальную зарплату среди преподавателей
SELECT MIN(Salary) 'Минимальная зарплата', MAX(Salary) 'Максимальная зарплата' FROM Teacher

-- 5. Вывести дисциплины и наибольшее число часов, по которым они преподаются в группах
SELECT ID_Discipline 'Код дисциплины', MAX(Number_Hours) 'Наибольшее количество часов' FROM Study_Plan
	WHERE ID_Group != 101
GROUP BY ID_Discipline

-- 6. 

-- 7.

5.	2 запроса на функцию AVG   с использованием условий и группировок; 

-- 8. Посчитать среднюю зарплату среди преподавателей
SELECT AVG(Salary) 'Средняя зарплата' From Teacher

-- 9. Посчитать среднее количество часов в учебном плане в разрезе дисциплины
SELECT ID_Discipline, AVG(Number_Hours) 'Среднее количество часов' FROM Study_Plan
	GROUP BY ID_Discipline

6.	3 запроса на функцию COUNT   с использованием условий и группировок; 

-- 10. Посчитать число студентов-мальчиков
SELECT COUNT(ID_Student) 'Число студентов-мальчиков' From Student
	WHERE FName NOT LIKE '%[ая]'

-- 11. Посчитать число дисциплин, по которым среднее число часов больше 100
SELECT COUNT(ID_Discipline) 'Количество дисциплин', AVG(Number_Hours) From Study_Plan

-- 12.

7.	3 запроса с использованием нескольких функций и добавлением разных параметров (WHERE, GROUP BY, HAVING); 

-- 13.

-- 14.

-- 15.