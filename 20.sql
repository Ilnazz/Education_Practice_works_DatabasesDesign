-- 1. ������� �������� ���������, ������� ����������� � ������ ����� 100 �����
SELECT Name_Discipline '�������� ����������' FROM Discipline
	WHERE ID_Discipline IN (SELECT ID_Discipline FROM Study_Plan WHERE Number_Hours = 100)

-- 2. ������� ���������� � ��������������, ������� ����� ���������� � ����� 301
SELECT LName '�������', FName '���', Patronymic '��������' FROM Teacher
	WHERE ID_Teacher IN (SELECT ID_Teacher FROM Teacher_Discipline WHERE ID_Discipline = 301)

-- 3. ������� ���������� � ����� ������������������ �������������
SELECT LName '�������', FName '���', Patronymic '��������', Salary '��������' FROM Teacher
	WHERE Salary = (SELECT MAX(Salary) FROM Teacher)

-- 4. ������� ���������� � �������������� �� ������ ������ ���� ��������
SELECT LName '�������', FName '���', Patronymic '��������', Work_Experience '����' FROM Teacher
	WHERE Work_Experience >= (SELECT AVG(Work_Experience) FROM Teacher)

-- 5. ���������, ������� ��������� ������ �� �������������, �������� �� ���
SELECT COUNT(ID_Student) FROM Student
	WHERE ID_Student NOT IN (SELECT ID_Student FROM [Group] g
								JOIN Student st ON st.ID_Group = g.ID_Group
									JOIN Speciality sp
										ON g.ID_Speciality = sp.ID_Speciality AND Name_Speciality = '���')

-- 6. ������� ���������� � ��������������, ������� ����� �����-���� ���������� ����� 110 �����
SELECT LName '�������', FName '���', Patronymic '��������' FROM Teacher
	WHERE ID_Teacher = ANY (SELECT t.ID_Teacher FROM Teacher t
								JOIN Teacher_Discipline td ON t.ID_Teacher = td.ID_Teacher
									JOIN Study_Plan sp
										ON td.ID_Discipline = sp.ID_Discipline AND sp.Number_Hours >= 110)

-- 7. ������� ���������� � ���������, ������� �� ���� ������������� �� ������ ����� 20 ���
SELECT LName '�������', FName '���', Patronymic '��������' FROM Student
	WHERE ID_Student != ALL (SELECT s.ID_Student FROM Student s
								JOIN [Group] g ON s.ID_Group = g.ID_Group
									JOIN Study_Plan sp ON g.ID_Group = sp.ID_Group
											JOIN Teacher_Discipline td ON sp.ID_Discipline = td.ID_Discipline
													JOIN Teacher t
														ON td.ID_Teacher = t.ID_Teacher AND t.Work_Experience < 20)

-- 8. ������� �������� �������������� �� ������� ������ ���������� "�������"
SELECT Name_Speciality '�������� �������������' FROM Speciality s
	WHERE EXISTS (SELECT * FROM [Group] g
							JOIN Study_Plan sp
								ON s.ID_Speciality = g.ID_Speciality AND g.ID_Group = sp.ID_Group
									JOIN Discipline d
										ON sp.ID_Discipline = d.ID_Discipline AND d.Name_Discipline = '�������')

-- 9. ������� �������� ������������� �� ������� ������ ������� ��� ������� 201
SELECT Name_Speciality '�������� �������������' FROM Speciality
	WHERE ID_Speciality = (SELECT ID_Speciality FROM [Group] g
								JOIN Student s
									ON s.ID_Group = g.ID_Group AND s.ID_Student = 201)

-- 10. ������� ��������������, ������� ���� � ������� �� ������������� ���
SELECT * FROM Teacher
	WHERE ID_Teacher IN (SELECT t.ID_Teacher FROM Teacher t
							JOIN Teacher_Discipline td ON t.ID_Teacher = td.ID_Teacher
								JOIN Study_Plan sp ON td.ID_Discipline = sp.ID_Discipline
									JOIN [Group] g ON sp.ID_Group = g.ID_Group
										JOIN Speciality s ON g.ID_Speciality = s.ID_Speciality
															AND s.Name_Speciality = '���')