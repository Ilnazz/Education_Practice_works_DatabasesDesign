USE College

-- ���������� �������

-- 1. ��������� ������������ ������ ������� � ������
SELECT * FROM Student, [Group]

-- 2. ������� ������ ����� � �������� �� ��������������
SELECT ID_Group '����� ������', Name_Speciality '�������� �������������' FROM [Group]
	JOIN Speciality
		ON [Group].ID_Speciality = Speciality.ID_Speciality

--SELECT ID_Group '����� ������', Name_Speciality '�������� �������������' FROM [Group], Speciality
--	WHERE [Group].ID_Speciality = Speciality.ID_Speciality

-- 3. ������� ��� �������������� � ������������ ���������, ������� ��� ���������
SELECT t.LName '�������', t.FName '���', t.Patronymic '��������', d.Name_Discipline '�������� ����������' FROM Teacher t
	JOIN Teacher_Discipline td
		ON t.ID_Teacher = td.ID_Teacher
			JOIN Discipline d
				ON td.ID_Discipline = d.ID_Discipline
				
--SELECT t.LName '�������', t.FName '���', t.Patronymic '��������', d.Name_Discipline '�������� ����������'
--	FROM Teacher t, Teacher_Discipline td, Discipline d
--		WHERE t.ID_Teacher = td.ID_Teacher AND td.ID_Discipline = d.ID_Discipline

-- 4. ������� ����� ������, �������� ���������� � ���������� ����� �� ���� ���������� � ���� ������
SELECT g.ID_Group '����� ������', d.Name_Discipline '�������� ����������', sp.Number_Hours '���������� �����' FROM [Group] g
	JOIN Study_Plan sp
		ON g.ID_Group = sp.ID_Group
			JOIN Discipline d
				ON sp.ID_Discipline= d.ID_Discipline

--SELECT g.ID_Group '����� ������', d.Name_Discipline '�������� ����������', sp.Number_Hours '���������� �����'
--	FROM [Group] g, Study_Plan sp, Discipline d
--		WHERE g.ID_Group = sp.ID_Group AND sp.ID_Discipline = d.ID_Discipline

-- 5. ������� ��� ��������� � �������������, �� ������� ��� ������
SELECT st.LName '�������', st.FName '���', st.Patronymic '��������', sp.Name_Speciality '�������� �������������' FROM Student st
	JOIN [Group] g
		ON st.ID_Group = g.ID_Group
			JOIN Speciality sp
				ON sp.ID_Speciality = g.ID_Speciality
				
--SELECT st.LName '�������', st.FName '���', st.Patronymic '��������', sp.Name_Speciality '�������� �������������'
--	FROM Student st, [Group] g, Speciality sp
--		WHERE st.ID_Group = g.ID_Group AND sp.ID_Speciality = g.ID_Speciality

-- 6. ������� ��� ��������������, ���������� ������ 1990-�� ���� � ������������ ���������, ������� ��� ���������
SELECT t.LName '�������', t.FName '���', t.Patronymic '��������', t.Birth_Date '���� ��������', d.Name_Discipline '�������� ����������' FROM Teacher t
		JOIN Teacher_Discipline td
			ON t.Birth_Date < '1990-01-01' AND td.ID_Teacher = t.ID_Teacher
				JOIN Discipline d
					ON td.ID_Discipline = d.ID_Discipline

-- SELECT t.LName '�������', t.FName '���', t.Patronymic '��������', d.Name_Discipline '�������� ����������'
-- 	FROM Teacher t, Teacher_Discipline td, Discipline d
-- 		WHERE t.Birth_Date < '1990-01-01' AND t.ID_Teacher = td.ID_Teacher AND td.ID_Discipline = d.ID_Discipline

-- 7. ������� ���� ���������, ������� ������ � ����� ������
SELECT s1.LName '������� 1-��', s1.FName '��� 1-��', s1.Patronymic '�������� 1-��',
	   s2.LName '������� 2-��', s2.FName '��� 2-��', s2.Patronymic '�������� 2-��', s1.ID_Group '����� ������'
FROM Student s1
	JOIN Student s2
		ON s1.ID_Group = s2.ID_Group AND s1.ID_Student <> s2.ID_Student
	
--SELECT s1.LName '������� 1-��', s1.FName '��� 1-��', s1.Patronymic '�������� 1-��',
--	   s2.LName '������� 2-��', s2.FName '��� 2-��', s2.Patronymic '�������� 2-��', s1.ID_Group '����� ������'
--FROM Student s1, Student s2
--	WHERE s1.ID_Group = s2.ID_Group AND s1.ID_Student <> s2.ID_Student

-- ������� �������

-- 8. ������� ������ ����� � ���������, ������� ������� � ���� �������
SELECT g.ID_Group '����� ������', s.LName '�������', s.FName '���', s.Patronymic '��������' FROM [Group] g
	LEFT JOIN Student s
		ON g.ID_Group = s.ID_Group

-- 9. ������� ������ ��������� � ������ �����, � ������� ��� ������
SELECT g.ID_Group '����� ������', s.LName '�������', s.FName '���', s.Patronymic '��������' FROM [Group] g
	RIGHT JOIN Student s
		ON g.ID_Group = s.ID_Group

-- 10. ��� ������ ������ ������� ��������, ������� � ��� ������ � ��� ������� �������� ������� ������, � ������� �� �������
SELECT g.ID_Group '����� ������', s.LName '�������', s.FName '���', s.Patronymic '��������' FROM [Group] g
	FULL JOIN Student s
		ON g.ID_Group = s.ID_Group
		
-- 11. ��� ������ ������ ������� ���� ��������� � ��� ������� �������� ������� ��� ������
SELECT g.ID_Group '����� ������', s.LName '�������', s.FName '���', s.Patronymic '��������' FROM [Group] g
	CROSS JOIN Student s