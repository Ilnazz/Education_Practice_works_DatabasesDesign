USE College

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
		ON td.ID_Teacher = t.ID_Teacher
			JOIN Discipline d
				ON td.ID_Discipline = d.ID_Discipline

-- 4. ������� ����� ������, �������� ���������� � ���������� ����� �� ���� ���������� � ���� ������
SELECT g.ID_Group '����� ������', d.Name_Discipline '�������� ����������', sp.Number_Hours '���������� �����' FROM [Group] g
	JOIN Study_Plan sp
		ON g.ID_Group = sp.ID_Group
			JOIN Discipline d
				ON sp.ID_Discipline= d.ID_Discipline

-- 5. ������� ������������� ���� ���������
SELECT st.LName '�������', st.FName '���', st.Patronymic '��������', sp.Name_Speciality '�������� �������������' FROM Student st
	JOIN [Group] g
		ON st.ID_Group = g.ID_Group
			JOIN Speciality sp
				ON sp.ID_Speciality = g.ID_Speciality

4.	2 ������� � �������������� ����������  ���� ������ �� ��������� � �������� ������; 
5.	2 ������� � �������������� ����������  ����  ������ �� ��������� � �������� ������; 
6.	1 ������� � �������������� ������������� ���������� � �������� ������������. 


-- 6. ������� ��� �������������� � ������������ ���������, ������� ��� ���������
SELECT t.LName '�������', t.FName '���', t.Patronymic '��������', d.Name_Discipline '�������� ����������' FROM Teacher t
	WHERE t.Birth_Date < '1990-01-01'
	JOIN Teacher_Discipline td
		ON td.ID_Teacher = t.ID_Teacher
			JOIN Discipline d
				ON td.ID_Discipline = d.ID_Discipline