USE [master]
GO
/****** Object:  Database [ToeicSystem]    Script Date: 12/21/2021 12:35:56 PM ******/
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
/****** Object:  Table [dbo].[account]    Script Date: 12/21/2021 12:35:57 PM ******/
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
/****** Object:  Table [dbo].[exam]    Script Date: 12/21/2021 12:35:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[exam](
	[id_exam] [int] IDENTITY(1,1) NOT NULL,
	[thumbnail] [varchar](255) NULL,
	[count_test] [int] NOT NULL,
	[date_add] [date] NULL,
	[description] [varchar](255) NULL,
	[level] [varchar](255) NULL,
	[title] [varchar](255) NULL,
	[update_by] [varchar](255) NULL,
	[update_date] [date] NULL,
	[user_add_id] [int] NULL,
	[count_rate] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_exam] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[explain_detail]    Script Date: 12/21/2021 12:35:57 PM ******/
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
/****** Object:  Table [dbo].[group_member]    Script Date: 12/21/2021 12:35:57 PM ******/
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
/****** Object:  Table [dbo].[group_team]    Script Date: 12/21/2021 12:35:57 PM ******/
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
/****** Object:  Table [dbo].[notification]    Script Date: 12/21/2021 12:35:57 PM ******/
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
/****** Object:  Table [dbo].[part]    Script Date: 12/21/2021 12:35:57 PM ******/
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
/****** Object:  Table [dbo].[post]    Script Date: 12/21/2021 12:35:57 PM ******/
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
/****** Object:  Table [dbo].[question]    Script Date: 12/21/2021 12:35:57 PM ******/
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
/****** Object:  Table [dbo].[rating]    Script Date: 12/21/2021 12:35:57 PM ******/
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
/****** Object:  Table [dbo].[role]    Script Date: 12/21/2021 12:35:57 PM ******/
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
/****** Object:  Table [dbo].[set_question]    Script Date: 12/21/2021 12:35:57 PM ******/
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
/****** Object:  Table [dbo].[slidebanner]    Script Date: 12/21/2021 12:35:57 PM ******/
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
/****** Object:  Table [dbo].[teacher_remark]    Script Date: 12/21/2021 12:35:57 PM ******/
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
/****** Object:  Table [dbo].[test_result]    Script Date: 12/21/2021 12:35:57 PM ******/
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

INSERT [dbo].[account] ([dtype], [id], [dia_chi], [email], [gender], [ho_ten], [is_delete], [password], [so_dien_thoai], [username], [join_date], [add_date], [company], [school], [role_id]) VALUES (N'Admin', 1, NULL, N'admin@gmail.com', 0, N'Tu?n Minh', 0, N'$2a$10$RF.fBEwxYgFYXNbnNMZJDea9jwntt0B14PDCZ6r.knTufQUJanYlS', N'123456789', N'tuanminh96', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[account] ([dtype], [id], [dia_chi], [email], [gender], [ho_ten], [is_delete], [password], [so_dien_thoai], [username], [join_date], [add_date], [company], [school], [role_id]) VALUES (N'User', 2, NULL, N'member@gmail.com', 0, N'Phan Minh Tuan', 0, N'$2a$10$eWdqZlPWSSHJLscyLF9oOOHsXtW1gHZUHdTeVhSzuVLs161ROdHVi', N'123456789', N'tuanminh2k', NULL, NULL, NULL, NULL, 2)
INSERT [dbo].[account] ([dtype], [id], [dia_chi], [email], [gender], [ho_ten], [is_delete], [password], [so_dien_thoai], [username], [join_date], [add_date], [company], [school], [role_id]) VALUES (N'User', 3, N'htgddg', N'tuan@gmail.com', 0, N'Phan Minh Tuan', 0, N'$2a$10$eWdqZlPWSSHJLscyLF9oOOHsXtW1gHZUHdTeVhSzuVLs161ROdHVi', N'0485454', N'tuanmino96', NULL, NULL, NULL, NULL, 3)
INSERT [dbo].[account] ([dtype], [id], [dia_chi], [email], [gender], [ho_ten], [is_delete], [password], [so_dien_thoai], [username], [join_date], [add_date], [company], [school], [role_id]) VALUES (N'User', 4, N'Ha nOI', N'tuanpm@sis.com', 0, N'Phan Minh Tuan', 0, N'$2a$10$RF.fBEwxYgFYXNbnNMZJDea9jwntt0B14PDCZ6r.knTufQUJanYlS', N'1243645645', NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[account] ([dtype], [id], [dia_chi], [email], [gender], [ho_ten], [is_delete], [password], [so_dien_thoai], [username], [join_date], [add_date], [company], [school], [role_id]) VALUES (N'User', 5, N'Thanh Hoa', N'Thangdz@gmail.com', 0, N'Le Van Thang', 0, N'$2a$10$V2EuUk//pnzeCAo/Hp1NZOpOm6y.YpPG7/7T.IR1HKnYTZqSZy5iu', N'0325411202', NULL, NULL, NULL, NULL, NULL, 2)
SET IDENTITY_INSERT [dbo].[account] OFF
SET IDENTITY_INSERT [dbo].[exam] ON 

INSERT [dbo].[exam] ([id_exam], [thumbnail], [count_test], [date_add], [description], [level], [title], [update_by], [update_date], [user_add_id], [count_rate]) VALUES (1, N'mini-test.png', 136097, CAST(N'2021-12-13' AS Date), NULL, N'1', N'Bai thi thu 1', NULL, NULL, 1, 5)
INSERT [dbo].[exam] ([id_exam], [thumbnail], [count_test], [date_add], [description], [level], [title], [update_by], [update_date], [user_add_id], [count_rate]) VALUES (2, N'mini-test.png', 1232, CAST(N'2021-12-14' AS Date), NULL, N'2', N'Bai thi thu 2', NULL, NULL, 1, 4)
INSERT [dbo].[exam] ([id_exam], [thumbnail], [count_test], [date_add], [description], [level], [title], [update_by], [update_date], [user_add_id], [count_rate]) VALUES (3, N'mini-test.png', 6, CAST(N'2021-12-15' AS Date), NULL, N'3', N'Bai thi thu 3', NULL, NULL, 1, 5)
INSERT [dbo].[exam] ([id_exam], [thumbnail], [count_test], [date_add], [description], [level], [title], [update_by], [update_date], [user_add_id], [count_rate]) VALUES (4, N'mini-test.png', 0, CAST(N'2021-12-16' AS Date), NULL, N'1', N'Bai thi thu 4', NULL, NULL, 1, 3)
INSERT [dbo].[exam] ([id_exam], [thumbnail], [count_test], [date_add], [description], [level], [title], [update_by], [update_date], [user_add_id], [count_rate]) VALUES (5, N'mini-test.png', 1453546, CAST(N'2021-12-17' AS Date), NULL, N'2', N'Bai thi thu 5', NULL, NULL, 1, 2)
INSERT [dbo].[exam] ([id_exam], [thumbnail], [count_test], [date_add], [description], [level], [title], [update_by], [update_date], [user_add_id], [count_rate]) VALUES (6, N'num2.jpg', 454, CAST(N'2021-12-18' AS Date), NULL, NULL, N'Bai thi thu 6', NULL, NULL, 1, 1)
SET IDENTITY_INSERT [dbo].[exam] OFF
SET IDENTITY_INSERT [dbo].[explain_detail] ON 

INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (1, N'Gia thich chi tiet 1', NULL, NULL, 131)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (2, N'Gia thich chi tiet 2', NULL, NULL, 132)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (3, N'Gia thich chi tiet 3', NULL, NULL, 133)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (4, N'Gia thich chi tiet 4', NULL, NULL, 134)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (5, N'Gia thich chi tiet 5', NULL, NULL, 135)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (6, N'Gia thich chi tiet 6', NULL, NULL, 159)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (7, N'Gia thich chi tiet 7', NULL, NULL, 160)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (8, N'Gia thich chi tiet 8', NULL, NULL, 136)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (9, N'Gia thich chi tiet 9', NULL, NULL, 137)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (10, N'Gia thich chi tiet 10', NULL, NULL, 138)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (11, N'Gia thich chi tiet 11', NULL, NULL, 161)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (12, N'Gia thich chi tiet 12', NULL, NULL, 162)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (13, N'Gia thich chi tiet 13', NULL, NULL, 163)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (14, N'Gia thich chi tiet 14', NULL, NULL, 139)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (15, N'Gia thich chi tiet 15', NULL, NULL, 140)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (16, N'Gia thich chi tiet 16', NULL, NULL, 141)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (17, N'Gia thich chi tiet 17', NULL, NULL, 164)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (18, N'Gia thich chi tiet 18', NULL, NULL, 165)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (19, N'Gia thich chi tiet 19', NULL, NULL, 166)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (20, N'Gia thich chi tiet 20', NULL, NULL, 142)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (21, N'Gia thich chi tiet 21', NULL, NULL, 143)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (22, N'Gia thich chi tiet 22', NULL, NULL, 144)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (23, N'Gia thich chi tiet 23', NULL, NULL, 157)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (24, N'Gia thich chi tiet 24', NULL, NULL, 158)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (25, N'Gia thich chi tiet 25', NULL, NULL, 145)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (26, N'Gia thich chi tiet 26', NULL, NULL, 146)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (27, N'Gia thich chi tiet 27', NULL, NULL, 147)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (28, N'Gia thich chi tiet 28', NULL, NULL, 148)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (29, N'Gia thich chi tiet 29', NULL, NULL, 149)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (30, N'Gia thich chi tiet 30', NULL, NULL, 150)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (31, N'Gia thich chi tiet 31', NULL, NULL, 151)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (32, N'Gia thich chi tiet 32', NULL, NULL, 152)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (33, N'Gia thich chi tiet 33', NULL, NULL, 153)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (34, N'Gia thich chi tiet 34', NULL, NULL, 154)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (35, N'Gia thich chi tiet 35', NULL, NULL, 155)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (36, N'Gia thich chi tiet 36', NULL, NULL, 156)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (37, N'Gia thich chi tiet 37', NULL, NULL, 130)
SET IDENTITY_INSERT [dbo].[explain_detail] OFF
SET IDENTITY_INSERT [dbo].[group_member] ON 

INSERT [dbo].[group_member] ([id_group_mem], [add_date], [id_group], [is_disabled], [update_by], [update_date], [id_user]) VALUES (3, NULL, 2, 0, NULL, NULL, 3)
SET IDENTITY_INSERT [dbo].[group_member] OFF
SET IDENTITY_INSERT [dbo].[group_team] ON 

INSERT [dbo].[group_team] ([id_group], [create_date], [description], [image], [max_mem], [name], [total_mem], [update_by], [update_date], [id_admin]) VALUES (1, CAST(N'2021-12-13T13:45:10.4700000' AS DateTime2), N'chào mn', NULL, 90, N'Nhóm ôn luy?n c?a Tu?n Minh', 0, NULL, NULL, 1)
INSERT [dbo].[group_team] ([id_group], [create_date], [description], [image], [max_mem], [name], [total_mem], [update_by], [update_date], [id_admin]) VALUES (2, CAST(N'2021-12-13T20:47:22.8540000' AS DateTime2), N'Hello', NULL, 13, N'Test nhom', 0, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[group_team] OFF
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

INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (1, N'num1', N'D', N'num1', 1, N'The man is finishing his meal', N'The customer is waiting for a table', N'The waiter is setting the table', N'The woman is looking at the menu', N'Look at the picture and listen to the sentences. Choose the sentence that best describes the picture:', N'', NULL, NULL, 1, 1, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (2, N'num2', N'A', N'num2', 2, N'He’s handling a tool', N'He’s cutting grass', N'He’s building a bookshelf', N'He’s walking up to the roof', N'', N'', NULL, NULL, 1, 1, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (3, N'num4', N'B', N'', 3, N'I came in early today', N'Because I had a question', N'By two o’clock at the earliest', NULL, N'Listen to the question and the three responses. Choose the response that best answers the question:', N'Why did you come by yesterday?', NULL, NULL, 1, 2, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (4, N'num5', N'C', N'', 4, N'Yes, I can lend it to you', N'The handle is in the front', N'Yes, that would be nice, thanks', NULL, N'', N'Would you like a hand with your luggage?', NULL, NULL, 1, 2, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (5, N'num6', N'B', N'', 5, N'No, it’s in Los Angeles', N'Yes, he is the boss there', N'He’s on a business trip', NULL, N'', N'Mr. Robertson runs our San Francisco office, doesn’t he?', NULL, NULL, 1, 2, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (6, N'num15-16-17', N'C', N'', 6, N'100.0', N'200.0', N'300.0', N'400.0', N'Listen to the dialogue. Then read each question and choose the best answer:', N' How many pens does the man need?', NULL, NULL, 1, 3, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (7, N'num15-16-17', N'D', N'', 7, N'To write a book', N'For the office employees', N'To make a large drawing', N'To give away at a conference', N'', N'Why does he need the pens?', NULL, NULL, 1, 3, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (8, N'num15-16-17', N'C', N'', 8, N'20.0', N'40.0', N'120.0', N'140.0', N'', N'How much will he pay for the pens?', NULL, NULL, 1, 3, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (9, N'num36-37-38', N'B', N'', 9, N'One day', N'One weekend', N'One week', N'One month', N'Listen to the talk. Then read each question and choose the best answer:', N'According to the speaker, how long will the special offer last?', NULL, NULL, 1, 4, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (10, N'num36-37-38', N'B', N'', 10, N'100.0', N'200.0', N'300.0', N'400.0', N'', N'How much is the special offer?', NULL, NULL, 1, 4, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (11, N'num36-37-38', N'D', N'', 11, N'People who want to travel overseas', N'Members who belong to the fitness club', N'Staff who work for the Travel Lodge Inn', N'Those who want to get away for the weekend', N'', N'Who would be most interested in this advertisement?', NULL, NULL, 1, 4, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (12, N'', N'B', N'', 12, N'nearly', N'immediately', N'precisely', N'significantly', N'Choose the word that best completes the sentence:', N'Employees who have not yet registered on the new company website must do so ------', NULL, NULL, 1, 5, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (13, N'', N'C', N'', 13, N'professional', N'profession', N'professionals', N'professionally', N'', N'Rosewater Medical Center employs healthcare -------- affiliated with Huron University.', NULL, NULL, 1, 5, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (14, N'', N'A', N'', 14, N'indicates', N'commands', N'notices ', N'distributes', N'', N'Once you have detected a fatal virus on your computer, common sense -------- that you should have your hard drive reformatted by skilled professionals.', NULL, NULL, 1, 5, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (15, N'', N'B', N'', 15, N'just ', N'once', N'such', N'likely', N'A long time ago, this part of the town used to be a place where people came to relax and get away from their stress. Although this was a shelter for people to escape, it has nowA long time ago, this part of the town used to be a place where people came to relax and get away from their stress. Although this was (65)........ a shelter for people to escape, it has now

Up until a few years ago, it wasn''t as bad as it is now. Although it is true that some people in the neighborhood supported the expansion of the market a few years ago, now most of them (66)........

that it has gotten out of control and created many serious problems for the area (67)........, it might have already gotten too far out of control. What we really need right now is not a

mere intervention by civilians but strong action from the mayor''s office.', N'Choose the word or phrase that best completes the blanks:', NULL, NULL, 1, 6, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (16, N'', N'B', N'', 16, N'would have agreed', N'would agree', N'has agree', N' were agreeing', N'', N'', NULL, NULL, 1, 6, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (17, N'', N'A', N'', 17, N'In fact', N'In spite of', N'On the other hand', N'Even though', N'', N'', NULL, NULL, 1, 6, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (18, N'', N'D', N'', 18, N'A meeting agenda', N'A printing schedule', N'A contract document ', N'Photographs of furniture', N'Passage 1:

To: Ken Perez <kperez@megasupply.com>
From: Emma Appleby <eappleby@megasupply.com>
Date: July 2
Subject: Fall Catalog Review
 
Hi Ken,
Please find attached sample pages from the fall catalog which will be released at the end of August. Please review them and give me your comments. Mr. Benson and I agreed that the pages with dining room furniture should be redone because the colors are not right. Let me know what you think.

We don’t have much time because we have to complete the catalog, send it for printing by July 30, and release it by the end of August. So please send me your comments as soon as possible. After I incorporate all the comments, I will obtain the management’s approval on the revised document and send it to ABC Printing.

Emma
 *************
Passage 2:

To: Emma Appleby <eappleby@megasupply.com>
From: Ken Perez <kperez@megasupply.com>
Date: July 3
Subject: RE: Fall Catalog review
 
Emma,

My e-mail system was down yesterday, and I did not have access to my messages until this morning. That’s why I was not able to address your concerns earlier.

Now I can open your e-mail, but for some reason I cannot open the attachments. I can’t figure out what is wrong.

Could you send me the attachment again? I have a marketing this afternoon at three, but will have some time to go over the pictures before that. I’ll try to send you my comments by the close of business today.

Ken', N' What is the attachment referred to by Mr. Perez?', NULL, NULL, 1, 7, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (19, N'', N'A', N'', 19, N'worries', N'suggestions', N'requests', N'involvements', N'', N'In the second e-mail, the word “concerns” in paragraph 1, line 2 is closest in meaning to', NULL, NULL, 1, 7, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (20, N'', N'C', N'', 20, N'To invite her to a meeting', N'To give his comments on the catalog', N'To request her to resend the document', N'To ask about the printing deadline', N'', N'Why did Mr. Perez send Ms. Appleby an e-mail?', NULL, NULL, 1, 7, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (21, N'', N'C', N'', 21, N'1.July', N'20.July', N'30.July', N'30.August', N'', N' By when should the document be sent to ABC Printing?', NULL, NULL, 1, 7, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (22, N'', N'B', N'', 22, N'To send her a notice regarding a marketing meeting', N'To review sample pages of a catalog', N'To put her photo in the new catalog', N'To fix her computer', N'', N' What did Ms. Appleby request Mr. Perez to do?', NULL, NULL, 1, 7, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (23, N'', N'D', N'', 23, N'It will soon provide train service to Everett', N'It provides free parking for monthly pass holders.', N'It provides free schedules for the ferry service.', N'Its business centers is only minutes from the ferry terminal', N'Exciting and Relaxing Waterborne Travel Option
Blue Bridge Ferries – Relax and enjoy the scenery!
 
Forget about annoying and crowded traffic! Take a ferry ride across the Bay of Fundy in comfort, style, and with time to spare! Our high-speed Blue Bridge ferries provide a quick and convenient ride between Everett and Fundy Bay City, offering a great host of amenities including reserved seating, fax machine, and television. Friendly captains and crew will make your ride more enjoyable. With hourly departures, our ferries will take you to Fundy Bay terminal, only five minutes from the Fundy Bay City business district, in just 45 minutes. Monthly passes are available at $100. Parking is available in an adjacent parking lot with affordable rates ($5.00 per day, $3.00 on weekends, $75.00 for a monthly pass). It is a great way to start and finish your day! For more information on fares and ferry schedules, visit our website at www.bbferries.com, or call us at (555) 512-3342.', N'What seems to be true about Fundy Bay City?', NULL, NULL, 1, 7, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (24, N'', N'B', N'', 24, N'Ferry employees', N'Commuters to Fundy Bay City', N'Travel agents ', N'Blue Bridge shareholders', N'', N'Who are the intended readers of this advertisement?', NULL, NULL, 1, 7, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (25, N'', N'D', N'', 25, N'A room charge', N'A telephone fee ', N'A room service charge', N'A dinner at the hotel restaurant', N'Guest Name: Helen County
Reservation number: AX 1402652
Room: 333
Arrival: December 3    13:23
Departure: December 9
 

 

Date Description Charge
Dec 3~9 Room Charge 840.00
Dec 3 Room Service 14.00
Dec 4 1900 Bar 20.00
Dec 6 Telephone call 10.00
Dec 7 Dinner: 1900 Bar & Grill 32.00*
Dec 7 Dry cleaning 5.00
Dec 8 Room Service 18.00
Dec 9 Shuttle Service 15.00
                                                                                                Total: $954.00
* 10% discount applied
Guest signature: Helen County
Hotel manager: Jeff Benson', N' To which item was the discount applied?', NULL, NULL, 1, 7, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (26, N'', N'D', N'', 26, N'3.Dec', N'5.Dec', N'7.Dec', N'9.Dec', N'', N'When was Ms. County’s check-out date?', NULL, NULL, 1, 7, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (27, N'num1', N'D', N'num1', 1, N'The man is finishing his meal', N'The customer is waiting for a table', N'The waiter is setting the table', N'The woman is looking at the menu', N'Look at the picture and listen to the sentences. Choose the sentence that best describes the picture:', N'', NULL, NULL, 2, 1, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (28, N'num2', N'A', N'num2', 2, N'He’s handling a tool', N'He’s cutting grass', N'He’s building a bookshelf', N'He’s walking up to the roof', N'', N'', NULL, NULL, 2, 1, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (29, N'num4', N'B', N'', 3, N'I came in early today', N'Because I had a question', N'By two o’clock at the earliest', NULL, N'Listen to the question and the three responses. Choose the response that best answers the question:', N'Why did you come by yesterday?', NULL, NULL, 2, 2, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (30, N'num5', N'C', N'', 4, N'Yes, I can lend it to you', N'The handle is in the front', N'Yes, that would be nice, thanks', NULL, N'', N'Would you like a hand with your luggage?', NULL, NULL, 2, 2, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (31, N'num6', N'B', N'', 5, N'No, it’s in Los Angeles', N'Yes, he is the boss there', N'He’s on a business trip', NULL, N'', N'Mr. Robertson runs our San Francisco office, doesn’t he?', NULL, NULL, 2, 2, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (32, N'num15-16-17', N'C', N'', 6, N'100.0', N'200.0', N'300.0', N'400.0', N'Listen to the dialogue. Then read each question and choose the best answer:', N' How many pens does the man need?', NULL, NULL, 2, 3, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (33, N'num15-16-17', N'D', N'', 7, N'To write a book', N'For the office employees', N'To make a large drawing', N'To give away at a conference', N'', N'Why does he need the pens?', NULL, NULL, 2, 3, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (34, N'num15-16-17', N'C', N'', 8, N'20.0', N'40.0', N'120.0', N'140.0', N'', N'How much will he pay for the pens?', NULL, NULL, 2, 3, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (35, N'num36-37-38', N'B', N'', 9, N'One day', N'One weekend', N'One week', N'One month', N'Listen to the talk. Then read each question and choose the best answer:', N'According to the speaker, how long will the special offer last?', NULL, NULL, 2, 4, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (36, N'num36-37-38', N'B', N'', 10, N'100.0', N'200.0', N'300.0', N'400.0', N'', N'How much is the special offer?', NULL, NULL, 2, 4, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (37, N'num36-37-38', N'D', N'', 11, N'People who want to travel overseas', N'Members who belong to the fitness club', N'Staff who work for the Travel Lodge Inn', N'Those who want to get away for the weekend', N'', N'Who would be most interested in this advertisement?', NULL, NULL, 2, 4, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (38, N'', N'B', N'', 12, N'nearly', N'immediately', N'precisely', N'significantly', N'Choose the word that best completes the sentence:', N'Employees who have not yet registered on the new company website must do so ------', NULL, NULL, 2, 5, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (39, N'', N'C', N'', 13, N'professional', N'profession', N'professionals', N'professionally', N'', N'Rosewater Medical Center employs healthcare -------- affiliated with Huron University.', NULL, NULL, 2, 5, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (40, N'', N'A', N'', 14, N'indicates', N'commands', N'notices ', N'distributes', N'', N'Once you have detected a fatal virus on your computer, common sense -------- that you should have your hard drive reformatted by skilled professionals.', NULL, NULL, 2, 5, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (41, N'', N'B', N'', 15, N'just ', N'once', N'such', N'likely', N'A long time ago, this part of the town used to be a place where people came to relax and get away from their stress. Although this was a shelter for people to escape, it has nowA long time ago, this part of the town used to be a place where people came to relax and get away from their stress. Although this was (65)........ a shelter for people to escape, it has now

Up until a few years ago, it wasn''t as bad as it is now. Although it is true that some people in the neighborhood supported the expansion of the market a few years ago, now most of them (66)........

that it has gotten out of control and created many serious problems for the area (67)........, it might have already gotten too far out of control. What we really need right now is not a

mere intervention by civilians but strong action from the mayor''s office.', N'Choose the word or phrase that best completes the blanks:', NULL, NULL, 2, 6, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (42, N'', N'B', N'', 16, N'would have agreed', N'would agree', N'has agree', N' were agreeing', N'', N'', NULL, NULL, 2, 6, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (43, N'', N'A', N'', 17, N'In fact', N'In spite of', N'On the other hand', N'Even though', N'', N'', NULL, NULL, 2, 6, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (44, N'', N'D', N'', 18, N'A meeting agenda', N'A printing schedule', N'A contract document ', N'Photographs of furniture', N'Passage 1:

To: Ken Perez <kperez@megasupply.com>
From: Emma Appleby <eappleby@megasupply.com>
Date: July 2
Subject: Fall Catalog Review
 
Hi Ken,
Please find attached sample pages from the fall catalog which will be released at the end of August. Please review them and give me your comments. Mr. Benson and I agreed that the pages with dining room furniture should be redone because the colors are not right. Let me know what you think.

We don’t have much time because we have to complete the catalog, send it for printing by July 30, and release it by the end of August. So please send me your comments as soon as possible. After I incorporate all the comments, I will obtain the management’s approval on the revised document and send it to ABC Printing.

Emma
 *************
Passage 2:

To: Emma Appleby <eappleby@megasupply.com>
From: Ken Perez <kperez@megasupply.com>
Date: July 3
Subject: RE: Fall Catalog review
 
Emma,

My e-mail system was down yesterday, and I did not have access to my messages until this morning. That’s why I was not able to address your concerns earlier.

Now I can open your e-mail, but for some reason I cannot open the attachments. I can’t figure out what is wrong.

Could you send me the attachment again? I have a marketing this afternoon at three, but will have some time to go over the pictures before that. I’ll try to send you my comments by the close of business today.

Ken', N' What is the attachment referred to by Mr. Perez?', NULL, NULL, 2, 7, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (45, N'', N'A', N'', 19, N'worries', N'suggestions', N'requests', N'involvements', N'', N'In the second e-mail, the word “concerns” in paragraph 1, line 2 is closest in meaning to', NULL, NULL, 2, 7, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (46, N'', N'C', N'', 20, N'To invite her to a meeting', N'To give his comments on the catalog', N'To request her to resend the document', N'To ask about the printing deadline', N'', N'Why did Mr. Perez send Ms. Appleby an e-mail?', NULL, NULL, 2, 7, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (47, N'', N'C', N'', 21, N'1.July', N'20.July', N'30.July', N'30.August', N'', N' By when should the document be sent to ABC Printing?', NULL, NULL, 2, 7, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (48, N'', N'B', N'', 22, N'To send her a notice regarding a marketing meeting', N'To review sample pages of a catalog', N'To put her photo in the new catalog', N'To fix her computer', N'', N' What did Ms. Appleby request Mr. Perez to do?', NULL, NULL, 2, 7, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (49, N'', N'D', N'', 23, N'It will soon provide train service to Everett', N'It provides free parking for monthly pass holders.', N'It provides free schedules for the ferry service.', N'Its business centers is only minutes from the ferry terminal', N'Exciting and Relaxing Waterborne Travel Option
Blue Bridge Ferries – Relax and enjoy the scenery!
 
Forget about annoying and crowded traffic! Take a ferry ride across the Bay of Fundy in comfort, style, and with time to spare! Our high-speed Blue Bridge ferries provide a quick and convenient ride between Everett and Fundy Bay City, offering a great host of amenities including reserved seating, fax machine, and television. Friendly captains and crew will make your ride more enjoyable. With hourly departures, our ferries will take you to Fundy Bay terminal, only five minutes from the Fundy Bay City business district, in just 45 minutes. Monthly passes are available at $100. Parking is available in an adjacent parking lot with affordable rates ($5.00 per day, $3.00 on weekends, $75.00 for a monthly pass). It is a great way to start and finish your day! For more information on fares and ferry schedules, visit our website at www.bbferries.com, or call us at (555) 512-3342.', N'What seems to be true about Fundy Bay City?', NULL, NULL, 2, 7, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (50, N'', N'B', N'', 24, N'Ferry employees', N'Commuters to Fundy Bay City', N'Travel agents ', N'Blue Bridge shareholders', N'', N'Who are the intended readers of this advertisement?', NULL, NULL, 2, 7, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (51, N'', N'D', N'', 25, N'A room charge', N'A telephone fee ', N'A room service charge', N'A dinner at the hotel restaurant', N'Guest Name: Helen County
Reservation number: AX 1402652
Room: 333
Arrival: December 3    13:23
Departure: December 9
 

 

Date Description Charge
Dec 3~9 Room Charge 840.00
Dec 3 Room Service 14.00
Dec 4 1900 Bar 20.00
Dec 6 Telephone call 10.00
Dec 7 Dinner: 1900 Bar & Grill 32.00*
Dec 7 Dry cleaning 5.00
Dec 8 Room Service 18.00
Dec 9 Shuttle Service 15.00
                                                                                                Total: $954.00
* 10% discount applied
Guest signature: Helen County
Hotel manager: Jeff Benson', N' To which item was the discount applied?', NULL, NULL, 2, 7, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (52, N'', N'D', N'', 26, N'3.Dec', N'5.Dec', N'7.Dec', N'9.Dec', N'', N'When was Ms. County’s check-out date?', NULL, NULL, 2, 7, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (53, N'num1', N'D', N'num1', 1, N'The man is finishing his meal', N'The customer is waiting for a table', N'The waiter is setting the table', N'The woman is looking at the menu', N'Look at the picture and listen to the sentences. Choose the sentence that best describes the picture:', N'', NULL, NULL, 3, 1, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (54, N'num2', N'A', N'num2', 2, N'He’s handling a tool', N'He’s cutting grass', N'He’s building a bookshelf', N'He’s walking up to the roof', N'', N'', NULL, NULL, 3, 1, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (55, N'num4', N'B', N'', 3, N'I came in early today', N'Because I had a question', N'By two o’clock at the earliest', NULL, N'Listen to the question and the three responses. Choose the response that best answers the question:', N'Why did you come by yesterday?', NULL, NULL, 3, 2, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (56, N'num5', N'C', N'', 4, N'Yes, I can lend it to you', N'The handle is in the front', N'Yes, that would be nice, thanks', NULL, N'', N'Would you like a hand with your luggage?', NULL, NULL, 3, 2, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (57, N'num6', N'B', N'', 5, N'No, it’s in Los Angeles', N'Yes, he is the boss there', N'He’s on a business trip', NULL, N'', N'Mr. Robertson runs our San Francisco office, doesn’t he?', NULL, NULL, 3, 2, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (58, N'num15-16-17', N'C', N'', 6, N'100.0', N'200.0', N'300.0', N'400.0', N'Listen to the dialogue. Then read each question and choose the best answer:', N' How many pens does the man need?', NULL, NULL, 3, 3, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (59, N'num15-16-17', N'D', N'', 7, N'To write a book', N'For the office employees', N'To make a large drawing', N'To give away at a conference', N'', N'Why does he need the pens?', NULL, NULL, 3, 3, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (60, N'num15-16-17', N'C', N'', 8, N'20.0', N'40.0', N'120.0', N'140.0', N'', N'How much will he pay for the pens?', NULL, NULL, 3, 3, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (61, N'num36-37-38', N'B', N'', 9, N'One day', N'One weekend', N'One week', N'One month', N'Listen to the talk. Then read each question and choose the best answer:', N'According to the speaker, how long will the special offer last?', NULL, NULL, 3, 4, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (62, N'num36-37-38', N'B', N'', 10, N'100.0', N'200.0', N'300.0', N'400.0', N'', N'How much is the special offer?', NULL, NULL, 3, 4, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (63, N'num36-37-38', N'D', N'', 11, N'People who want to travel overseas', N'Members who belong to the fitness club', N'Staff who work for the Travel Lodge Inn', N'Those who want to get away for the weekend', N'', N'Who would be most interested in this advertisement?', NULL, NULL, 3, 4, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (64, N'', N'B', N'', 12, N'nearly', N'immediately', N'precisely', N'significantly', N'Choose the word that best completes the sentence:', N'Employees who have not yet registered on the new company website must do so ------', NULL, NULL, 3, 5, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (65, N'', N'C', N'', 13, N'professional', N'profession', N'professionals', N'professionally', N'', N'Rosewater Medical Center employs healthcare -------- affiliated with Huron University.', NULL, NULL, 3, 5, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (66, N'', N'A', N'', 14, N'indicates', N'commands', N'notices ', N'distributes', N'', N'Once you have detected a fatal virus on your computer, common sense -------- that you should have your hard drive reformatted by skilled professionals.', NULL, NULL, 3, 5, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (67, N'', N'B', N'', 15, N'just ', N'once', N'such', N'likely', N'A long time ago, this part of the town used to be a place where people came to relax and get away from their stress. Although this was a shelter for people to escape, it has nowA long time ago, this part of the town used to be a place where people came to relax and get away from their stress. Although this was (65)........ a shelter for people to escape, it has now

Up until a few years ago, it wasn''t as bad as it is now. Although it is true that some people in the neighborhood supported the expansion of the market a few years ago, now most of them (66)........

that it has gotten out of control and created many serious problems for the area (67)........, it might have already gotten too far out of control. What we really need right now is not a

mere intervention by civilians but strong action from the mayor''s office.', N'Choose the word or phrase that best completes the blanks:', NULL, NULL, 3, 6, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (68, N'', N'B', N'', 16, N'would have agreed', N'would agree', N'has agree', N' were agreeing', N'', N'', NULL, NULL, 3, 6, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (69, N'', N'A', N'', 17, N'In fact', N'In spite of', N'On the other hand', N'Even though', N'', N'', NULL, NULL, 3, 6, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (70, N'', N'D', N'', 18, N'A meeting agenda', N'A printing schedule', N'A contract document ', N'Photographs of furniture', N'Passage 1:

To: Ken Perez <kperez@megasupply.com>
From: Emma Appleby <eappleby@megasupply.com>
Date: July 2
Subject: Fall Catalog Review
 
Hi Ken,
Please find attached sample pages from the fall catalog which will be released at the end of August. Please review them and give me your comments. Mr. Benson and I agreed that the pages with dining room furniture should be redone because the colors are not right. Let me know what you think.

We don’t have much time because we have to complete the catalog, send it for printing by July 30, and release it by the end of August. So please send me your comments as soon as possible. After I incorporate all the comments, I will obtain the management’s approval on the revised document and send it to ABC Printing.

Emma
 *************
Passage 2:

To: Emma Appleby <eappleby@megasupply.com>
From: Ken Perez <kperez@megasupply.com>
Date: July 3
Subject: RE: Fall Catalog review
 
Emma,

My e-mail system was down yesterday, and I did not have access to my messages until this morning. That’s why I was not able to address your concerns earlier.

Now I can open your e-mail, but for some reason I cannot open the attachments. I can’t figure out what is wrong.

Could you send me the attachment again? I have a marketing this afternoon at three, but will have some time to go over the pictures before that. I’ll try to send you my comments by the close of business today.

Ken', N' What is the attachment referred to by Mr. Perez?', NULL, NULL, 3, 7, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (71, N'', N'A', N'', 19, N'worries', N'suggestions', N'requests', N'involvements', N'', N'In the second e-mail, the word “concerns” in paragraph 1, line 2 is closest in meaning to', NULL, NULL, 3, 7, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (72, N'', N'C', N'', 20, N'To invite her to a meeting', N'To give his comments on the catalog', N'To request her to resend the document', N'To ask about the printing deadline', N'', N'Why did Mr. Perez send Ms. Appleby an e-mail?', NULL, NULL, 3, 7, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (73, N'', N'C', N'', 21, N'1.July', N'20.July', N'30.July', N'30.August', N'', N' By when should the document be sent to ABC Printing?', NULL, NULL, 3, 7, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (74, N'', N'B', N'', 22, N'To send her a notice regarding a marketing meeting', N'To review sample pages of a catalog', N'To put her photo in the new catalog', N'To fix her computer', N'', N' What did Ms. Appleby request Mr. Perez to do?', NULL, NULL, 3, 7, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (75, N'', N'D', N'', 23, N'It will soon provide train service to Everett', N'It provides free parking for monthly pass holders.', N'It provides free schedules for the ferry service.', N'Its business centers is only minutes from the ferry terminal', N'Exciting and Relaxing Waterborne Travel Option
Blue Bridge Ferries – Relax and enjoy the scenery!
 
Forget about annoying and crowded traffic! Take a ferry ride across the Bay of Fundy in comfort, style, and with time to spare! Our high-speed Blue Bridge ferries provide a quick and convenient ride between Everett and Fundy Bay City, offering a great host of amenities including reserved seating, fax machine, and television. Friendly captains and crew will make your ride more enjoyable. With hourly departures, our ferries will take you to Fundy Bay terminal, only five minutes from the Fundy Bay City business district, in just 45 minutes. Monthly passes are available at $100. Parking is available in an adjacent parking lot with affordable rates ($5.00 per day, $3.00 on weekends, $75.00 for a monthly pass). It is a great way to start and finish your day! For more information on fares and ferry schedules, visit our website at www.bbferries.com, or call us at (555) 512-3342.', N'What seems to be true about Fundy Bay City?', NULL, NULL, 3, 7, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (76, N'', N'B', N'', 24, N'Ferry employees', N'Commuters to Fundy Bay City', N'Travel agents ', N'Blue Bridge shareholders', N'', N'Who are the intended readers of this advertisement?', NULL, NULL, 3, 7, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (77, N'', N'D', N'', 25, N'A room charge', N'A telephone fee ', N'A room service charge', N'A dinner at the hotel restaurant', N'Guest Name: Helen County
Reservation number: AX 1402652
Room: 333
Arrival: December 3    13:23
Departure: December 9
 

 

Date Description Charge
Dec 3~9 Room Charge 840.00
Dec 3 Room Service 14.00
Dec 4 1900 Bar 20.00
Dec 6 Telephone call 10.00
Dec 7 Dinner: 1900 Bar & Grill 32.00*
Dec 7 Dry cleaning 5.00
Dec 8 Room Service 18.00
Dec 9 Shuttle Service 15.00
                                                                                                Total: $954.00
* 10% discount applied
Guest signature: Helen County
Hotel manager: Jeff Benson', N' To which item was the discount applied?', NULL, NULL, 3, 7, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (78, N'', N'D', N'', 26, N'3.Dec', N'5.Dec', N'7.Dec', N'9.Dec', N'', N'When was Ms. County’s check-out date?', NULL, NULL, 3, 7, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (79, N'num1', N'D', N'num1', 1, N'The man is finishing his meal', N'The customer is waiting for a table', N'The waiter is setting the table', N'The woman is looking at the menu', N'Look at the picture and listen to the sentences. Choose the sentence that best describes the picture:', N'', NULL, NULL, 4, 1, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (80, N'num2', N'A', N'num2', 2, N'He’s handling a tool', N'He’s cutting grass', N'He’s building a bookshelf', N'He’s walking up to the roof', N'', N'', NULL, NULL, 4, 1, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (81, N'num4', N'B', N'', 3, N'I came in early today', N'Because I had a question', N'By two o’clock at the earliest', NULL, N'Listen to the question and the three responses. Choose the response that best answers the question:', N'Why did you come by yesterday?', NULL, NULL, 4, 2, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (82, N'num5', N'C', N'', 4, N'Yes, I can lend it to you', N'The handle is in the front', N'Yes, that would be nice, thanks', NULL, N'', N'Would you like a hand with your luggage?', NULL, NULL, 4, 2, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (83, N'num6', N'B', N'', 5, N'No, it’s in Los Angeles', N'Yes, he is the boss there', N'He’s on a business trip', NULL, N'', N'Mr. Robertson runs our San Francisco office, doesn’t he?', NULL, NULL, 4, 2, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (84, N'num15-16-17', N'C', N'', 6, N'100.0', N'200.0', N'300.0', N'400.0', N'Listen to the dialogue. Then read each question and choose the best answer:', N' How many pens does the man need?', NULL, NULL, 4, 3, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (85, N'num15-16-17', N'D', N'', 7, N'To write a book', N'For the office employees', N'To make a large drawing', N'To give away at a conference', N'', N'Why does he need the pens?', NULL, NULL, 4, 3, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (86, N'num15-16-17', N'C', N'', 8, N'20.0', N'40.0', N'120.0', N'140.0', N'', N'How much will he pay for the pens?', NULL, NULL, 4, 3, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (87, N'num36-37-38', N'B', N'', 9, N'One day', N'One weekend', N'One week', N'One month', N'Listen to the talk. Then read each question and choose the best answer:', N'According to the speaker, how long will the special offer last?', NULL, NULL, 4, 4, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (88, N'num36-37-38', N'B', N'', 10, N'100.0', N'200.0', N'300.0', N'400.0', N'', N'How much is the special offer?', NULL, NULL, 4, 4, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (89, N'num36-37-38', N'D', N'', 11, N'People who want to travel overseas', N'Members who belong to the fitness club', N'Staff who work for the Travel Lodge Inn', N'Those who want to get away for the weekend', N'', N'Who would be most interested in this advertisement?', NULL, NULL, 4, 4, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (90, N'', N'B', N'', 12, N'nearly', N'immediately', N'precisely', N'significantly', N'Choose the word that best completes the sentence:', N'Employees who have not yet registered on the new company website must do so ------', NULL, NULL, 4, 5, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (91, N'', N'C', N'', 13, N'professional', N'profession', N'professionals', N'professionally', N'', N'Rosewater Medical Center employs healthcare -------- affiliated with Huron University.', NULL, NULL, 4, 5, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (92, N'', N'A', N'', 14, N'indicates', N'commands', N'notices ', N'distributes', N'', N'Once you have detected a fatal virus on your computer, common sense -------- that you should have your hard drive reformatted by skilled professionals.', NULL, NULL, 4, 5, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (93, N'', N'B', N'', 15, N'just ', N'once', N'such', N'likely', N'A long time ago, this part of the town used to be a place where people came to relax and get away from their stress. Although this was a shelter for people to escape, it has nowA long time ago, this part of the town used to be a place where people came to relax and get away from their stress. Although this was (65)........ a shelter for people to escape, it has now

Up until a few years ago, it wasn''t as bad as it is now. Although it is true that some people in the neighborhood supported the expansion of the market a few years ago, now most of them (66)........

that it has gotten out of control and created many serious problems for the area (67)........, it might have already gotten too far out of control. What we really need right now is not a

mere intervention by civilians but strong action from the mayor''s office.', N'Choose the word or phrase that best completes the blanks:', NULL, NULL, 4, 6, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (94, N'', N'B', N'', 16, N'would have agreed', N'would agree', N'has agree', N' were agreeing', N'', N'', NULL, NULL, 4, 6, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (95, N'', N'A', N'', 17, N'In fact', N'In spite of', N'On the other hand', N'Even though', N'', N'', NULL, NULL, 4, 6, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (96, N'', N'D', N'', 18, N'A meeting agenda', N'A printing schedule', N'A contract document ', N'Photographs of furniture', N'Passage 1:

To: Ken Perez <kperez@megasupply.com>
From: Emma Appleby <eappleby@megasupply.com>
Date: July 2
Subject: Fall Catalog Review
 
Hi Ken,
Please find attached sample pages from the fall catalog which will be released at the end of August. Please review them and give me your comments. Mr. Benson and I agreed that the pages with dining room furniture should be redone because the colors are not right. Let me know what you think.

We don’t have much time because we have to complete the catalog, send it for printing by July 30, and release it by the end of August. So please send me your comments as soon as possible. After I incorporate all the comments, I will obtain the management’s approval on the revised document and send it to ABC Printing.

Emma
 *************
Passage 2:

To: Emma Appleby <eappleby@megasupply.com>
From: Ken Perez <kperez@megasupply.com>
Date: July 3
Subject: RE: Fall Catalog review
 
Emma,

My e-mail system was down yesterday, and I did not have access to my messages until this morning. That’s why I was not able to address your concerns earlier.

Now I can open your e-mail, but for some reason I cannot open the attachments. I can’t figure out what is wrong.

Could you send me the attachment again? I have a marketing this afternoon at three, but will have some time to go over the pictures before that. I’ll try to send you my comments by the close of business today.

Ken', N' What is the attachment referred to by Mr. Perez?', NULL, NULL, 4, 7, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (97, N'', N'A', N'', 19, N'worries', N'suggestions', N'requests', N'involvements', N'', N'In the second e-mail, the word “concerns” in paragraph 1, line 2 is closest in meaning to', NULL, NULL, 4, 7, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (98, N'', N'C', N'', 20, N'To invite her to a meeting', N'To give his comments on the catalog', N'To request her to resend the document', N'To ask about the printing deadline', N'', N'Why did Mr. Perez send Ms. Appleby an e-mail?', NULL, NULL, 4, 7, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (99, N'', N'C', N'', 21, N'1.July', N'20.July', N'30.July', N'30.August', N'', N' By when should the document be sent to ABC Printing?', NULL, NULL, 4, 7, NULL)
GO
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (100, N'', N'B', N'', 22, N'To send her a notice regarding a marketing meeting', N'To review sample pages of a catalog', N'To put her photo in the new catalog', N'To fix her computer', N'', N' What did Ms. Appleby request Mr. Perez to do?', NULL, NULL, 4, 7, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (101, N'', N'D', N'', 23, N'It will soon provide train service to Everett', N'It provides free parking for monthly pass holders.', N'It provides free schedules for the ferry service.', N'Its business centers is only minutes from the ferry terminal', N'Exciting and Relaxing Waterborne Travel Option
Blue Bridge Ferries – Relax and enjoy the scenery!
 
Forget about annoying and crowded traffic! Take a ferry ride across the Bay of Fundy in comfort, style, and with time to spare! Our high-speed Blue Bridge ferries provide a quick and convenient ride between Everett and Fundy Bay City, offering a great host of amenities including reserved seating, fax machine, and television. Friendly captains and crew will make your ride more enjoyable. With hourly departures, our ferries will take you to Fundy Bay terminal, only five minutes from the Fundy Bay City business district, in just 45 minutes. Monthly passes are available at $100. Parking is available in an adjacent parking lot with affordable rates ($5.00 per day, $3.00 on weekends, $75.00 for a monthly pass). It is a great way to start and finish your day! For more information on fares and ferry schedules, visit our website at www.bbferries.com, or call us at (555) 512-3342.', N'What seems to be true about Fundy Bay City?', NULL, NULL, 4, 7, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (102, N'', N'B', N'', 24, N'Ferry employees', N'Commuters to Fundy Bay City', N'Travel agents ', N'Blue Bridge shareholders', N'', N'Who are the intended readers of this advertisement?', NULL, NULL, 4, 7, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (103, N'', N'D', N'', 25, N'A room charge', N'A telephone fee ', N'A room service charge', N'A dinner at the hotel restaurant', N'Guest Name: Helen County
Reservation number: AX 1402652
Room: 333
Arrival: December 3    13:23
Departure: December 9
 

 

Date Description Charge
Dec 3~9 Room Charge 840.00
Dec 3 Room Service 14.00
Dec 4 1900 Bar 20.00
Dec 6 Telephone call 10.00
Dec 7 Dinner: 1900 Bar & Grill 32.00*
Dec 7 Dry cleaning 5.00
Dec 8 Room Service 18.00
Dec 9 Shuttle Service 15.00
                                                                                                Total: $954.00
* 10% discount applied
Guest signature: Helen County
Hotel manager: Jeff Benson', N' To which item was the discount applied?', NULL, NULL, 4, 7, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (104, N'', N'D', N'', 26, N'3.Dec', N'5.Dec', N'7.Dec', N'9.Dec', N'', N'When was Ms. County’s check-out date?', NULL, NULL, 4, 7, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (105, N'num1', N'D', N'num1', 1, N'The man is finishing his meal', N'The customer is waiting for a table', N'The waiter is setting the table', N'The woman is looking at the menu', N'Look at the picture and listen to the sentences. Choose the sentence that best describes the picture:', N'', NULL, NULL, 5, 1, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (106, N'num2', N'A', N'num2', 2, N'He’s handling a tool', N'He’s cutting grass', N'He’s building a bookshelf', N'He’s walking up to the roof', N'', N'', NULL, NULL, 5, 1, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (107, N'num4', N'B', N'', 3, N'I came in early today', N'Because I had a question', N'By two o’clock at the earliest', NULL, N'Listen to the question and the three responses. Choose the response that best answers the question:', N'Why did you come by yesterday?', NULL, NULL, 5, 2, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (108, N'num5', N'C', N'', 4, N'Yes, I can lend it to you', N'The handle is in the front', N'Yes, that would be nice, thanks', NULL, N'', N'Would you like a hand with your luggage?', NULL, NULL, 5, 2, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (109, N'num6', N'B', N'', 5, N'No, it’s in Los Angeles', N'Yes, he is the boss there', N'He’s on a business trip', NULL, N'', N'Mr. Robertson runs our San Francisco office, doesn’t he?', NULL, NULL, 5, 2, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (110, N'num15-16-17', N'C', N'', 6, N'100.0', N'200.0', N'300.0', N'400.0', N'Listen to the dialogue. Then read each question and choose the best answer:', N' How many pens does the man need?', NULL, NULL, 5, 3, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (111, N'num15-16-17', N'D', N'', 7, N'To write a book', N'For the office employees', N'To make a large drawing', N'To give away at a conference', N'', N'Why does he need the pens?', NULL, NULL, 5, 3, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (112, N'num15-16-17', N'C', N'', 8, N'20.0', N'40.0', N'120.0', N'140.0', N'', N'How much will he pay for the pens?', NULL, NULL, 5, 3, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (113, N'num36-37-38', N'B', N'', 9, N'One day', N'One weekend', N'One week', N'One month', N'Listen to the talk. Then read each question and choose the best answer:', N'According to the speaker, how long will the special offer last?', NULL, NULL, 5, 4, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (114, N'num36-37-38', N'B', N'', 10, N'100.0', N'200.0', N'300.0', N'400.0', N'', N'How much is the special offer?', NULL, NULL, 5, 4, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (115, N'num36-37-38', N'D', N'', 11, N'People who want to travel overseas', N'Members who belong to the fitness club', N'Staff who work for the Travel Lodge Inn', N'Those who want to get away for the weekend', N'', N'Who would be most interested in this advertisement?', NULL, NULL, 5, 4, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (116, N'', N'B', N'', 12, N'nearly', N'immediately', N'precisely', N'significantly', N'Choose the word that best completes the sentence:', N'Employees who have not yet registered on the new company website must do so ------', NULL, NULL, 5, 5, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (117, N'', N'C', N'', 13, N'professional', N'profession', N'professionals', N'professionally', N'', N'Rosewater Medical Center employs healthcare -------- affiliated with Huron University.', NULL, NULL, 5, 5, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (118, N'', N'A', N'', 14, N'indicates', N'commands', N'notices ', N'distributes', N'', N'Once you have detected a fatal virus on your computer, common sense -------- that you should have your hard drive reformatted by skilled professionals.', NULL, NULL, 5, 5, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (119, N'', N'B', N'', 15, N'just ', N'once', N'such', N'likely', N'A long time ago, this part of the town used to be a place where people came to relax and get away from their stress. Although this was a shelter for people to escape, it has nowA long time ago, this part of the town used to be a place where people came to relax and get away from their stress. Although this was (65)........ a shelter for people to escape, it has now

Up until a few years ago, it wasn''t as bad as it is now. Although it is true that some people in the neighborhood supported the expansion of the market a few years ago, now most of them (66)........

that it has gotten out of control and created many serious problems for the area (67)........, it might have already gotten too far out of control. What we really need right now is not a

mere intervention by civilians but strong action from the mayor''s office.', N'Choose the word or phrase that best completes the blanks:', NULL, NULL, 5, 6, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (120, N'', N'B', N'', 16, N'would have agreed', N'would agree', N'has agree', N' were agreeing', N'', N'', NULL, NULL, 5, 6, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (121, N'', N'A', N'', 17, N'In fact', N'In spite of', N'On the other hand', N'Even though', N'', N'', NULL, NULL, 5, 6, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (122, N'', N'D', N'', 18, N'A meeting agenda', N'A printing schedule', N'A contract document ', N'Photographs of furniture', N'Passage 1:

To: Ken Perez <kperez@megasupply.com>
From: Emma Appleby <eappleby@megasupply.com>
Date: July 2
Subject: Fall Catalog Review
 
Hi Ken,
Please find attached sample pages from the fall catalog which will be released at the end of August. Please review them and give me your comments. Mr. Benson and I agreed that the pages with dining room furniture should be redone because the colors are not right. Let me know what you think.

We don’t have much time because we have to complete the catalog, send it for printing by July 30, and release it by the end of August. So please send me your comments as soon as possible. After I incorporate all the comments, I will obtain the management’s approval on the revised document and send it to ABC Printing.

Emma
 *************
Passage 2:

To: Emma Appleby <eappleby@megasupply.com>
From: Ken Perez <kperez@megasupply.com>
Date: July 3
Subject: RE: Fall Catalog review
 
Emma,

My e-mail system was down yesterday, and I did not have access to my messages until this morning. That’s why I was not able to address your concerns earlier.

Now I can open your e-mail, but for some reason I cannot open the attachments. I can’t figure out what is wrong.

Could you send me the attachment again? I have a marketing this afternoon at three, but will have some time to go over the pictures before that. I’ll try to send you my comments by the close of business today.

Ken', N' What is the attachment referred to by Mr. Perez?', NULL, NULL, 5, 7, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (123, N'', N'A', N'', 19, N'worries', N'suggestions', N'requests', N'involvements', N'', N'In the second e-mail, the word “concerns” in paragraph 1, line 2 is closest in meaning to', NULL, NULL, 5, 7, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (124, N'', N'C', N'', 20, N'To invite her to a meeting', N'To give his comments on the catalog', N'To request her to resend the document', N'To ask about the printing deadline', N'', N'Why did Mr. Perez send Ms. Appleby an e-mail?', NULL, NULL, 5, 7, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (125, N'', N'C', N'', 21, N'1.July', N'20.July', N'30.July', N'30.August', N'', N' By when should the document be sent to ABC Printing?', NULL, NULL, 5, 7, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (126, N'', N'B', N'', 22, N'To send her a notice regarding a marketing meeting', N'To review sample pages of a catalog', N'To put her photo in the new catalog', N'To fix her computer', N'', N' What did Ms. Appleby request Mr. Perez to do?', NULL, NULL, 5, 7, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (127, N'', N'D', N'', 23, N'It will soon provide train service to Everett', N'It provides free parking for monthly pass holders.', N'It provides free schedules for the ferry service.', N'Its business centers is only minutes from the ferry terminal', N'Exciting and Relaxing Waterborne Travel Option
Blue Bridge Ferries – Relax and enjoy the scenery!
 
Forget about annoying and crowded traffic! Take a ferry ride across the Bay of Fundy in comfort, style, and with time to spare! Our high-speed Blue Bridge ferries provide a quick and convenient ride between Everett and Fundy Bay City, offering a great host of amenities including reserved seating, fax machine, and television. Friendly captains and crew will make your ride more enjoyable. With hourly departures, our ferries will take you to Fundy Bay terminal, only five minutes from the Fundy Bay City business district, in just 45 minutes. Monthly passes are available at $100. Parking is available in an adjacent parking lot with affordable rates ($5.00 per day, $3.00 on weekends, $75.00 for a monthly pass). It is a great way to start and finish your day! For more information on fares and ferry schedules, visit our website at www.bbferries.com, or call us at (555) 512-3342.', N'What seems to be true about Fundy Bay City?', NULL, NULL, 5, 7, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (128, N'', N'B', N'', 24, N'Ferry employees', N'Commuters to Fundy Bay City', N'Travel agents ', N'Blue Bridge shareholders', N'', N'Who are the intended readers of this advertisement?', NULL, NULL, 5, 7, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (129, N'', N'D', N'', 25, N'A room charge', N'A telephone fee ', N'A room service charge', N'A dinner at the hotel restaurant', N'Guest Name: Helen County
Reservation number: AX 1402652
Room: 333
Arrival: December 3    13:23
Departure: December 9
 

 

Date Description Charge
Dec 3~9 Room Charge 840.00
Dec 3 Room Service 14.00
Dec 4 1900 Bar 20.00
Dec 6 Telephone call 10.00
Dec 7 Dinner: 1900 Bar & Grill 32.00*
Dec 7 Dry cleaning 5.00
Dec 8 Room Service 18.00
Dec 9 Shuttle Service 15.00
                                                                                                Total: $954.00
* 10% discount applied
Guest signature: Helen County
Hotel manager: Jeff Benson', N' To which item was the discount applied?', NULL, NULL, 5, 7, NULL)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (130, N'', N'D', N'', 26, N'3.Dec', N'5.Dec', N'7.Dec', N'9.Dec', N'', N'When was Ms. County’s check-out date?', NULL, NULL, 6, 5, 18)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (131, N'num1', N'D', N'num1', 1, N'The man is finishing his meal', N'The customer is waiting for a table', N'The waiter is setting the table', N'The woman is looking at the menu', N'Look at the picture and listen to the sentences. Choose the sentence that best describes the picture:', N'', NULL, NULL, 6, 1, 2)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (132, N'num2', N'A', N'num2', 2, N'He’s handling a tool', N'He’s cutting grass', N'He’s building a bookshelf', N'He’s walking up to the roof', N'', N'', NULL, NULL, 6, 1, 9)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (133, N'num4', N'B', N'', 3, N'I came in early today', N'Because I had a question', N'By two o’clock at the earliest', NULL, N'Listen to the question and the three responses. Choose the response that best answers the question:', N'Why did you come by yesterday?', NULL, NULL, 6, 2, 3)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (134, N'num5', N'C', N'', 4, N'Yes, I can lend it to you', N'The handle is in the front', N'Yes, that would be nice, thanks', NULL, N'', N'Would you like a hand with your luggage?', NULL, NULL, 6, 2, 3)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (135, N'num6', N'B', N'', 5, N'No, it’s in Los Angeles', N'Yes, he is the boss there', N'He’s on a business trip', NULL, N'', N'Mr. Robertson runs our San Francisco office, doesn’t he?', NULL, NULL, 6, 2, 3)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (136, N'num15-16-17', N'C', N'', 6, N'100.0', N'200.0', N'300.0', N'400.0', N'Listen to the dialogue. Then read each question and choose the best answer:', N' How many pens does the man need?', NULL, NULL, 6, 3, 4)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (137, N'num15-16-17', N'D', N'', 7, N'To write a book', N'For the office employees', N'To make a large drawing', N'To give away at a conference', N'', N'Why does he need the pens?', NULL, NULL, 6, 3, 4)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (138, N'num15-16-17', N'C', N'', 8, N'20.0', N'40.0', N'120.0', N'140.0', N'', N'How much will he pay for the pens?', NULL, NULL, 6, 3, 4)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (139, N'num36-37-38', N'B', N'', 9, N'One day', N'One weekend', N'One week', N'One month', N'Listen to the talk. Then read each question and choose the best answer:', N'According to the speaker, how long will the special offer last?', NULL, NULL, 6, 4, 7)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (140, N'num36-37-38', N'B', N'', 10, N'100.0', N'200.0', N'300.0', N'400.0', N'', N'How much is the special offer?', NULL, NULL, 6, 4, 7)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (141, N'num36-37-38', N'D', N'', 11, N'People who want to travel overseas', N'Members who belong to the fitness club', N'Staff who work for the Travel Lodge Inn', N'Those who want to get away for the weekend', N'', N'Who would be most interested in this advertisement?', NULL, NULL, 6, 4, 7)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (142, N'', N'B', N'', 12, N'nearly', N'immediately', N'precisely', N'significantly', N'Choose the word that best completes the sentence:', N'Employees who have not yet registered on the new company website must do so ------', NULL, NULL, 6, 5, 10)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (143, N'', N'C', N'', 13, N'professional', N'profession', N'professionals', N'professionally', N'', N'Rosewater Medical Center employs healthcare -------- affiliated with Huron University.', NULL, NULL, 6, 5, 15)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (144, N'', N'A', N'', 14, N'indicates', N'commands', N'notices ', N'distributes', N'', N'Once you have detected a fatal virus on your computer, common sense -------- that you should have your hard drive reformatted by skilled professionals.', NULL, NULL, 6, 5, 16)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (145, N'', N'B', N'', 15, N'just ', N'once', N'such', N'likely', N'A long time ago, this part of the town used to be a place where people came to relax and get away from their stress. Although this was a shelter for people to escape, it has nowA long time ago, this part of the town used to be a place where people came to relax and get away from their stress. Although this was (65)........ a shelter for people to escape, it has now

Up until a few years ago, it wasn''t as bad as it is now. Although it is true that some people in the neighborhood supported the expansion of the market a few years ago, now most of them (66)........

that it has gotten out of control and created many serious problems for the area (67)........, it might have already gotten too far out of control. What we really need right now is not a

mere intervention by civilians but strong action from the mayor''s office.', N'Choose the word or phrase that best completes the blanks:', NULL, NULL, 6, 6, 11)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (146, N'', N'B', N'', 16, N'would have agreed', N'would agree', N'has agree', N' were agreeing', N'', N'', NULL, NULL, 6, 6, 11)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (147, N'', N'A', N'', 17, N'In fact', N'In spite of', N'On the other hand', N'Even though', N'', N'', NULL, NULL, 6, 6, 11)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (148, N'', N'D', N'', 18, N'A meeting agenda', N'A printing schedule', N'A contract document ', N'Photographs of furniture', N'Passage 1:

To: Ken Perez <kperez@megasupply.com>
From: Emma Appleby <eappleby@megasupply.com>
Date: July 2
Subject: Fall Catalog Review
 
Hi Ken,
Please find attached sample pages from the fall catalog which will be released at the end of August. Please review them and give me your comments. Mr. Benson and I agreed that the pages with dining room furniture should be redone because the colors are not right. Let me know what you think.

We don’t have much time because we have to complete the catalog, send it for printing by July 30, and release it by the end of August. So please send me your comments as soon as possible. After I incorporate all the comments, I will obtain the management’s approval on the revised document and send it to ABC Printing.

Emma
 *************
Passage 2:

To: Emma Appleby <eappleby@megasupply.com>
From: Ken Perez <kperez@megasupply.com>
Date: July 3
Subject: RE: Fall Catalog review
 
Emma,

My e-mail system was down yesterday, and I did not have access to my messages until this morning. That’s why I was not able to address your concerns earlier.

Now I can open your e-mail, but for some reason I cannot open the attachments. I can’t figure out what is wrong.

Could you send me the attachment again? I have a marketing this afternoon at three, but will have some time to go over the pictures before that. I’ll try to send you my comments by the close of business today.

Ken', N' What is the attachment referred to by Mr. Perez?', NULL, NULL, 6, 6, 14)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (149, N'', N'A', N'', 19, N'worries', N'suggestions', N'requests', N'involvements', N'', N'In the second e-mail, the word “concerns” in paragraph 1, line 2 is closest in meaning to', NULL, NULL, 6, 6, 14)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (150, N'', N'C', N'', 20, N'To invite her to a meeting', N'To give his comments on the catalog', N'To request her to resend the document', N'To ask about the printing deadline', N'', N'Why did Mr. Perez send Ms. Appleby an e-mail?', NULL, NULL, 6, 6, 14)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (151, N'', N'C', N'', 21, N'1.July', N'20.July', N'30.July', N'30.August', N'', N' By when should the document be sent to ABC Printing?', NULL, NULL, 6, 7, 12)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (152, N'', N'B', N'', 22, N'To send her a notice regarding a marketing meeting', N'To review sample pages of a catalog', N'To put her photo in the new catalog', N'To fix her computer', N'', N' What did Ms. Appleby request Mr. Perez to do?', NULL, NULL, 6, 7, 12)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (153, N'', N'D', N'', 23, N'It will soon provide train service to Everett', N'It provides free parking for monthly pass holders.', N'It provides free schedules for the ferry service.', N'Its business centers is only minutes from the ferry terminal', N'Exciting and Relaxing Waterborne Travel Option
Blue Bridge Ferries – Relax and enjoy the scenery!
 
Forget about annoying and crowded traffic! Take a ferry ride across the Bay of Fundy in comfort, style, and with time to spare! Our high-speed Blue Bridge ferries provide a quick and convenient ride between Everett and Fundy Bay City, offering a great host of amenities including reserved seating, fax machine, and television. Friendly captains and crew will make your ride more enjoyable. With hourly departures, our ferries will take you to Fundy Bay terminal, only five minutes from the Fundy Bay City business district, in just 45 minutes. Monthly passes are available at $100. Parking is available in an adjacent parking lot with affordable rates ($5.00 per day, $3.00 on weekends, $75.00 for a monthly pass). It is a great way to start and finish your day! For more information on fares and ferry schedules, visit our website at www.bbferries.com, or call us at (555) 512-3342.', N'What seems to be true about Fundy Bay City?', NULL, NULL, 6, 7, 12)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (154, N'', N'B', N'', 24, N'Ferry employees', N'Commuters to Fundy Bay City', N'Travel agents ', N'Blue Bridge shareholders', N'', N'Who are the intended readers of this advertisement?', NULL, NULL, 6, 7, 13)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (155, N'', N'D', N'', 25, N'A room charge', N'A telephone fee ', N'A room service charge', N'A dinner at the hotel restaurant', N'Guest Name: Helen County
Reservation number: AX 1402652
Room: 333
Arrival: December 3    13:23
Departure: December 9
 

 

Date Description Charge
Dec 3~9 Room Charge 840.00
Dec 3 Room Service 14.00
Dec 4 1900 Bar 20.00
Dec 6 Telephone call 10.00
Dec 7 Dinner: 1900 Bar & Grill 32.00*
Dec 7 Dry cleaning 5.00
Dec 8 Room Service 18.00
Dec 9 Shuttle Service 15.00
                                                                                                Total: $954.00
* 10% discount applied
Guest signature: Helen County
Hotel manager: Jeff Benson', N' To which item was the discount applied?', NULL, NULL, 6, 7, 13)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (156, N'', N'D', N'', 26, N'3.Dec', N'5.Dec', N'7.Dec', N'9.Dec', N'', N'When was Ms. County’s check-out date?', NULL, NULL, 6, 7, 13)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (157, N'', N'A', N'', 14, N'indicates', N'commands', N'notices ', N'distributes', N'', N'Once you have detected a fatal virus on your computer, common sense -------- that you should have your hard drive reformatted by skilled professionals.', NULL, NULL, 6, 5, 17)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (158, N'', N'A', N'', 14, N'indicates', N'commands', N'notices ', N'distributes', N'', N'Once you have detected a fatal virus on your computer, common sense -------- that you should have your hard drive reformatted by skilled professionals.', NULL, NULL, 6, 5, 18)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (159, N'num6', N'B', N'', 5, N'No, it’s in Los Angeles', N'Yes, he is the boss there', N'He’s on a business trip', NULL, N'', N'Mr. Robertson runs our San Francisco office, doesn’t he?', NULL, NULL, 6, 2, 3)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (160, N'num6', N'B', N'', 5, N'No, it’s in Los Angeles', N'Yes, he is the boss there', N'He’s on a business trip', NULL, N'', N'Mr. Robertson runs our San Francisco office, doesn’t he?', NULL, NULL, 6, 2, 3)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (161, N'num15-16-17', N'C', N'', 6, N'100.0', N'200.0', N'300.0', N'400.0', N'Listen to the dialogue. Then read each question and choose the best answer:', N' How many pens does the man need?', NULL, NULL, 6, 3, 6)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (162, N'num15-16-17', N'D', N'', 7, N'To write a book', N'For the office employees', N'To make a large drawing', N'To give away at a conference', N'', N'Why does he need the pens?', NULL, NULL, 6, 3, 6)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (163, N'num15-16-17', N'C', N'', 8, N'20.0', N'40.0', N'120.0', N'140.0', N'', N'How much will he pay for the pens?', NULL, NULL, 6, 3, 6)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (164, N'num36-37-38', N'B', N'', 9, N'One day', N'One weekend', N'One week', N'One month', N'Listen to the talk. Then read each question and choose the best answer:', N'According to the speaker, how long will the special offer last?', NULL, NULL, 6, 4, 8)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (165, N'num36-37-38', N'B', N'', 10, N'100.0', N'200.0', N'300.0', N'400.0', N'', N'How much is the special offer?', NULL, NULL, 6, 4, 8)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (166, N'num36-37-38', N'D', N'', 11, N'People who want to travel overseas', N'Members who belong to the fitness club', N'Staff who work for the Travel Lodge Inn', N'Those who want to get away for the weekend', N'', N'Who would be most interested in this advertisement?', NULL, NULL, 6, 4, 8)
SET IDENTITY_INSERT [dbo].[question] OFF
SET IDENTITY_INSERT [dbo].[role] ON 

INSERT [dbo].[role] ([id_role], [code], [description], [role]) VALUES (1, 1, NULL, N'ROLE_ADMIN')
INSERT [dbo].[role] ([id_role], [code], [description], [role]) VALUES (2, 2, NULL, N'ROLE_MEMBER')
INSERT [dbo].[role] ([id_role], [code], [description], [role]) VALUES (3, 3, NULL, N'ROLE_MEMBER_VIP')
INSERT [dbo].[role] ([id_role], [code], [description], [role]) VALUES (4, 4, NULL, N'ROLE_CONTENT')
SET IDENTITY_INSERT [dbo].[role] OFF
SET IDENTITY_INSERT [dbo].[set_question] ON 

INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (2, N'num1', N'Set 1 A', N'num1', N'1A', 1, NULL, NULL, 6, 1)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (3, NULL, N'Set 2', NULL, NULL, 5, NULL, NULL, 6, 2)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (4, NULL, N'Set 3 A', NULL, N'A', 3, NULL, NULL, 6, 3)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (6, NULL, N'Set 3 B', NULL, N'B', 3, NULL, NULL, 6, 3)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (7, NULL, N'Set 4 A', NULL, N'A', 3, NULL, NULL, 6, 4)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (8, NULL, N'Set 4 B', NULL, N'4B', 3, NULL, NULL, 6, 4)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (9, N'num2', N'Set 1 B', N'num2', N'1B', 1, NULL, NULL, 6, 1)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (10, NULL, N'Set 5 A', NULL, N'5A', 1, NULL, NULL, 6, 5)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (11, NULL, N'Set 6 A', NULL, N'6A', 3, NULL, NULL, 6, 6)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (12, NULL, N'Set 7 A', NULL, N'7A', 3, NULL, NULL, 6, 7)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (13, NULL, N'Set 7 B', NULL, N'7B', 3, NULL, NULL, 6, 7)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (14, NULL, N'Set 6 B', NULL, N'6B', 3, NULL, NULL, 6, 6)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (15, NULL, N'Set 5 B', NULL, N'5B', 1, NULL, NULL, 6, 5)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (16, NULL, N'Set 5 C', NULL, N'5C', 1, NULL, NULL, 6, 5)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (17, NULL, N'Set 5 D', NULL, N'5D', 1, NULL, NULL, 6, 5)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (18, NULL, N'Set 5 E', NULL, N'5E', 1, NULL, NULL, 6, 5)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (19, NULL, N'Set 5 F', NULL, N'5F', 1, NULL, NULL, 6, 5)
SET IDENTITY_INSERT [dbo].[set_question] OFF
SET IDENTITY_INSERT [dbo].[test_result] ON 

INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1, 2, 0, CAST(N'2021-12-13T21:02:15.9210000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 10, 40, 0, 1, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (2, 0, 0, CAST(N'2021-12-13T21:02:46.3130000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 12, 50, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (3, 0, 0, CAST(N'2021-12-13T21:06:48.7150000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 14, 20, 0, 4, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (6, 1, 0, CAST(N'2021-12-14T22:31:27.5860000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 16, 26, 0, 5, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (7, 2, 0, CAST(N'2021-12-13T21:02:15.9210000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 40, 28, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (8, 0, 0, CAST(N'2021-12-13T21:02:46.3130000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 32, 48, 0, 2, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (9, 0, 0, CAST(N'2021-12-13T21:06:48.7150000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 26, 40, 0, 2, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (10, 1, 0, CAST(N'2021-12-14T22:31:27.5860000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 24, 46, 0, 3, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (11, 2, 0, CAST(N'2021-12-13T21:02:15.9210000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 28, 48, 0, 2, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (12, 0, 0, CAST(N'2021-12-13T21:02:46.3130000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 26, 28, 0, 1, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (13, 0, 0, CAST(N'2021-12-13T21:06:48.7150000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 38, 14, 0, 4, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (14, 1, 0, CAST(N'2021-12-14T22:31:27.5860000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 34, 26, 0, 3, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (15, 2, 0, CAST(N'2021-12-13T21:02:15.9210000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 36, 42, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (16, 0, 0, CAST(N'2021-12-13T21:02:46.3130000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 22, 26, 0, 5, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (17, 0, 0, CAST(N'2021-12-13T21:06:48.7150000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 26, 54, 0, 3, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (18, 1, 0, CAST(N'2021-12-14T22:31:27.5860000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 14, 54, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (19, 2, 0, CAST(N'2021-12-13T21:02:15.9210000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 24, 52, 0, 3, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (20, 0, 0, CAST(N'2021-12-13T21:02:46.3130000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 18, 26, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (21, 0, 0, CAST(N'2021-12-13T21:06:48.7150000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 24, 24, 0, 3, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (22, 1, 0, CAST(N'2021-12-14T22:31:27.5860000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 14, 22, 0, 2, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (23, 2, 0, CAST(N'2021-12-13T21:02:15.9210000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 12, 24, 0, 1, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (24, 0, 0, CAST(N'2021-12-13T21:02:46.3130000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 24, 58, 0, 4, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (25, 0, 0, CAST(N'2021-12-13T21:06:48.7150000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 26, 60, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (26, 1, 0, CAST(N'2021-12-14T22:31:27.5860000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 28, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1007, 0, 0, CAST(N'2021-12-16T21:32:10.3030000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1008, 1, 0, CAST(N'2021-12-16T21:32:49.7250000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1009, 0, 0, CAST(N'2021-12-16T21:42:49.1880000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1010, 0, 0, CAST(N'2021-12-16T22:31:18.0710000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1011, 0, 0, CAST(N'2021-12-16T23:02:27.0530000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1012, 0, 0, CAST(N'2021-12-16T23:05:04.1840000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1013, 0, 0, CAST(N'2021-12-16T23:06:08.1370000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1014, 0, 0, CAST(N'2021-12-16T23:06:31.8940000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1015, 0, 0, CAST(N'2021-12-16T23:09:43.0930000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1016, 0, 0, CAST(N'2021-12-16T23:12:21.2180000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1017, 0, 0, CAST(N'2021-12-16T23:18:32.4700000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1018, 0, 0, CAST(N'2021-12-16T23:19:54.7270000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1019, 0, 0, CAST(N'2021-12-16T23:20:33.2190000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1020, 6, 0, CAST(N'2021-12-17T21:00:50.7310000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1021, 0, 0, CAST(N'2021-12-18T20:20:32.4310000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1022, 0, 0, CAST(N'2021-12-18T20:21:43.3230000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1023, 0, 0, CAST(N'2021-12-18T20:35:00.2610000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1024, 0, 0, CAST(N'2021-12-18T20:36:31.9960000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1025, 0, 0, CAST(N'2021-12-18T21:03:49.9470000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1026, 0, 0, CAST(N'2021-12-18T21:04:08.9000000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1027, 0, 0, CAST(N'2021-12-18T21:11:15.7410000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1028, 1, 0, CAST(N'2021-12-18T23:40:18.1290000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1029, 0, 0, CAST(N'2021-12-18T23:44:38.7190000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1030, 0, 0, CAST(N'2021-12-18T23:47:05.7370000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1031, 0, 0, CAST(N'2021-12-18T23:49:11.8140000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1032, 0, 0, CAST(N'2021-12-18T23:50:54.8740000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1033, 0, 0, CAST(N'2021-12-18T23:57:38.3750000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1034, 0, 0, CAST(N'2021-12-19T00:03:07.0030000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1035, 0, 0, CAST(N'2021-12-19T00:05:17.7590000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1036, 0, 0, CAST(N'2021-12-19T00:07:39.2080000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1037, 0, 0, CAST(N'2021-12-19T00:10:24.0300000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1038, 0, 0, CAST(N'2021-12-19T00:13:46.7360000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1039, 0, 0, CAST(N'2021-12-19T00:14:26.0060000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1040, 0, 0, CAST(N'2021-12-19T00:15:56.0960000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1041, 0, 0, CAST(N'2021-12-19T00:17:55.4540000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1042, 0, 0, CAST(N'2021-12-19T00:20:09.2510000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1043, 0, 0, CAST(N'2021-12-19T00:22:14.1770000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1044, 0, 0, CAST(N'2021-12-19T00:22:44.2470000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1045, 5, 0, CAST(N'2021-12-19T00:27:45.6340000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1046, 0, 0, CAST(N'2021-12-19T00:33:32.0490000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1047, 5, 0, CAST(N'2021-12-19T00:37:58.4270000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1049, 0, 0, CAST(N'2021-12-19T00:42:49.2300000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1050, 0, 0, CAST(N'2021-12-19T00:45:13.0860000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1051, 0, 0, CAST(N'2021-12-19T00:48:28.5100000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1052, 0, 0, CAST(N'2021-12-19T00:50:40.4040000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1053, 0, 0, CAST(N'2021-12-19T00:52:31.6160000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1054, 0, 0, CAST(N'2021-12-19T12:06:34.8280000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1055, 0, 0, CAST(N'2021-12-19T12:07:41.3930000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1056, 1, 0, CAST(N'2021-12-19T12:11:27.5830000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1057, 0, 0, CAST(N'2021-12-19T12:20:16.5520000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1058, 0, 0, CAST(N'2021-12-19T19:53:41.9880000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1059, 0, 0, CAST(N'2021-12-19T19:53:57.6840000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1060, 0, 0, CAST(N'2021-12-19T20:05:55.9780000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1061, 0, 0, CAST(N'2021-12-19T20:24:19.2780000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1062, 4, 0, CAST(N'2021-12-19T20:25:51.9450000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1063, 0, 0, CAST(N'2021-12-19T20:27:18.2170000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1064, 0, 0, CAST(N'2021-12-19T20:29:31.0240000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1065, 0, 0, CAST(N'2021-12-19T20:31:17.1710000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1066, 0, 0, CAST(N'2021-12-19T20:34:03.8120000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1067, 0, 0, CAST(N'2021-12-19T20:35:57.2030000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1068, 0, 0, CAST(N'2021-12-19T20:36:03.1320000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1069, 0, 0, CAST(N'2021-12-19T20:36:17.0750000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1070, 0, 0, CAST(N'2021-12-19T20:37:41.0230000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1071, 0, 0, CAST(N'2021-12-19T20:38:43.2140000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1072, 4, 0, CAST(N'2021-12-19T20:47:16.9620000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1073, 1, 2, CAST(N'2021-12-19T20:52:36.3880000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1074, 0, 0, CAST(N'2021-12-19T20:55:09.2490000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1075, 0, 0, CAST(N'2021-12-19T21:01:06.6670000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1076, 0, 0, CAST(N'2021-12-19T21:05:28.4910000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1077, 0, 0, CAST(N'2021-12-19T21:58:48.2850000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1078, 0, 0, CAST(N'2021-12-19T22:02:59.6930000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1080, 0, 0, CAST(N'2021-12-19T23:18:59.5110000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1081, 0, 0, CAST(N'2021-12-19T23:22:43.5230000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1082, 0, 0, CAST(N'2021-12-19T23:29:33.9930000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1083, 0, 0, CAST(N'2021-12-20T00:03:23.0990000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
GO
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1084, 0, 0, CAST(N'2021-12-20T00:05:43.1420000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1085, 0, 0, CAST(N'2021-12-20T00:06:58.6800000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1086, 0, 0, CAST(N'2021-12-20T00:07:48.5540000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1087, 0, 0, CAST(N'2021-12-20T00:26:45.6960000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1088, 0, 0, CAST(N'2021-12-20T00:27:11.5110000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1089, 0, 0, CAST(N'2021-12-20T00:29:04.4640000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1090, 0, 0, CAST(N'2021-12-20T00:29:08.2690000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1091, 0, 0, CAST(N'2021-12-20T00:43:13.6270000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1092, 0, 0, CAST(N'2021-12-20T00:43:15.3610000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1093, 0, 0, CAST(N'2021-12-20T00:46:39.5300000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1094, 0, 0, CAST(N'2021-12-20T19:10:40.7250000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1095, 0, 0, CAST(N'2021-12-20T19:10:42.2540000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1096, 0, 0, CAST(N'2021-12-20T19:14:36.1090000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1097, 0, 0, CAST(N'2021-12-20T19:19:24.2620000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1098, 0, 0, CAST(N'2021-12-20T19:20:11.1280000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1099, 0, 0, CAST(N'2021-12-20T20:46:58.8460000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1100, 0, 0, CAST(N'2021-12-20T20:52:23.7000000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1101, 0, 0, CAST(N'2021-12-20T20:52:25.4970000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1102, 0, 0, CAST(N'2021-12-20T20:57:12.9430000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1103, 0, 0, CAST(N'2021-12-20T20:57:15.0060000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1104, 0, 0, CAST(N'2021-12-20T20:57:27.2850000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1105, 0, 0, CAST(N'2021-12-20T21:05:11.1010000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1106, 0, 0, CAST(N'2021-12-20T21:07:17.9100000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1107, 0, 0, CAST(N'2021-12-20T21:09:10.5780000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1108, 0, 0, CAST(N'2021-12-20T21:22:40.3120000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1109, 0, 0, CAST(N'2021-12-20T21:24:00.4210000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1110, 0, 0, CAST(N'2021-12-20T21:25:10.1240000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1111, 0, 0, CAST(N'2021-12-20T21:38:03.0310000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1112, 0, 0, CAST(N'2021-12-20T21:41:30.3330000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1113, 0, 0, CAST(N'2021-12-20T21:41:47.7390000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1114, 0, 0, CAST(N'2021-12-20T21:44:34.1690000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1115, 0, 0, CAST(N'2021-12-20T21:45:17.1410000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1116, 0, 0, CAST(N'2021-12-20T21:46:42.2800000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1117, 0, 0, CAST(N'2021-12-20T22:06:34.6870000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1118, 0, 0, CAST(N'2021-12-20T22:08:32.5150000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1119, 0, 0, CAST(N'2021-12-20T22:52:29.0380000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1120, 0, 0, CAST(N'2021-12-21T00:22:47.4400000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1121, 0, 0, CAST(N'2021-12-21T00:23:25.1900000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1122, 0, 0, CAST(N'2021-12-21T00:27:54.5570000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1123, 0, 4, CAST(N'2021-12-21T01:23:47.4540000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1124, 0, 0, CAST(N'2021-12-21T01:28:07.3850000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1125, 0, 0, CAST(N'2021-12-21T01:31:51.4490000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1126, 0, 0, CAST(N'2021-12-21T01:39:20.1050000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1127, 2, 3, CAST(N'2021-12-21T01:42:30.3950000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1128, 2, 1, CAST(N'2021-12-21T01:47:34.5540000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1129, 0, 0, CAST(N'2021-12-21T01:48:57.2460000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1130, 2, 0, CAST(N'2021-12-21T01:58:09.9740000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1131, 0, 0, CAST(N'2021-12-21T01:59:51.3760000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1132, 0, 0, CAST(N'2021-12-21T02:01:05.6550000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1133, 0, 2, CAST(N'2021-12-21T02:03:14.0570000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1134, 2, 0, CAST(N'2021-12-21T02:05:58.8270000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1135, 3, 1, CAST(N'2021-12-21T02:08:46.7680000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1136, 2, 0, CAST(N'2021-12-21T02:34:44.6380000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1137, 2, 2, CAST(N'2021-12-21T02:35:53.5160000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1138, 3, 0, CAST(N'2021-12-21T11:23:57.2610000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1139, 3, 4, CAST(N'2021-12-21T11:44:13.0140000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1140, 2, 5, CAST(N'2021-12-21T11:47:25.8080000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1141, 0, 2, CAST(N'2021-12-21T11:52:26.8630000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1142, 0, 0, CAST(N'2021-12-21T11:55:40.7350000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1143, 0, 0, CAST(N'2021-12-21T11:56:06.9730000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1144, 0, 0, CAST(N'2021-12-21T11:57:48.5070000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1145, 1, 0, CAST(N'2021-12-21T12:04:05.1050000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1146, 1, 0, CAST(N'2021-12-21T12:07:06.2950000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1147, 1, 0, CAST(N'2021-12-21T12:08:23.0180000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1148, 1, 0, CAST(N'2021-12-21T12:08:55.0110000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1149, 2, 0, CAST(N'2021-12-21T12:09:54.7930000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1150, 2, 0, CAST(N'2021-12-21T12:11:42.1190000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1151, 1, 0, CAST(N'2021-12-21T12:12:49.1150000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1152, 2, 0, CAST(N'2021-12-21T12:13:54.3410000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1153, 1, 0, CAST(N'2021-12-21T12:15:20.0690000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1154, 1, 0, CAST(N'2021-12-21T12:15:58.0120000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1155, 1, 0, CAST(N'2021-12-21T12:17:19.1070000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1156, 1, 0, CAST(N'2021-12-21T12:21:19.4510000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1157, 1, 0, CAST(N'2021-12-21T12:26:24.9770000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1158, 1, 0, CAST(N'2021-12-21T12:27:37.3920000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
INSERT [dbo].[test_result] ([result_id], [correctlisten], [correctread], [date_test], [right_part1], [right_part2], [right_part3], [right_part4], [right_part5], [right_part6], [right_part7], [score_listen], [score_reading], [total_time_test], [baithithuid], [nguoidungid]) VALUES (1159, 1, 0, CAST(N'2021-12-21T12:29:02.6330000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5)
SET IDENTITY_INSERT [dbo].[test_result] OFF
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
