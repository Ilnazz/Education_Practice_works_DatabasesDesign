USE College

-- 1. ������� ���������� � ������ ���� ���������
SELECT TOP 5 * FROM Student

-- 2. ������� ������ 20 % ����� �� ����� ����� ����� ������� Discipline
SELECT TOP 20 PERCENT * FROM Discipline

-- 3. ������������� �� ������� � ������� ���� ���������
SELECT * FROM Student
	ORDER BY LName

-- 4. ������������� �� �������, ����� � ������� ���� ���������, ������� �� ������ � ������ 101
SELECT * FROM Student
	WHERE ID_Group != 101
	ORDER BY LName, FName

-- 5. ������������� �� ��������, ������� � ����� � ������� ���� ��������, �������� ������� ������ 60000
SELECT * FROM Teacher
	WHERE Salary >= 60000
	ORDER BY Patronymic, Fname, Lname

-- 6. ������� ��� ������ ������� Study_Plan � ������� �������� ���������� ����� �� �����������
SELECT * FROM Study_Plan
	ORDER BY Number_Hours DESC

-- 7. ������� ��� ������ ������� Study_Plan, � ������� ���������� ����� �� ���������� ��������� � ��������� [70;100]
SELECT * FROM Study_Plan
	WHERE Number_Hours BETWEEN 70 AND 100

-- 8. ������� �������� ��������������, ������� �������� ����� "�"
SELECT Name_Speciality FROM Speciality
	WHERE Name_Speciality LIKE '%�%'

-- 9. ������� ���� ���������, ����� ������� ������������ �� "� ��� �"
SELECT * FROM Student
	WHERE FName LIKE '%[��]'

-- 10. ������� ���� ���������, ����� ������� �� ������������ �� "�" ��� "�"
SELECT * FROM Student
	WHERE FName NOT LIKE '%[��]'

-- 11. ������� ���� �������������� � �� ���������������� ��������� � ����������� �� ����� ������
SELECT LName, FName,

CASE
	WHEN Work_Experience < 3 THEN 'IV ���������'
	WHEN Work_Experience < 5 THEN 'III ���������'
	WHEN Work_Experience < 10 THEN 'II ���������'
	ELSE 'I ���������'
END AS '���������'

FROM Teacher

-- 12. ������� ���������� � �� ���
SELECT *,

CASE Name_Discipline
	WHEN '�������' THEN '������������'
	WHEN '���������� �������' THEN '������������'
	WHEN '����������� ����' THEN '������������'
	WHEN '�������� � �������������' THEN '������������'
	ELSE '�����������'
END AS '��� ����������'

FROM Discipline
	
-- 13. ������� ���� ���������, ������� ������ � ������ 101 � ������� �� �� ��������� �������
SELECT *
INTO #StudentsFromGroup101
FROM Student
	WHERE ID_Group = 101

SELECT * FROM #StudentsFromGroup101

-- 14. 
SELECT LName, FName,
	Salary '��������',
	IIF(Work_Experience > 10, 10, 5) '������',
	Salary * (IIF(Work_Experience > 10, 10, 5)) '�������� � ������ ������'
FROM Teacher

-- 15. ������� ������ �������������� � ������ �����, ������� �� ��� ���������, ������������� �� �������������, �������� ������������� � ������� 1
SELECT ID_Speciality, ID_Group FROM [Group]
GROUP BY ID_Speciality, ID_Group
	HAVING ID_Speciality != 1