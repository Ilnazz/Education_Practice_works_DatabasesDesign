USE College

-- Запросы из практической работы № 16

-- 1. Вывести номера групп, обучающихся на специальности с кодом 001.
SELECT ID_Group AS 'Номер группы', ID_Speciality 'Код специальности' FROM [Group]
	WHERE ID_Speciality = 001

-- 2. Вывести фамилии и имена преподавателей с окладом более 60 тысяч рублей
SELECT LName AS 'Фамилия', FName AS 'Имя', Salary 'Оклад' FROM Teacher
	WHERE Salary > 60000

-- 3. Вывести номера студентов с именем "Антон"
SELECT ID_STUDENT AS 'Номер студента', FName 'Имя' FROM Student
	WHERE FName = 'Антон'

-- 4. Вывести фамилии и имена студентов, которые учатся в группе 102 и номер которых меньше 206
SELECT LName AS 'Фамилия', FName AS 'Имя', ID_Group 'Номер группы' FROM Student
	WHERE ID_Group = 102 AND ID_Student < 206

-- 5. Вывести номера преподавателей, которые преподают дисциплины "Психология общения" или "История"
SELECT ID_Teacher AS 'Табельный номер', ID_Discipline 'Код дисциплины' FROM Teacher_Discipline
	WHERE ID_Discipline = 301 OR ID_Discipline = 304

-- 6. Вывести номера дисциплин, которые не преподаются в группе 101
SELECT ID_DISCIPLINE AS 'Код дисциплины' FROM Study_Plan
	WHERE NOT (ID_Group = 101)

-- 7. Вывести фамилии и имена студентов, номера которых не превышают 210 и фамилия начинается на букву "Г", или не учащихся в группе 102
SELECT LName AS 'Фамилия', FName AS 'Имя', ID_Student 'Номер студента' FROM Student
	WHERE (ID_Student < 210 AND (LName LIKE 'Г%')) OR ID_Group != 102

-- 8. Вывести фамилии и инициалы всех преподавателей
SELECT LName + ' ' + SUBSTRING(FName, 1, 1) + '. ' + SUBSTRING(Patronymic, 1, 1) + '.' AS 'Фамилия и инициалы'
	FROM Teacher

-- Вывести зарплаты преподавателей с учетом премий и удержаний
SELECT
	Salary 'Старая зарплата',
	(Salary + Salary * 0.1) 'Повышенная на 10% зарплата',
	(Salary + Salary * 0.1)*0.13 'Удержано с повышенной зарплаты',
	(Salary + Salary * 0.1) - (Salary + Salary * 0.1)*0.13 'Итоговая зарплата'
FROM Teacher


-- 9. Вывести номера студентов, которых зовут Антон, Александр, Арсений, Андрей или Алексей
SELECT ID_Student AS 'Номер студента', FName 'Имя студента' FROM Student
	WHERE FName IN ('Антон', 'Александр', 'Арсений', 'Андрей', 'Алексей')

-- 10. Вывести номера специальностей, по которым учится группа 101, 102 или 103
SELECT ID_Speciality AS 'Номер специальности', ID_Group 'Код группы' FROM [Group]
	WHERE ID_Group IN (101, 102, 103)

-- 11. Вывести Фамилии преподавателей с окладом больше 50 тысяч, но меньше 60 тысяч рублей
SELECT LName AS 'Фамилия', Salary 'Оклад' FROM Teacher
	WHERE Salary BETWEEN 50000 AND 60000

-- 12. Вывести Фамилии студентов, номера которых не принадлежат промежутку [203;207]
SELECT LName AS 'Фамилия', ID_Student 'Номер студента' FROM Student
	WHERE ID_Student NOT BETWEEN 203 AND 207

-- 13. Вывести названия дисциплин, начинающихся на "Введение" или "Основы"
SELECT Name_Discipline 'Название' FROM Discipline
	WHERE Name_Discipline LIKE 'Введение%' OR Name_Discipline LIKE 'Основы%'

-- 14. Вывести названия дисциплин, содержащие выражение "программирован"
SELECT Name_Discipline FROM Discipline
	WHERE Name_Discipline LIKE '%программирован%'

-- 15. Вывести номера преподавателей, зарплата которых указана
SELECT ID_Teacher AS 'Табельный номер', Salary 'Зарплата' FROM Teacher
	WHERE Salary IS NULL

-- Запросы из практической работы № 17

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

-- 14. Вывести фамилию, имя, зарплату, рассчитанную премию, зарплату с учетом премии преподавателей
SELECT LName, FName,
	Salary 'Зарплата',
	IIF(Work_Experience > 10, 10, 5) 'Премия (%)',
	Salary * (IIF(Work_Experience > 10, 10, 5)) 'Зарплата с учетом премии'
FROM Teacher

-- 15. Вывести стаж работы, дату рождения, фамилию и имя преподавателей, сгруппировав записи в этом же порядке
SELECT Work_Experience, Birth_Date, LName, FName FROM Teacher
GROUP BY Work_Experience, Birth_Date, LName, FName
	HAVING Birth_Date < '2000-01-01'

-- Запросы из практической работы № 18

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

-- 13. Выбрать тех преподавателей, оклад которых больше 70000, сгруппировать по году рождения, имени и отчеству и отобрать группы, группы со стажем более 4 лет
SELECT Birth_Date 'Дата рождения', LName 'Фамилия', FName 'Имя', Salary 'Зарплата' FROM Teacher
	WHERE Salary >= 70000
GROUP BY Birth_Date, LName, FName, Salary
HAVING YEAR(Birth_Date) > 1990

-- Запросы из практической работы № 19

-- Внутренние запросы

-- 1. Декартово произведение таблиц Студент и Группа
SELECT * FROM Student, [Group]

-- 2. Вывести номера групп и названия их специальностей
SELECT ID_Group 'Номер группы', Name_Speciality 'Название специальности' FROM [Group]
	JOIN Speciality
		ON [Group].ID_Speciality = Speciality.ID_Speciality

-- 3. Вывести ФИО Преподавателей и наименование дисциплин, которые они преподают
SELECT t.LName 'Фамилия', t.FName 'Имя', t.Patronymic 'Отчество', d.Name_Discipline 'Название дисциплины' FROM Teacher t
	JOIN Teacher_Discipline td
		ON t.ID_Teacher = td.ID_Teacher
			JOIN Discipline d
				ON td.ID_Discipline = d.ID_Discipline

-- 4. Вывести номер группы, название дисциплины и количество часов по этой дисциплине в этой группе
SELECT g.ID_Group 'Номер группы', d.Name_Discipline 'Название дисциплины', sp.Number_Hours 'Количество часов' FROM [Group] g
	JOIN Study_Plan sp
		ON g.ID_Group = sp.ID_Group
			JOIN Discipline d
				ON sp.ID_Discipline= d.ID_Discipline

-- 5. Вывести ФИО студентов и специальности, по которым они учатся
SELECT st.LName 'Фамилия', st.FName 'Имя', st.Patronymic 'Отчество', sp.Name_Speciality 'Название специальности' FROM Student st
	JOIN [Group] g
		ON st.ID_Group = g.ID_Group
			JOIN Speciality sp
				ON sp.ID_Speciality = g.ID_Speciality

-- 6. Вывести ФИО Преподавателей, родившихся раньше 1990-го года и наименование дисциплин, которые они преподают
SELECT t.LName 'Фамилия', t.FName 'Имя', t.Patronymic 'Отчество', t.Birth_Date 'Дата рождения', d.Name_Discipline 'Название дисциплины' FROM Teacher t
		JOIN Teacher_Discipline td
			ON t.Birth_Date < '1990-01-01' AND td.ID_Teacher = t.ID_Teacher
				JOIN Discipline d
					ON td.ID_Discipline = d.ID_Discipline

-- 7. Вывести всех студентов, которые учатся в одной группе
SELECT s1.LName 'Фамилия 1-го', s1.FName 'Имя 1-го', s1.Patronymic 'Отчество 1-го',
	   s2.LName 'Фамилия 2-го', s2.FName 'Имя 2-го', s2.Patronymic 'Отчество 2-го', s1.ID_Group 'Номер группы'
FROM Student s1
	JOIN Student s2
		ON s1.ID_Group = s2.ID_Group AND s1.ID_Student < s2.ID_Student

-- Внешние запросы

-- 8. Вывести номера групп и студентов, которые состоят в этих группах
SELECT g.ID_Group 'Номер группы', s.LName 'Фамилия', s.FName 'Имя', s.Patronymic 'Отчество' FROM [Group] g
	LEFT JOIN Student s
		ON g.ID_Group = s.ID_Group

-- 9. Вывести номера студентов и номера групп, в которых они учатся
SELECT g.ID_Group 'Номер группы', s.LName 'Фамилия', s.FName 'Имя', s.Patronymic 'Отчество' FROM [Group] g
	RIGHT JOIN Student s
		ON g.ID_Group = s.ID_Group

-- 10. Для каждой группы вывести студента, который в ней учится и для каждого студента вывести группу, в которой он состоит
SELECT g.ID_Group 'Номер группы', s.LName 'Фамилия', s.FName 'Имя', s.Patronymic 'Отчество' FROM [Group] g
	FULL JOIN Student s
		ON g.ID_Group = s.ID_Group
		
-- 11. Для каждой группы вывести всех студентов и для каждого студента вывести все группы
SELECT g.ID_Group 'Номер группы', s.LName 'Фамилия', s.FName 'Имя', s.Patronymic 'Отчество' FROM [Group] g
	CROSS JOIN Student s

-- Запросы из практической работы № 20

-- 1. Вывести названия дисциплин, которые преподаются в группе ровно 100 часов
SELECT Name_Discipline 'Название дисциплины' FROM Discipline
	WHERE ID_Discipline IN (SELECT ID_Discipline FROM Study_Plan WHERE Number_Hours = 100)

-- 2. Вывести информацию о преподавателях, которые ведут дисциплину с кодом 301
SELECT LName 'Фамилия', FName 'Имя', Patronymic 'Отчество' FROM Teacher
	WHERE ID_Teacher IN (SELECT ID_Teacher FROM Teacher_Discipline WHERE ID_Discipline = 301)

-- 3. Вывести информацию о самом высокооплачиваемом преподавателе
SELECT LName 'Фамилия', FName 'Имя', Patronymic 'Отчество', Salary 'Зарплата' FROM Teacher
	WHERE Salary = (SELECT MAX(Salary) FROM Teacher)

-- 4. Вывести информацию о преподавателях со стажем работы выше среднего
SELECT LName 'Фамилия', FName 'Имя', Patronymic 'Отчество', Work_Experience 'Стаж' FROM Teacher
	WHERE Work_Experience >= (SELECT AVG(Work_Experience) FROM Teacher)

-- 5. Посчитать, сколько студентов учатся на специальности, отличной от СИС
SELECT COUNT(ID_Student) FROM Student
	WHERE ID_Student NOT IN (SELECT ID_Student FROM [Group] g
								JOIN Student st ON st.ID_Group = g.ID_Group
									JOIN Speciality sp
										ON g.ID_Speciality = sp.ID_Speciality AND Name_Speciality = 'СИС')

-- 6. Вывести информацию о преподавателях, которые ведут какую-либо дисциплину более 110 часов
SELECT LName 'Фамилия', FName 'Имя', Patronymic 'Отчество' FROM Teacher
	WHERE ID_Teacher = ANY (SELECT t.ID_Teacher FROM Teacher t
								JOIN Teacher_Discipline td ON t.ID_Teacher = td.ID_Teacher
									JOIN Study_Plan sp
										ON td.ID_Discipline = sp.ID_Discipline AND sp.Number_Hours >= 110)

-- 7. Вывести информацию о студентах, которых не учат преподаватели со стажем менее 20 лет
SELECT LName 'Фамилия', FName 'Имя', Patronymic 'Отчество' FROM Student
	WHERE ID_Student != ALL (SELECT s.ID_Student FROM Student s
								JOIN [Group] g ON s.ID_Group = g.ID_Group
									JOIN Study_Plan sp ON g.ID_Group = sp.ID_Group
											JOIN Teacher_Discipline td ON sp.ID_Discipline = td.ID_Discipline
													JOIN Teacher t
														ON td.ID_Teacher = t.ID_Teacher AND t.Work_Experience < 20)

-- 8. Вывести названия специальностей по которым ведётся дисциплина "История"
SELECT Name_Speciality 'Название специальности' FROM Speciality s
	WHERE EXISTS (SELECT * FROM [Group] g
							JOIN Study_Plan sp
								ON s.ID_Speciality = g.ID_Speciality AND g.ID_Group = sp.ID_Group
									JOIN Discipline d
										ON sp.ID_Discipline = d.ID_Discipline AND d.Name_Discipline = 'История')

-- 9. Вывести название специальности по которой учится студент под номером 201
SELECT Name_Speciality 'Название специальности' FROM Speciality
	WHERE ID_Speciality = (SELECT ID_Speciality FROM [Group] g
								JOIN Student s
									ON s.ID_Group = g.ID_Group AND s.ID_Student = 201)

-- 10. Вывести преподавателей, которые учат в группах по специальности СИС
SELECT * FROM Teacher
	WHERE ID_Teacher IN (SELECT t.ID_Teacher FROM Teacher t
							JOIN Teacher_Discipline td ON t.ID_Teacher = td.ID_Teacher
								JOIN Study_Plan sp ON td.ID_Discipline = sp.ID_Discipline
									JOIN [Group] g ON sp.ID_Group = g.ID_Group
										JOIN Speciality s ON g.ID_Speciality = s.ID_Speciality
															AND s.Name_Speciality = 'СИС')
