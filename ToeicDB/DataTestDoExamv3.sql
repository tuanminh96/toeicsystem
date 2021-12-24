USE [master]
GO
/****** Object:  Database [ToeicSystem]    Script Date: 12/24/2021 10:05:09 PM ******/
CREATE DATABASE [ToeicSystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ToeicSystem', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\ToeicSystem.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ToeicSystem_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\ToeicSystem_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ToeicSystem] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ToeicSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ToeicSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ToeicSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ToeicSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ToeicSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ToeicSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [ToeicSystem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ToeicSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ToeicSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ToeicSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ToeicSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ToeicSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ToeicSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ToeicSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ToeicSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ToeicSystem] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ToeicSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ToeicSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ToeicSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ToeicSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ToeicSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ToeicSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ToeicSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ToeicSystem] SET RECOVERY FULL 
GO
ALTER DATABASE [ToeicSystem] SET  MULTI_USER 
GO
ALTER DATABASE [ToeicSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ToeicSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ToeicSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ToeicSystem] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ToeicSystem] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ToeicSystem', N'ON'
GO
ALTER DATABASE [ToeicSystem] SET QUERY_STORE = OFF
GO
USE [ToeicSystem]
GO
/****** Object:  Table [dbo].[account]    Script Date: 12/24/2021 10:05:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[account](
	[dtype] [varchar](31) NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
	[dia_chi] [varchar](255) NULL,
	[email] [varchar](255) NULL,
	[gender] [int] NOT NULL,
	[ho_ten] [varchar](255) NULL,
	[is_delete] [bit] NOT NULL,
	[password] [varchar](255) NULL,
	[so_dien_thoai] [varchar](255) NULL,
	[username] [varchar](255) NULL,
	[join_date] [datetime2](7) NULL,
	[add_date] [datetime2](7) NULL,
	[company] [varchar](255) NULL,
	[school] [varchar](255) NULL,
	[role_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[exam]    Script Date: 12/24/2021 10:05:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[exam](
	[id_exam] [int] IDENTITY(1,1) NOT NULL,
	[thumbnail] [varchar](255) NULL,
	[count_rate] [float] NULL,
	[count_test] [int] NOT NULL,
	[date_add] [date] NULL,
	[description] [varchar](255) NULL,
	[level] [varchar](255) NULL,
	[title] [varchar](255) NULL,
	[update_by] [varchar](255) NULL,
	[update_date] [date] NULL,
	[user_add_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_exam] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[explain_detail]    Script Date: 12/24/2021 10:05:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[explain_detail](
	[id_explain] [int] IDENTITY(1,1) NOT NULL,
	[explain] [varchar](255) NULL,
	[update_date] [date] NULL,
	[id_admin_id] [int] NULL,
	[question_cauhoibaithithuid] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_explain] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[group_member]    Script Date: 12/24/2021 10:05:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[group_member](
	[id_group_mem] [int] IDENTITY(1,1) NOT NULL,
	[add_date] [datetime2](7) NULL,
	[id_group] [int] NULL,
	[is_disabled] [int] NULL,
	[update_by] [varchar](255) NULL,
	[update_date] [datetime2](7) NULL,
	[id_user] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_group_mem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[group_team]    Script Date: 12/24/2021 10:05:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[group_team](
	[id_group] [int] IDENTITY(1,1) NOT NULL,
	[create_date] [datetime2](7) NULL,
	[description] [varchar](255) NULL,
	[image] [varchar](255) NULL,
	[max_mem] [int] NOT NULL,
	[name] [varchar](255) NULL,
	[total_mem] [int] NOT NULL,
	[update_by] [varchar](255) NULL,
	[update_date] [datetime2](7) NULL,
	[id_admin] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_group] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[notification]    Script Date: 12/24/2021 10:05:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[notification](
	[id_notification] [int] IDENTITY(1,1) NOT NULL,
	[brief] [varchar](255) NULL,
	[content] [varchar](255) NULL,
	[date_seen] [datetime2](7) NULL,
	[date_send] [datetime2](7) NULL,
	[hyper_link] [varchar](255) NULL,
	[user_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_notification] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[part]    Script Date: 12/24/2021 10:05:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[part](
	[id_part] [int] IDENTITY(1,1) NOT NULL,
	[description] [varchar](255) NULL,
	[part_name] [varchar](255) NULL,
	[question_total] [int] NOT NULL,
	[set_question_total] [int] NOT NULL,
	[time_for_test] [int] NOT NULL,
	[type] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_part] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[post]    Script Date: 12/24/2021 10:05:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[post](
	[id_post] [int] IDENTITY(1,1) NOT NULL,
	[content] [varchar](255) NULL,
	[date_post] [datetime2](7) NULL,
	[title] [varchar](255) NULL,
	[update_by] [varchar](255) NULL,
	[update_date] [datetime2](7) NULL,
	[group_id_group] [int] NULL,
	[user_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_post] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[question]    Script Date: 12/24/2021 10:05:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[question](
	[cauhoibaithithuid] [int] IDENTITY(1,1) NOT NULL,
	[audiomp3] [varchar](255) NULL,
	[correctanswer] [varchar](255) NULL,
	[image] [varchar](255) NULL,
	[number] [int] NULL,
	[option1] [varchar](255) NULL,
	[option2] [varchar](255) NULL,
	[option3] [varchar](255) NULL,
	[option4] [varchar](255) NULL,
	[paragraph] [text] NULL,
	[question] [varchar](255) NULL,
	[update_by] [varchar](255) NULL,
	[update_date] [date] NULL,
	[baithithuid] [int] NOT NULL,
	[id_part] [int] NOT NULL,
	[id_set] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[cauhoibaithithuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rating]    Script Date: 12/24/2021 10:05:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rating](
	[id_rating] [int] IDENTITY(1,1) NOT NULL,
	[date_review] [datetime2](7) NULL,
	[review] [varchar](255) NULL,
	[star] [int] NOT NULL,
	[exam_id_exam] [int] NULL,
	[nguoi_dung_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_rating] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[role]    Script Date: 12/24/2021 10:05:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[role](
	[id_role] [int] IDENTITY(1,1) NOT NULL,
	[code] [int] NOT NULL,
	[description] [varchar](255) NULL,
	[role] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_role] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[set_question]    Script Date: 12/24/2021 10:05:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[set_question](
	[id_set] [int] IDENTITY(1,1) NOT NULL,
	[audio] [varchar](255) NULL,
	[content] [varchar](255) NULL,
	[image] [varchar](255) NULL,
	[paragraph] [text] NULL,
	[total_quest] [int] NOT NULL,
	[update_by] [varchar](255) NULL,
	[update_date] [date] NULL,
	[exam_id_exam] [int] NULL,
	[part_toeic_id_part] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_set] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[set_question_list_question]    Script Date: 12/24/2021 10:05:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[set_question_list_question](
	[set_question_id_set] [int] NOT NULL,
	[list_question_cauhoibaithithuid] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[slidebanner]    Script Date: 12/24/2021 10:05:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[slidebanner](
	[slidebannerid] [int] IDENTITY(1,1) NOT NULL,
	[slidecontent] [varchar](255) NULL,
	[slideimage] [varchar](255) NULL,
	[slidename] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[slidebannerid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[teacher_remark]    Script Date: 12/24/2021 10:05:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[teacher_remark](
	[id_remark] [int] IDENTITY(1,1) NOT NULL,
	[date_range] [varchar](255) NULL,
	[remark] [varchar](255) NULL,
	[time_remark] [datetime2](7) NULL,
	[week_num] [varchar](255) NULL,
	[admin_remark_id] [int] NULL,
	[user_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_remark] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[test_result]    Script Date: 12/24/2021 10:05:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[test_result](
	[result_id] [int] IDENTITY(1,1) NOT NULL,
	[correctlisten] [int] NULL,
	[correctread] [int] NULL,
	[date_test] [datetime2](7) NULL,
	[right_part1] [int] NOT NULL,
	[right_part2] [int] NOT NULL,
	[right_part3] [int] NOT NULL,
	[right_part4] [int] NOT NULL,
	[right_part5] [int] NOT NULL,
	[right_part6] [int] NOT NULL,
	[right_part7] [int] NOT NULL,
	[score_listen] [int] NOT NULL,
	[score_reading] [int] NOT NULL,
	[total_time_test] [int] NOT NULL,
	[baithithuid] [int] NOT NULL,
	[nguoidungid] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[result_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[account] ON 

INSERT [dbo].[account] ([dtype], [id], [dia_chi], [email], [gender], [ho_ten], [is_delete], [password], [so_dien_thoai], [username], [join_date], [add_date], [company], [school], [role_id]) VALUES (N'User', 1, NULL, N'user1@gmail.com', 0, NULL, 0, N'$2a$10$LUlJwXJnk61DFw0Tsz1Ppuj8LLKQ7ouUc66BeN3V6a2wHvhsqtK1S', NULL, N'tuanmino96', NULL, CAST(N'2021-12-24T21:41:38.1440000' AS DateTime2), NULL, NULL, 2)
INSERT [dbo].[account] ([dtype], [id], [dia_chi], [email], [gender], [ho_ten], [is_delete], [password], [so_dien_thoai], [username], [join_date], [add_date], [company], [school], [role_id]) VALUES (N'User', 2, NULL, N'uservip1@gmail.com', 0, NULL, 0, N'$2a$10$PCexrhgpUFbrqRORMiXySOw9svq1zVumm7Tg1SCSQeLxCXc5wkHmi', NULL, N'tuanmino97', NULL, CAST(N'2021-12-24T21:41:38.5820000' AS DateTime2), NULL, NULL, 3)
INSERT [dbo].[account] ([dtype], [id], [dia_chi], [email], [gender], [ho_ten], [is_delete], [password], [so_dien_thoai], [username], [join_date], [add_date], [company], [school], [role_id]) VALUES (N'User', 3, NULL, N'uservip2@gmail.com', 0, NULL, 0, N'$2a$10$Oo0w4ev3EGQgjltTIynkguE2J1349/yXV4JDLL81bB38TGo2uH0ta', NULL, N'tuanmino98', NULL, CAST(N'2021-12-24T21:41:38.6880000' AS DateTime2), NULL, NULL, 3)
INSERT [dbo].[account] ([dtype], [id], [dia_chi], [email], [gender], [ho_ten], [is_delete], [password], [so_dien_thoai], [username], [join_date], [add_date], [company], [school], [role_id]) VALUES (N'User', 4, NULL, N'uservip3@gmail.com', 0, NULL, 0, N'$2a$10$r.YJ.mwcSlqUBL90q8XaDu69hjuUtE8qJaVLwqr0OiTtQObSKwCai', NULL, N'tuanmino99', NULL, CAST(N'2021-12-24T21:41:38.7920000' AS DateTime2), NULL, NULL, 3)
INSERT [dbo].[account] ([dtype], [id], [dia_chi], [email], [gender], [ho_ten], [is_delete], [password], [so_dien_thoai], [username], [join_date], [add_date], [company], [school], [role_id]) VALUES (N'User', 5, NULL, N'uservip4@gmail.com', 0, NULL, 0, N'$2a$10$6vHd3d/jB2t5t9cNBSQ7GenJVc50uFJ1HAB7mMFXoxI2mb00WQlQC', NULL, N'tuanmino2k', NULL, CAST(N'2021-12-24T21:41:38.8930000' AS DateTime2), NULL, NULL, 3)
INSERT [dbo].[account] ([dtype], [id], [dia_chi], [email], [gender], [ho_ten], [is_delete], [password], [so_dien_thoai], [username], [join_date], [add_date], [company], [school], [role_id]) VALUES (N'ContentAdmin', 6, NULL, N'contentadmin1@gmail.com', 0, NULL, 0, N'$2a$10$O8d4aucDhsDee1igL0Ud2.9II2BYEr5xPJVLwp8u7yJi/.oxotzJS', NULL, N'tuanmino2k2', NULL, NULL, NULL, NULL, 4)
INSERT [dbo].[account] ([dtype], [id], [dia_chi], [email], [gender], [ho_ten], [is_delete], [password], [so_dien_thoai], [username], [join_date], [add_date], [company], [school], [role_id]) VALUES (N'ManagerAdmin', 7, NULL, N'manageradmin1@gmail.com', 0, NULL, 0, N'$2a$10$UVhuXKcXfpx9hpXvOk5g4OW3Jm9KNrNz0h6EQaD3RPI7IYKYBnb.O', NULL, N'tuanmino2k3', NULL, NULL, NULL, NULL, 5)
INSERT [dbo].[account] ([dtype], [id], [dia_chi], [email], [gender], [ho_ten], [is_delete], [password], [so_dien_thoai], [username], [join_date], [add_date], [company], [school], [role_id]) VALUES (N'TutorialAdmin', 8, N'Thanh Hoa', N'Thangdz@gmail.com', 0, N'Le Van Thang', 0, N'$2a$10$As2MqSpzvi8SPZz7QMWFpO63lOrjnCN5cb2C.2f30ybebto.ASL6q', N'0398722638', N'tuanmino2k4', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[account] ([dtype], [id], [dia_chi], [email], [gender], [ho_ten], [is_delete], [password], [so_dien_thoai], [username], [join_date], [add_date], [company], [school], [role_id]) VALUES (N'User', 9, N'Thanh Hoa', N'Thangdz1@gmail.com', 0, N'Le Van Thang', 0, N'$2a$10$As2MqSpzvi8SPZz7QMWFpO63lOrjnCN5cb2C.2f30ybebto.ASL6q', N'0398722638', NULL, NULL, NULL, NULL, NULL, 2)
SET IDENTITY_INSERT [dbo].[account] OFF
SET IDENTITY_INSERT [dbo].[exam] ON 

INSERT [dbo].[exam] ([id_exam], [thumbnail], [count_rate], [count_test], [date_add], [description], [level], [title], [update_by], [update_date], [user_add_id]) VALUES (1, N'thumbnail.png', 0, 0, CAST(N'2021-12-24' AS Date), N'Exam1', N'2', N'Exam1', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[exam] OFF
SET IDENTITY_INSERT [dbo].[explain_detail] ON 

INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (1, N'Giai thich 1', CAST(N'2021-12-24' AS Date), NULL, 1)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (2, N'Giai thich 2', CAST(N'2021-12-24' AS Date), NULL, 2)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (3, N'Giai thich 3', CAST(N'2021-12-24' AS Date), NULL, 3)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (4, N'Giai thich 4', CAST(N'2021-12-24' AS Date), NULL, 4)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (5, N'Giai thich 5', CAST(N'2021-12-24' AS Date), NULL, 5)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (6, N'Giai thich 6', CAST(N'2021-12-24' AS Date), NULL, 6)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (7, N'Giai thich 7', CAST(N'2021-12-24' AS Date), NULL, 7)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (8, N'Giai thich 8', CAST(N'2021-12-24' AS Date), NULL, 8)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (9, N'Giai thich 9', CAST(N'2021-12-24' AS Date), NULL, 9)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (10, N'Giai thich 10', CAST(N'2021-12-24' AS Date), NULL, 10)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (11, N'Giai thich 11', CAST(N'2021-12-24' AS Date), NULL, 11)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (12, N'Giai thich 12', CAST(N'2021-12-24' AS Date), NULL, 12)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (13, N'Giai thich 13', CAST(N'2021-12-24' AS Date), NULL, 13)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (14, N'Giai thich 14', CAST(N'2021-12-24' AS Date), NULL, 14)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (15, N'Giai thich 15', CAST(N'2021-12-24' AS Date), NULL, 15)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (16, N'Giai thich 16', CAST(N'2021-12-24' AS Date), NULL, 16)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (17, N'Giai thich 17', CAST(N'2021-12-24' AS Date), NULL, 17)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (18, N'Giai thich 18', CAST(N'2021-12-24' AS Date), NULL, 18)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (19, N'Giai thich 19', CAST(N'2021-12-24' AS Date), NULL, 19)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (20, N'Giai thich 20', CAST(N'2021-12-24' AS Date), NULL, 20)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (21, N'Giai thich 21', CAST(N'2021-12-24' AS Date), NULL, 21)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (22, N'Giai thich 22', CAST(N'2021-12-24' AS Date), NULL, 22)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (23, N'Giai thich 23', CAST(N'2021-12-24' AS Date), NULL, 23)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (24, N'Giai thich 24', CAST(N'2021-12-24' AS Date), NULL, 24)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (25, N'Giai thich 25', CAST(N'2021-12-24' AS Date), NULL, 25)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (26, N'Giai thich 26', CAST(N'2021-12-24' AS Date), NULL, 26)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (27, N'Giai thich 27', CAST(N'2021-12-24' AS Date), NULL, 27)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (28, N'Giai thich 28', CAST(N'2021-12-24' AS Date), NULL, 28)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (29, N'Giai thich 29', CAST(N'2021-12-24' AS Date), NULL, 29)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (30, N'Giai thich 30', CAST(N'2021-12-24' AS Date), NULL, 30)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (31, N'Giai thich 31', CAST(N'2021-12-24' AS Date), NULL, 31)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (32, N'Giai thich 32', CAST(N'2021-12-24' AS Date), NULL, 32)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (33, N'Giai thich 33', CAST(N'2021-12-24' AS Date), NULL, 33)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (34, N'Giai thich 34', CAST(N'2021-12-24' AS Date), NULL, 34)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (35, N'Giai thich 35', CAST(N'2021-12-24' AS Date), NULL, 35)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (36, N'Giai thich 36', CAST(N'2021-12-24' AS Date), NULL, 36)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (37, N'Giai thich 37', CAST(N'2021-12-24' AS Date), NULL, 37)
SET IDENTITY_INSERT [dbo].[explain_detail] OFF
SET IDENTITY_INSERT [dbo].[part] ON 

INSERT [dbo].[part] ([id_part], [description], [part_name], [question_total], [set_question_total], [time_for_test], [type]) VALUES (1, N'Look at the picture and listen to the sentences. Choose the sentence that best describes the picture:', N'Part I', 0, 0, 0, N'Listening')
INSERT [dbo].[part] ([id_part], [description], [part_name], [question_total], [set_question_total], [time_for_test], [type]) VALUES (2, N'Listen to the question and the three responses. Choose the response that best answers the question:', N'Part II', 0, 0, 0, N'Listening')
INSERT [dbo].[part] ([id_part], [description], [part_name], [question_total], [set_question_total], [time_for_test], [type]) VALUES (3, N'Listen to the dialogue. Then read each question and choose the best answer:', N'Part III', 0, 0, 0, N'Listening')
INSERT [dbo].[part] ([id_part], [description], [part_name], [question_total], [set_question_total], [time_for_test], [type]) VALUES (4, N'Listen to the talk. Then read each question and choose the best answer:', N'Part IV', 0, 0, 0, N'Listening')
INSERT [dbo].[part] ([id_part], [description], [part_name], [question_total], [set_question_total], [time_for_test], [type]) VALUES (5, N'Choose the word that best completes the sentence:', N'Part V', 0, 0, 0, N'Reading')
INSERT [dbo].[part] ([id_part], [description], [part_name], [question_total], [set_question_total], [time_for_test], [type]) VALUES (6, N'Choose the word or phrase that best completes the blanks:', N'Part VI', 0, 0, 0, N'Reading')
INSERT [dbo].[part] ([id_part], [description], [part_name], [question_total], [set_question_total], [time_for_test], [type]) VALUES (7, N'Read the passage and choose the correct answer', N'Part VII', 0, 0, 0, N'Reading')
SET IDENTITY_INSERT [dbo].[part] OFF
SET IDENTITY_INSERT [dbo].[question] ON 

INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (1, NULL, N'A', NULL, 1, NULL, NULL, NULL, NULL, NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 1, 1, 1)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (2, NULL, N'A', NULL, 2, NULL, NULL, NULL, NULL, NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 1, 1, 2)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (3, NULL, N'A', NULL, 3, NULL, NULL, NULL, NULL, NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 1, 2, 3)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (4, NULL, N'A', NULL, 4, NULL, NULL, NULL, NULL, NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 1, 2, 3)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (5, NULL, N'A', NULL, 5, NULL, NULL, NULL, NULL, NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 1, 2, 3)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (6, NULL, N'A', NULL, 6, NULL, NULL, NULL, NULL, NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 1, 2, 3)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (7, NULL, N'A', NULL, 7, NULL, NULL, NULL, NULL, NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 1, 2, 3)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (8, NULL, N'A', NULL, 8, N'20.0', N'40.0', N'120.0', N'140.0', NULL, N'How much will he pay for the pens?', NULL, CAST(N'2021-12-24' AS Date), 1, 3, 4)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (9, NULL, N'A', NULL, 9, N'One day', N'One weekend', N'One week', N'One month', NULL, N'According to the speaker, how long will the special offer last?', NULL, CAST(N'2021-12-24' AS Date), 1, 3, 4)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (10, NULL, N'A', NULL, 10, N'100.0', N'200.0', N'300.0', N'400.0', NULL, N'How much is the special offer?', NULL, CAST(N'2021-12-24' AS Date), 1, 3, 4)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (11, NULL, N'A', NULL, 11, N'People who want to travel overseas', N'Members who belong to the fitness club', N'Staff who work for the Travel Lodge Inn', N'Those who want to get away for the weekend', NULL, N'Who would be most interested in this advertisement?', NULL, CAST(N'2021-12-24' AS Date), 1, 3, 5)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (12, NULL, N'A', NULL, 12, N'nearly', N'immediately', N'precisely', N'significantly', NULL, N'Employees who have not yet registered on the new company website must do so ------', NULL, CAST(N'2021-12-24' AS Date), 1, 3, 5)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (13, NULL, N'A', NULL, 13, N'professional', N'profession', N'professionals', N'professionally', NULL, N'Rosewater Medical Center employs healthcare -------- affiliated with Huron University.', NULL, CAST(N'2021-12-24' AS Date), 1, 3, 5)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (14, NULL, N'A', NULL, 14, N'indicates', N'commands', N'notices ', N'distributes', NULL, N'Once you have detected a fatal virus on your computer, common sense -------- that you should have your hard drive reformatted by skilled professionals.', NULL, CAST(N'2021-12-24' AS Date), 1, 4, 6)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (15, NULL, N'A', NULL, 15, N'just ', N'once', N'such', N'likely', NULL, N'Choose the word or phrase that best completes the blanks:', NULL, CAST(N'2021-12-24' AS Date), 1, 4, 6)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (16, NULL, N'A', NULL, 16, N'would have agreed', N'would agree', N'has agree', N' were agreeing', NULL, N'Choose the word or phrase that best completes the blanks:', NULL, CAST(N'2021-12-24' AS Date), 1, 4, 6)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (17, NULL, N'A', NULL, 17, N'In fact', N'In spite of', N'On the other hand', N'Even though', NULL, N'Choose the word or phrase that best completes the blanks:', NULL, CAST(N'2021-12-24' AS Date), 1, 4, 7)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (18, NULL, N'A', NULL, 18, N'The man is finishing his meal', N'The customer is waiting for a table', N'The waiter is setting the table', N'The woman is looking at the menu', NULL, N'Choose the word or phrase that best completes the blanks:', NULL, CAST(N'2021-12-24' AS Date), 1, 4, 7)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (19, NULL, N'A', NULL, 19, N'He’s handling a tool', N'He’s cutting grass', N'He’s building a bookshelf', N'He’s walking up to the roof', NULL, N'Choose the word or phrase that best completes the blanks:', NULL, CAST(N'2021-12-24' AS Date), 1, 4, 7)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (20, NULL, N'A', NULL, 20, N'I came in early today', N'Because I had a question', N'By two o’clock at the earliest', N'Because I had a question', NULL, N'Why did you come by yesterday?', NULL, CAST(N'2021-12-24' AS Date), 1, 5, 8)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (21, NULL, N'A', NULL, 21, N'Yes, I can lend it to you', N'The handle is in the front', N'Yes, that would be nice, thanks', N'The handle is in the front', NULL, N'Would you like a hand with your luggage?', NULL, CAST(N'2021-12-24' AS Date), 1, 5, 8)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (22, NULL, N'A', NULL, 22, N'No, it’s in Los Angeles', N'Yes, he is the boss there', N'He’s on a business trip', N'Yes, he is the boss there', NULL, N'Mr. Robertson runs our San Francisco office, doesn’t he?', NULL, CAST(N'2021-12-24' AS Date), 1, 5, 8)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (23, NULL, N'A', NULL, 23, N'100.0', N'200.0', N'300.0', N'400.0', NULL, N' How many pens does the man need?', NULL, CAST(N'2021-12-24' AS Date), 1, 5, 8)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (24, NULL, N'A', NULL, 24, N'To write a book', N'For the office employees', N'To make a large drawing', N'To give away at a conference', NULL, N'Why does he need the pens?', NULL, CAST(N'2021-12-24' AS Date), 1, 5, 8)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (25, NULL, N'A', NULL, 25, N'20.0', N'40.0', N'120.0', N'140.0', NULL, N'How much will he pay for the pens?', NULL, CAST(N'2021-12-24' AS Date), 1, 5, 8)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (26, NULL, N'A', NULL, 26, N'One day', N'One weekend', N'One week', N'One month', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 1, 6, 9)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (27, NULL, N'A', NULL, 27, N'100.0', N'200.0', N'300.0', N'400.0', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 1, 6, 9)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (28, NULL, N'A', NULL, 28, N'People who want to travel overseas', N'Members who belong to the fitness club', N'Staff who work for the Travel Lodge Inn', N'Those who want to get away for the weekend', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 1, 6, 9)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (29, NULL, N'A', NULL, 29, N'nearly', N'immediately', N'precisely', N'significantly', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 1, 6, 10)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (30, NULL, N'A', NULL, 30, N'professional', N'profession', N'professionals', N'professionally', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 1, 6, 10)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (31, NULL, N'A', NULL, 31, N'indicates', N'commands', N'notices ', N'distributes', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 1, 6, 10)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (32, NULL, N'A', NULL, 32, N'just ', N'once', N'such', N'likely', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 1, 7, 11)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (33, NULL, N'A', NULL, 33, N'would have agreed', N'would agree', N'has agree', N' were agreeing', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 1, 7, 11)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (34, NULL, N'A', NULL, 34, N'In fact', N'In spite of', N'On the other hand', N'Even though', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 1, 7, 11)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (35, NULL, N'A', NULL, 35, N'just ', N'once', N'such', N'likely', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 1, 7, 12)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (36, NULL, N'A', NULL, 36, N'would have agreed', N'would agree', N'has agree', N' were agreeing', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 1, 7, 12)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (37, NULL, N'A', NULL, 37, N'In fact', N'In spite of', N'On the other hand', N'Even though', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 1, 7, 12)
SET IDENTITY_INSERT [dbo].[question] OFF
SET IDENTITY_INSERT [dbo].[role] ON 

INSERT [dbo].[role] ([id_role], [code], [description], [role]) VALUES (1, 1, NULL, N'ROLE_TUTORIAL')
INSERT [dbo].[role] ([id_role], [code], [description], [role]) VALUES (2, 2, NULL, N'ROLE_MEMBER')
INSERT [dbo].[role] ([id_role], [code], [description], [role]) VALUES (3, 3, NULL, N'ROLE_MEMBER_VIP')
INSERT [dbo].[role] ([id_role], [code], [description], [role]) VALUES (4, 4, NULL, N'ROLE_CONTENT')
INSERT [dbo].[role] ([id_role], [code], [description], [role]) VALUES (5, 5, NULL, N'ROLE_MANAGER')
SET IDENTITY_INSERT [dbo].[role] OFF
SET IDENTITY_INSERT [dbo].[set_question] ON 

INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (1, N'audio1.mp3', N'Mo ta set question 1', N'image1.jpg', N'', 0, NULL, CAST(N'2021-12-24' AS Date), 1, 1)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (2, N'audio2.mp3', N'Mo ta set question 2', N'image2.jpg', N'', 0, NULL, CAST(N'2021-12-24' AS Date), 1, 1)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (3, N'audio3.mp3', N'Mo ta set question 3', N'', N'', 0, NULL, CAST(N'2021-12-24' AS Date), 1, 2)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (4, N'audio4.mp3', N'Mo ta set question 4', N'', N'', 0, NULL, CAST(N'2021-12-24' AS Date), 1, 3)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (5, N'audio5.mp3', N'Mo ta set question 5', N'', N'', 0, NULL, CAST(N'2021-12-24' AS Date), 1, 3)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (6, N'audio6.mp3', N'Mo ta set question 6', N'', N'', 0, NULL, CAST(N'2021-12-24' AS Date), 1, 4)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (7, N'audio7.mp3', N'Mo ta set question 7', N'', N'', 0, NULL, CAST(N'2021-12-24' AS Date), 1, 4)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (8, N'', N'Mo ta set question 8', N'', N'', 0, NULL, CAST(N'2021-12-24' AS Date), 1, 5)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (9, N'', N'Mo ta set question 9', N'', N'Paragraph 1', 0, NULL, CAST(N'2021-12-24' AS Date), 1, 6)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (10, N'', N'Mo ta set question 10', N'', N'Paragraph 2', 0, NULL, CAST(N'2021-12-24' AS Date), 1, 6)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (11, N'', N'Mo ta set question 11', N'', N'Paragraph 3', 0, NULL, CAST(N'2021-12-24' AS Date), 1, 7)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (12, N'', N'Mo ta set question 12', N'', N'Paragraph 4', 0, NULL, CAST(N'2021-12-24' AS Date), 1, 7)
SET IDENTITY_INSERT [dbo].[set_question] OFF
SET IDENTITY_INSERT [dbo].[test_result] ON 

INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1, 1, 1, CAST(N'2021-12-24T21:53:57.7800000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 10, 10, 279, 1, 9)
SET IDENTITY_INSERT [dbo].[test_result] OFF
/****** Object:  Index [UK_khw1hu7me9nitob9dhu86p3pa]    Script Date: 12/24/2021 10:05:10 PM ******/
ALTER TABLE [dbo].[set_question_list_question] ADD  CONSTRAINT [UK_khw1hu7me9nitob9dhu86p3pa] UNIQUE NONCLUSTERED 
(
	[list_question_cauhoibaithithuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[exam] ADD  DEFAULT ((0)) FOR [count_rate]
GO
ALTER TABLE [dbo].[group_member] ADD  DEFAULT ((0)) FOR [is_disabled]
GO
ALTER TABLE [dbo].[account]  WITH CHECK ADD  CONSTRAINT [FKd4vb66o896tay3yy52oqxr9w0] FOREIGN KEY([role_id])
REFERENCES [dbo].[role] ([id_role])
GO
ALTER TABLE [dbo].[account] CHECK CONSTRAINT [FKd4vb66o896tay3yy52oqxr9w0]
GO
ALTER TABLE [dbo].[exam]  WITH CHECK ADD  CONSTRAINT [FK6jxjvsrmump4tdq3xm9es5gi9] FOREIGN KEY([user_add_id])
REFERENCES [dbo].[account] ([id])
GO
ALTER TABLE [dbo].[exam] CHECK CONSTRAINT [FK6jxjvsrmump4tdq3xm9es5gi9]
GO
ALTER TABLE [dbo].[explain_detail]  WITH CHECK ADD  CONSTRAINT [FK4wgl8iw7vjyyeuxgui605h19h] FOREIGN KEY([id_admin_id])
REFERENCES [dbo].[account] ([id])
GO
ALTER TABLE [dbo].[explain_detail] CHECK CONSTRAINT [FK4wgl8iw7vjyyeuxgui605h19h]
GO
ALTER TABLE [dbo].[explain_detail]  WITH CHECK ADD  CONSTRAINT [FKk2qs02x6uhqmc16oykpefg6uc] FOREIGN KEY([question_cauhoibaithithuid])
REFERENCES [dbo].[question] ([cauhoibaithithuid])
GO
ALTER TABLE [dbo].[explain_detail] CHECK CONSTRAINT [FKk2qs02x6uhqmc16oykpefg6uc]
GO
ALTER TABLE [dbo].[group_member]  WITH CHECK ADD  CONSTRAINT [FKbcd9seo210qit35bpdg393lpb] FOREIGN KEY([id_user])
REFERENCES [dbo].[account] ([id])
GO
ALTER TABLE [dbo].[group_member] CHECK CONSTRAINT [FKbcd9seo210qit35bpdg393lpb]
GO
ALTER TABLE [dbo].[group_member]  WITH CHECK ADD  CONSTRAINT [FKfjxwf05t41p2kksg39uqbmv27] FOREIGN KEY([id_group])
REFERENCES [dbo].[group_team] ([id_group])
GO
ALTER TABLE [dbo].[group_member] CHECK CONSTRAINT [FKfjxwf05t41p2kksg39uqbmv27]
GO
ALTER TABLE [dbo].[group_team]  WITH CHECK ADD  CONSTRAINT [FKel2cp7ti6s127lras4eq4wpgm] FOREIGN KEY([id_admin])
REFERENCES [dbo].[account] ([id])
GO
ALTER TABLE [dbo].[group_team] CHECK CONSTRAINT [FKel2cp7ti6s127lras4eq4wpgm]
GO
ALTER TABLE [dbo].[notification]  WITH CHECK ADD  CONSTRAINT [FK96r0i20wp2hmej07vg57dnk1i] FOREIGN KEY([user_id])
REFERENCES [dbo].[account] ([id])
GO
ALTER TABLE [dbo].[notification] CHECK CONSTRAINT [FK96r0i20wp2hmej07vg57dnk1i]
GO
ALTER TABLE [dbo].[post]  WITH CHECK ADD  CONSTRAINT [FK4f62kobdc0890vctu2jq5tcvq] FOREIGN KEY([user_id])
REFERENCES [dbo].[account] ([id])
GO
ALTER TABLE [dbo].[post] CHECK CONSTRAINT [FK4f62kobdc0890vctu2jq5tcvq]
GO
ALTER TABLE [dbo].[post]  WITH CHECK ADD  CONSTRAINT [FKiy1xd0krkn5e512y5o8cnnqew] FOREIGN KEY([group_id_group])
REFERENCES [dbo].[group_team] ([id_group])
GO
ALTER TABLE [dbo].[post] CHECK CONSTRAINT [FKiy1xd0krkn5e512y5o8cnnqew]
GO
ALTER TABLE [dbo].[question]  WITH CHECK ADD  CONSTRAINT [FK56d37svlma8df66w2p2hgpvu9] FOREIGN KEY([id_set])
REFERENCES [dbo].[set_question] ([id_set])
GO
ALTER TABLE [dbo].[question] CHECK CONSTRAINT [FK56d37svlma8df66w2p2hgpvu9]
GO
ALTER TABLE [dbo].[question]  WITH CHECK ADD  CONSTRAINT [FKibxycke3f399ujf6msljwp6mm] FOREIGN KEY([id_part])
REFERENCES [dbo].[part] ([id_part])
GO
ALTER TABLE [dbo].[question] CHECK CONSTRAINT [FKibxycke3f399ujf6msljwp6mm]
GO
ALTER TABLE [dbo].[question]  WITH CHECK ADD  CONSTRAINT [FKiq9iqirxj1kwehawmsc8qfrb9] FOREIGN KEY([baithithuid])
REFERENCES [dbo].[exam] ([id_exam])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[question] CHECK CONSTRAINT [FKiq9iqirxj1kwehawmsc8qfrb9]
GO
ALTER TABLE [dbo].[rating]  WITH CHECK ADD  CONSTRAINT [FKc66vglc70y4i068emp1x37vmf] FOREIGN KEY([exam_id_exam])
REFERENCES [dbo].[exam] ([id_exam])
GO
ALTER TABLE [dbo].[rating] CHECK CONSTRAINT [FKc66vglc70y4i068emp1x37vmf]
GO
ALTER TABLE [dbo].[rating]  WITH CHECK ADD  CONSTRAINT [FKk33n3yn6p3m8labjr1de7y0gv] FOREIGN KEY([nguoi_dung_id])
REFERENCES [dbo].[account] ([id])
GO
ALTER TABLE [dbo].[rating] CHECK CONSTRAINT [FKk33n3yn6p3m8labjr1de7y0gv]
GO
ALTER TABLE [dbo].[set_question]  WITH CHECK ADD  CONSTRAINT [FK6whe6k1131mqmepmcc14cdca7] FOREIGN KEY([part_toeic_id_part])
REFERENCES [dbo].[part] ([id_part])
GO
ALTER TABLE [dbo].[set_question] CHECK CONSTRAINT [FK6whe6k1131mqmepmcc14cdca7]
GO
ALTER TABLE [dbo].[set_question]  WITH CHECK ADD  CONSTRAINT [FKi8yq49e8h0wvgr7j7wxp53hg8] FOREIGN KEY([exam_id_exam])
REFERENCES [dbo].[exam] ([id_exam])
GO
ALTER TABLE [dbo].[set_question] CHECK CONSTRAINT [FKi8yq49e8h0wvgr7j7wxp53hg8]
GO
ALTER TABLE [dbo].[set_question_list_question]  WITH CHECK ADD  CONSTRAINT [FKnw5l6v1lcllmudxjmxl1vruoe] FOREIGN KEY([list_question_cauhoibaithithuid])
REFERENCES [dbo].[question] ([cauhoibaithithuid])
GO
ALTER TABLE [dbo].[set_question_list_question] CHECK CONSTRAINT [FKnw5l6v1lcllmudxjmxl1vruoe]
GO
ALTER TABLE [dbo].[set_question_list_question]  WITH CHECK ADD  CONSTRAINT [FKqev9o2c35v9h32k5o7ffla91w] FOREIGN KEY([set_question_id_set])
REFERENCES [dbo].[set_question] ([id_set])
GO
ALTER TABLE [dbo].[set_question_list_question] CHECK CONSTRAINT [FKqev9o2c35v9h32k5o7ffla91w]
GO
ALTER TABLE [dbo].[teacher_remark]  WITH CHECK ADD  CONSTRAINT [FKf4m21wlf60sa47lv2h4jgc6ep] FOREIGN KEY([admin_remark_id])
REFERENCES [dbo].[account] ([id])
GO
ALTER TABLE [dbo].[teacher_remark] CHECK CONSTRAINT [FKf4m21wlf60sa47lv2h4jgc6ep]
GO
ALTER TABLE [dbo].[teacher_remark]  WITH CHECK ADD  CONSTRAINT [FKgmnq23uvuuj87ni96de2uyhxt] FOREIGN KEY([user_id])
REFERENCES [dbo].[account] ([id])
GO
ALTER TABLE [dbo].[teacher_remark] CHECK CONSTRAINT [FKgmnq23uvuuj87ni96de2uyhxt]
GO
ALTER TABLE [dbo].[test_result]  WITH CHECK ADD  CONSTRAINT [FK42aamljp6byjk0t670d23p22j] FOREIGN KEY([baithithuid])
REFERENCES [dbo].[exam] ([id_exam])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[test_result] CHECK CONSTRAINT [FK42aamljp6byjk0t670d23p22j]
GO
ALTER TABLE [dbo].[test_result]  WITH CHECK ADD  CONSTRAINT [FK72nfcqsxiy3pyh9xirvipg61a] FOREIGN KEY([nguoidungid])
REFERENCES [dbo].[account] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[test_result] CHECK CONSTRAINT [FK72nfcqsxiy3pyh9xirvipg61a]
GO
USE [master]
GO
ALTER DATABASE [ToeicSystem] SET  READ_WRITE 
GO
