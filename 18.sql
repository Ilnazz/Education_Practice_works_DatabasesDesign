USE College

-- 1. ��������� ����� �������� ��������������
SELECT SUM(Salary) '����� �������� ��������������' FROM Teacher

-- 2. ��������� ����� �������� ��������������-������
SELECT SUM(Salary) '����� �������� ��������������-������' FROM Teacher
	WHERE FName NOT LIKE '%[��]'

-- 3. ��������� ����� ���������� ����� �� ������ ����������
SELECT ID_Discipline, SUM(Number_Hours) '����� ���������� �����' FROM Study_Plan
	GROUP BY ID_Discipline

4.	4 ������� �� ������� MIN � MAX   � �������������� ������� � �����������; 

-- 4. ������� ����������� � ������������ �������� ����� ��������������
SELECT MIN(Salary) '����������� ��������', MAX(Salary) '������������ ��������' FROM Teacher

-- 5. ������� ���������� � ���������� ����� �����, �� ������� ��� ����������� � �������
SELECT ID_Discipline '��� ����������', MAX(Number_Hours) '���������� ���������� �����' FROM Study_Plan
	WHERE ID_Group != 101
GROUP BY ID_Discipline

-- 6. 

-- 7.

5.	2 ������� �� ������� AVG   � �������������� ������� � �����������; 

-- 8. ��������� ������� �������� ����� ��������������
SELECT AVG(Salary) '������� ��������' From Teacher

-- 9. ��������� ������� ���������� ����� � ������� ����� � ������� ����������
SELECT ID_Discipline, AVG(Number_Hours) '������� ���������� �����' FROM Study_Plan
	GROUP BY ID_Discipline

6.	3 ������� �� ������� COUNT   � �������������� ������� � �����������; 

-- 10. ��������� ����� ���������-���������
SELECT COUNT(ID_Student) '����� ���������-���������' From Student
	WHERE FName NOT LIKE '%[��]'

-- 11. ��������� ����� ���������, �� ������� ������� ����� ����� ������ 100
SELECT COUNT(ID_Discipline) '���������� ���������', AVG(Number_Hours) From Study_Plan

-- 12.

7.	3 ������� � �������������� ���������� ������� � ����������� ������ ���������� (WHERE, GROUP BY, HAVING); 

-- 13.

-- 14.

-- 15.