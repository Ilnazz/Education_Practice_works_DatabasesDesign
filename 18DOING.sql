USE College

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

-- 6. ������� ����������� �������� ��������������, ���������� ������ 2000-�� ����, ������������ �� �� ����� ������
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

-- 11. ��������� ����� ���������, �� ������� ������� ����� ����� ������ 100
SELECT ID_Discipline '��� ����������', COUNT(ID_Discipline) '���������� ���������' From Study_Plan
	GROUP BY ID_Discipline
	HAVING AVG(Number_Hours) > 100

-- 12. ��������� ����� ���������, ����� �������, ����� � �������� ������� �����
SELECT COUNT(ID_Student) FROM Student
	WHERE (LEN(FName) = LEN(LName)) AND (LEN(LName) = LEN(Patronymic))

7.	3 ������� � �������������� ���������� ������� � ����������� ������ ���������� (WHERE, GROUP BY, HAVING); 

-- 13.

-- 14.

-- 15.