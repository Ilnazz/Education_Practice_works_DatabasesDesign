USE College

-- 1. Декартово произведение таблиц Студент и Группа
SELECT * FROM Student, [Group]

-- 2. Вывести номера групп и названия их специальностей
SELECT ID_Group 'Номер группы', Name_Speciality 'Название специальности' FROM [Group]
	JOIN Speciality
		ON [Group].ID_Speciality = Speciality.ID_Speciality

--SELECT ID_Group 'Номер группы', Name_Speciality 'Название специальности' FROM [Group], Speciality
--	WHERE [Group].ID_Speciality = Speciality.ID_Speciality

-- 3. Вывести ФИО Преподавателей и наименование дисциплин, которые они преподают
SELECT t.LName 'Фамилия', t.FName 'Имя', t.Patronymic 'Отчество', d.Name_Discipline 'Название дисциплины' FROM Teacher t
	JOIN Teacher_Discipline td
		ON t.ID_Teacher = td.ID_Teacher
			JOIN Discipline d
				ON td.ID_Discipline = d.ID_Discipline
				
--SELECT t.LName 'Фамилия', t.FName 'Имя', t.Patronymic 'Отчество', d.Name_Discipline 'Название дисциплины'
--	FROM Teacher t, Teacher_Discipline td, Discipline d
--		WHERE t.ID_Teacher = td.ID_Teacher AND td.ID_Discipline = d.ID_Discipline

-- 4. Вывести номер группы, название дисциплины и количество часов по этой дисциплине в этой группе
SELECT g.ID_Group 'Номер группы', d.Name_Discipline 'Название дисциплины', sp.Number_Hours 'Количество часов' FROM [Group] g
	JOIN Study_Plan sp
		ON g.ID_Group = sp.ID_Group
			JOIN Discipline d
				ON sp.ID_Discipline= d.ID_Discipline

--SELECT g.ID_Group 'Номер группы', d.Name_Discipline 'Название дисциплины', sp.Number_Hours 'Количество часов'
--	FROM [Group] g, Study_Plan sp, Discipline d
--		WHERE g.ID_Group = sp.ID_Group AND sp.ID_Discipline = d.ID_Discipline

-- 5. Вывести ФИО студентов и специальности, по которым они учатся
SELECT st.LName 'Фамилия', st.FName 'Имя', st.Patronymic 'Отчество', sp.Name_Speciality 'Название специальности' FROM Student st
	JOIN [Group] g
		ON st.ID_Group = g.ID_Group
			JOIN Speciality sp
				ON sp.ID_Speciality = g.ID_Speciality
				
SELECT st.LName 'Фамилия', st.FName 'Имя', st.Patronymic 'Отчество', sp.Name_Speciality 'Название специальности'
	FROM Student st, [Group] g, Speciality sp
		WHERE st.ID_Group = g.ID_Group AND sp.ID_Speciality = g.ID_Speciality

4.	2 запроса с использованием соединения  двух таблиц по равенству и условием отбора; 

-- 6. Вывести ФИО Преподавателей и наименование дисциплин, которые они преподают
SELECT t.LName 'Фамилия', t.FName 'Имя', t.Patronymic 'Отчество', d.Name_Discipline 'Название дисциплины' FROM Teacher t
	WHERE t.Birth_Date < '1990-01-01'
	JOIN Teacher_Discipline td
		ON td.ID_Teacher = t.ID_Teacher
			JOIN Discipline d
				ON td.ID_Discipline = d.ID_Discipline



5.	2 запроса с использованием соединения  трех  таблиц по равенству и условием отбора; 
6.	1 запроса с использованием симметричного соединения и удаление избыточности. 
