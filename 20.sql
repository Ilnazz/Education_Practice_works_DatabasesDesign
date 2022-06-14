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