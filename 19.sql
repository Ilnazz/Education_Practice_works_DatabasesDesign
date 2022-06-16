USE College

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
