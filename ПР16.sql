USE College

-- 1. Вывести номера групп, обучающихся на специальности с кодом 001.
SELECT ID_Group AS 'Номер группы' FROM [Group]
	WHERE ID_Speciality = 001

-- 2. Вывести фамилии и имена преподавателей с окладом более 60 тысяч рублей
SELECT LName AS 'Фамилия', FName AS 'Имя' FROM Teacher
	WHERE Salary > 60000

-- 3. Вывести номера студентов с именем "Антон"
SELECT ID_STUDENT AS 'Номер студента' FROM Student
	WHERE FName = 'Антон'

-- 4. Вывести фамилии и имена студентов, которые учатся в группе 102 и номер которых меньше 206
SELECT LName AS 'Фамилия', FName AS 'Имя' FROM Student
	WHERE ID_Group = 102 AND ID_Student < 206

-- 5. Вывести номера преподавателей, которые преподают дисциплины "Психология общения" или "История"
SELECT ID_Teacher AS 'Табельный номер' FROM Teacher_Discipline
	WHERE ID_Discipline = 301 OR ID_Discipline = 304

-- 6. Вывести номера дисциплин, которые не преподаются в группе 101
SELECT ID_DISCIPLINE AS 'Код дисциплины' FROM Study_Plan
	WHERE NOT (ID_Group = 101)

-- 7. Вывести фамилии и имена студентов, номера которых не превышают 210 и фамилия начинается на букву "Г", или не учащихся в группе 102
SELECT LName AS 'Фамилия', FName AS 'Имя' FROM Student
	WHERE (ID_Student < 210 AND (LName LIKE 'Г%')) OR ID_Group != 102

-- 8. Вывести фамилии и инициалы всех преподавателей
SELECT LName + ' ' + SUBSTRING(FName, 1, 1) + '. ' + SUBSTRING(Patronymic, 1, 1) + '.' AS 'Фамилия и инициалы'
	FROM Teacher

-- 9. Вывести номера студентов, которых зовут Антон, Александр, Арсений, Андрей или Алексей
SELECT ID_Student AS 'Номер студента' FROM Student
	WHERE FName IN ('Антон', 'Александр', 'Арсений', 'Андрей', 'Алексей')

-- 10. Вывести номера специальностей, по которым учится группа 101, 102 или 103
SELECT ID_Speciality AS 'Номер специальности' FROM [Group]
	WHERE ID_Group IN (101, 102, 103)

-- 11. Вывести Фамилии преподавателей с окладом больше 50 тысяч, но меньше 60 тысяч рублей
SELECT LName AS 'Фамилия' FROM Teacher
	WHERE Salary BETWEEN 50000 AND 60000

-- 12. Вывести Фамилии студентов, номера которых не принадлежат промежутку [203;207]
SELECT LName AS 'Фамилия'FROM Student
	WHERE ID_Student NOT BETWEEN 203 AND 207

-- 13. Вывести названия дисциплин, начинающихся на "Введение" или "Основы"
SELECT Name_Discipline FROM Discipline
	WHERE Name_Discipline LIKE 'Введение%' OR Name_Discipline LIKE 'Основы%'

-- 14. Вывести названия дисциплин, содержащие выражение "программирован"
SELECT Name_Discipline FROM Discipline
	WHERE Name_Discipline LIKE '%программирован%'

-- 15. Вывести номера преподавателей, зарплата которых указана
SELECT ID_Teacher AS 'Табельный номер' FROM Teacher
	WHERE Salary IS NOT NULL
