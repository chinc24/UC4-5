USE [master]
GO
/****** Object:  Database [SRUManagementDB]    Script Date: 2/1/2019 3:19:34 PM ******/
CREATE DATABASE [SRUManagementDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SRUManagementDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLLEDOCON\MSSQL\DATA\SRUManagementDB.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SRUManagementDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLLEDOCON\MSSQL\DATA\SRUManagementDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SRUManagementDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SRUManagementDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SRUManagementDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SRUManagementDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SRUManagementDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SRUManagementDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SRUManagementDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [SRUManagementDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SRUManagementDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SRUManagementDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SRUManagementDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SRUManagementDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SRUManagementDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SRUManagementDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SRUManagementDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SRUManagementDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SRUManagementDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SRUManagementDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SRUManagementDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SRUManagementDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SRUManagementDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SRUManagementDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SRUManagementDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SRUManagementDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SRUManagementDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SRUManagementDB] SET  MULTI_USER 
GO
ALTER DATABASE [SRUManagementDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SRUManagementDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SRUManagementDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SRUManagementDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [SRUManagementDB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [SRUManagementDB]
GO
/****** Object:  Table [dbo].[Attendance]    Script Date: 2/1/2019 3:19:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attendance](
	[Id] [int] NOT NULL,
	[IdPerson] [int] NULL,
	[Type] [nvarchar](50) NULL,
	[Date] [date] NULL,
	[Note] [nvarchar](200) NULL,
 CONSTRAINT [PK_Attendance] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Certificate]    Script Date: 2/1/2019 3:19:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Certificate](
	[Id] [int] NOT NULL,
	[TraineeId] [int] NULL,
	[FinalGrade] [nvarchar](50) NULL,
	[CompletionLevel] [nvarchar](50) NULL,
	[Provider] [nchar](10) NULL,
	[GroupOf] [nvarchar](50) NULL,
	[SubGroup] [nvarchar](50) NULL,
	[Name] [nvarchar](50) NULL,
	[Code] [nvarchar](50) NULL,
 CONSTRAINT [PK_Certificate] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ClassAdmin]    Script Date: 2/1/2019 3:19:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClassAdmin](
	[Id] [int] NOT NULL,
	[Password] [nvarchar](50) NULL,
 CONSTRAINT [PK_ClassAdmin] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Course]    Script Date: 2/1/2019 3:19:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[courseId] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[openDate] [date] NULL,
	[Note] [nvarchar](50) NULL,
	[IdTrainer] [int] NULL,
	[classStatus] [nvarchar](50) NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[courseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 2/1/2019 3:19:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[Id] [int] NOT NULL,
	[IdTO] [int] NULL,
	[ConsultDate] [date] NULL,
	[FeedBackScore] [float] NULL,
 CONSTRAINT [PK_Feedback] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Fresher]    Script Date: 2/1/2019 3:19:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fresher](
	[Id] [int] NOT NULL,
	[UniversityGraduationDate] [date] NULL,
	[FullTimeAvailable] [date] NULL,
 CONSTRAINT [PK_Fresher] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Internship]    Script Date: 2/1/2019 3:19:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Internship](
	[Id] [int] NOT NULL,
 CONSTRAINT [PK_Internship] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Mistake]    Script Date: 2/1/2019 3:19:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mistake](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Description] [nvarchar](200) NULL,
	[Note] [nvarchar](200) NULL,
	[IdTrainee] [int] NULL,
	[Date] [date] NULL,
 CONSTRAINT [PK_Mistake] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QuestionFeedback]    Script Date: 2/1/2019 3:19:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestionFeedback](
	[Id] [int] NOT NULL,
	[IdFeedback] [int] NULL,
	[groupOfQuestion] [nvarchar](50) NULL,
	[Topic] [nvarchar](50) NULL,
	[QfbContent] [nvarchar](50) NULL,
	[Score] [float] NULL,
 CONSTRAINT [PK_QuestionFeedback] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Score]    Script Date: 2/1/2019 3:19:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Score](
	[Id] [int] NOT NULL,
	[IdTO] [int] NOT NULL,
	[IdTrainee] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Value] [float] NULL,
 CONSTRAINT [PK_Score] PRIMARY KEY CLUSTERED 
(
	[Id] ASC,
	[IdTO] ASC,
	[IdTrainee] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Status]    Script Date: 2/1/2019 3:19:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[Id] [int] NOT NULL,
	[Type] [nvarchar](50) NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[LearnTime] [float] NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Trainee]    Script Date: 2/1/2019 3:19:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trainee](
	[Id] [int] NOT NULL,
	[IdCource] [int] NULL,
	[Branch] [nvarchar](50) NULL,
	[ParentDepartment] [nvarchar](50) NULL,
	[RecInterviewDate] [date] NULL,
	[RecInterviewStatus] [nvarchar](50) NULL,
	[Note] [nvarchar](50) NULL,
	[TraineeStatus] [int] NULL,
	[University] [nvarchar](50) NULL,
	[Faculty] [nvarchar](50) NULL,
 CONSTRAINT [PK_Trainee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Trainer]    Script Date: 2/1/2019 3:19:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trainer](
	[Id] [int] NOT NULL,
 CONSTRAINT [PK_Trainer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TrainingObjective]    Script Date: 2/1/2019 3:19:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TrainingObjective](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Code] [nvarchar](50) NULL,
	[IdTrainer] [int] NULL,
	[trainingObjectID] [int] NOT NULL,
	[trainerID] [int] NOT NULL,
	[trainingObjectCode] [varchar](255) NULL,
	[trainingObjectName] [varchar](255) NULL,
 CONSTRAINT [PK_TrainingObjective] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[User]    Script Date: 2/1/2019 3:19:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] NOT NULL,
	[Account] [nvarchar](50) NULL,
	[InNational] [nvarchar](50) NULL,
	[Fullname] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[TelPhone] [nvarchar](50) NULL,
	[Facebook] [nvarchar](50) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Course] ([courseId], [Name], [openDate], [Note], [IdTrainer], [classStatus]) VALUES (1, N'PRO192	', CAST(N'2019-01-01' AS Date), N'Object-Oriented Programming with Java', 16, N'Running')
INSERT [dbo].[Course] ([courseId], [Name], [openDate], [Note], [IdTrainer], [classStatus]) VALUES (2, N'PRN292', CAST(N'2019-01-01' AS Date), N'.NET and C#', 17, N'Running')
INSERT [dbo].[Course] ([courseId], [Name], [openDate], [Note], [IdTrainer], [classStatus]) VALUES (3, N'PRJ321', CAST(N'2019-07-01' AS Date), N'Java Web Application', 18, N'Running')
INSERT [dbo].[Course] ([courseId], [Name], [openDate], [Note], [IdTrainer], [classStatus]) VALUES (4, N'OSG202	', CAST(N'2019-07-01' AS Date), N'Operating Systems', 19, N'Running')
INSERT [dbo].[Course] ([courseId], [Name], [openDate], [Note], [IdTrainer], [classStatus]) VALUES (5, N'SWE102', CAST(N'2019-01-14' AS Date), N'Introduction to Software Engineering', 20, N'Release')
INSERT [dbo].[Course] ([courseId], [Name], [openDate], [Note], [IdTrainer], [classStatus]) VALUES (6, N'MAE101', CAST(N'2019-01-14' AS Date), N'Mathematics for Engineering', 16, N'Waiting')
INSERT [dbo].[Course] ([courseId], [Name], [openDate], [Note], [IdTrainer], [classStatus]) VALUES (7, N'SSG101', CAST(N'2019-01-14' AS Date), N'Working in Group Skills', 17, N'Release')
INSERT [dbo].[Course] ([courseId], [Name], [openDate], [Note], [IdTrainer], [classStatus]) VALUES (8, N'DBI202', CAST(N'2019-01-21' AS Date), N'Introduction to Databases', 18, N'Running')
INSERT [dbo].[Course] ([courseId], [Name], [openDate], [Note], [IdTrainer], [classStatus]) VALUES (9, N'SWR302', CAST(N'2019-01-21' AS Date), N'	Software Requirements', 19, N'Waiting')
INSERT [dbo].[Course] ([courseId], [Name], [openDate], [Note], [IdTrainer], [classStatus]) VALUES (10, N'MAD101	', CAST(N'2019-01-21' AS Date), N'	Discrete mathematics', 20, N'Running')
INSERT [dbo].[Fresher] ([Id], [UniversityGraduationDate], [FullTimeAvailable]) VALUES (1, NULL, CAST(N'2019-01-05' AS Date))
INSERT [dbo].[Fresher] ([Id], [UniversityGraduationDate], [FullTimeAvailable]) VALUES (2, CAST(N'2018-01-06' AS Date), CAST(N'2019-01-05' AS Date))
INSERT [dbo].[Fresher] ([Id], [UniversityGraduationDate], [FullTimeAvailable]) VALUES (3, CAST(N'2018-01-02' AS Date), CAST(N'2019-01-04' AS Date))
INSERT [dbo].[Fresher] ([Id], [UniversityGraduationDate], [FullTimeAvailable]) VALUES (4, NULL, CAST(N'2019-01-04' AS Date))
INSERT [dbo].[Fresher] ([Id], [UniversityGraduationDate], [FullTimeAvailable]) VALUES (5, NULL, CAST(N'2019-01-05' AS Date))
INSERT [dbo].[Fresher] ([Id], [UniversityGraduationDate], [FullTimeAvailable]) VALUES (6, CAST(N'2016-03-04' AS Date), CAST(N'2019-01-04' AS Date))
INSERT [dbo].[Fresher] ([Id], [UniversityGraduationDate], [FullTimeAvailable]) VALUES (7, CAST(N'2019-01-03' AS Date), CAST(N'2019-03-20' AS Date))
INSERT [dbo].[Fresher] ([Id], [UniversityGraduationDate], [FullTimeAvailable]) VALUES (8, NULL, CAST(N'2019-03-20' AS Date))
INSERT [dbo].[Fresher] ([Id], [UniversityGraduationDate], [FullTimeAvailable]) VALUES (9, NULL, CAST(N'2019-01-04' AS Date))
INSERT [dbo].[Fresher] ([Id], [UniversityGraduationDate], [FullTimeAvailable]) VALUES (10, CAST(N'2017-01-09' AS Date), CAST(N'2019-03-10' AS Date))
INSERT [dbo].[Status] ([Id], [Type], [StartDate], [EndDate], [LearnTime]) VALUES (1, N'Fresher', CAST(N'2019-01-09' AS Date), CAST(N'2019-05-09' AS Date), NULL)
INSERT [dbo].[Status] ([Id], [Type], [StartDate], [EndDate], [LearnTime]) VALUES (2, N'Fresher', CAST(N'2019-01-14' AS Date), CAST(N'2019-05-14' AS Date), NULL)
INSERT [dbo].[Status] ([Id], [Type], [StartDate], [EndDate], [LearnTime]) VALUES (3, N'Tester', CAST(N'2019-01-20' AS Date), CAST(N'2019-05-20' AS Date), NULL)
INSERT [dbo].[Status] ([Id], [Type], [StartDate], [EndDate], [LearnTime]) VALUES (4, N'Tester', CAST(N'2019-01-20' AS Date), CAST(N'2019-05-20' AS Date), NULL)
INSERT [dbo].[Trainee] ([Id], [IdCource], [Branch], [ParentDepartment], [RecInterviewDate], [RecInterviewStatus], [Note], [TraineeStatus], [University], [Faculty]) VALUES (1, 1, N'chip sang', N'FSoft', CAST(N'2019-07-01' AS Date), N'Passed', N'Very Good', 1, N'FPT', N'Java')
INSERT [dbo].[Trainee] ([Id], [IdCource], [Branch], [ParentDepartment], [RecInterviewDate], [RecInterviewStatus], [Note], [TraineeStatus], [University], [Faculty]) VALUES (2, 2, N'DTL', N'Fsoft', CAST(N'2019-07-01' AS Date), N'Passed', N'Good', 2, N'FPT', N'.NET and C#')
INSERT [dbo].[Trainee] ([Id], [IdCource], [Branch], [ParentDepartment], [RecInterviewDate], [RecInterviewStatus], [Note], [TraineeStatus], [University], [Faculty]) VALUES (3, 1, N'FSU1', N'Fsoft', CAST(N'2019-09-01' AS Date), N'Passed', N'OK', 1, N'Mo', N'.NET')
INSERT [dbo].[Trainee] ([Id], [IdCource], [Branch], [ParentDepartment], [RecInterviewDate], [RecInterviewStatus], [Note], [TraineeStatus], [University], [Faculty]) VALUES (4, 1, N'FSU2', N'Fsoft', CAST(N'2019-09-01' AS Date), N'Passed', N'OK', 1, N'Hoa Sen', N'Java')
INSERT [dbo].[Trainee] ([Id], [IdCource], [Branch], [ParentDepartment], [RecInterviewDate], [RecInterviewStatus], [Note], [TraineeStatus], [University], [Faculty]) VALUES (5, 3, N'FA', N'Fsoft', CAST(N'2019-01-14' AS Date), N'Passed', N'OK', 1, N'Cong Nghiep', N'.NET')
INSERT [dbo].[Trainee] ([Id], [IdCource], [Branch], [ParentDepartment], [RecInterviewDate], [RecInterviewStatus], [Note], [TraineeStatus], [University], [Faculty]) VALUES (6, 6, N'FA', N'Fsoft', CAST(N'2019-01-14' AS Date), N'Passed', N'Good', 2, N'FPT', N'Java')
INSERT [dbo].[Trainee] ([Id], [IdCource], [Branch], [ParentDepartment], [RecInterviewDate], [RecInterviewStatus], [Note], [TraineeStatus], [University], [Faculty]) VALUES (7, 4, N'DTL', N'Fsoft', CAST(N'2019-01-14' AS Date), N'Waiting', N'Good', 2, N'FPT', N'.NET')
INSERT [dbo].[Trainee] ([Id], [IdCource], [Branch], [ParentDepartment], [RecInterviewDate], [RecInterviewStatus], [Note], [TraineeStatus], [University], [Faculty]) VALUES (8, 5, N'FSU3', N'Fsoft', CAST(N'2019-01-14' AS Date), N'Waiting', N'Very Good', 3, N'FPT', N'Java')
INSERT [dbo].[Trainee] ([Id], [IdCource], [Branch], [ParentDepartment], [RecInterviewDate], [RecInterviewStatus], [Note], [TraineeStatus], [University], [Faculty]) VALUES (9, 7, N'FA', N'Fsoft', CAST(N'2019-01-21' AS Date), N'Passed', N'Good', 4, N'FPT', N'Java and .NET')
INSERT [dbo].[Trainee] ([Id], [IdCource], [Branch], [ParentDepartment], [RecInterviewDate], [RecInterviewStatus], [Note], [TraineeStatus], [University], [Faculty]) VALUES (10, 8, N'FA', N'Fsoft', CAST(N'2019-01-21' AS Date), N'Passed', N'OK', 4, N'Cong Nghiep', N'C++')
INSERT [dbo].[Trainee] ([Id], [IdCource], [Branch], [ParentDepartment], [RecInterviewDate], [RecInterviewStatus], [Note], [TraineeStatus], [University], [Faculty]) VALUES (11, 4, N'FSU2', N'Fsoft', CAST(N'2019-01-21' AS Date), N'Passed', N'OK', 3, N'FPT', N'C++')
INSERT [dbo].[Trainee] ([Id], [IdCource], [Branch], [ParentDepartment], [RecInterviewDate], [RecInterviewStatus], [Note], [TraineeStatus], [University], [Faculty]) VALUES (12, 2, N'chip sang', N'Fsoft', CAST(N'2019-01-21' AS Date), N'Waiting', N'Good', 1, N'Su Pham Ky Thuat', N'.NET')
INSERT [dbo].[Trainee] ([Id], [IdCource], [Branch], [ParentDepartment], [RecInterviewDate], [RecInterviewStatus], [Note], [TraineeStatus], [University], [Faculty]) VALUES (13, 7, N'FSU1', N'Fsoft', CAST(N'2019-01-10' AS Date), N'Passed', N'Very Good', 4, N'FPT', N'Java and .NET')
INSERT [dbo].[Trainee] ([Id], [IdCource], [Branch], [ParentDepartment], [RecInterviewDate], [RecInterviewStatus], [Note], [TraineeStatus], [University], [Faculty]) VALUES (14, 3, N'FSU1', N'Fsoft', CAST(N'2019-01-10' AS Date), N'Passed', N'OK', 4, N'FPT', N'Java')
INSERT [dbo].[Trainee] ([Id], [IdCource], [Branch], [ParentDepartment], [RecInterviewDate], [RecInterviewStatus], [Note], [TraineeStatus], [University], [Faculty]) VALUES (15, 4, N'FA', N'Fsoft', CAST(N'2019-01-10' AS Date), N'Passed', N'Good', 3, N'Hoa Sen', N'Java')
INSERT [dbo].[Trainer] ([Id]) VALUES (16)
INSERT [dbo].[Trainer] ([Id]) VALUES (17)
INSERT [dbo].[Trainer] ([Id]) VALUES (18)
INSERT [dbo].[Trainer] ([Id]) VALUES (19)
INSERT [dbo].[Trainer] ([Id]) VALUES (20)
INSERT [dbo].[User] ([Id], [Account], [InNational], [Fullname], [Email], [TelPhone], [Facebook]) VALUES (1, N'tin', N'Viet Nam', N'Nguyen Trung Tin', N'tinntse62275@fpt.edu.vn', N'0123456789', N'Nguyen Trung Tin')
INSERT [dbo].[User] ([Id], [Account], [InNational], [Fullname], [Email], [TelPhone], [Facebook]) VALUES (2, N'le', N'Laos', N'Dang Huu Le', N'ledhse12345@ft.edu.vn', N'9876543210', N'Gay Lord')
INSERT [dbo].[User] ([Id], [Account], [InNational], [Fullname], [Email], [TelPhone], [Facebook]) VALUES (3, N'hoang', N'China', N'Huynh Minh Hoang', N'hoanghmse12345@fpt.edu.vn', N'123123123', N'Pit Bull')
INSERT [dbo].[User] ([Id], [Account], [InNational], [Fullname], [Email], [TelPhone], [Facebook]) VALUES (4, N'tuan', N'Cambodia', N'Pham Minh Tuan', N'tuanpmse123456@fpt.edu.vn', N'456456456', N'Ngao')
INSERT [dbo].[User] ([Id], [Account], [InNational], [Fullname], [Email], [TelPhone], [Facebook]) VALUES (5, N'chi', N'Japan', N'Chi', N'chise123456@fpt.edu.vn', N'789789789', N'Chi hua hua')
INSERT [dbo].[User] ([Id], [Account], [InNational], [Fullname], [Email], [TelPhone], [Facebook]) VALUES (6, N'dat', N'Viet Name', N'Bo Cong Dat', N'datbcse12345@fpt.edu.vn', N'321321321', N'Cong Dat')
INSERT [dbo].[User] ([Id], [Account], [InNational], [Fullname], [Email], [TelPhone], [Facebook]) VALUES (7, N'thao', N'America', N'Ho Thien Thao', N'thaohtse98765@fpt.edu.vn', N'654654654', N'Thien Thao')
INSERT [dbo].[User] ([Id], [Account], [InNational], [Fullname], [Email], [TelPhone], [Facebook]) VALUES (8, N'anh', N'United Kingdom', N'Tran Ho Tram Anh', N'anhthtse54321@fpt.edu.vn', N'147852369', N'Tram Anh')
INSERT [dbo].[User] ([Id], [Account], [InNational], [Fullname], [Email], [TelPhone], [Facebook]) VALUES (9, N'tien', N'Canada', N'Tien', N'tien@gmail.com', N'963258741', N'Tien')
INSERT [dbo].[User] ([Id], [Account], [InNational], [Fullname], [Email], [TelPhone], [Facebook]) VALUES (10, N'obama', N'America', N'Obama', N'obama@gmail.com', N'0123654123', N'Obama')
INSERT [dbo].[User] ([Id], [Account], [InNational], [Fullname], [Email], [TelPhone], [Facebook]) VALUES (11, N'naruto', N'Konoha', N'Uzumaki Naruto', N'naruto@gmail.com', N'01111111', N'Naruto')
INSERT [dbo].[User] ([Id], [Account], [InNational], [Fullname], [Email], [TelPhone], [Facebook]) VALUES (12, N'sasuke', N'di bui', N'Uchiha Sasuke', N'sasuke@gmail.com', N'02222222', N'Sasuke')
INSERT [dbo].[User] ([Id], [Account], [InNational], [Fullname], [Email], [TelPhone], [Facebook]) VALUES (13, N'minato', N'Konoha', N'Namikaze Minato', N'minato@gmail.com', N'03333333', N'Minato')
INSERT [dbo].[User] ([Id], [Account], [InNational], [Fullname], [Email], [TelPhone], [Facebook]) VALUES (14, N'bee', N'lang may', N'Killer Bee', N'bee@gmail.com', N'04444444', N'Bee')
INSERT [dbo].[User] ([Id], [Account], [InNational], [Fullname], [Email], [TelPhone], [Facebook]) VALUES (15, N'mei', N'lang suong mu', N'Mei', N'mei@gmail.com', N'05555555', N'Mei')
INSERT [dbo].[User] ([Id], [Account], [InNational], [Fullname], [Email], [TelPhone], [Facebook]) VALUES (16, N'madara', N'Konoha', N'Uchiha madara', N'madara@gmail.com', N'06666666', N'Madara')
INSERT [dbo].[User] ([Id], [Account], [InNational], [Fullname], [Email], [TelPhone], [Facebook]) VALUES (17, N'obito', N'Konoha', N'Uchiha Obito', N'obito@gmail.com', N'07777777', N'Tobi')
INSERT [dbo].[User] ([Id], [Account], [InNational], [Fullname], [Email], [TelPhone], [Facebook]) VALUES (18, N'itachi', N'Konoha', N'Uchiha Itachi', N'itachi@gmail.com', N'08888888', N'Itachi')
INSERT [dbo].[User] ([Id], [Account], [InNational], [Fullname], [Email], [TelPhone], [Facebook]) VALUES (19, N'nagato', N'lang mua', N'Uzumaki Nagato', N'nagato@gmail.com', N'09999999', N'Nagato')
INSERT [dbo].[User] ([Id], [Account], [InNational], [Fullname], [Email], [TelPhone], [Facebook]) VALUES (20, N'gaara', N'lang cat', N'Gaara', N'gaara@fpt.edu.vn', N'00000001', N'Gaara')
ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD  CONSTRAINT [FK_Attendance_User] FOREIGN KEY([IdPerson])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Attendance] CHECK CONSTRAINT [FK_Attendance_User]
GO
ALTER TABLE [dbo].[Certificate]  WITH CHECK ADD  CONSTRAINT [FK_Certificate_Trainee1] FOREIGN KEY([TraineeId])
REFERENCES [dbo].[Trainee] ([Id])
GO
ALTER TABLE [dbo].[Certificate] CHECK CONSTRAINT [FK_Certificate_Trainee1]
GO
ALTER TABLE [dbo].[ClassAdmin]  WITH CHECK ADD  CONSTRAINT [FK_ClassAdmin_User] FOREIGN KEY([Id])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[ClassAdmin] CHECK CONSTRAINT [FK_ClassAdmin_User]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_Feedback_TrainingObjective] FOREIGN KEY([IdTO])
REFERENCES [dbo].[TrainingObjective] ([Id])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_Feedback_TrainingObjective]
GO
ALTER TABLE [dbo].[Fresher]  WITH CHECK ADD  CONSTRAINT [FK_Fresher_Trainee] FOREIGN KEY([Id])
REFERENCES [dbo].[Trainee] ([Id])
GO
ALTER TABLE [dbo].[Fresher] CHECK CONSTRAINT [FK_Fresher_Trainee]
GO
ALTER TABLE [dbo].[Internship]  WITH CHECK ADD  CONSTRAINT [FK_Internship_Trainee] FOREIGN KEY([Id])
REFERENCES [dbo].[Trainee] ([Id])
GO
ALTER TABLE [dbo].[Internship] CHECK CONSTRAINT [FK_Internship_Trainee]
GO
ALTER TABLE [dbo].[Mistake]  WITH CHECK ADD  CONSTRAINT [FK_Mistake_Trainee] FOREIGN KEY([IdTrainee])
REFERENCES [dbo].[Trainee] ([Id])
GO
ALTER TABLE [dbo].[Mistake] CHECK CONSTRAINT [FK_Mistake_Trainee]
GO
ALTER TABLE [dbo].[QuestionFeedback]  WITH CHECK ADD  CONSTRAINT [FK_QuestionFeedback_Feedback] FOREIGN KEY([IdFeedback])
REFERENCES [dbo].[Feedback] ([Id])
GO
ALTER TABLE [dbo].[QuestionFeedback] CHECK CONSTRAINT [FK_QuestionFeedback_Feedback]
GO
ALTER TABLE [dbo].[Score]  WITH CHECK ADD  CONSTRAINT [FK_Score_Trainee] FOREIGN KEY([IdTrainee])
REFERENCES [dbo].[Trainee] ([Id])
GO
ALTER TABLE [dbo].[Score] CHECK CONSTRAINT [FK_Score_Trainee]
GO
ALTER TABLE [dbo].[Score]  WITH CHECK ADD  CONSTRAINT [FK_Score_TrainingObjective] FOREIGN KEY([IdTO])
REFERENCES [dbo].[TrainingObjective] ([Id])
GO
ALTER TABLE [dbo].[Score] CHECK CONSTRAINT [FK_Score_TrainingObjective]
GO
ALTER TABLE [dbo].[Trainee]  WITH CHECK ADD  CONSTRAINT [FK_Trainee_Status] FOREIGN KEY([TraineeStatus])
REFERENCES [dbo].[Status] ([Id])
GO
ALTER TABLE [dbo].[Trainee] CHECK CONSTRAINT [FK_Trainee_Status]
GO
ALTER TABLE [dbo].[Trainee]  WITH CHECK ADD  CONSTRAINT [FK_Trainee_User] FOREIGN KEY([Id])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Trainee] CHECK CONSTRAINT [FK_Trainee_User]
GO
ALTER TABLE [dbo].[Trainer]  WITH CHECK ADD  CONSTRAINT [FK_Trainer_User1] FOREIGN KEY([Id])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Trainer] CHECK CONSTRAINT [FK_Trainer_User1]
GO
ALTER TABLE [dbo].[TrainingObjective]  WITH CHECK ADD  CONSTRAINT [FK_TrainingObjective_Trainer] FOREIGN KEY([IdTrainer])
REFERENCES [dbo].[Trainer] ([Id])
GO
ALTER TABLE [dbo].[TrainingObjective] CHECK CONSTRAINT [FK_TrainingObjective_Trainer]
GO
USE [master]
GO
ALTER DATABASE [SRUManagementDB] SET  READ_WRITE 
GO
