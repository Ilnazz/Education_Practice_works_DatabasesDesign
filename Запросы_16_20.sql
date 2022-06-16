USE College

-- ������� �� ������������ ������ � 16

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

-- ������� �������� �������������� � ������ ������ � ���������
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

-- ������� �� ������������ ������ � 17

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

-- 14. ������� �������, ���, ��������, ������������ ������, �������� � ������ ������ ��������������
SELECT LName, FName,
	Salary '��������',
	IIF(Work_Experience > 10, 10, 5) '������ (%)',
	Salary * (IIF(Work_Experience > 10, 10, 5)) '�������� � ������ ������'
FROM Teacher

-- 15. ������� ���� ������, ���� ��������, ������� � ��� ��������������, ������������ ������ � ���� �� �������
SELECT Work_Experience, Birth_Date, LName, FName FROM Teacher
GROUP BY Work_Experience, Birth_Date, LName, FName
	HAVING Birth_Date < '2000-01-01'

-- ������� �� ������������ ������ � 18

-- 1. ��������� ����� �������� ��������������
SELECT SUM(Salary) '����� �������� ��������������' FROM Teacher

-- 2. ��������� ����� �������� ��������������, ���������� ������ 2000-�� ����
SELECT SUM(Salary) '����� ��������' FROM Teacher
	WHERE Birth_Date < '2000-01-01'

-- 3. ��������� ����� ���������� ����� ������������ ����� ���������� � ������ �������
SELECT ID_Discipline, SUM(Number_Hours) '����� ���������� �����' FROM Study_Plan
	GROUP BY ID_Discipline

-- 4. ������� ����������� � ������������ �������� ����� ��������������
SELECT MIN(Salary) '����������� ��������', MAX(Salary) '������������ ��������' FROM Teacher

-- 5. ������� ���������� � ���������� ����� �����, �� ������� ��� ����������� � �������
SELECT ID_Discipline '��� ����������', MAX(Number_Hours) '���������� ���������� �����' FROM Study_Plan
	WHERE ID_Group != 101
	GROUP BY ID_Discipline

-- 6. �������� ��������������, ���������� ������ 2000-�� ����;
-- ������������� �� �� ����� ������;
-- ����� ����������� �������� ����� ������ ������ ��������������
SELECT Work_Experience, MIN(Salary) FROM Teacher
	WHERE Birth_Date < '2000-01-01'
	GROUP BY Work_Experience

-- 7. ������� ����������� � ������������ ����� �������, �����, � �������� ����� ���������
SELECT MIN(LEN(LName)) '����������� ����� �������',
	   MAX(LEN(LName)) '������������ ����� �������',
	   MIN(LEN(FName)) '����������� ����� �����',
	   MAX(LEN(FName)) '������������ ����� �����',
	   MIN(LEN(Patronymic)) '����������� ����� ��������',
	   MAX(LEN(Patronymic)) '������������ ����� ��������'
FROM Student

-- 8. ��������� ������� �������� ����� �������������� �� ������ ������ ����� 5-�� ���
SELECT AVG(Salary) '������� ��������' From Teacher
	WHERE Work_Experience > 5

-- 9. ��������� ������� ���������� ����� �� ������ ���������� � ������� �����
SELECT ID_Discipline, AVG(Number_Hours) '������� ���������� �����' FROM Study_Plan
	GROUP BY ID_Discipline

-- 10. ���������, ������� �������������� �������� ������ 2000-�� ����
SELECT COUNT(ID_Teacher) '����� ��������������' From Teacher
	WHERE Birth_Date < '2000-01-01'

-- 11. ��������� ���������� ���������� ���� ����� ���������
SELECT COUNT(DISTINCT FName) '���������� ���������' From Student

-- 12. ��������� ����� ���������, ����� �������, ����� � �������� ������� ����� ���� �����
SELECT COUNT(ID_Student) '����� ���������' FROM Student
	WHERE (LEN(FName) = LEN(LName)) AND (LEN(LName) = LEN(Patronymic))

-- 13. ������� ��� ��������������, ����� ������� ������ 70000, ������������� �� ���� ��������, ����� � �������� � �������� ������, ������ �� ������ ����� 4 ���
SELECT Birth_Date '���� ��������', LName '�������', FName '���', Salary '��������' FROM Teacher
	WHERE Salary >= 70000
GROUP BY Birth_Date, LName, FName, Salary
HAVING YEAR(Birth_Date) > 1990

-- ������� �� ������������ ������ � 19

-- ���������� �������

-- 1. ��������� ������������ ������ ������� � ������
SELECT * FROM Student, [Group]

-- 2. ������� ������ ����� � �������� �� ��������������
SELECT ID_Group '����� ������', Name_Speciality '�������� �������������' FROM [Group]
	JOIN Speciality
		ON [Group].ID_Speciality = Speciality.ID_Speciality

-- 3. ������� ��� �������������� � ������������ ���������, ������� ��� ���������
SELECT t.LName '�������', t.FName '���', t.Patronymic '��������', d.Name_Discipline '�������� ����������' FROM Teacher t
	JOIN Teacher_Discipline td
		ON t.ID_Teacher = td.ID_Teacher
			JOIN Discipline d
				ON td.ID_Discipline = d.ID_Discipline

-- 4. ������� ����� ������, �������� ���������� � ���������� ����� �� ���� ���������� � ���� ������
SELECT g.ID_Group '����� ������', d.Name_Discipline '�������� ����������', sp.Number_Hours '���������� �����' FROM [Group] g
	JOIN Study_Plan sp
		ON g.ID_Group = sp.ID_Group
			JOIN Discipline d
				ON sp.ID_Discipline= d.ID_Discipline

-- 5. ������� ��� ��������� � �������������, �� ������� ��� ������
SELECT st.LName '�������', st.FName '���', st.Patronymic '��������', sp.Name_Speciality '�������� �������������' FROM Student st
	JOIN [Group] g
		ON st.ID_Group = g.ID_Group
			JOIN Speciality sp
				ON sp.ID_Speciality = g.ID_Speciality

-- 6. ������� ��� ��������������, ���������� ������ 1990-�� ���� � ������������ ���������, ������� ��� ���������
SELECT t.LName '�������', t.FName '���', t.Patronymic '��������', t.Birth_Date '���� ��������', d.Name_Discipline '�������� ����������' FROM Teacher t
		JOIN Teacher_Discipline td
			ON t.Birth_Date < '1990-01-01' AND td.ID_Teacher = t.ID_Teacher
				JOIN Discipline d
					ON td.ID_Discipline = d.ID_Discipline

-- 7. ������� ���� ���������, ������� ������ � ����� ������
SELECT s1.LName '������� 1-��', s1.FName '��� 1-��', s1.Patronymic '�������� 1-��',
	   s2.LName '������� 2-��', s2.FName '��� 2-��', s2.Patronymic '�������� 2-��', s1.ID_Group '����� ������'
FROM Student s1
	JOIN Student s2
		ON s1.ID_Group = s2.ID_Group AND s1.ID_Student < s2.ID_Student

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

-- ������� �� ������������ ������ � 20

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
