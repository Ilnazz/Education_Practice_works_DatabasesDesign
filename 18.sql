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

-- 13. ������� ��� ��������������, ����� ������� ������ 70000, ������������� �� ����� ������, ��������, ����� � �������� � �������� ������, ������ �� ������ ����� 4 ���
SELECT Work_Experience, LName, FName, Salary FROM Teacher
	WHERE Salary >= 70000
GROUP BY Work_Experience, Salary, FName, LName
HAVING Work_Experience > 4

-- 14. ?
SELECT Work_Experience FROM Teacher
	WHERE Birth_Date < '1990-01-01'
GROUP BY Work_Experience
HAVING COUNT(Work_Experience) > 1

-- 15. ������� ��������������, �������� ������� �� �������, ������������� �� ����� ������
SELECT ID_Teacher FROM Teacher
	WHERE Salary IS NULL
GROUP BY Work_Experience, ID_Teacher