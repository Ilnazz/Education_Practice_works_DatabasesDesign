USE College

-- 1. ������� ������ �����, ����������� �� ������������� � ����� 001.
SELECT ID_Group AS '����� ������', ID_Speciality '��� �������������' FROM [Group]
	WHERE ID_Speciality = 001

-- 2. ������� ������� � ����� �������������� � ������� ����� 60 ����� ������
SELECT LName AS '�������', FName AS '���', Salary '�����' FROM Teacher
	WHERE Salary > 60000

-- 3. ������� ������ ��������� � ������ "�����"
SELECT ID_STUDENT AS '����� ��������', FName '���' FROM Student
	WHERE FName = '�����'

-- 4. ������� ������� � ����� ���������, ������� ������ � ������ 102 � ����� ������� ������ 206
SELECT LName AS '�������', FName AS '���', ID_Group '����� ������' FROM Student
	WHERE ID_Group = 102 AND ID_Student < 206

-- 5. ������� ������ ��������������, ������� ��������� ���������� "���������� �������" ��� "�������"
SELECT ID_Teacher AS '��������� �����', ID_Discipline '��� ����������' FROM Teacher_Discipline
	WHERE ID_Discipline = 301 OR ID_Discipline = 304

-- 6. ������� ������ ���������, ������� �� ����������� � ������ 101
SELECT ID_DISCIPLINE AS '��� ����������' FROM Study_Plan
	WHERE NOT (ID_Group = 101)

-- 7. ������� ������� � ����� ���������, ������ ������� �� ��������� 210 � ������� ���������� �� ����� "�", ��� �� �������� � ������ 102
SELECT LName AS '�������', FName AS '���', ID_Student '����� ��������' FROM Student
	WHERE (ID_Student < 210 AND (LName LIKE '�%')) OR ID_Group != 102

-- 8. ������� ������� � �������� ���� ��������������
SELECT LName + ' ' + SUBSTRING(FName, 1, 1) + '. ' + SUBSTRING(Patronymic, 1, 1) + '.' AS '������� � ��������'
	FROM Teacher

-- ��������� ��� ���������
SELECT
	Salary '������ ��������',
	(Salary + Salary * 0.1) '���������� �� 10% ��������',
	(Salary + Salary * 0.1)*0.13 '�������� � ���������� ��������',
	(Salary + Salary * 0.1) - (Salary + Salary * 0.1)*0.13 '�������� ��������'
FROM Teacher


-- 9. ������� ������ ���������, ������� ����� �����, ���������, �������, ������ ��� �������
SELECT ID_Student AS '����� ��������', FName '��� ��������' FROM Student
	WHERE FName IN ('�����', '���������', '�������', '������', '�������')

-- 10. ������� ������ ��������������, �� ������� ������ ������ 101, 102 ��� 103
SELECT ID_Speciality AS '����� �������������', ID_Group '��� ������' FROM [Group]
	WHERE ID_Group IN (101, 102, 103)

-- 11. ������� ������� �������������� � ������� ������ 50 �����, �� ������ 60 ����� ������
SELECT LName AS '�������', Salary '�����' FROM Teacher
	WHERE Salary BETWEEN 50000 AND 60000

-- 12. ������� ������� ���������, ������ ������� �� ����������� ���������� [203;207]
SELECT LName AS '�������', ID_Student '����� ��������' FROM Student
	WHERE ID_Student NOT BETWEEN 203 AND 207

-- 13. ������� �������� ���������, ������������ �� "��������" ��� "������"
SELECT Name_Discipline '��������' FROM Discipline
	WHERE Name_Discipline LIKE '��������%' OR Name_Discipline LIKE '������%'

-- 14. ������� �������� ���������, ���������� ��������� "��������������"
SELECT Name_Discipline FROM Discipline
	WHERE Name_Discipline LIKE '%��������������%'

-- 15. ������� ������ ��������������, �������� ������� �������
SELECT ID_Teacher AS '��������� �����', Salary '��������' FROM Teacher
	WHERE Salary IS NULL