USE [Zakaz_Project_Khasanov]
GO
/****** Object:  Table [dbo].[Discipline]    Script Date: 11.05.2022 13:00:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discipline](
	[ID_Discipline] [int] NOT NULL,
	[Name_Discipline] [nvarchar](255) NULL,
 CONSTRAINT [PK_Discipline] PRIMARY KEY CLUSTERED 
(
	[ID_Discipline] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Group]    Script Date: 11.05.2022 13:00:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group](
	[ID_Group] [int] NOT NULL,
	[ID_Speciality] [int] NOT NULL,
 CONSTRAINT [PK_Group] PRIMARY KEY CLUSTERED 
(
	[ID_Group] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Speciality]    Script Date: 11.05.2022 13:00:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Speciality](
	[ID_Speciality] [int] NOT NULL,
	[Name_Speciality] [nvarchar](255) NULL,
 CONSTRAINT [PK_Speciality] PRIMARY KEY CLUSTERED 
(
	[ID_Speciality] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 11.05.2022 13:00:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[ID_Student] [int] NOT NULL,
	[LName] [nvarchar](30) NULL,
	[FName] [nvarchar](30) NULL,
	[Patronymic] [nvarchar](30) NULL,
	[ID_Group] [int] NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[ID_Student] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Study_Plan]    Script Date: 11.05.2022 13:00:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Study_Plan](
	[ID_Group] [int] NOT NULL,
	[ID_Discipline] [int] NOT NULL,
	[Number_Hours] [int] NULL,
 CONSTRAINT [PK_Study_Plan] PRIMARY KEY CLUSTERED 
(
	[ID_Group] ASC,
	[ID_Discipline] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 11.05.2022 13:00:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teacher](
	[ID_Teacher] [int] NOT NULL,
	[LName] [nvarchar](30) NULL,
	[FName] [nvarchar](30) NULL,
	[Patronymic] [nvarchar](30) NULL,
	[Salary] [decimal](8, 2) NULL,
 CONSTRAINT [PK_Teacher] PRIMARY KEY CLUSTERED 
(
	[ID_Teacher] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teacher_Discipline]    Script Date: 11.05.2022 13:00:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teacher_Discipline](
	[ID_Teacher] [int] NOT NULL,
	[ID_Discipline] [int] NOT NULL,
 CONSTRAINT [PK_Teacher_Discipline] PRIMARY KEY CLUSTERED 
(
	[ID_Teacher] ASC,
	[ID_Discipline] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Discipline] ([ID_Discipline], [Name_Discipline]) VALUES (301, N'Психология общения')
INSERT [dbo].[Discipline] ([ID_Discipline], [Name_Discipline]) VALUES (302, N'Информационные технологии')
INSERT [dbo].[Discipline] ([ID_Discipline], [Name_Discipline]) VALUES (303, N'Элементы высшей математики')
INSERT [dbo].[Discipline] ([ID_Discipline], [Name_Discipline]) VALUES (304, N'История')
INSERT [dbo].[Discipline] ([ID_Discipline], [Name_Discipline]) VALUES (305, N'Введение в специальность')
INSERT [dbo].[Discipline] ([ID_Discipline], [Name_Discipline]) VALUES (306, N'Основы алгоритмизации и программирования')
INSERT [dbo].[Discipline] ([ID_Discipline], [Name_Discipline]) VALUES (307, N'Введение в конфигурирование и программирование на платформе 1С')
INSERT [dbo].[Discipline] ([ID_Discipline], [Name_Discipline]) VALUES (308, N'Иностранный язык')
INSERT [dbo].[Discipline] ([ID_Discipline], [Name_Discipline]) VALUES (309, N'Компьютерные сети')
INSERT [dbo].[Group] ([ID_Group], [ID_Speciality]) VALUES (101, 1)
INSERT [dbo].[Group] ([ID_Group], [ID_Speciality]) VALUES (102, 2)
INSERT [dbo].[Group] ([ID_Group], [ID_Speciality]) VALUES (103, 3)
INSERT [dbo].[Speciality] ([ID_Speciality], [Name_Speciality]) VALUES (1, N'СИС')
INSERT [dbo].[Speciality] ([ID_Speciality], [Name_Speciality]) VALUES (2, N'КСК')
INSERT [dbo].[Speciality] ([ID_Speciality], [Name_Speciality]) VALUES (3, N'ВЕБ')
INSERT [dbo].[Student] ([ID_Student], [LName], [FName], [Patronymic], [ID_Group]) VALUES (201, N'Серпухов', N'Виктор', N'Кузьмич', 101)
INSERT [dbo].[Student] ([ID_Student], [LName], [FName], [Patronymic], [ID_Group]) VALUES (202, N'Батталова', N'Анастасия', N'Юрьевна', 101)
INSERT [dbo].[Student] ([ID_Student], [LName], [FName], [Patronymic], [ID_Group]) VALUES (203, N'Кириллов', N'Валентин', N'Владиславович', 101)
INSERT [dbo].[Student] ([ID_Student], [LName], [FName], [Patronymic], [ID_Group]) VALUES (204, N'Игнатьев', N'Антон', N'Григорьевич', 102)
INSERT [dbo].[Student] ([ID_Student], [LName], [FName], [Patronymic], [ID_Group]) VALUES (205, N'Павлова', N'Юлия', N'Константиновна', 102)
INSERT [dbo].[Student] ([ID_Student], [LName], [FName], [Patronymic], [ID_Group]) VALUES (206, N'Богданов', N'Николай', N'Филиппович', 102)
INSERT [dbo].[Student] ([ID_Student], [LName], [FName], [Patronymic], [ID_Group]) VALUES (207, N'Герасимов', N'Вячеслав', N'Емельянович', 103)
INSERT [dbo].[Student] ([ID_Student], [LName], [FName], [Patronymic], [ID_Group]) VALUES (208, N'Лебедева', N'Виктория', N'Михайловна', 103)
INSERT [dbo].[Student] ([ID_Student], [LName], [FName], [Patronymic], [ID_Group]) VALUES (209, N'Гусева', N'Ксения', N'Фомина', 103)
INSERT [dbo].[Study_Plan] ([ID_Group], [ID_Discipline], [Number_Hours]) VALUES (101, 301, 100)
INSERT [dbo].[Study_Plan] ([ID_Group], [ID_Discipline], [Number_Hours]) VALUES (101, 302, 90)
INSERT [dbo].[Study_Plan] ([ID_Group], [ID_Discipline], [Number_Hours]) VALUES (101, 303, 80)
INSERT [dbo].[Study_Plan] ([ID_Group], [ID_Discipline], [Number_Hours]) VALUES (102, 304, 70)
INSERT [dbo].[Study_Plan] ([ID_Group], [ID_Discipline], [Number_Hours]) VALUES (102, 305, 80)
INSERT [dbo].[Study_Plan] ([ID_Group], [ID_Discipline], [Number_Hours]) VALUES (102, 306, 90)
INSERT [dbo].[Study_Plan] ([ID_Group], [ID_Discipline], [Number_Hours]) VALUES (103, 307, 110)
INSERT [dbo].[Study_Plan] ([ID_Group], [ID_Discipline], [Number_Hours]) VALUES (103, 308, 120)
INSERT [dbo].[Study_Plan] ([ID_Group], [ID_Discipline], [Number_Hours]) VALUES (103, 309, 130)
INSERT [dbo].[Teacher] ([ID_Teacher], [LName], [FName], [Patronymic], [Salary]) VALUES (401, N'Долгова', N'Фарида', N'Рахимовна', CAST(60000.00 AS Decimal(8, 2)))
INSERT [dbo].[Teacher] ([ID_Teacher], [LName], [FName], [Patronymic], [Salary]) VALUES (402, N'Минина', N'Дарья', N'Дмитриевна', CAST(65000.00 AS Decimal(8, 2)))
INSERT [dbo].[Teacher] ([ID_Teacher], [LName], [FName], [Patronymic], [Salary]) VALUES (403, N'Ахтамова', N'Елена', N'Арсеньевна', CAST(55000.00 AS Decimal(8, 2)))
INSERT [dbo].[Teacher_Discipline] ([ID_Teacher], [ID_Discipline]) VALUES (401, 301)
INSERT [dbo].[Teacher_Discipline] ([ID_Teacher], [ID_Discipline]) VALUES (401, 302)
INSERT [dbo].[Teacher_Discipline] ([ID_Teacher], [ID_Discipline]) VALUES (401, 303)
INSERT [dbo].[Teacher_Discipline] ([ID_Teacher], [ID_Discipline]) VALUES (402, 304)
INSERT [dbo].[Teacher_Discipline] ([ID_Teacher], [ID_Discipline]) VALUES (402, 305)
INSERT [dbo].[Teacher_Discipline] ([ID_Teacher], [ID_Discipline]) VALUES (402, 306)
INSERT [dbo].[Teacher_Discipline] ([ID_Teacher], [ID_Discipline]) VALUES (403, 307)
INSERT [dbo].[Teacher_Discipline] ([ID_Teacher], [ID_Discipline]) VALUES (403, 308)
INSERT [dbo].[Teacher_Discipline] ([ID_Teacher], [ID_Discipline]) VALUES (403, 309)
ALTER TABLE [dbo].[Group]  WITH CHECK ADD  CONSTRAINT [FK_Group_Speciality1] FOREIGN KEY([ID_Speciality])
REFERENCES [dbo].[Speciality] ([ID_Speciality])
GO
ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [FK_Group_Speciality1]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Group1] FOREIGN KEY([ID_Group])
REFERENCES [dbo].[Group] ([ID_Group])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Group1]
GO
ALTER TABLE [dbo].[Study_Plan]  WITH CHECK ADD  CONSTRAINT [FK_Study_Plan_Discipline1] FOREIGN KEY([ID_Discipline])
REFERENCES [dbo].[Discipline] ([ID_Discipline])
GO
ALTER TABLE [dbo].[Study_Plan] CHECK CONSTRAINT [FK_Study_Plan_Discipline1]
GO
ALTER TABLE [dbo].[Study_Plan]  WITH CHECK ADD  CONSTRAINT [FK_Study_Plan_Group] FOREIGN KEY([ID_Group])
REFERENCES [dbo].[Group] ([ID_Group])
GO
ALTER TABLE [dbo].[Study_Plan] CHECK CONSTRAINT [FK_Study_Plan_Group]
GO
ALTER TABLE [dbo].[Teacher_Discipline]  WITH CHECK ADD  CONSTRAINT [FK_Teacher_Discipline_Discipline1] FOREIGN KEY([ID_Discipline])
REFERENCES [dbo].[Discipline] ([ID_Discipline])
GO
ALTER TABLE [dbo].[Teacher_Discipline] CHECK CONSTRAINT [FK_Teacher_Discipline_Discipline1]
GO
ALTER TABLE [dbo].[Teacher_Discipline]  WITH CHECK ADD  CONSTRAINT [FK_Teacher_Discipline_Teacher] FOREIGN KEY([ID_Teacher])
REFERENCES [dbo].[Teacher] ([ID_Teacher])
GO
ALTER TABLE [dbo].[Teacher_Discipline] CHECK CONSTRAINT [FK_Teacher_Discipline_Teacher]
GO
