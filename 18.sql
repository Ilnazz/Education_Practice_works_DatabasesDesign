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

-- 6. Отобрать преподавателей, родившихся раньше 2000-го года;
-- сгруппировать их по стажу работы;
-- найти минимальную зарплату среди каждой группы преподавателей
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

-- 11. Сосчитать количество уникальных имен среди студентов
SELECT COUNT(DISTINCT FName) 'Количество дисциплин' From Student

-- 12. Посчитать число студентов, длина фамилии, имени и отчества которых равны друг другу
SELECT COUNT(ID_Student) 'Число студентов' FROM Student
	WHERE (LEN(FName) = LEN(LName)) AND (LEN(LName) = LEN(Patronymic))

-- 13. Выбрать тех преподавателей, оклад которых больше 70000, сгруппировать по стажу работы, зарплате, имени и отчеству и отобрать группы, группы со стажем более 4 лет
SELECT Work_Experience, LName, FName, Salary FROM Teacher
	WHERE Salary >= 70000
GROUP BY Work_Experience, Salary, FName, LName
HAVING Work_Experience > 4

-- 14. ?
SELECT Work_Experience FROM Teacher
	WHERE Birth_Date < '1990-01-01'
GROUP BY Work_Experience
HAVING COUNT(Work_Experience) > 1

-- 15. Выбрать преподавателей, зарплата которых не указана, сгруппировать по стажу работы
SELECT ID_Teacher FROM Teacher
	WHERE Salary IS NULL
GROUP BY Work_Experience, ID_Teacher