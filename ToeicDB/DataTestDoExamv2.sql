USE [master]
GO
/****** Object:  Database [ToeicSystem]    Script Date: 12/24/2021 9:40:16 PM ******/
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
/****** Object:  Table [dbo].[account]    Script Date: 12/24/2021 9:40:17 PM ******/
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
/****** Object:  Table [dbo].[exam]    Script Date: 12/24/2021 9:40:17 PM ******/
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
/****** Object:  Table [dbo].[explain_detail]    Script Date: 12/24/2021 9:40:17 PM ******/
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
/****** Object:  Table [dbo].[group_member]    Script Date: 12/24/2021 9:40:17 PM ******/
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
/****** Object:  Table [dbo].[group_team]    Script Date: 12/24/2021 9:40:17 PM ******/
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
/****** Object:  Table [dbo].[notification]    Script Date: 12/24/2021 9:40:17 PM ******/
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
/****** Object:  Table [dbo].[part]    Script Date: 12/24/2021 9:40:17 PM ******/
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
/****** Object:  Table [dbo].[post]    Script Date: 12/24/2021 9:40:17 PM ******/
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
/****** Object:  Table [dbo].[question]    Script Date: 12/24/2021 9:40:17 PM ******/
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
/****** Object:  Table [dbo].[rating]    Script Date: 12/24/2021 9:40:17 PM ******/
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
/****** Object:  Table [dbo].[role]    Script Date: 12/24/2021 9:40:17 PM ******/
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
/****** Object:  Table [dbo].[set_question]    Script Date: 12/24/2021 9:40:17 PM ******/
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
/****** Object:  Table [dbo].[set_question_list_question]    Script Date: 12/24/2021 9:40:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[set_question_list_question](
	[set_question_id_set] [int] NOT NULL,
	[list_question_cauhoibaithithuid] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[slidebanner]    Script Date: 12/24/2021 9:40:17 PM ******/
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
/****** Object:  Table [dbo].[teacher_remark]    Script Date: 12/24/2021 9:40:17 PM ******/
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
/****** Object:  Table [dbo].[test_result]    Script Date: 12/24/2021 9:40:17 PM ******/
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

INSERT [dbo].[account] ([dtype], [id], [dia_chi], [email], [gender], [ho_ten], [is_delete], [password], [so_dien_thoai], [username], [join_date], [add_date], [company], [school], [role_id]) VALUES (N'ContentAdmin', 1, NULL, N'1', 0, N'Tu?n Minh', 0, N'$2a$10$V2EuUk//pnzeCAo/Hp1NZOpOm6y.YpPG7/7T.IR1HKnYTZqSZy5iu', N'123456789', N'tuanminh96', NULL, NULL, NULL, NULL, 4)
INSERT [dbo].[account] ([dtype], [id], [dia_chi], [email], [gender], [ho_ten], [is_delete], [password], [so_dien_thoai], [username], [join_date], [add_date], [company], [school], [role_id]) VALUES (N'User', 2, NULL, N'member@gmail.com', 0, N'Phan Minh Tuan', 0, N'$2a$10$eWdqZlPWSSHJLscyLF9oOOHsXtW1gHZUHdTeVhSzuVLs161ROdHVi', N'123456789', N'tuanminh2k', NULL, NULL, NULL, NULL, 2)
INSERT [dbo].[account] ([dtype], [id], [dia_chi], [email], [gender], [ho_ten], [is_delete], [password], [so_dien_thoai], [username], [join_date], [add_date], [company], [school], [role_id]) VALUES (N'User', 3, N'htgddg', N'tuan@gmail.com', 0, N'Phan Minh Tuan', 0, N'$2a$10$eWdqZlPWSSHJLscyLF9oOOHsXtW1gHZUHdTeVhSzuVLs161ROdHVi', N'0485454', N'tuanmino96', NULL, NULL, NULL, NULL, 3)
INSERT [dbo].[account] ([dtype], [id], [dia_chi], [email], [gender], [ho_ten], [is_delete], [password], [so_dien_thoai], [username], [join_date], [add_date], [company], [school], [role_id]) VALUES (N'User', 4, N'Ha nOI', N'tuanpm@sis.com', 0, N'Phan Minh Tuan', 0, N'$2a$10$RF.fBEwxYgFYXNbnNMZJDea9jwntt0B14PDCZ6r.knTufQUJanYlS', N'1243645645', NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[account] ([dtype], [id], [dia_chi], [email], [gender], [ho_ten], [is_delete], [password], [so_dien_thoai], [username], [join_date], [add_date], [company], [school], [role_id]) VALUES (N'User', 5, N'Thanh Hoa', N'Loidz@gmail.com', 0, N'Le Van Thang', 0, N'$2a$10$V2EuUk//pnzeCAo/Hp1NZOpOm6y.YpPG7/7T.IR1HKnYTZqSZy5iu', N'0325411202', NULL, NULL, NULL, NULL, NULL, 2)
INSERT [dbo].[account] ([dtype], [id], [dia_chi], [email], [gender], [ho_ten], [is_delete], [password], [so_dien_thoai], [username], [join_date], [add_date], [company], [school], [role_id]) VALUES (N'User', 1005, NULL, N'user1@gmail.com', 0, NULL, 0, N'$2a$10$IEvoaTIZpAnMwbUdqM27Yu6qV.VG3ntekO3HO4DAGFt6irljMfEXG', NULL, N'tuanmino96', NULL, CAST(N'2021-12-21T21:52:12.6630000' AS DateTime2), NULL, NULL, 2)
INSERT [dbo].[account] ([dtype], [id], [dia_chi], [email], [gender], [ho_ten], [is_delete], [password], [so_dien_thoai], [username], [join_date], [add_date], [company], [school], [role_id]) VALUES (N'User', 1006, NULL, N'uservip1@gmail.com', 0, NULL, 0, N'$2a$10$Xo2uqij.EHDlIbmpvKkVX.vTiIM.QZfGAfoLe0CYTgq.jV2AMsRVO', NULL, N'tuanmino97', NULL, CAST(N'2021-12-21T21:52:12.7870000' AS DateTime2), NULL, NULL, 3)
INSERT [dbo].[account] ([dtype], [id], [dia_chi], [email], [gender], [ho_ten], [is_delete], [password], [so_dien_thoai], [username], [join_date], [add_date], [company], [school], [role_id]) VALUES (N'User', 1007, NULL, N'uservip2@gmail.com', 0, NULL, 0, N'$2a$10$HKAABWQhyrE8smvFJwJzrepgavhAz3p4cMi5WbbR2velGUemhJ.yq', NULL, N'tuanmino98', NULL, CAST(N'2021-12-21T21:52:12.8790000' AS DateTime2), NULL, NULL, 3)
INSERT [dbo].[account] ([dtype], [id], [dia_chi], [email], [gender], [ho_ten], [is_delete], [password], [so_dien_thoai], [username], [join_date], [add_date], [company], [school], [role_id]) VALUES (N'User', 1008, NULL, N'uservip3@gmail.com', 0, NULL, 0, N'$2a$10$wVsp9XRkYn0p1VGbTeppG.yIHdOwcUtxrLHRg.uCl/uPpwYxOkz.a', NULL, N'tuanmino99', NULL, CAST(N'2021-12-21T21:52:12.9700000' AS DateTime2), NULL, NULL, 3)
INSERT [dbo].[account] ([dtype], [id], [dia_chi], [email], [gender], [ho_ten], [is_delete], [password], [so_dien_thoai], [username], [join_date], [add_date], [company], [school], [role_id]) VALUES (N'User', 1009, NULL, N'uservip4@gmail.com', 0, NULL, 0, N'$2a$10$UzDjH0LoM21NstfqEf7jM.eyTjTCSV4cwpIpSeY2XrlzuxeT2tYvu', NULL, N'tuanmino2k', NULL, CAST(N'2021-12-21T21:52:13.0610000' AS DateTime2), NULL, NULL, 3)
INSERT [dbo].[account] ([dtype], [id], [dia_chi], [email], [gender], [ho_ten], [is_delete], [password], [so_dien_thoai], [username], [join_date], [add_date], [company], [school], [role_id]) VALUES (N'ManagerAdmin', 1010, NULL, N'Thangdz2@gmail.com', 0, NULL, 0, N'$2a$10$V2EuUk//pnzeCAo/Hp1NZOpOm6y.YpPG7/7T.IR1HKnYTZqSZy5iu', NULL, N'tuanmino2k2', NULL, NULL, NULL, NULL, 5)
INSERT [dbo].[account] ([dtype], [id], [dia_chi], [email], [gender], [ho_ten], [is_delete], [password], [so_dien_thoai], [username], [join_date], [add_date], [company], [school], [role_id]) VALUES (N'ContentAdmin', 1011, NULL, N'manageradmin1@gmail.com', 0, NULL, 0, N'$2a$10$WFlhrGfT7oFj1486GejUN.ZJDHNFsAJkYU6.H61nR0sxYd2hwfLuC', NULL, N'tuanmino2k3', NULL, NULL, NULL, NULL, 4)
INSERT [dbo].[account] ([dtype], [id], [dia_chi], [email], [gender], [ho_ten], [is_delete], [password], [so_dien_thoai], [username], [join_date], [add_date], [company], [school], [role_id]) VALUES (N'TutorialAdmin', 1012, NULL, N'Thangdz@gmail.com', 0, NULL, 0, N'$2a$10$V2EuUk//pnzeCAo/Hp1NZOpOm6y.YpPG7/7T.IR1HKnYTZqSZy5iu', NULL, N'tuanmino2k4', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[account] ([dtype], [id], [dia_chi], [email], [gender], [ho_ten], [is_delete], [password], [so_dien_thoai], [username], [join_date], [add_date], [company], [school], [role_id]) VALUES (N'ContentAdmin', 1013, NULL, N'contentadmin1@gmail.com', 0, NULL, 0, N'$2a$10$iyVnSUi.Ik2DbKICj3OKF.XHX/g3KEhHmawjUd9k/jUe8Galb4lIK', NULL, N'tuanmino2k2', NULL, NULL, NULL, NULL, 4)
INSERT [dbo].[account] ([dtype], [id], [dia_chi], [email], [gender], [ho_ten], [is_delete], [password], [so_dien_thoai], [username], [join_date], [add_date], [company], [school], [role_id]) VALUES (N'ManagerAdmin', 1014, NULL, N'manageradmin1@gmail.com', 0, NULL, 0, N'$2a$10$Mw1WK4JU99B7CSdMOxGVLOnBOfpA/4jkNaPalEy7BearhpjU8uiAq', NULL, N'tuanmino2k3', NULL, NULL, NULL, NULL, 5)
INSERT [dbo].[account] ([dtype], [id], [dia_chi], [email], [gender], [ho_ten], [is_delete], [password], [so_dien_thoai], [username], [join_date], [add_date], [company], [school], [role_id]) VALUES (N'TutorialAdmin', 1015, NULL, N'ttadmin1@gmail.com', 0, NULL, 0, N'$2a$10$.90EpIZ7OM1dWNYWoAq5kerHnH4RUbMW8o3rt2Su1rx2eo.qZWuC.', NULL, N'tuanmino2k4', NULL, NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[account] OFF
SET IDENTITY_INSERT [dbo].[exam] ON 

INSERT [dbo].[exam] ([id_exam], [thumbnail], [count_test], [date_add], [description], [level], [title], [update_by], [update_date], [user_add_id], [count_rate]) VALUES (1, N'mini-test.png', 136097, CAST(N'2021-12-13' AS Date), NULL, N'1', N'Bai thi thu 1', NULL, NULL, 1, 5)
INSERT [dbo].[exam] ([id_exam], [thumbnail], [count_test], [date_add], [description], [level], [title], [update_by], [update_date], [user_add_id], [count_rate]) VALUES (2, N'mini-test.png', 1232, CAST(N'2021-12-14' AS Date), NULL, N'2', N'Bai thi thu 2', NULL, NULL, 1, 4)
INSERT [dbo].[exam] ([id_exam], [thumbnail], [count_test], [date_add], [description], [level], [title], [update_by], [update_date], [user_add_id], [count_rate]) VALUES (3, N'mini-test.png', 6, CAST(N'2021-12-15' AS Date), NULL, N'3', N'Bai thi thu 3', NULL, NULL, 1, 5)
INSERT [dbo].[exam] ([id_exam], [thumbnail], [count_test], [date_add], [description], [level], [title], [update_by], [update_date], [user_add_id], [count_rate]) VALUES (4, N'mini-test.png', 0, CAST(N'2021-12-16' AS Date), NULL, N'1', N'Bai thi thu 4', NULL, NULL, 1, 3)
INSERT [dbo].[exam] ([id_exam], [thumbnail], [count_test], [date_add], [description], [level], [title], [update_by], [update_date], [user_add_id], [count_rate]) VALUES (5, N'mini-test.png', 1453546, CAST(N'2021-12-17' AS Date), NULL, N'2', N'Bai thi thu 5', NULL, NULL, 1, 2)
INSERT [dbo].[exam] ([id_exam], [thumbnail], [count_test], [date_add], [description], [level], [title], [update_by], [update_date], [user_add_id], [count_rate]) VALUES (6, N'num2.jpg', 454, CAST(N'2021-12-18' AS Date), NULL, NULL, N'Bai thi thu 6', NULL, NULL, 1, 1)
INSERT [dbo].[exam] ([id_exam], [thumbnail], [count_test], [date_add], [description], [level], [title], [update_by], [update_date], [user_add_id], [count_rate]) VALUES (11, N'thumbnail.png', 0, NULL, N'Exam4', N'2', N'Exam4', NULL, NULL, NULL, 0)
INSERT [dbo].[exam] ([id_exam], [thumbnail], [count_test], [date_add], [description], [level], [title], [update_by], [update_date], [user_add_id], [count_rate]) VALUES (12, N'thumbnail.png', 0, NULL, N'Exam5', N'2', N'Exam5', NULL, NULL, NULL, 0)
INSERT [dbo].[exam] ([id_exam], [thumbnail], [count_test], [date_add], [description], [level], [title], [update_by], [update_date], [user_add_id], [count_rate]) VALUES (13, N'thumbnail.png', 0, NULL, N'Exam6', N'2', N'Exam6', NULL, NULL, NULL, 0)
INSERT [dbo].[exam] ([id_exam], [thumbnail], [count_test], [date_add], [description], [level], [title], [update_by], [update_date], [user_add_id], [count_rate]) VALUES (14, N'thumbnail.png', 0, NULL, N'qwewq', N'2', N'Exam7', NULL, NULL, NULL, 0)
INSERT [dbo].[exam] ([id_exam], [thumbnail], [count_test], [date_add], [description], [level], [title], [update_by], [update_date], [user_add_id], [count_rate]) VALUES (15, N'thumbnail.png', 0, NULL, N'123', N'2', N'qwe1', NULL, NULL, NULL, 0)
INSERT [dbo].[exam] ([id_exam], [thumbnail], [count_test], [date_add], [description], [level], [title], [update_by], [update_date], [user_add_id], [count_rate]) VALUES (16, N'thumbnail.png', 0, NULL, N'123', N'2', N'qwe2', NULL, NULL, NULL, 0)
INSERT [dbo].[exam] ([id_exam], [thumbnail], [count_test], [date_add], [description], [level], [title], [update_by], [update_date], [user_add_id], [count_rate]) VALUES (17, N'thumbnail.png', 0, NULL, N'123', N'2', N'qwe3', NULL, NULL, NULL, 0)
INSERT [dbo].[exam] ([id_exam], [thumbnail], [count_test], [date_add], [description], [level], [title], [update_by], [update_date], [user_add_id], [count_rate]) VALUES (18, N'thumbnail.png', 0, NULL, N'qqwe', N'2', N'qwe4', NULL, NULL, NULL, 0)
INSERT [dbo].[exam] ([id_exam], [thumbnail], [count_test], [date_add], [description], [level], [title], [update_by], [update_date], [user_add_id], [count_rate]) VALUES (19, N'thumbnail.png', 0, NULL, N'qqwe', N'2', N'qwe5', NULL, NULL, NULL, 0)
INSERT [dbo].[exam] ([id_exam], [thumbnail], [count_test], [date_add], [description], [level], [title], [update_by], [update_date], [user_add_id], [count_rate]) VALUES (20, N'thumbnail.png', 0, NULL, N'123123', N'2', N'qwe6', NULL, NULL, NULL, 0)
INSERT [dbo].[exam] ([id_exam], [thumbnail], [count_test], [date_add], [description], [level], [title], [update_by], [update_date], [user_add_id], [count_rate]) VALUES (21, N'thumbnail.png', 0, NULL, N'123', N'2', N'qwer1', NULL, NULL, NULL, 0)
INSERT [dbo].[exam] ([id_exam], [thumbnail], [count_test], [date_add], [description], [level], [title], [update_by], [update_date], [user_add_id], [count_rate]) VALUES (22, N'thumbnail.png', 0, NULL, N'123', N'2', N'qwer2', NULL, NULL, NULL, 0)
INSERT [dbo].[exam] ([id_exam], [thumbnail], [count_test], [date_add], [description], [level], [title], [update_by], [update_date], [user_add_id], [count_rate]) VALUES (23, N'thumbnail.png', 0, NULL, N'123123', N'2', N'qwer3', NULL, NULL, NULL, 0)
INSERT [dbo].[exam] ([id_exam], [thumbnail], [count_test], [date_add], [description], [level], [title], [update_by], [update_date], [user_add_id], [count_rate]) VALUES (24, N'thumbnail.png', 0, CAST(N'2021-12-20' AS Date), N'q1', N'1', N'q1', NULL, NULL, NULL, 0)
INSERT [dbo].[exam] ([id_exam], [thumbnail], [count_test], [date_add], [description], [level], [title], [update_by], [update_date], [user_add_id], [count_rate]) VALUES (25, N'thumbnail.png', 0, CAST(N'2021-12-20' AS Date), N'12', N'2', N'q2', NULL, NULL, NULL, 0)
INSERT [dbo].[exam] ([id_exam], [thumbnail], [count_test], [date_add], [description], [level], [title], [update_by], [update_date], [user_add_id], [count_rate]) VALUES (26, N'thumbnail.png', 0, CAST(N'2021-12-20' AS Date), N'1312313', N'2', N'q3', NULL, NULL, NULL, 0)
INSERT [dbo].[exam] ([id_exam], [thumbnail], [count_test], [date_add], [description], [level], [title], [update_by], [update_date], [user_add_id], [count_rate]) VALUES (27, N'thumbnail.png', 0, CAST(N'2021-12-20' AS Date), N'1312313', N'2', N'q4', NULL, NULL, NULL, 0)
INSERT [dbo].[exam] ([id_exam], [thumbnail], [count_test], [date_add], [description], [level], [title], [update_by], [update_date], [user_add_id], [count_rate]) VALUES (28, N'thumbnail.png', 0, CAST(N'2021-12-20' AS Date), N'123', N'2', N'q5', NULL, NULL, NULL, 0)
INSERT [dbo].[exam] ([id_exam], [thumbnail], [count_test], [date_add], [description], [level], [title], [update_by], [update_date], [user_add_id], [count_rate]) VALUES (29, N'thumbnail.png', 0, CAST(N'2021-12-20' AS Date), N'q7', N'2', N'q7', NULL, NULL, NULL, 0)
INSERT [dbo].[exam] ([id_exam], [thumbnail], [count_test], [date_add], [description], [level], [title], [update_by], [update_date], [user_add_id], [count_rate]) VALUES (30, N'thumbnail.png', 0, CAST(N'2021-12-20' AS Date), N'w1', N'2', N'w1', NULL, NULL, NULL, 0)
INSERT [dbo].[exam] ([id_exam], [thumbnail], [count_test], [date_add], [description], [level], [title], [update_by], [update_date], [user_add_id], [count_rate]) VALUES (31, N'thumbnail.png', 0, CAST(N'2021-12-24' AS Date), N'w2', N'2', N'w2', NULL, NULL, NULL, 0)
INSERT [dbo].[exam] ([id_exam], [thumbnail], [count_test], [date_add], [description], [level], [title], [update_by], [update_date], [user_add_id], [count_rate]) VALUES (32, N'thumbnail.png', 0, CAST(N'2021-12-24' AS Date), N'w4', N'2', N'w4', NULL, NULL, NULL, 0)
INSERT [dbo].[exam] ([id_exam], [thumbnail], [count_test], [date_add], [description], [level], [title], [update_by], [update_date], [user_add_id], [count_rate]) VALUES (33, N'thumbnail.png', 0, CAST(N'2021-12-24' AS Date), N'Mo ta 33', N'2', N'Exam33', NULL, NULL, NULL, 0)
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
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (38, N'Giai thich 1', NULL, NULL, 262)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (39, N'Giai thich 2', NULL, NULL, 263)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (40, N'Giai thich 3', NULL, NULL, 264)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (41, N'Giai thich 4', NULL, NULL, 265)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (42, N'Giai thich 5', NULL, NULL, 266)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (43, N'Giai thich 6', NULL, NULL, 267)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (44, N'Giai thich 7', NULL, NULL, 268)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (45, N'Giai thich 8', NULL, NULL, 269)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (46, N'Giai thich 9', NULL, NULL, 270)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (47, N'Giai thich 10', NULL, NULL, 271)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (48, N'Giai thich 11', NULL, NULL, 272)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (49, N'Giai thich 12', NULL, NULL, 273)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (50, N'Giai thich 13', NULL, NULL, 274)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (51, N'Giai thich 14', NULL, NULL, 275)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (52, N'Giai thich 15', NULL, NULL, 276)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (53, N'Giai thich 16', NULL, NULL, 277)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (54, N'Giai thich 17', NULL, NULL, 278)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (55, N'Giai thich 18', NULL, NULL, 279)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (56, N'Giai thich 19', NULL, NULL, 280)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (57, N'Giai thich 20', NULL, NULL, 281)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (58, N'Giai thich 21', NULL, NULL, 282)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (59, N'Giai thich 22', NULL, NULL, 283)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (60, N'Giai thich 23', NULL, NULL, 284)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (61, N'Giai thich 24', NULL, NULL, 285)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (62, N'Giai thich 25', NULL, NULL, 286)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (63, N'Giai thich 26', NULL, NULL, 287)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (64, N'Giai thich 27', NULL, NULL, 288)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (65, N'Giai thich 28', NULL, NULL, 289)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (66, N'Giai thich 29', NULL, NULL, 290)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (67, N'Giai thich 30', NULL, NULL, 291)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (68, N'Giai thich 31', NULL, NULL, 292)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (69, N'Giai thich 32', NULL, NULL, 293)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (70, N'Giai thich 33', NULL, NULL, 294)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (71, N'Giai thich 34', NULL, NULL, 295)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (72, N'Giai thich 35', NULL, NULL, 296)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (73, N'Giai thich 36', NULL, NULL, 297)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (74, N'Giai thich 37', NULL, NULL, 298)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (75, N'Giai thich 1', NULL, NULL, 299)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (76, N'Giai thich 2', NULL, NULL, 300)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (77, N'Giai thich 3', NULL, NULL, 301)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (78, N'Giai thich 4', NULL, NULL, 302)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (79, N'Giai thich 5', NULL, NULL, 303)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (80, N'Giai thich 6', NULL, NULL, 304)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (81, N'Giai thich 7', NULL, NULL, 305)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (82, N'Giai thich 8', NULL, NULL, 306)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (83, N'Giai thich 9', NULL, NULL, 307)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (84, N'Giai thich 10', NULL, NULL, 308)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (85, N'Giai thich 11', NULL, NULL, 309)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (86, N'Giai thich 12', NULL, NULL, 310)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (87, N'Giai thich 13', NULL, NULL, 311)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (88, N'Giai thich 14', NULL, NULL, 312)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (89, N'Giai thich 15', NULL, NULL, 313)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (90, N'Giai thich 16', NULL, NULL, 314)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (91, N'Giai thich 17', NULL, NULL, 315)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (92, N'Giai thich 18', NULL, NULL, 316)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (93, N'Giai thich 19', NULL, NULL, 317)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (94, N'Giai thich 20', NULL, NULL, 318)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (95, N'Giai thich 21', NULL, NULL, 319)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (96, N'Giai thich 22', NULL, NULL, 320)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (97, N'Giai thich 23', NULL, NULL, 321)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (98, N'Giai thich 24', NULL, NULL, 322)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (99, N'Giai thich 25', NULL, NULL, 323)
GO
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (100, N'Giai thich 26', NULL, NULL, 324)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (101, N'Giai thich 27', NULL, NULL, 325)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (102, N'Giai thich 28', NULL, NULL, 326)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (103, N'Giai thich 29', NULL, NULL, 327)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (104, N'Giai thich 30', NULL, NULL, 328)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (105, N'Giai thich 31', NULL, NULL, 329)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (106, N'Giai thich 32', NULL, NULL, 330)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (107, N'Giai thich 33', NULL, NULL, 331)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (108, N'Giai thich 34', NULL, NULL, 332)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (109, N'Giai thich 35', NULL, NULL, 333)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (110, N'Giai thich 36', NULL, NULL, 334)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (111, N'Giai thich 37', NULL, NULL, 335)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (112, N'Giai thich 1', NULL, NULL, 336)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (113, N'Giai thich 2', NULL, NULL, 337)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (114, N'Giai thich 3', NULL, NULL, 338)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (115, N'Giai thich 4', NULL, NULL, 339)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (116, N'Giai thich 5', NULL, NULL, 340)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (117, N'Giai thich 6', NULL, NULL, 341)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (118, N'Giai thich 7', NULL, NULL, 342)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (119, N'Giai thich 8', NULL, NULL, 343)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (120, N'Giai thich 9', NULL, NULL, 344)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (121, N'Giai thich 10', NULL, NULL, 345)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (122, N'Giai thich 11', NULL, NULL, 346)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (123, N'Giai thich 12', NULL, NULL, 347)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (124, N'Giai thich 13', NULL, NULL, 348)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (125, N'Giai thich 14', NULL, NULL, 349)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (126, N'Giai thich 15', NULL, NULL, 350)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (127, N'Giai thich 16', NULL, NULL, 351)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (128, N'Giai thich 17', NULL, NULL, 352)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (129, N'Giai thich 18', NULL, NULL, 353)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (130, N'Giai thich 19', NULL, NULL, 354)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (131, N'Giai thich 20', NULL, NULL, 355)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (132, N'Giai thich 21', NULL, NULL, 356)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (133, N'Giai thich 22', NULL, NULL, 357)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (134, N'Giai thich 23', NULL, NULL, 358)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (135, N'Giai thich 24', NULL, NULL, 359)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (136, N'Giai thich 25', NULL, NULL, 360)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (137, N'Giai thich 26', NULL, NULL, 361)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (138, N'Giai thich 27', NULL, NULL, 362)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (139, N'Giai thich 28', NULL, NULL, 363)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (140, N'Giai thich 29', NULL, NULL, 364)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (141, N'Giai thich 30', NULL, NULL, 365)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (142, N'Giai thich 31', NULL, NULL, 366)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (143, N'Giai thich 32', NULL, NULL, 367)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (144, N'Giai thich 33', NULL, NULL, 368)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (145, N'Giai thich 34', NULL, NULL, 369)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (146, N'Giai thich 35', NULL, NULL, 370)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (147, N'Giai thich 36', NULL, NULL, 371)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (148, N'Giai thich 37', NULL, NULL, 372)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (149, N'Giai thich 1', NULL, NULL, 373)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (150, N'Giai thich 2', NULL, NULL, 374)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (151, N'Giai thich 3', NULL, NULL, 375)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (152, N'Giai thich 4', NULL, NULL, 376)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (153, N'Giai thich 5', NULL, NULL, 377)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (154, N'Giai thich 6', NULL, NULL, 378)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (155, N'Giai thich 7', NULL, NULL, 379)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (156, N'Giai thich 8', NULL, NULL, 380)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (157, N'Giai thich 9', NULL, NULL, 381)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (158, N'Giai thich 10', NULL, NULL, 382)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (159, N'Giai thich 11', NULL, NULL, 383)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (160, N'Giai thich 12', NULL, NULL, 384)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (161, N'Giai thich 13', NULL, NULL, 385)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (162, N'Giai thich 14', NULL, NULL, 386)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (163, N'Giai thich 15', NULL, NULL, 387)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (164, N'Giai thich 16', NULL, NULL, 388)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (165, N'Giai thich 17', NULL, NULL, 389)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (166, N'Giai thich 18', NULL, NULL, 390)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (167, N'Giai thich 19', NULL, NULL, 391)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (168, N'Giai thich 20', NULL, NULL, 392)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (169, N'Giai thich 21', NULL, NULL, 393)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (170, N'Giai thich 22', NULL, NULL, 394)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (171, N'Giai thich 23', NULL, NULL, 395)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (172, N'Giai thich 24', NULL, NULL, 396)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (173, N'Giai thich 25', NULL, NULL, 397)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (174, N'Giai thich 26', NULL, NULL, 398)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (175, N'Giai thich 27', NULL, NULL, 399)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (176, N'Giai thich 28', NULL, NULL, 400)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (177, N'Giai thich 29', NULL, NULL, 401)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (178, N'Giai thich 30', NULL, NULL, 402)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (179, N'Giai thich 31', NULL, NULL, 403)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (180, N'Giai thich 32', NULL, NULL, 404)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (181, N'Giai thich 33', NULL, NULL, 405)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (182, N'Giai thich 34', NULL, NULL, 406)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (183, N'Giai thich 35', NULL, NULL, 407)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (184, N'Giai thich 36', NULL, NULL, 408)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (185, N'Giai thich 37', NULL, NULL, 409)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (186, N'Giai thich 1', NULL, NULL, 410)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (187, N'Giai thich 2', NULL, NULL, 411)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (188, N'Giai thich 3', NULL, NULL, 412)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (189, N'Giai thich 4', NULL, NULL, 413)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (190, N'Giai thich 5', NULL, NULL, 414)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (191, N'Giai thich 6', NULL, NULL, 415)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (192, N'Giai thich 7', NULL, NULL, 416)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (193, N'Giai thich 8', NULL, NULL, 417)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (194, N'Giai thich 9', NULL, NULL, 418)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (195, N'Giai thich 10', NULL, NULL, 419)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (196, N'Giai thich 11', NULL, NULL, 420)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (197, N'Giai thich 12', NULL, NULL, 421)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (198, N'Giai thich 13', NULL, NULL, 422)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (199, N'Giai thich 14', NULL, NULL, 423)
GO
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (200, N'Giai thich 15', NULL, NULL, 424)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (201, N'Giai thich 16', NULL, NULL, 425)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (202, N'Giai thich 17', NULL, NULL, 426)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (203, N'Giai thich 18', NULL, NULL, 427)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (204, N'Giai thich 19', NULL, NULL, 428)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (205, N'Giai thich 20', NULL, NULL, 429)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (206, N'Giai thich 21', NULL, NULL, 430)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (207, N'Giai thich 22', NULL, NULL, 431)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (208, N'Giai thich 23', NULL, NULL, 432)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (209, N'Giai thich 24', NULL, NULL, 433)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (210, N'Giai thich 25', NULL, NULL, 434)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (211, N'Giai thich 26', NULL, NULL, 435)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (212, N'Giai thich 27', NULL, NULL, 436)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (213, N'Giai thich 28', NULL, NULL, 437)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (214, N'Giai thich 29', NULL, NULL, 438)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (215, N'Giai thich 30', NULL, NULL, 439)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (216, N'Giai thich 31', NULL, NULL, 440)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (217, N'Giai thich 32', NULL, NULL, 441)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (218, N'Giai thich 33', NULL, NULL, 442)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (219, N'Giai thich 34', NULL, NULL, 443)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (220, N'Giai thich 35', NULL, NULL, 444)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (221, N'Giai thich 36', NULL, NULL, 445)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (222, N'Giai thich 37', NULL, NULL, 446)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (223, N'Giai thich 1', CAST(N'2021-12-24' AS Date), NULL, 447)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (224, N'Giai thich 2', CAST(N'2021-12-24' AS Date), NULL, 448)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (225, N'Giai thich 3', CAST(N'2021-12-24' AS Date), NULL, 449)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (226, N'Giai thich 4', CAST(N'2021-12-24' AS Date), NULL, 450)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (227, N'Giai thich 5', CAST(N'2021-12-24' AS Date), NULL, 451)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (228, N'Giai thich 6', CAST(N'2021-12-24' AS Date), NULL, 452)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (229, N'Giai thich 7', CAST(N'2021-12-24' AS Date), NULL, 453)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (230, N'Giai thich 8', CAST(N'2021-12-24' AS Date), NULL, 454)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (231, N'Giai thich 9', CAST(N'2021-12-24' AS Date), NULL, 455)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (232, N'Giai thich 10', CAST(N'2021-12-24' AS Date), NULL, 456)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (233, N'Giai thich 11', CAST(N'2021-12-24' AS Date), NULL, 457)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (234, N'Giai thich 12', CAST(N'2021-12-24' AS Date), NULL, 458)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (235, N'Giai thich 13', CAST(N'2021-12-24' AS Date), NULL, 459)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (236, N'Giai thich 14', CAST(N'2021-12-24' AS Date), NULL, 460)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (237, N'Giai thich 15', CAST(N'2021-12-24' AS Date), NULL, 461)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (238, N'Giai thich 16', CAST(N'2021-12-24' AS Date), NULL, 462)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (239, N'Giai thich 17', CAST(N'2021-12-24' AS Date), NULL, 463)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (240, N'Giai thich 18', CAST(N'2021-12-24' AS Date), NULL, 464)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (241, N'Giai thich 19', CAST(N'2021-12-24' AS Date), NULL, 465)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (242, N'Giai thich 20', CAST(N'2021-12-24' AS Date), NULL, 466)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (243, N'Giai thich 21', CAST(N'2021-12-24' AS Date), NULL, 467)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (244, N'Giai thich 22', CAST(N'2021-12-24' AS Date), NULL, 468)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (245, N'Giai thich 23', CAST(N'2021-12-24' AS Date), NULL, 469)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (246, N'Giai thich 24', CAST(N'2021-12-24' AS Date), NULL, 470)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (247, N'Giai thich 25', CAST(N'2021-12-24' AS Date), NULL, 471)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (248, N'Giai thich 26', CAST(N'2021-12-24' AS Date), NULL, 472)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (249, N'Giai thich 27', CAST(N'2021-12-24' AS Date), NULL, 473)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (250, N'Giai thich 28', CAST(N'2021-12-24' AS Date), NULL, 474)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (251, N'Giai thich 29', CAST(N'2021-12-24' AS Date), NULL, 475)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (252, N'Giai thich 30', CAST(N'2021-12-24' AS Date), NULL, 476)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (253, N'Giai thich 31', CAST(N'2021-12-24' AS Date), NULL, 477)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (254, N'Giai thich 32', CAST(N'2021-12-24' AS Date), NULL, 478)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (255, N'Giai thich 33', CAST(N'2021-12-24' AS Date), NULL, 479)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (256, N'Giai thich 34', CAST(N'2021-12-24' AS Date), NULL, 480)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (257, N'Giai thich 35', CAST(N'2021-12-24' AS Date), NULL, 481)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (258, N'Giai thich 36', CAST(N'2021-12-24' AS Date), NULL, 482)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (259, N'Giai thich 37', CAST(N'2021-12-24' AS Date), NULL, 483)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (260, N'Giai thich 1', CAST(N'2021-12-24' AS Date), NULL, 484)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (261, N'Giai thich 2', CAST(N'2021-12-24' AS Date), NULL, 485)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (262, N'Giai thich 3', CAST(N'2021-12-24' AS Date), NULL, 486)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (263, N'Giai thich 4', CAST(N'2021-12-24' AS Date), NULL, 487)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (264, N'Giai thich 5', CAST(N'2021-12-24' AS Date), NULL, 488)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (265, N'Giai thich 6', CAST(N'2021-12-24' AS Date), NULL, 489)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (266, N'Giai thich 7', CAST(N'2021-12-24' AS Date), NULL, 490)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (267, N'Giai thich 8', CAST(N'2021-12-24' AS Date), NULL, 491)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (268, N'Giai thich 9', CAST(N'2021-12-24' AS Date), NULL, 492)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (269, N'Giai thich 10', CAST(N'2021-12-24' AS Date), NULL, 493)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (270, N'Giai thich 11', CAST(N'2021-12-24' AS Date), NULL, 494)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (271, N'Giai thich 12', CAST(N'2021-12-24' AS Date), NULL, 495)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (272, N'Giai thich 13', CAST(N'2021-12-24' AS Date), NULL, 496)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (273, N'Giai thich 14', CAST(N'2021-12-24' AS Date), NULL, 497)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (274, N'Giai thich 15', CAST(N'2021-12-24' AS Date), NULL, 498)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (275, N'Giai thich 16', CAST(N'2021-12-24' AS Date), NULL, 499)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (276, N'Giai thich 17', CAST(N'2021-12-24' AS Date), NULL, 500)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (277, N'Giai thich 18', CAST(N'2021-12-24' AS Date), NULL, 501)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (278, N'Giai thich 19', CAST(N'2021-12-24' AS Date), NULL, 502)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (279, N'Giai thich 20', CAST(N'2021-12-24' AS Date), NULL, 503)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (280, N'Giai thich 21', CAST(N'2021-12-24' AS Date), NULL, 504)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (281, N'Giai thich 22', CAST(N'2021-12-24' AS Date), NULL, 505)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (282, N'Giai thich 23', CAST(N'2021-12-24' AS Date), NULL, 506)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (283, N'Giai thich 24', CAST(N'2021-12-24' AS Date), NULL, 507)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (284, N'Giai thich 25', CAST(N'2021-12-24' AS Date), NULL, 508)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (285, N'Giai thich 26', CAST(N'2021-12-24' AS Date), NULL, 509)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (286, N'Giai thich 27', CAST(N'2021-12-24' AS Date), NULL, 510)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (287, N'Giai thich 28', CAST(N'2021-12-24' AS Date), NULL, 511)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (288, N'Giai thich 29', CAST(N'2021-12-24' AS Date), NULL, 512)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (289, N'Giai thich 30', CAST(N'2021-12-24' AS Date), NULL, 513)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (290, N'Giai thich 31', CAST(N'2021-12-24' AS Date), NULL, 514)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (291, N'Giai thich 32', CAST(N'2021-12-24' AS Date), NULL, 515)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (292, N'Giai thich 33', CAST(N'2021-12-24' AS Date), NULL, 516)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (293, N'Giai thich 34', CAST(N'2021-12-24' AS Date), NULL, 517)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (294, N'Giai thich 35', CAST(N'2021-12-24' AS Date), NULL, 518)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (295, N'Giai thich 36', CAST(N'2021-12-24' AS Date), NULL, 519)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (296, N'Giai thich 37', CAST(N'2021-12-24' AS Date), NULL, 520)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (297, N'Giai thich 1', CAST(N'2021-12-24' AS Date), NULL, 521)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (298, N'Giai thich 2', CAST(N'2021-12-24' AS Date), NULL, 522)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (299, N'Giai thich 3', CAST(N'2021-12-24' AS Date), NULL, 523)
GO
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (300, N'Giai thich 4', CAST(N'2021-12-24' AS Date), NULL, 524)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (301, N'Giai thich 5', CAST(N'2021-12-24' AS Date), NULL, 525)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (302, N'Giai thich 6', CAST(N'2021-12-24' AS Date), NULL, 526)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (303, N'Giai thich 7', CAST(N'2021-12-24' AS Date), NULL, 527)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (304, N'Giai thich 8', CAST(N'2021-12-24' AS Date), NULL, 528)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (305, N'Giai thich 9', CAST(N'2021-12-24' AS Date), NULL, 529)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (306, N'Giai thich 10', CAST(N'2021-12-24' AS Date), NULL, 530)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (307, N'Giai thich 11', CAST(N'2021-12-24' AS Date), NULL, 531)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (308, N'Giai thich 12', CAST(N'2021-12-24' AS Date), NULL, 532)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (309, N'Giai thich 13', CAST(N'2021-12-24' AS Date), NULL, 533)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (310, N'Giai thich 14', CAST(N'2021-12-24' AS Date), NULL, 534)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (311, N'Giai thich 15', CAST(N'2021-12-24' AS Date), NULL, 535)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (312, N'Giai thich 16', CAST(N'2021-12-24' AS Date), NULL, 536)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (313, N'Giai thich 17', CAST(N'2021-12-24' AS Date), NULL, 537)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (314, N'Giai thich 18', CAST(N'2021-12-24' AS Date), NULL, 538)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (315, N'Giai thich 19', CAST(N'2021-12-24' AS Date), NULL, 539)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (316, N'Giai thich 20', CAST(N'2021-12-24' AS Date), NULL, 540)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (317, N'Giai thich 21', CAST(N'2021-12-24' AS Date), NULL, 541)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (318, N'Giai thich 22', CAST(N'2021-12-24' AS Date), NULL, 542)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (319, N'Giai thich 23', CAST(N'2021-12-24' AS Date), NULL, 543)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (320, N'Giai thich 24', CAST(N'2021-12-24' AS Date), NULL, 544)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (321, N'Giai thich 25', CAST(N'2021-12-24' AS Date), NULL, 545)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (322, N'Giai thich 26', CAST(N'2021-12-24' AS Date), NULL, 546)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (323, N'Giai thich 27', CAST(N'2021-12-24' AS Date), NULL, 547)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (324, N'Giai thich 28', CAST(N'2021-12-24' AS Date), NULL, 548)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (325, N'Giai thich 29', CAST(N'2021-12-24' AS Date), NULL, 549)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (326, N'Giai thich 30', CAST(N'2021-12-24' AS Date), NULL, 550)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (327, N'Giai thich 31', CAST(N'2021-12-24' AS Date), NULL, 551)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (328, N'Giai thich 32', CAST(N'2021-12-24' AS Date), NULL, 552)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (329, N'Giai thich 33', CAST(N'2021-12-24' AS Date), NULL, 553)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (330, N'Giai thich 34', CAST(N'2021-12-24' AS Date), NULL, 554)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (331, N'Giai thich 35', CAST(N'2021-12-24' AS Date), NULL, 555)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (332, N'Giai thich 36', CAST(N'2021-12-24' AS Date), NULL, 556)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (333, N'Giai thich 37', CAST(N'2021-12-24' AS Date), NULL, 557)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (334, N'Giai thich 1', CAST(N'2021-12-24' AS Date), NULL, 558)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (335, N'Giai thich 2', CAST(N'2021-12-24' AS Date), NULL, 559)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (336, N'Giai thich 3', CAST(N'2021-12-24' AS Date), NULL, 560)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (337, N'Giai thich 4', CAST(N'2021-12-24' AS Date), NULL, 561)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (338, N'Giai thich 5', CAST(N'2021-12-24' AS Date), NULL, 562)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (339, N'Giai thich 6', CAST(N'2021-12-24' AS Date), NULL, 563)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (340, N'Giai thich 7', CAST(N'2021-12-24' AS Date), NULL, 564)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (341, N'Giai thich 8', CAST(N'2021-12-24' AS Date), NULL, 565)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (342, N'Giai thich 9', CAST(N'2021-12-24' AS Date), NULL, 566)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (343, N'Giai thich 10', CAST(N'2021-12-24' AS Date), NULL, 567)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (344, N'Giai thich 11', CAST(N'2021-12-24' AS Date), NULL, 568)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (345, N'Giai thich 12', CAST(N'2021-12-24' AS Date), NULL, 569)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (346, N'Giai thich 13', CAST(N'2021-12-24' AS Date), NULL, 570)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (347, N'Giai thich 14', CAST(N'2021-12-24' AS Date), NULL, 571)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (348, N'Giai thich 15', CAST(N'2021-12-24' AS Date), NULL, 572)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (349, N'Giai thich 16', CAST(N'2021-12-24' AS Date), NULL, 573)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (350, N'Giai thich 17', CAST(N'2021-12-24' AS Date), NULL, 574)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (351, N'Giai thich 18', CAST(N'2021-12-24' AS Date), NULL, 575)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (352, N'Giai thich 19', CAST(N'2021-12-24' AS Date), NULL, 576)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (353, N'Giai thich 20', CAST(N'2021-12-24' AS Date), NULL, 577)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (354, N'Giai thich 21', CAST(N'2021-12-24' AS Date), NULL, 578)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (355, N'Giai thich 22', CAST(N'2021-12-24' AS Date), NULL, 579)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (356, N'Giai thich 23', CAST(N'2021-12-24' AS Date), NULL, 580)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (357, N'Giai thich 24', CAST(N'2021-12-24' AS Date), NULL, 581)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (358, N'Giai thich 25', CAST(N'2021-12-24' AS Date), NULL, 582)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (359, N'Giai thich 26', CAST(N'2021-12-24' AS Date), NULL, 583)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (360, N'Giai thich 27', CAST(N'2021-12-24' AS Date), NULL, 584)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (361, N'Giai thich 28', CAST(N'2021-12-24' AS Date), NULL, 585)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (362, N'Giai thich 29', CAST(N'2021-12-24' AS Date), NULL, 586)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (363, N'Giai thich 30', CAST(N'2021-12-24' AS Date), NULL, 587)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (364, N'Giai thich 31', CAST(N'2021-12-24' AS Date), NULL, 588)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (365, N'Giai thich 32', CAST(N'2021-12-24' AS Date), NULL, 589)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (366, N'Giai thich 33', CAST(N'2021-12-24' AS Date), NULL, 590)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (367, N'Giai thich 34', CAST(N'2021-12-24' AS Date), NULL, 591)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (368, N'Giai thich 35', CAST(N'2021-12-24' AS Date), NULL, 592)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (369, N'Giai thich 36', CAST(N'2021-12-24' AS Date), NULL, 593)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (370, N'Giai thich 37', CAST(N'2021-12-24' AS Date), NULL, 594)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (371, N'Giai thich 1', CAST(N'2021-12-24' AS Date), NULL, 595)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (372, N'Giai thich 2', CAST(N'2021-12-24' AS Date), NULL, 596)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (373, N'Giai thich 3', CAST(N'2021-12-24' AS Date), NULL, 597)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (374, N'Giai thich 4', CAST(N'2021-12-24' AS Date), NULL, 598)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (375, N'Giai thich 5', CAST(N'2021-12-24' AS Date), NULL, 599)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (376, N'Giai thich 6', CAST(N'2021-12-24' AS Date), NULL, 600)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (377, N'Giai thich 7', CAST(N'2021-12-24' AS Date), NULL, 601)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (378, N'Giai thich 8', CAST(N'2021-12-24' AS Date), NULL, 602)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (379, N'Giai thich 9', CAST(N'2021-12-24' AS Date), NULL, 603)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (380, N'Giai thich 10', CAST(N'2021-12-24' AS Date), NULL, 604)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (381, N'Giai thich 11', CAST(N'2021-12-24' AS Date), NULL, 605)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (382, N'Giai thich 12', CAST(N'2021-12-24' AS Date), NULL, 606)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (383, N'Giai thich 13', CAST(N'2021-12-24' AS Date), NULL, 607)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (384, N'Giai thich 14', CAST(N'2021-12-24' AS Date), NULL, 608)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (385, N'Giai thich 15', CAST(N'2021-12-24' AS Date), NULL, 609)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (386, N'Giai thich 16', CAST(N'2021-12-24' AS Date), NULL, 610)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (387, N'Giai thich 17', CAST(N'2021-12-24' AS Date), NULL, 611)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (388, N'Giai thich 18', CAST(N'2021-12-24' AS Date), NULL, 612)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (389, N'Giai thich 19', CAST(N'2021-12-24' AS Date), NULL, 613)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (390, N'Giai thich 20', CAST(N'2021-12-24' AS Date), NULL, 614)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (391, N'Giai thich 21', CAST(N'2021-12-24' AS Date), NULL, 615)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (392, N'Giai thich 22', CAST(N'2021-12-24' AS Date), NULL, 616)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (393, N'Giai thich 23', CAST(N'2021-12-24' AS Date), NULL, 617)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (394, N'Giai thich 24', CAST(N'2021-12-24' AS Date), NULL, 618)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (395, N'Giai thich 25', CAST(N'2021-12-24' AS Date), NULL, 619)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (396, N'Giai thich 26', CAST(N'2021-12-24' AS Date), NULL, 620)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (397, N'Giai thich 27', CAST(N'2021-12-24' AS Date), NULL, 621)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (398, N'Giai thich 28', CAST(N'2021-12-24' AS Date), NULL, 622)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (399, N'Giai thich 29', CAST(N'2021-12-24' AS Date), NULL, 623)
GO
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (400, N'Giai thich 30', CAST(N'2021-12-24' AS Date), NULL, 624)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (401, N'Giai thich 31', CAST(N'2021-12-24' AS Date), NULL, 625)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (402, N'Giai thich 32', CAST(N'2021-12-24' AS Date), NULL, 626)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (403, N'Giai thich 33', CAST(N'2021-12-24' AS Date), NULL, 627)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (404, N'Giai thich 34', CAST(N'2021-12-24' AS Date), NULL, 628)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (405, N'Giai thich 35', CAST(N'2021-12-24' AS Date), NULL, 629)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (406, N'Giai thich 36', CAST(N'2021-12-24' AS Date), NULL, 630)
INSERT [dbo].[explain_detail] ([id_explain], [explain], [update_date], [id_admin_id], [question_cauhoibaithithuid]) VALUES (407, N'Giai thich 37', CAST(N'2021-12-24' AS Date), NULL, 631)
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
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (167, NULL, N'A', NULL, 1, NULL, NULL, NULL, NULL, NULL, N'', NULL, NULL, 13, 1, 22)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (168, NULL, N'A', NULL, 2, NULL, NULL, NULL, NULL, NULL, N'', NULL, NULL, 13, 1, 23)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (169, NULL, N'A', NULL, 3, NULL, NULL, NULL, NULL, NULL, N'', NULL, NULL, 13, 2, 24)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (170, NULL, N'A', NULL, 1, N'', N'', N'', N'', NULL, N'', NULL, NULL, 14, 1, 25)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (171, NULL, N'A', NULL, 2, N'', N'', N'', N'', NULL, N'', NULL, NULL, 14, 1, 26)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (172, NULL, N'A', NULL, 3, N'', N'', N'', N'', NULL, N'', NULL, NULL, 14, 2, 27)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (173, NULL, N'A', NULL, 1, N'', N'', N'', N'', NULL, N'', NULL, NULL, 15, 1, 28)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (174, NULL, N'A', NULL, 2, N'', N'', N'', N'', NULL, N'', NULL, NULL, 15, 1, 29)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (175, NULL, N'A', NULL, 3, N'', N'', N'', N'', NULL, N'', NULL, NULL, 15, 2, 30)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (176, NULL, N'A', NULL, 1, N'', N'', N'', N'', NULL, N'', NULL, NULL, 16, 1, 31)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (177, NULL, N'A', NULL, 2, N'', N'', N'', N'', NULL, N'', NULL, NULL, 16, 1, 32)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (178, NULL, N'A', NULL, 3, N'', N'', N'', N'', NULL, N'', NULL, NULL, 16, 2, 33)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (179, NULL, N'A', NULL, 4, N'', N'', N'', N'', NULL, N'', NULL, NULL, 16, 2, 33)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (180, NULL, N'A', NULL, 5, N'', N'', N'', N'', NULL, N'', NULL, NULL, 16, 2, 33)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (181, NULL, N'A', NULL, 6, N'', N'', N'', N'', NULL, N'', NULL, NULL, 16, 2, 33)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (182, NULL, N'A', NULL, 7, N'', N'', N'', N'', NULL, N'', NULL, NULL, 16, 2, 33)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (183, NULL, N'A', NULL, 1, N'', N'', N'', N'', NULL, N'', NULL, NULL, 17, 1, 35)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (184, NULL, N'A', NULL, 2, N'', N'', N'', N'', NULL, N'', NULL, NULL, 17, 1, 36)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (185, NULL, N'A', NULL, 3, N'', N'', N'', N'', NULL, N'', NULL, NULL, 17, 2, 37)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (186, NULL, N'A', NULL, 4, N'', N'', N'', N'', NULL, N'', NULL, NULL, 17, 2, 37)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (187, NULL, N'A', NULL, 5, N'', N'', N'', N'', NULL, N'', NULL, NULL, 17, 2, 37)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (188, NULL, N'A', NULL, 6, N'', N'', N'', N'', NULL, N'', NULL, NULL, 17, 2, 37)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (189, NULL, N'A', NULL, 7, N'', N'', N'', N'', NULL, N'', NULL, NULL, 17, 2, 37)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (190, NULL, N'A', NULL, 1, N'', N'', N'', N'', NULL, N'', NULL, NULL, 18, 1, 39)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (191, NULL, N'A', NULL, 2, N'', N'', N'', N'', NULL, N'', NULL, NULL, 18, 1, 40)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (192, NULL, N'A', NULL, 3, N'', N'', N'', N'', NULL, N'', NULL, NULL, 18, 2, 41)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (193, NULL, N'A', NULL, 4, N'', N'', N'', N'', NULL, N'', NULL, NULL, 18, 2, 41)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (194, NULL, N'A', NULL, 5, N'', N'', N'', N'', NULL, N'', NULL, NULL, 18, 2, 41)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (195, NULL, N'A', NULL, 6, N'', N'', N'', N'', NULL, N'', NULL, NULL, 18, 2, 41)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (196, NULL, N'A', NULL, 7, N'', N'', N'', N'', NULL, N'', NULL, NULL, 18, 2, 41)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (197, NULL, N'A', NULL, 1, N'', N'', N'', N'', NULL, N'', NULL, NULL, 19, 1, 43)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (198, NULL, N'A', NULL, 2, N'', N'', N'', N'', NULL, N'', NULL, NULL, 19, 1, 44)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (199, NULL, N'A', NULL, 3, N'', N'', N'', N'', NULL, N'', NULL, NULL, 19, 2, 45)
GO
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (200, NULL, N'A', NULL, 4, N'', N'', N'', N'', NULL, N'', NULL, NULL, 19, 2, 45)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (201, NULL, N'A', NULL, 5, N'', N'', N'', N'', NULL, N'', NULL, NULL, 19, 2, 45)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (202, NULL, N'A', NULL, 6, N'', N'', N'', N'', NULL, N'', NULL, NULL, 19, 2, 45)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (203, NULL, N'A', NULL, 7, N'', N'', N'', N'', NULL, N'', NULL, NULL, 19, 2, 45)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (204, NULL, N'A', NULL, 1, N'', N'', N'', N'', NULL, N'', NULL, NULL, 20, 1, 47)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (205, NULL, N'A', NULL, 2, N'', N'', N'', N'', NULL, N'', NULL, NULL, 20, 1, 48)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (206, NULL, N'A', NULL, 3, N'', N'', N'', N'', NULL, N'', NULL, NULL, 20, 2, 49)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (207, NULL, N'A', NULL, 4, N'', N'', N'', N'', NULL, N'', NULL, NULL, 20, 2, 49)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (208, NULL, N'A', NULL, 5, N'', N'', N'', N'', NULL, N'', NULL, NULL, 20, 2, 49)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (209, NULL, N'A', NULL, 6, N'', N'', N'', N'', NULL, N'', NULL, NULL, 20, 2, 49)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (210, NULL, N'A', NULL, 7, N'', N'', N'', N'', NULL, N'', NULL, NULL, 20, 2, 49)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (211, NULL, N'A', NULL, 1, N'', N'', N'', N'', NULL, N'', NULL, NULL, 21, 1, 51)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (212, NULL, N'A', NULL, 2, N'', N'', N'', N'', NULL, N'', NULL, NULL, 21, 1, 52)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (213, NULL, N'A', NULL, 3, N'', N'', N'', N'', NULL, N'', NULL, NULL, 21, 2, 53)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (214, NULL, N'A', NULL, 4, N'', N'', N'', N'', NULL, N'', NULL, NULL, 21, 2, 53)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (215, NULL, N'A', NULL, 5, N'', N'', N'', N'', NULL, N'', NULL, NULL, 21, 2, 53)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (216, NULL, N'A', NULL, 6, N'', N'', N'', N'', NULL, N'', NULL, NULL, 21, 2, 53)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (217, NULL, N'A', NULL, 7, N'', N'', N'', N'', NULL, N'', NULL, NULL, 21, 2, 53)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (218, NULL, N'A', NULL, 1, N'', N'', N'', N'', NULL, N'', NULL, NULL, 22, 1, 55)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (219, NULL, N'A', NULL, 2, N'', N'', N'', N'', NULL, N'', NULL, NULL, 22, 1, 56)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (220, NULL, N'A', NULL, 3, N'', N'', N'', N'', NULL, N'', NULL, NULL, 22, 2, 57)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (221, NULL, N'A', NULL, 4, N'', N'', N'', N'', NULL, N'', NULL, NULL, 22, 2, 57)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (222, NULL, N'A', NULL, 5, N'', N'', N'', N'', NULL, N'', NULL, NULL, 22, 2, 57)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (223, NULL, N'A', NULL, 6, N'', N'', N'', N'', NULL, N'', NULL, NULL, 22, 2, 57)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (224, NULL, N'A', NULL, 7, N'', N'', N'', N'', NULL, N'', NULL, NULL, 22, 2, 57)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (225, NULL, N'A', NULL, 1, NULL, NULL, NULL, NULL, NULL, N'', NULL, NULL, 23, 1, 59)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (226, NULL, N'A', NULL, 2, NULL, NULL, NULL, NULL, NULL, N'', NULL, NULL, 23, 1, 60)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (227, NULL, N'A', NULL, 3, NULL, NULL, NULL, NULL, NULL, N'', NULL, NULL, 23, 2, 61)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (228, NULL, N'A', NULL, 4, NULL, NULL, NULL, NULL, NULL, N'', NULL, NULL, 23, 2, 61)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (229, NULL, N'A', NULL, 5, NULL, NULL, NULL, NULL, NULL, N'', NULL, NULL, 23, 2, 61)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (230, NULL, N'A', NULL, 6, NULL, NULL, NULL, NULL, NULL, N'', NULL, NULL, 23, 2, 61)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (231, NULL, N'A', NULL, 7, NULL, NULL, NULL, NULL, NULL, N'', NULL, NULL, 23, 2, 61)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (232, NULL, N'A', NULL, 8, N'20.0', N'40.0', N'120.0', N'140.0', NULL, N'How much will he pay for the pens?', NULL, NULL, 23, 3, 62)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (233, NULL, N'A', NULL, 9, N'One day', N'One weekend', N'One week', N'One month', NULL, N'According to the speaker, how long will the special offer last?', NULL, NULL, 23, 3, 62)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (234, NULL, N'A', NULL, 10, N'100.0', N'200.0', N'300.0', N'400.0', NULL, N'How much is the special offer?', NULL, NULL, 23, 3, 62)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (235, NULL, N'A', NULL, 11, N'People who want to travel overseas', N'Members who belong to the fitness club', N'Staff who work for the Travel Lodge Inn', N'Those who want to get away for the weekend', NULL, N'Who would be most interested in this advertisement?', NULL, NULL, 23, 3, 63)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (236, NULL, N'A', NULL, 12, N'nearly', N'immediately', N'precisely', N'significantly', NULL, N'Employees who have not yet registered on the new company website must do so ------', NULL, NULL, 23, 3, 63)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (237, NULL, N'A', NULL, 13, N'professional', N'profession', N'professionals', N'professionally', NULL, N'Rosewater Medical Center employs healthcare -------- affiliated with Huron University.', NULL, NULL, 23, 3, 63)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (238, NULL, N'A', NULL, 14, N'indicates', N'commands', N'notices ', N'distributes', NULL, N'Once you have detected a fatal virus on your computer, common sense -------- that you should have your hard drive reformatted by skilled professionals.', NULL, NULL, 23, 4, 64)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (239, NULL, N'A', NULL, 15, N'just ', N'once', N'such', N'likely', NULL, N'Choose the word or phrase that best completes the blanks:', NULL, NULL, 23, 4, 64)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (240, NULL, N'A', NULL, 16, N'would have agreed', N'would agree', N'has agree', N' were agreeing', NULL, N'Choose the word or phrase that best completes the blanks:', NULL, NULL, 23, 4, 64)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (241, NULL, N'A', NULL, 17, N'In fact', N'In spite of', N'On the other hand', N'Even though', NULL, N'Choose the word or phrase that best completes the blanks:', NULL, NULL, 23, 4, 65)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (242, NULL, N'A', NULL, 18, N'The man is finishing his meal', N'The customer is waiting for a table', N'The waiter is setting the table', N'The woman is looking at the menu', NULL, N'Choose the word or phrase that best completes the blanks:', NULL, NULL, 23, 4, 65)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (243, NULL, N'A', NULL, 19, N'He’s handling a tool', N'He’s cutting grass', N'He’s building a bookshelf', N'He’s walking up to the roof', NULL, N'Choose the word or phrase that best completes the blanks:', NULL, NULL, 23, 4, 65)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (244, NULL, N'A', NULL, 20, N'I came in early today', N'Because I had a question', N'By two o’clock at the earliest', N'NULL', NULL, N'Why did you come by yesterday?', NULL, NULL, 23, 5, 66)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (245, NULL, N'A', NULL, 21, N'Yes, I can lend it to you', N'The handle is in the front', N'Yes, that would be nice, thanks', N'NULL', NULL, N'Would you like a hand with your luggage?', NULL, NULL, 23, 5, 66)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (246, NULL, N'A', NULL, 22, N'No, it’s in Los Angeles', N'Yes, he is the boss there', N'He’s on a business trip', N'NULL', NULL, N'Mr. Robertson runs our San Francisco office, doesn’t he?', NULL, NULL, 23, 5, 66)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (247, NULL, N'A', NULL, 23, N'100.0', N'200.0', N'300.0', N'400.0', NULL, N' How many pens does the man need?', NULL, NULL, 23, 5, 66)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (248, NULL, N'A', NULL, 24, N'To write a book', N'For the office employees', N'To make a large drawing', N'To give away at a conference', NULL, N'Why does he need the pens?', NULL, NULL, 23, 5, 66)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (249, NULL, N'A', NULL, 25, N'20.0', N'40.0', N'120.0', N'140.0', NULL, N'How much will he pay for the pens?', NULL, NULL, 23, 5, 67)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (250, NULL, N'A', NULL, 26, N'One day', N'One weekend', N'One week', N'One month', NULL, N'', NULL, NULL, 23, 6, 68)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (251, NULL, N'A', NULL, 27, N'100.0', N'200.0', N'300.0', N'400.0', NULL, N'', NULL, NULL, 23, 6, 68)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (252, NULL, N'A', NULL, 28, N'People who want to travel overseas', N'Members who belong to the fitness club', N'Staff who work for the Travel Lodge Inn', N'Those who want to get away for the weekend', NULL, N'', NULL, NULL, 23, 6, 68)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (253, NULL, N'A', NULL, 29, N'nearly', N'immediately', N'precisely', N'significantly', NULL, N'', NULL, NULL, 23, 6, 69)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (254, NULL, N'A', NULL, 30, N'professional', N'profession', N'professionals', N'professionally', NULL, N'', NULL, NULL, 23, 6, 69)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (255, NULL, N'A', NULL, 31, N'indicates', N'commands', N'notices ', N'distributes', NULL, N'', NULL, NULL, 23, 6, 69)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (256, NULL, N'A', NULL, 32, N'just ', N'once', N'such', N'likely', NULL, N'', NULL, NULL, 23, 7, 70)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (257, NULL, N'A', NULL, 33, N'would have agreed', N'would agree', N'has agree', N' were agreeing', NULL, N'', NULL, NULL, 23, 7, 70)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (258, NULL, N'A', NULL, 34, N'In fact', N'In spite of', N'On the other hand', N'Even though', NULL, N'', NULL, NULL, 23, 7, 70)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (259, NULL, N'A', NULL, 35, N'just ', N'once', N'such', N'likely', NULL, N'', NULL, NULL, 23, 7, 70)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (260, NULL, N'A', NULL, 36, N'would have agreed', N'would agree', N'has agree', N' were agreeing', NULL, N'', NULL, NULL, 23, 7, 70)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (261, NULL, N'A', NULL, 37, N'In fact', N'In spite of', N'On the other hand', N'Even though', NULL, N'', NULL, NULL, 23, 7, 70)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (262, NULL, N'A', NULL, 1, NULL, NULL, NULL, NULL, NULL, N'', NULL, NULL, 24, 1, 71)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (263, NULL, N'A', NULL, 2, NULL, NULL, NULL, NULL, NULL, N'', NULL, NULL, 24, 1, 72)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (264, NULL, N'A', NULL, 3, NULL, NULL, NULL, NULL, NULL, N'', NULL, NULL, 24, 2, 73)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (265, NULL, N'A', NULL, 4, NULL, NULL, NULL, NULL, NULL, N'', NULL, NULL, 24, 2, 73)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (266, NULL, N'A', NULL, 5, NULL, NULL, NULL, NULL, NULL, N'', NULL, NULL, 24, 2, 73)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (267, NULL, N'A', NULL, 6, NULL, NULL, NULL, NULL, NULL, N'', NULL, NULL, 24, 2, 73)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (268, NULL, N'A', NULL, 7, NULL, NULL, NULL, NULL, NULL, N'', NULL, NULL, 24, 2, 73)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (269, NULL, N'A', NULL, 8, N'20.0', N'40.0', N'120.0', N'140.0', NULL, N'How much will he pay for the pens?', NULL, NULL, 24, 3, 74)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (270, NULL, N'A', NULL, 9, N'One day', N'One weekend', N'One week', N'One month', NULL, N'According to the speaker, how long will the special offer last?', NULL, NULL, 24, 3, 74)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (271, NULL, N'A', NULL, 10, N'100.0', N'200.0', N'300.0', N'400.0', NULL, N'How much is the special offer?', NULL, NULL, 24, 3, 74)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (272, NULL, N'A', NULL, 11, N'People who want to travel overseas', N'Members who belong to the fitness club', N'Staff who work for the Travel Lodge Inn', N'Those who want to get away for the weekend', NULL, N'Who would be most interested in this advertisement?', NULL, NULL, 24, 3, 75)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (273, NULL, N'A', NULL, 12, N'nearly', N'immediately', N'precisely', N'significantly', NULL, N'Employees who have not yet registered on the new company website must do so ------', NULL, NULL, 24, 3, 75)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (274, NULL, N'A', NULL, 13, N'professional', N'profession', N'professionals', N'professionally', NULL, N'Rosewater Medical Center employs healthcare -------- affiliated with Huron University.', NULL, NULL, 24, 3, 75)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (275, NULL, N'A', NULL, 14, N'indicates', N'commands', N'notices ', N'distributes', NULL, N'Once you have detected a fatal virus on your computer, common sense -------- that you should have your hard drive reformatted by skilled professionals.', NULL, NULL, 24, 4, 76)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (276, NULL, N'A', NULL, 15, N'just ', N'once', N'such', N'likely', NULL, N'Choose the word or phrase that best completes the blanks:', NULL, NULL, 24, 4, 76)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (277, NULL, N'A', NULL, 16, N'would have agreed', N'would agree', N'has agree', N' were agreeing', NULL, N'Choose the word or phrase that best completes the blanks:', NULL, NULL, 24, 4, 76)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (278, NULL, N'A', NULL, 17, N'In fact', N'In spite of', N'On the other hand', N'Even though', NULL, N'Choose the word or phrase that best completes the blanks:', NULL, NULL, 24, 4, 77)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (279, NULL, N'A', NULL, 18, N'The man is finishing his meal', N'The customer is waiting for a table', N'The waiter is setting the table', N'The woman is looking at the menu', NULL, N'Choose the word or phrase that best completes the blanks:', NULL, NULL, 24, 4, 77)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (280, NULL, N'A', NULL, 19, N'He’s handling a tool', N'He’s cutting grass', N'He’s building a bookshelf', N'He’s walking up to the roof', NULL, N'Choose the word or phrase that best completes the blanks:', NULL, NULL, 24, 4, 77)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (281, NULL, N'A', NULL, 20, N'I came in early today', N'Because I had a question', N'By two o’clock at the earliest', N'NULL', NULL, N'Why did you come by yesterday?', NULL, NULL, 24, 5, 78)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (282, NULL, N'A', NULL, 21, N'Yes, I can lend it to you', N'The handle is in the front', N'Yes, that would be nice, thanks', N'NULL', NULL, N'Would you like a hand with your luggage?', NULL, NULL, 24, 5, 78)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (283, NULL, N'A', NULL, 22, N'No, it’s in Los Angeles', N'Yes, he is the boss there', N'He’s on a business trip', N'NULL', NULL, N'Mr. Robertson runs our San Francisco office, doesn’t he?', NULL, NULL, 24, 5, 78)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (284, NULL, N'A', NULL, 23, N'100.0', N'200.0', N'300.0', N'400.0', NULL, N' How many pens does the man need?', NULL, NULL, 24, 5, 78)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (285, NULL, N'A', NULL, 24, N'To write a book', N'For the office employees', N'To make a large drawing', N'To give away at a conference', NULL, N'Why does he need the pens?', NULL, NULL, 24, 5, 78)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (286, NULL, N'A', NULL, 25, N'20.0', N'40.0', N'120.0', N'140.0', NULL, N'How much will he pay for the pens?', NULL, NULL, 24, 5, 79)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (287, NULL, N'A', NULL, 26, N'One day', N'One weekend', N'One week', N'One month', NULL, N'', NULL, NULL, 24, 6, 80)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (288, NULL, N'A', NULL, 27, N'100.0', N'200.0', N'300.0', N'400.0', NULL, N'', NULL, NULL, 24, 6, 80)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (289, NULL, N'A', NULL, 28, N'People who want to travel overseas', N'Members who belong to the fitness club', N'Staff who work for the Travel Lodge Inn', N'Those who want to get away for the weekend', NULL, N'', NULL, NULL, 24, 6, 80)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (290, NULL, N'A', NULL, 29, N'nearly', N'immediately', N'precisely', N'significantly', NULL, N'', NULL, NULL, 24, 6, 81)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (291, NULL, N'A', NULL, 30, N'professional', N'profession', N'professionals', N'professionally', NULL, N'', NULL, NULL, 24, 6, 81)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (292, NULL, N'A', NULL, 31, N'indicates', N'commands', N'notices ', N'distributes', NULL, N'', NULL, NULL, 24, 6, 81)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (293, NULL, N'A', NULL, 32, N'just ', N'once', N'such', N'likely', NULL, N'', NULL, NULL, 24, 7, 82)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (294, NULL, N'A', NULL, 33, N'would have agreed', N'would agree', N'has agree', N' were agreeing', NULL, N'', NULL, NULL, 24, 7, 82)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (295, NULL, N'A', NULL, 34, N'In fact', N'In spite of', N'On the other hand', N'Even though', NULL, N'', NULL, NULL, 24, 7, 82)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (296, NULL, N'A', NULL, 35, N'just ', N'once', N'such', N'likely', NULL, N'', NULL, NULL, 24, 7, 82)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (297, NULL, N'A', NULL, 36, N'would have agreed', N'would agree', N'has agree', N' were agreeing', NULL, N'', NULL, NULL, 24, 7, 82)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (298, NULL, N'A', NULL, 37, N'In fact', N'In spite of', N'On the other hand', N'Even though', NULL, N'', NULL, NULL, 24, 7, 82)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (299, NULL, N'A', NULL, 1, NULL, NULL, NULL, NULL, NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 25, 1, 83)
GO
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (300, NULL, N'A', NULL, 2, NULL, NULL, NULL, NULL, NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 25, 1, 84)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (301, NULL, N'A', NULL, 3, NULL, NULL, NULL, NULL, NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 25, 2, 85)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (302, NULL, N'A', NULL, 4, NULL, NULL, NULL, NULL, NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 25, 2, 85)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (303, NULL, N'A', NULL, 5, NULL, NULL, NULL, NULL, NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 25, 2, 85)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (304, NULL, N'A', NULL, 6, NULL, NULL, NULL, NULL, NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 25, 2, 85)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (305, NULL, N'A', NULL, 7, NULL, NULL, NULL, NULL, NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 25, 2, 85)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (306, NULL, N'A', NULL, 8, N'20.0', N'40.0', N'120.0', N'140.0', NULL, N'How much will he pay for the pens?', NULL, CAST(N'2021-12-24' AS Date), 25, 3, 86)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (307, NULL, N'A', NULL, 9, N'One day', N'One weekend', N'One week', N'One month', NULL, N'According to the speaker, how long will the special offer last?', NULL, CAST(N'2021-12-24' AS Date), 25, 3, 86)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (308, NULL, N'A', NULL, 10, N'100.0', N'200.0', N'300.0', N'400.0', NULL, N'How much is the special offer?', NULL, CAST(N'2021-12-24' AS Date), 25, 3, 86)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (309, NULL, N'A', NULL, 11, N'People who want to travel overseas', N'Members who belong to the fitness club', N'Staff who work for the Travel Lodge Inn', N'Those who want to get away for the weekend', NULL, N'Who would be most interested in this advertisement?', NULL, CAST(N'2021-12-24' AS Date), 25, 3, 87)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (310, NULL, N'A', NULL, 12, N'nearly', N'immediately', N'precisely', N'significantly', NULL, N'Employees who have not yet registered on the new company website must do so ------', NULL, CAST(N'2021-12-24' AS Date), 25, 3, 87)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (311, NULL, N'A', NULL, 13, N'professional', N'profession', N'professionals', N'professionally', NULL, N'Rosewater Medical Center employs healthcare -------- affiliated with Huron University.', NULL, CAST(N'2021-12-24' AS Date), 25, 3, 87)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (312, NULL, N'A', NULL, 14, N'indicates', N'commands', N'notices ', N'distributes', NULL, N'Once you have detected a fatal virus on your computer, common sense -------- that you should have your hard drive reformatted by skilled professionals.', NULL, CAST(N'2021-12-24' AS Date), 25, 4, 88)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (313, NULL, N'A', NULL, 15, N'just ', N'once', N'such', N'likely', NULL, N'Choose the word or phrase that best completes the blanks:', NULL, CAST(N'2021-12-24' AS Date), 25, 4, 88)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (314, NULL, N'A', NULL, 16, N'would have agreed', N'would agree', N'has agree', N' were agreeing', NULL, N'Choose the word or phrase that best completes the blanks:', NULL, CAST(N'2021-12-24' AS Date), 25, 4, 88)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (315, NULL, N'A', NULL, 17, N'In fact', N'In spite of', N'On the other hand', N'Even though', NULL, N'Choose the word or phrase that best completes the blanks:', NULL, CAST(N'2021-12-24' AS Date), 25, 4, 89)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (316, NULL, N'A', NULL, 18, N'The man is finishing his meal', N'The customer is waiting for a table', N'The waiter is setting the table', N'The woman is looking at the menu', NULL, N'Choose the word or phrase that best completes the blanks:', NULL, CAST(N'2021-12-24' AS Date), 25, 4, 89)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (317, NULL, N'A', NULL, 19, N'He’s handling a tool', N'He’s cutting grass', N'He’s building a bookshelf', N'He’s walking up to the roof', NULL, N'Choose the word or phrase that best completes the blanks:', NULL, CAST(N'2021-12-24' AS Date), 25, 4, 89)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (318, NULL, N'A', NULL, 20, N'I came in early today', N'Because I had a question', N'By two o’clock at the earliest', N'Because I had a question', NULL, N'Why did you come by yesterday?', NULL, CAST(N'2021-12-24' AS Date), 25, 5, 90)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (319, NULL, N'A', NULL, 21, N'Yes, I can lend it to you', N'The handle is in the front', N'Yes, that would be nice, thanks', N'The handle is in the front', NULL, N'Would you like a hand with your luggage?', NULL, CAST(N'2021-12-24' AS Date), 25, 5, 90)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (320, NULL, N'A', NULL, 22, N'No, it’s in Los Angeles', N'Yes, he is the boss there', N'He’s on a business trip', N'Yes, he is the boss there', NULL, N'Mr. Robertson runs our San Francisco office, doesn’t he?', NULL, CAST(N'2021-12-24' AS Date), 25, 5, 90)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (321, NULL, N'A', NULL, 23, N'100.0', N'200.0', N'300.0', N'400.0', NULL, N' How many pens does the man need?', NULL, CAST(N'2021-12-24' AS Date), 25, 5, 90)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (322, NULL, N'A', NULL, 24, N'To write a book', N'For the office employees', N'To make a large drawing', N'To give away at a conference', NULL, N'Why does he need the pens?', NULL, CAST(N'2021-12-24' AS Date), 25, 5, 90)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (323, NULL, N'A', NULL, 25, N'20.0', N'40.0', N'120.0', N'140.0', NULL, N'How much will he pay for the pens?', NULL, CAST(N'2021-12-24' AS Date), 25, 5, 91)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (324, NULL, N'A', NULL, 26, N'One day', N'One weekend', N'One week', N'One month', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 25, 6, 92)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (325, NULL, N'A', NULL, 27, N'100.0', N'200.0', N'300.0', N'400.0', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 25, 6, 92)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (326, NULL, N'A', NULL, 28, N'People who want to travel overseas', N'Members who belong to the fitness club', N'Staff who work for the Travel Lodge Inn', N'Those who want to get away for the weekend', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 25, 6, 92)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (327, NULL, N'A', NULL, 29, N'nearly', N'immediately', N'precisely', N'significantly', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 25, 6, 93)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (328, NULL, N'A', NULL, 30, N'professional', N'profession', N'professionals', N'professionally', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 25, 6, 93)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (329, NULL, N'A', NULL, 31, N'indicates', N'commands', N'notices ', N'distributes', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 25, 6, 93)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (330, NULL, N'A', NULL, 32, N'just ', N'once', N'such', N'likely', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 25, 7, 94)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (331, NULL, N'A', NULL, 33, N'would have agreed', N'would agree', N'has agree', N' were agreeing', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 25, 7, 94)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (332, NULL, N'A', NULL, 34, N'In fact', N'In spite of', N'On the other hand', N'Even though', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 25, 7, 94)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (333, NULL, N'A', NULL, 35, N'just ', N'once', N'such', N'likely', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 25, 7, 94)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (334, NULL, N'A', NULL, 36, N'would have agreed', N'would agree', N'has agree', N' were agreeing', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 25, 7, 94)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (335, NULL, N'A', NULL, 37, N'In fact', N'In spite of', N'On the other hand', N'Even though', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 25, 7, 94)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (336, NULL, N'A', NULL, 1, NULL, NULL, NULL, NULL, NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 26, 1, 95)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (337, NULL, N'A', NULL, 2, NULL, NULL, NULL, NULL, NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 26, 1, 96)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (338, NULL, N'A', NULL, 3, NULL, NULL, NULL, NULL, NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 26, 2, 97)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (339, NULL, N'A', NULL, 4, NULL, NULL, NULL, NULL, NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 26, 2, 97)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (340, NULL, N'A', NULL, 5, NULL, NULL, NULL, NULL, NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 26, 2, 97)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (341, NULL, N'A', NULL, 6, NULL, NULL, NULL, NULL, NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 26, 2, 97)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (342, NULL, N'A', NULL, 7, NULL, NULL, NULL, NULL, NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 26, 2, 97)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (343, NULL, N'A', NULL, 8, N'20.0', N'40.0', N'120.0', N'140.0', NULL, N'How much will he pay for the pens?', NULL, CAST(N'2021-12-24' AS Date), 26, 3, 98)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (344, NULL, N'A', NULL, 9, N'One day', N'One weekend', N'One week', N'One month', NULL, N'According to the speaker, how long will the special offer last?', NULL, CAST(N'2021-12-24' AS Date), 26, 3, 98)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (345, NULL, N'A', NULL, 10, N'100.0', N'200.0', N'300.0', N'400.0', NULL, N'How much is the special offer?', NULL, CAST(N'2021-12-24' AS Date), 26, 3, 98)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (346, NULL, N'A', NULL, 11, N'People who want to travel overseas', N'Members who belong to the fitness club', N'Staff who work for the Travel Lodge Inn', N'Those who want to get away for the weekend', NULL, N'Who would be most interested in this advertisement?', NULL, CAST(N'2021-12-24' AS Date), 26, 3, 99)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (347, NULL, N'A', NULL, 12, N'nearly', N'immediately', N'precisely', N'significantly', NULL, N'Employees who have not yet registered on the new company website must do so ------', NULL, CAST(N'2021-12-24' AS Date), 26, 3, 99)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (348, NULL, N'A', NULL, 13, N'professional', N'profession', N'professionals', N'professionally', NULL, N'Rosewater Medical Center employs healthcare -------- affiliated with Huron University.', NULL, CAST(N'2021-12-24' AS Date), 26, 3, 99)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (349, NULL, N'A', NULL, 14, N'indicates', N'commands', N'notices ', N'distributes', NULL, N'Once you have detected a fatal virus on your computer, common sense -------- that you should have your hard drive reformatted by skilled professionals.', NULL, CAST(N'2021-12-24' AS Date), 26, 4, 100)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (350, NULL, N'A', NULL, 15, N'just ', N'once', N'such', N'likely', NULL, N'Choose the word or phrase that best completes the blanks:', NULL, CAST(N'2021-12-24' AS Date), 26, 4, 100)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (351, NULL, N'A', NULL, 16, N'would have agreed', N'would agree', N'has agree', N' were agreeing', NULL, N'Choose the word or phrase that best completes the blanks:', NULL, CAST(N'2021-12-24' AS Date), 26, 4, 100)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (352, NULL, N'A', NULL, 17, N'In fact', N'In spite of', N'On the other hand', N'Even though', NULL, N'Choose the word or phrase that best completes the blanks:', NULL, CAST(N'2021-12-24' AS Date), 26, 4, 101)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (353, NULL, N'A', NULL, 18, N'The man is finishing his meal', N'The customer is waiting for a table', N'The waiter is setting the table', N'The woman is looking at the menu', NULL, N'Choose the word or phrase that best completes the blanks:', NULL, CAST(N'2021-12-24' AS Date), 26, 4, 101)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (354, NULL, N'A', NULL, 19, N'He’s handling a tool', N'He’s cutting grass', N'He’s building a bookshelf', N'He’s walking up to the roof', NULL, N'Choose the word or phrase that best completes the blanks:', NULL, CAST(N'2021-12-24' AS Date), 26, 4, 101)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (355, NULL, N'A', NULL, 20, N'I came in early today', N'Because I had a question', N'By two o’clock at the earliest', N'Because I had a question', NULL, N'Why did you come by yesterday?', NULL, CAST(N'2021-12-24' AS Date), 26, 5, 102)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (356, NULL, N'A', NULL, 21, N'Yes, I can lend it to you', N'The handle is in the front', N'Yes, that would be nice, thanks', N'The handle is in the front', NULL, N'Would you like a hand with your luggage?', NULL, CAST(N'2021-12-24' AS Date), 26, 5, 102)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (357, NULL, N'A', NULL, 22, N'No, it’s in Los Angeles', N'Yes, he is the boss there', N'He’s on a business trip', N'Yes, he is the boss there', NULL, N'Mr. Robertson runs our San Francisco office, doesn’t he?', NULL, CAST(N'2021-12-24' AS Date), 26, 5, 102)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (358, NULL, N'A', NULL, 23, N'100.0', N'200.0', N'300.0', N'400.0', NULL, N' How many pens does the man need?', NULL, CAST(N'2021-12-24' AS Date), 26, 5, 102)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (359, NULL, N'A', NULL, 24, N'To write a book', N'For the office employees', N'To make a large drawing', N'To give away at a conference', NULL, N'Why does he need the pens?', NULL, CAST(N'2021-12-24' AS Date), 26, 5, 102)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (360, NULL, N'A', NULL, 25, N'20.0', N'40.0', N'120.0', N'140.0', NULL, N'How much will he pay for the pens?', NULL, CAST(N'2021-12-24' AS Date), 26, 5, 103)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (361, NULL, N'A', NULL, 26, N'One day', N'One weekend', N'One week', N'One month', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 26, 6, 104)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (362, NULL, N'A', NULL, 27, N'100.0', N'200.0', N'300.0', N'400.0', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 26, 6, 104)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (363, NULL, N'A', NULL, 28, N'People who want to travel overseas', N'Members who belong to the fitness club', N'Staff who work for the Travel Lodge Inn', N'Those who want to get away for the weekend', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 26, 6, 104)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (364, NULL, N'A', NULL, 29, N'nearly', N'immediately', N'precisely', N'significantly', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 26, 6, 105)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (365, NULL, N'A', NULL, 30, N'professional', N'profession', N'professionals', N'professionally', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 26, 6, 105)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (366, NULL, N'A', NULL, 31, N'indicates', N'commands', N'notices ', N'distributes', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 26, 6, 105)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (367, NULL, N'A', NULL, 32, N'just ', N'once', N'such', N'likely', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 26, 7, 106)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (368, NULL, N'A', NULL, 33, N'would have agreed', N'would agree', N'has agree', N' were agreeing', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 26, 7, 106)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (369, NULL, N'A', NULL, 34, N'In fact', N'In spite of', N'On the other hand', N'Even though', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 26, 7, 106)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (370, NULL, N'A', NULL, 35, N'just ', N'once', N'such', N'likely', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 26, 7, 106)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (371, NULL, N'A', NULL, 36, N'would have agreed', N'would agree', N'has agree', N' were agreeing', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 26, 7, 106)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (372, NULL, N'A', NULL, 37, N'In fact', N'In spite of', N'On the other hand', N'Even though', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 26, 7, 106)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (373, NULL, N'A', NULL, 1, NULL, NULL, NULL, NULL, NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 27, 1, 107)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (374, NULL, N'A', NULL, 2, NULL, NULL, NULL, NULL, NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 27, 1, 108)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (375, NULL, N'A', NULL, 3, NULL, NULL, NULL, NULL, NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 27, 2, 109)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (376, NULL, N'A', NULL, 4, NULL, NULL, NULL, NULL, NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 27, 2, 109)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (377, NULL, N'A', NULL, 5, NULL, NULL, NULL, NULL, NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 27, 2, 109)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (378, NULL, N'A', NULL, 6, NULL, NULL, NULL, NULL, NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 27, 2, 109)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (379, NULL, N'A', NULL, 7, NULL, NULL, NULL, NULL, NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 27, 2, 109)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (380, NULL, N'A', NULL, 8, N'20.0', N'40.0', N'120.0', N'140.0', NULL, N'How much will he pay for the pens?', NULL, CAST(N'2021-12-24' AS Date), 27, 3, 110)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (381, NULL, N'A', NULL, 9, N'One day', N'One weekend', N'One week', N'One month', NULL, N'According to the speaker, how long will the special offer last?', NULL, CAST(N'2021-12-24' AS Date), 27, 3, 110)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (382, NULL, N'A', NULL, 10, N'100.0', N'200.0', N'300.0', N'400.0', NULL, N'How much is the special offer?', NULL, CAST(N'2021-12-24' AS Date), 27, 3, 110)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (383, NULL, N'A', NULL, 11, N'People who want to travel overseas', N'Members who belong to the fitness club', N'Staff who work for the Travel Lodge Inn', N'Those who want to get away for the weekend', NULL, N'Who would be most interested in this advertisement?', NULL, CAST(N'2021-12-24' AS Date), 27, 3, 111)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (384, NULL, N'A', NULL, 12, N'nearly', N'immediately', N'precisely', N'significantly', NULL, N'Employees who have not yet registered on the new company website must do so ------', NULL, CAST(N'2021-12-24' AS Date), 27, 3, 111)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (385, NULL, N'A', NULL, 13, N'professional', N'profession', N'professionals', N'professionally', NULL, N'Rosewater Medical Center employs healthcare -------- affiliated with Huron University.', NULL, CAST(N'2021-12-24' AS Date), 27, 3, 111)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (386, NULL, N'A', NULL, 14, N'indicates', N'commands', N'notices ', N'distributes', NULL, N'Once you have detected a fatal virus on your computer, common sense -------- that you should have your hard drive reformatted by skilled professionals.', NULL, CAST(N'2021-12-24' AS Date), 27, 4, 112)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (387, NULL, N'A', NULL, 15, N'just ', N'once', N'such', N'likely', NULL, N'Choose the word or phrase that best completes the blanks:', NULL, CAST(N'2021-12-24' AS Date), 27, 4, 112)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (388, NULL, N'A', NULL, 16, N'would have agreed', N'would agree', N'has agree', N' were agreeing', NULL, N'Choose the word or phrase that best completes the blanks:', NULL, CAST(N'2021-12-24' AS Date), 27, 4, 112)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (389, NULL, N'A', NULL, 17, N'In fact', N'In spite of', N'On the other hand', N'Even though', NULL, N'Choose the word or phrase that best completes the blanks:', NULL, CAST(N'2021-12-24' AS Date), 27, 4, 113)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (390, NULL, N'A', NULL, 18, N'The man is finishing his meal', N'The customer is waiting for a table', N'The waiter is setting the table', N'The woman is looking at the menu', NULL, N'Choose the word or phrase that best completes the blanks:', NULL, CAST(N'2021-12-24' AS Date), 27, 4, 113)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (391, NULL, N'A', NULL, 19, N'He’s handling a tool', N'He’s cutting grass', N'He’s building a bookshelf', N'He’s walking up to the roof', NULL, N'Choose the word or phrase that best completes the blanks:', NULL, CAST(N'2021-12-24' AS Date), 27, 4, 113)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (392, NULL, N'A', NULL, 20, N'I came in early today', N'Because I had a question', N'By two o’clock at the earliest', N'Because I had a question', NULL, N'Why did you come by yesterday?', NULL, CAST(N'2021-12-24' AS Date), 27, 5, 114)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (393, NULL, N'A', NULL, 21, N'Yes, I can lend it to you', N'The handle is in the front', N'Yes, that would be nice, thanks', N'The handle is in the front', NULL, N'Would you like a hand with your luggage?', NULL, CAST(N'2021-12-24' AS Date), 27, 5, 114)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (394, NULL, N'A', NULL, 22, N'No, it’s in Los Angeles', N'Yes, he is the boss there', N'He’s on a business trip', N'Yes, he is the boss there', NULL, N'Mr. Robertson runs our San Francisco office, doesn’t he?', NULL, CAST(N'2021-12-24' AS Date), 27, 5, 114)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (395, NULL, N'A', NULL, 23, N'100.0', N'200.0', N'300.0', N'400.0', NULL, N' How many pens does the man need?', NULL, CAST(N'2021-12-24' AS Date), 27, 5, 114)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (396, NULL, N'A', NULL, 24, N'To write a book', N'For the office employees', N'To make a large drawing', N'To give away at a conference', NULL, N'Why does he need the pens?', NULL, CAST(N'2021-12-24' AS Date), 27, 5, 114)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (397, NULL, N'A', NULL, 25, N'20.0', N'40.0', N'120.0', N'140.0', NULL, N'How much will he pay for the pens?', NULL, CAST(N'2021-12-24' AS Date), 27, 5, 115)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (398, NULL, N'A', NULL, 26, N'One day', N'One weekend', N'One week', N'One month', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 27, 6, 116)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (399, NULL, N'A', NULL, 27, N'100.0', N'200.0', N'300.0', N'400.0', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 27, 6, 116)
GO
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (400, NULL, N'A', NULL, 28, N'People who want to travel overseas', N'Members who belong to the fitness club', N'Staff who work for the Travel Lodge Inn', N'Those who want to get away for the weekend', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 27, 6, 116)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (401, NULL, N'A', NULL, 29, N'nearly', N'immediately', N'precisely', N'significantly', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 27, 6, 117)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (402, NULL, N'A', NULL, 30, N'professional', N'profession', N'professionals', N'professionally', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 27, 6, 117)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (403, NULL, N'A', NULL, 31, N'indicates', N'commands', N'notices ', N'distributes', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 27, 6, 117)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (404, NULL, N'A', NULL, 32, N'just ', N'once', N'such', N'likely', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 27, 7, 118)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (405, NULL, N'A', NULL, 33, N'would have agreed', N'would agree', N'has agree', N' were agreeing', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 27, 7, 118)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (406, NULL, N'A', NULL, 34, N'In fact', N'In spite of', N'On the other hand', N'Even though', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 27, 7, 118)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (407, NULL, N'A', NULL, 35, N'just ', N'once', N'such', N'likely', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 27, 7, 118)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (408, NULL, N'A', NULL, 36, N'would have agreed', N'would agree', N'has agree', N' were agreeing', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 27, 7, 118)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (409, NULL, N'A', NULL, 37, N'In fact', N'In spite of', N'On the other hand', N'Even though', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 27, 7, 118)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (410, NULL, N'A', NULL, 1, NULL, NULL, NULL, NULL, NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 28, 1, 119)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (411, NULL, N'A', NULL, 2, NULL, NULL, NULL, NULL, NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 28, 1, 120)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (412, NULL, N'A', NULL, 3, NULL, NULL, NULL, NULL, NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 28, 2, 121)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (413, NULL, N'A', NULL, 4, NULL, NULL, NULL, NULL, NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 28, 2, 121)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (414, NULL, N'A', NULL, 5, NULL, NULL, NULL, NULL, NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 28, 2, 121)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (415, NULL, N'A', NULL, 6, NULL, NULL, NULL, NULL, NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 28, 2, 121)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (416, NULL, N'A', NULL, 7, NULL, NULL, NULL, NULL, NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 28, 2, 121)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (417, NULL, N'A', NULL, 8, N'20.0', N'40.0', N'120.0', N'140.0', NULL, N'How much will he pay for the pens?', NULL, CAST(N'2021-12-24' AS Date), 28, 3, 122)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (418, NULL, N'A', NULL, 9, N'One day', N'One weekend', N'One week', N'One month', NULL, N'According to the speaker, how long will the special offer last?', NULL, CAST(N'2021-12-24' AS Date), 28, 3, 122)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (419, NULL, N'A', NULL, 10, N'100.0', N'200.0', N'300.0', N'400.0', NULL, N'How much is the special offer?', NULL, CAST(N'2021-12-24' AS Date), 28, 3, 122)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (420, NULL, N'A', NULL, 11, N'People who want to travel overseas', N'Members who belong to the fitness club', N'Staff who work for the Travel Lodge Inn', N'Those who want to get away for the weekend', NULL, N'Who would be most interested in this advertisement?', NULL, CAST(N'2021-12-24' AS Date), 28, 3, 123)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (421, NULL, N'A', NULL, 12, N'nearly', N'immediately', N'precisely', N'significantly', NULL, N'Employees who have not yet registered on the new company website must do so ------', NULL, CAST(N'2021-12-24' AS Date), 28, 3, 123)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (422, NULL, N'A', NULL, 13, N'professional', N'profession', N'professionals', N'professionally', NULL, N'Rosewater Medical Center employs healthcare -------- affiliated with Huron University.', NULL, CAST(N'2021-12-24' AS Date), 28, 3, 123)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (423, NULL, N'A', NULL, 14, N'indicates', N'commands', N'notices ', N'distributes', NULL, N'Once you have detected a fatal virus on your computer, common sense -------- that you should have your hard drive reformatted by skilled professionals.', NULL, CAST(N'2021-12-24' AS Date), 28, 4, 124)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (424, NULL, N'A', NULL, 15, N'just ', N'once', N'such', N'likely', NULL, N'Choose the word or phrase that best completes the blanks:', NULL, CAST(N'2021-12-24' AS Date), 28, 4, 124)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (425, NULL, N'A', NULL, 16, N'would have agreed', N'would agree', N'has agree', N' were agreeing', NULL, N'Choose the word or phrase that best completes the blanks:', NULL, CAST(N'2021-12-24' AS Date), 28, 4, 124)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (426, NULL, N'A', NULL, 17, N'In fact', N'In spite of', N'On the other hand', N'Even though', NULL, N'Choose the word or phrase that best completes the blanks:', NULL, CAST(N'2021-12-24' AS Date), 28, 4, 125)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (427, NULL, N'A', NULL, 18, N'The man is finishing his meal', N'The customer is waiting for a table', N'The waiter is setting the table', N'The woman is looking at the menu', NULL, N'Choose the word or phrase that best completes the blanks:', NULL, CAST(N'2021-12-24' AS Date), 28, 4, 125)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (428, NULL, N'A', NULL, 19, N'He’s handling a tool', N'He’s cutting grass', N'He’s building a bookshelf', N'He’s walking up to the roof', NULL, N'Choose the word or phrase that best completes the blanks:', NULL, CAST(N'2021-12-24' AS Date), 28, 4, 125)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (429, NULL, N'A', NULL, 20, N'I came in early today', N'Because I had a question', N'By two o’clock at the earliest', N'Because I had a question', NULL, N'Why did you come by yesterday?', NULL, CAST(N'2021-12-24' AS Date), 28, 5, 126)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (430, NULL, N'A', NULL, 21, N'Yes, I can lend it to you', N'The handle is in the front', N'Yes, that would be nice, thanks', N'The handle is in the front', NULL, N'Would you like a hand with your luggage?', NULL, CAST(N'2021-12-24' AS Date), 28, 5, 126)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (431, NULL, N'A', NULL, 22, N'No, it’s in Los Angeles', N'Yes, he is the boss there', N'He’s on a business trip', N'Yes, he is the boss there', NULL, N'Mr. Robertson runs our San Francisco office, doesn’t he?', NULL, CAST(N'2021-12-24' AS Date), 28, 5, 126)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (432, NULL, N'A', NULL, 23, N'100.0', N'200.0', N'300.0', N'400.0', NULL, N' How many pens does the man need?', NULL, CAST(N'2021-12-24' AS Date), 28, 5, 126)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (433, NULL, N'A', NULL, 24, N'To write a book', N'For the office employees', N'To make a large drawing', N'To give away at a conference', NULL, N'Why does he need the pens?', NULL, CAST(N'2021-12-24' AS Date), 28, 5, 126)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (434, NULL, N'A', NULL, 25, N'20.0', N'40.0', N'120.0', N'140.0', NULL, N'How much will he pay for the pens?', NULL, CAST(N'2021-12-24' AS Date), 28, 5, 126)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (435, NULL, N'A', NULL, 26, N'One day', N'One weekend', N'One week', N'One month', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 28, 6, 127)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (436, NULL, N'A', NULL, 27, N'100.0', N'200.0', N'300.0', N'400.0', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 28, 6, 127)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (437, NULL, N'A', NULL, 28, N'People who want to travel overseas', N'Members who belong to the fitness club', N'Staff who work for the Travel Lodge Inn', N'Those who want to get away for the weekend', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 28, 6, 127)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (438, NULL, N'A', NULL, 29, N'nearly', N'immediately', N'precisely', N'significantly', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 28, 6, 128)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (439, NULL, N'A', NULL, 30, N'professional', N'profession', N'professionals', N'professionally', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 28, 6, 128)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (440, NULL, N'A', NULL, 31, N'indicates', N'commands', N'notices ', N'distributes', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 28, 6, 128)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (441, NULL, N'A', NULL, 32, N'just ', N'once', N'such', N'likely', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 28, 7, 129)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (442, NULL, N'A', NULL, 33, N'would have agreed', N'would agree', N'has agree', N' were agreeing', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 28, 7, 129)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (443, NULL, N'A', NULL, 34, N'In fact', N'In spite of', N'On the other hand', N'Even though', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 28, 7, 129)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (444, NULL, N'A', NULL, 35, N'just ', N'once', N'such', N'likely', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 28, 7, 130)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (445, NULL, N'A', NULL, 36, N'would have agreed', N'would agree', N'has agree', N' were agreeing', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 28, 7, 130)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (446, NULL, N'A', NULL, 37, N'In fact', N'In spite of', N'On the other hand', N'Even though', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 28, 7, 130)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (447, NULL, N'A', NULL, 1, NULL, NULL, NULL, NULL, NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 29, 1, 131)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (448, NULL, N'A', NULL, 2, NULL, NULL, NULL, NULL, NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 29, 1, 132)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (449, NULL, N'A', NULL, 3, NULL, NULL, NULL, NULL, NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 29, 2, 133)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (450, NULL, N'A', NULL, 4, NULL, NULL, NULL, NULL, NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 29, 2, 133)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (451, NULL, N'A', NULL, 5, NULL, NULL, NULL, NULL, NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 29, 2, 133)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (452, NULL, N'A', NULL, 6, NULL, NULL, NULL, NULL, NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 29, 2, 133)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (453, NULL, N'A', NULL, 7, NULL, NULL, NULL, NULL, NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 29, 2, 133)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (454, NULL, N'A', NULL, 8, N'20.0', N'40.0', N'120.0', N'140.0', NULL, N'How much will he pay for the pens?', NULL, CAST(N'2021-12-24' AS Date), 29, 3, 134)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (455, NULL, N'A', NULL, 9, N'One day', N'One weekend', N'One week', N'One month', NULL, N'According to the speaker, how long will the special offer last?', NULL, CAST(N'2021-12-24' AS Date), 29, 3, 134)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (456, NULL, N'A', NULL, 10, N'100.0', N'200.0', N'300.0', N'400.0', NULL, N'How much is the special offer?', NULL, CAST(N'2021-12-24' AS Date), 29, 3, 134)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (457, NULL, N'A', NULL, 11, N'People who want to travel overseas', N'Members who belong to the fitness club', N'Staff who work for the Travel Lodge Inn', N'Those who want to get away for the weekend', NULL, N'Who would be most interested in this advertisement?', NULL, CAST(N'2021-12-24' AS Date), 29, 3, 135)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (458, NULL, N'A', NULL, 12, N'nearly', N'immediately', N'precisely', N'significantly', NULL, N'Employees who have not yet registered on the new company website must do so ------', NULL, CAST(N'2021-12-24' AS Date), 29, 3, 135)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (459, NULL, N'A', NULL, 13, N'professional', N'profession', N'professionals', N'professionally', NULL, N'Rosewater Medical Center employs healthcare -------- affiliated with Huron University.', NULL, CAST(N'2021-12-24' AS Date), 29, 3, 135)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (460, NULL, N'A', NULL, 14, N'indicates', N'commands', N'notices ', N'distributes', NULL, N'Once you have detected a fatal virus on your computer, common sense -------- that you should have your hard drive reformatted by skilled professionals.', NULL, CAST(N'2021-12-24' AS Date), 29, 4, 136)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (461, NULL, N'A', NULL, 15, N'just ', N'once', N'such', N'likely', NULL, N'Choose the word or phrase that best completes the blanks:', NULL, CAST(N'2021-12-24' AS Date), 29, 4, 136)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (462, NULL, N'A', NULL, 16, N'would have agreed', N'would agree', N'has agree', N' were agreeing', NULL, N'Choose the word or phrase that best completes the blanks:', NULL, CAST(N'2021-12-24' AS Date), 29, 4, 136)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (463, NULL, N'A', NULL, 17, N'In fact', N'In spite of', N'On the other hand', N'Even though', NULL, N'Choose the word or phrase that best completes the blanks:', NULL, CAST(N'2021-12-24' AS Date), 29, 4, 137)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (464, NULL, N'A', NULL, 18, N'The man is finishing his meal', N'The customer is waiting for a table', N'The waiter is setting the table', N'The woman is looking at the menu', NULL, N'Choose the word or phrase that best completes the blanks:', NULL, CAST(N'2021-12-24' AS Date), 29, 4, 137)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (465, NULL, N'A', NULL, 19, N'He’s handling a tool', N'He’s cutting grass', N'He’s building a bookshelf', N'He’s walking up to the roof', NULL, N'Choose the word or phrase that best completes the blanks:', NULL, CAST(N'2021-12-24' AS Date), 29, 4, 137)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (466, NULL, N'A', NULL, 20, N'I came in early today', N'Because I had a question', N'By two o’clock at the earliest', N'Because I had a question', NULL, N'Why did you come by yesterday?', NULL, CAST(N'2021-12-24' AS Date), 29, 5, 138)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (467, NULL, N'A', NULL, 21, N'Yes, I can lend it to you', N'The handle is in the front', N'Yes, that would be nice, thanks', N'The handle is in the front', NULL, N'Would you like a hand with your luggage?', NULL, CAST(N'2021-12-24' AS Date), 29, 5, 138)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (468, NULL, N'A', NULL, 22, N'No, it’s in Los Angeles', N'Yes, he is the boss there', N'He’s on a business trip', N'Yes, he is the boss there', NULL, N'Mr. Robertson runs our San Francisco office, doesn’t he?', NULL, CAST(N'2021-12-24' AS Date), 29, 5, 138)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (469, NULL, N'A', NULL, 23, N'100.0', N'200.0', N'300.0', N'400.0', NULL, N' How many pens does the man need?', NULL, CAST(N'2021-12-24' AS Date), 29, 5, 138)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (470, NULL, N'A', NULL, 24, N'To write a book', N'For the office employees', N'To make a large drawing', N'To give away at a conference', NULL, N'Why does he need the pens?', NULL, CAST(N'2021-12-24' AS Date), 29, 5, 138)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (471, NULL, N'A', NULL, 25, N'20.0', N'40.0', N'120.0', N'140.0', NULL, N'How much will he pay for the pens?', NULL, CAST(N'2021-12-24' AS Date), 29, 5, 138)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (472, NULL, N'A', NULL, 26, N'One day', N'One weekend', N'One week', N'One month', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 29, 6, 139)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (473, NULL, N'A', NULL, 27, N'100.0', N'200.0', N'300.0', N'400.0', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 29, 6, 139)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (474, NULL, N'A', NULL, 28, N'People who want to travel overseas', N'Members who belong to the fitness club', N'Staff who work for the Travel Lodge Inn', N'Those who want to get away for the weekend', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 29, 6, 139)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (475, NULL, N'A', NULL, 29, N'nearly', N'immediately', N'precisely', N'significantly', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 29, 6, 140)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (476, NULL, N'A', NULL, 30, N'professional', N'profession', N'professionals', N'professionally', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 29, 6, 140)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (477, NULL, N'A', NULL, 31, N'indicates', N'commands', N'notices ', N'distributes', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 29, 6, 140)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (478, NULL, N'A', NULL, 32, N'just ', N'once', N'such', N'likely', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 29, 7, 141)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (479, NULL, N'A', NULL, 33, N'would have agreed', N'would agree', N'has agree', N' were agreeing', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 29, 7, 141)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (480, NULL, N'A', NULL, 34, N'In fact', N'In spite of', N'On the other hand', N'Even though', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 29, 7, 141)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (481, NULL, N'A', NULL, 35, N'just ', N'once', N'such', N'likely', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 29, 7, 142)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (482, NULL, N'A', NULL, 36, N'would have agreed', N'would agree', N'has agree', N' were agreeing', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 29, 7, 142)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (483, NULL, N'A', NULL, 37, N'In fact', N'In spite of', N'On the other hand', N'Even though', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 29, 7, 142)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (484, NULL, N'A', NULL, 1, NULL, NULL, NULL, NULL, NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 30, 1, 143)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (485, NULL, N'A', NULL, 2, NULL, NULL, NULL, NULL, NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 30, 1, 144)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (486, NULL, N'A', NULL, 3, NULL, NULL, NULL, NULL, NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 30, 2, 145)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (487, NULL, N'A', NULL, 4, NULL, NULL, NULL, NULL, NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 30, 2, 145)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (488, NULL, N'A', NULL, 5, NULL, NULL, NULL, NULL, NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 30, 2, 145)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (489, NULL, N'A', NULL, 6, NULL, NULL, NULL, NULL, NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 30, 2, 145)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (490, NULL, N'A', NULL, 7, NULL, NULL, NULL, NULL, NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 30, 2, 145)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (491, NULL, N'A', NULL, 8, N'20.0', N'40.0', N'120.0', N'140.0', NULL, N'How much will he pay for the pens?', NULL, CAST(N'2021-12-24' AS Date), 30, 3, 146)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (492, NULL, N'A', NULL, 9, N'One day', N'One weekend', N'One week', N'One month', NULL, N'According to the speaker, how long will the special offer last?', NULL, CAST(N'2021-12-24' AS Date), 30, 3, 146)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (493, NULL, N'A', NULL, 10, N'100.0', N'200.0', N'300.0', N'400.0', NULL, N'How much is the special offer?', NULL, CAST(N'2021-12-24' AS Date), 30, 3, 146)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (494, NULL, N'A', NULL, 11, N'People who want to travel overseas', N'Members who belong to the fitness club', N'Staff who work for the Travel Lodge Inn', N'Those who want to get away for the weekend', NULL, N'Who would be most interested in this advertisement?', NULL, CAST(N'2021-12-24' AS Date), 30, 3, 147)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (495, NULL, N'A', NULL, 12, N'nearly', N'immediately', N'precisely', N'significantly', NULL, N'Employees who have not yet registered on the new company website must do so ------', NULL, CAST(N'2021-12-24' AS Date), 30, 3, 147)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (496, NULL, N'A', NULL, 13, N'professional', N'profession', N'professionals', N'professionally', NULL, N'Rosewater Medical Center employs healthcare -------- affiliated with Huron University.', NULL, CAST(N'2021-12-24' AS Date), 30, 3, 147)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (497, NULL, N'A', NULL, 14, N'indicates', N'commands', N'notices ', N'distributes', NULL, N'Once you have detected a fatal virus on your computer, common sense -------- that you should have your hard drive reformatted by skilled professionals.', NULL, CAST(N'2021-12-24' AS Date), 30, 4, 148)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (498, NULL, N'A', NULL, 15, N'just ', N'once', N'such', N'likely', NULL, N'Choose the word or phrase that best completes the blanks:', NULL, CAST(N'2021-12-24' AS Date), 30, 4, 148)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (499, NULL, N'A', NULL, 16, N'would have agreed', N'would agree', N'has agree', N' were agreeing', NULL, N'Choose the word or phrase that best completes the blanks:', NULL, CAST(N'2021-12-24' AS Date), 30, 4, 148)
GO
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (500, NULL, N'A', NULL, 17, N'In fact', N'In spite of', N'On the other hand', N'Even though', NULL, N'Choose the word or phrase that best completes the blanks:', NULL, CAST(N'2021-12-24' AS Date), 30, 4, 149)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (501, NULL, N'A', NULL, 18, N'The man is finishing his meal', N'The customer is waiting for a table', N'The waiter is setting the table', N'The woman is looking at the menu', NULL, N'Choose the word or phrase that best completes the blanks:', NULL, CAST(N'2021-12-24' AS Date), 30, 4, 149)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (502, NULL, N'A', NULL, 19, N'He’s handling a tool', N'He’s cutting grass', N'He’s building a bookshelf', N'He’s walking up to the roof', NULL, N'Choose the word or phrase that best completes the blanks:', NULL, CAST(N'2021-12-24' AS Date), 30, 4, 149)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (503, NULL, N'A', NULL, 20, N'I came in early today', N'Because I had a question', N'By two o’clock at the earliest', N'Because I had a question', NULL, N'Why did you come by yesterday?', NULL, CAST(N'2021-12-24' AS Date), 30, 5, 150)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (504, NULL, N'A', NULL, 21, N'Yes, I can lend it to you', N'The handle is in the front', N'Yes, that would be nice, thanks', N'The handle is in the front', NULL, N'Would you like a hand with your luggage?', NULL, CAST(N'2021-12-24' AS Date), 30, 5, 150)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (505, NULL, N'A', NULL, 22, N'No, it’s in Los Angeles', N'Yes, he is the boss there', N'He’s on a business trip', N'Yes, he is the boss there', NULL, N'Mr. Robertson runs our San Francisco office, doesn’t he?', NULL, CAST(N'2021-12-24' AS Date), 30, 5, 150)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (506, NULL, N'A', NULL, 23, N'100.0', N'200.0', N'300.0', N'400.0', NULL, N' How many pens does the man need?', NULL, CAST(N'2021-12-24' AS Date), 30, 5, 150)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (507, NULL, N'A', NULL, 24, N'To write a book', N'For the office employees', N'To make a large drawing', N'To give away at a conference', NULL, N'Why does he need the pens?', NULL, CAST(N'2021-12-24' AS Date), 30, 5, 150)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (508, NULL, N'A', NULL, 25, N'20.0', N'40.0', N'120.0', N'140.0', NULL, N'How much will he pay for the pens?', NULL, CAST(N'2021-12-24' AS Date), 30, 5, 150)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (509, NULL, N'A', NULL, 26, N'One day', N'One weekend', N'One week', N'One month', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 30, 6, 151)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (510, NULL, N'A', NULL, 27, N'100.0', N'200.0', N'300.0', N'400.0', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 30, 6, 151)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (511, NULL, N'A', NULL, 28, N'People who want to travel overseas', N'Members who belong to the fitness club', N'Staff who work for the Travel Lodge Inn', N'Those who want to get away for the weekend', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 30, 6, 151)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (512, NULL, N'A', NULL, 29, N'nearly', N'immediately', N'precisely', N'significantly', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 30, 6, 152)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (513, NULL, N'A', NULL, 30, N'professional', N'profession', N'professionals', N'professionally', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 30, 6, 152)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (514, NULL, N'A', NULL, 31, N'indicates', N'commands', N'notices ', N'distributes', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 30, 6, 152)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (515, NULL, N'A', NULL, 32, N'just ', N'once', N'such', N'likely', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 30, 7, 153)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (516, NULL, N'A', NULL, 33, N'would have agreed', N'would agree', N'has agree', N' were agreeing', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 30, 7, 153)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (517, NULL, N'A', NULL, 34, N'In fact', N'In spite of', N'On the other hand', N'Even though', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 30, 7, 153)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (518, NULL, N'A', NULL, 35, N'just ', N'once', N'such', N'likely', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 30, 7, 154)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (519, NULL, N'A', NULL, 36, N'would have agreed', N'would agree', N'has agree', N' were agreeing', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 30, 7, 154)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (520, NULL, N'A', NULL, 37, N'In fact', N'In spite of', N'On the other hand', N'Even though', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 30, 7, 154)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (521, NULL, N'A', NULL, 1, NULL, NULL, NULL, NULL, NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 31, 1, 155)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (522, NULL, N'A', NULL, 2, NULL, NULL, NULL, NULL, NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 31, 1, 156)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (523, NULL, N'A', NULL, 3, NULL, NULL, NULL, NULL, NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 31, 2, 157)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (524, NULL, N'A', NULL, 4, NULL, NULL, NULL, NULL, NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 31, 2, 157)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (525, NULL, N'A', NULL, 5, NULL, NULL, NULL, NULL, NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 31, 2, 157)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (526, NULL, N'A', NULL, 6, NULL, NULL, NULL, NULL, NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 31, 2, 157)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (527, NULL, N'A', NULL, 7, NULL, NULL, NULL, NULL, NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 31, 2, 157)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (528, NULL, N'A', NULL, 8, N'20.0', N'40.0', N'120.0', N'140.0', NULL, N'How much will he pay for the pens?', NULL, CAST(N'2021-12-24' AS Date), 31, 3, 158)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (529, NULL, N'A', NULL, 9, N'One day', N'One weekend', N'One week', N'One month', NULL, N'According to the speaker, how long will the special offer last?', NULL, CAST(N'2021-12-24' AS Date), 31, 3, 158)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (530, NULL, N'A', NULL, 10, N'100.0', N'200.0', N'300.0', N'400.0', NULL, N'How much is the special offer?', NULL, CAST(N'2021-12-24' AS Date), 31, 3, 158)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (531, NULL, N'A', NULL, 11, N'People who want to travel overseas', N'Members who belong to the fitness club', N'Staff who work for the Travel Lodge Inn', N'Those who want to get away for the weekend', NULL, N'Who would be most interested in this advertisement?', NULL, CAST(N'2021-12-24' AS Date), 31, 3, 159)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (532, NULL, N'A', NULL, 12, N'nearly', N'immediately', N'precisely', N'significantly', NULL, N'Employees who have not yet registered on the new company website must do so ------', NULL, CAST(N'2021-12-24' AS Date), 31, 3, 159)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (533, NULL, N'A', NULL, 13, N'professional', N'profession', N'professionals', N'professionally', NULL, N'Rosewater Medical Center employs healthcare -------- affiliated with Huron University.', NULL, CAST(N'2021-12-24' AS Date), 31, 3, 159)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (534, NULL, N'A', NULL, 14, N'indicates', N'commands', N'notices ', N'distributes', NULL, N'Once you have detected a fatal virus on your computer, common sense -------- that you should have your hard drive reformatted by skilled professionals.', NULL, CAST(N'2021-12-24' AS Date), 31, 4, 160)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (535, NULL, N'A', NULL, 15, N'just ', N'once', N'such', N'likely', NULL, N'Choose the word or phrase that best completes the blanks:', NULL, CAST(N'2021-12-24' AS Date), 31, 4, 160)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (536, NULL, N'A', NULL, 16, N'would have agreed', N'would agree', N'has agree', N' were agreeing', NULL, N'Choose the word or phrase that best completes the blanks:', NULL, CAST(N'2021-12-24' AS Date), 31, 4, 160)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (537, NULL, N'A', NULL, 17, N'In fact', N'In spite of', N'On the other hand', N'Even though', NULL, N'Choose the word or phrase that best completes the blanks:', NULL, CAST(N'2021-12-24' AS Date), 31, 4, 161)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (538, NULL, N'A', NULL, 18, N'The man is finishing his meal', N'The customer is waiting for a table', N'The waiter is setting the table', N'The woman is looking at the menu', NULL, N'Choose the word or phrase that best completes the blanks:', NULL, CAST(N'2021-12-24' AS Date), 31, 4, 161)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (539, NULL, N'A', NULL, 19, N'He’s handling a tool', N'He’s cutting grass', N'He’s building a bookshelf', N'He’s walking up to the roof', NULL, N'Choose the word or phrase that best completes the blanks:', NULL, CAST(N'2021-12-24' AS Date), 31, 4, 161)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (540, NULL, N'A', NULL, 20, N'I came in early today', N'Because I had a question', N'By two o’clock at the earliest', N'Because I had a question', NULL, N'Why did you come by yesterday?', NULL, CAST(N'2021-12-24' AS Date), 31, 5, 162)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (541, NULL, N'A', NULL, 21, N'Yes, I can lend it to you', N'The handle is in the front', N'Yes, that would be nice, thanks', N'The handle is in the front', NULL, N'Would you like a hand with your luggage?', NULL, CAST(N'2021-12-24' AS Date), 31, 5, 162)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (542, NULL, N'A', NULL, 22, N'No, it’s in Los Angeles', N'Yes, he is the boss there', N'He’s on a business trip', N'Yes, he is the boss there', NULL, N'Mr. Robertson runs our San Francisco office, doesn’t he?', NULL, CAST(N'2021-12-24' AS Date), 31, 5, 162)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (543, NULL, N'A', NULL, 23, N'100.0', N'200.0', N'300.0', N'400.0', NULL, N' How many pens does the man need?', NULL, CAST(N'2021-12-24' AS Date), 31, 5, 162)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (544, NULL, N'A', NULL, 24, N'To write a book', N'For the office employees', N'To make a large drawing', N'To give away at a conference', NULL, N'Why does he need the pens?', NULL, CAST(N'2021-12-24' AS Date), 31, 5, 162)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (545, NULL, N'A', NULL, 25, N'20.0', N'40.0', N'120.0', N'140.0', NULL, N'How much will he pay for the pens?', NULL, CAST(N'2021-12-24' AS Date), 31, 5, 162)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (546, NULL, N'A', NULL, 26, N'One day', N'One weekend', N'One week', N'One month', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 31, 6, 163)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (547, NULL, N'A', NULL, 27, N'100.0', N'200.0', N'300.0', N'400.0', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 31, 6, 163)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (548, NULL, N'A', NULL, 28, N'People who want to travel overseas', N'Members who belong to the fitness club', N'Staff who work for the Travel Lodge Inn', N'Those who want to get away for the weekend', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 31, 6, 163)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (549, NULL, N'A', NULL, 29, N'nearly', N'immediately', N'precisely', N'significantly', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 31, 6, 164)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (550, NULL, N'A', NULL, 30, N'professional', N'profession', N'professionals', N'professionally', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 31, 6, 164)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (551, NULL, N'A', NULL, 31, N'indicates', N'commands', N'notices ', N'distributes', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 31, 6, 164)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (552, NULL, N'A', NULL, 32, N'just ', N'once', N'such', N'likely', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 31, 7, 165)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (553, NULL, N'A', NULL, 33, N'would have agreed', N'would agree', N'has agree', N' were agreeing', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 31, 7, 165)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (554, NULL, N'A', NULL, 34, N'In fact', N'In spite of', N'On the other hand', N'Even though', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 31, 7, 165)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (555, NULL, N'A', NULL, 35, N'just ', N'once', N'such', N'likely', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 31, 7, 166)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (556, NULL, N'A', NULL, 36, N'would have agreed', N'would agree', N'has agree', N' were agreeing', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 31, 7, 166)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (557, NULL, N'A', NULL, 37, N'In fact', N'In spite of', N'On the other hand', N'Even though', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 31, 7, 166)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (558, NULL, N'A', NULL, 1, NULL, NULL, NULL, NULL, NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 32, 1, 167)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (559, NULL, N'A', NULL, 2, NULL, NULL, NULL, NULL, NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 32, 1, 168)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (560, NULL, N'A', NULL, 3, NULL, NULL, NULL, NULL, NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 32, 2, 169)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (561, NULL, N'A', NULL, 4, NULL, NULL, NULL, NULL, NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 32, 2, 169)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (562, NULL, N'A', NULL, 5, NULL, NULL, NULL, NULL, NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 32, 2, 169)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (563, NULL, N'A', NULL, 6, NULL, NULL, NULL, NULL, NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 32, 2, 169)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (564, NULL, N'A', NULL, 7, NULL, NULL, NULL, NULL, NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 32, 2, 169)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (565, NULL, N'A', NULL, 8, N'20.0', N'40.0', N'120.0', N'140.0', NULL, N'How much will he pay for the pens?', NULL, CAST(N'2021-12-24' AS Date), 32, 3, 170)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (566, NULL, N'A', NULL, 9, N'One day', N'One weekend', N'One week', N'One month', NULL, N'According to the speaker, how long will the special offer last?', NULL, CAST(N'2021-12-24' AS Date), 32, 3, 170)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (567, NULL, N'A', NULL, 10, N'100.0', N'200.0', N'300.0', N'400.0', NULL, N'How much is the special offer?', NULL, CAST(N'2021-12-24' AS Date), 32, 3, 170)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (568, NULL, N'A', NULL, 11, N'People who want to travel overseas', N'Members who belong to the fitness club', N'Staff who work for the Travel Lodge Inn', N'Those who want to get away for the weekend', NULL, N'Who would be most interested in this advertisement?', NULL, CAST(N'2021-12-24' AS Date), 32, 3, 171)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (569, NULL, N'A', NULL, 12, N'nearly', N'immediately', N'precisely', N'significantly', NULL, N'Employees who have not yet registered on the new company website must do so ------', NULL, CAST(N'2021-12-24' AS Date), 32, 3, 171)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (570, NULL, N'A', NULL, 13, N'professional', N'profession', N'professionals', N'professionally', NULL, N'Rosewater Medical Center employs healthcare -------- affiliated with Huron University.', NULL, CAST(N'2021-12-24' AS Date), 32, 3, 171)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (571, NULL, N'A', NULL, 14, N'indicates', N'commands', N'notices ', N'distributes', NULL, N'Once you have detected a fatal virus on your computer, common sense -------- that you should have your hard drive reformatted by skilled professionals.', NULL, CAST(N'2021-12-24' AS Date), 32, 4, 172)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (572, NULL, N'A', NULL, 15, N'just ', N'once', N'such', N'likely', NULL, N'Choose the word or phrase that best completes the blanks:', NULL, CAST(N'2021-12-24' AS Date), 32, 4, 172)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (573, NULL, N'A', NULL, 16, N'would have agreed', N'would agree', N'has agree', N' were agreeing', NULL, N'Choose the word or phrase that best completes the blanks:', NULL, CAST(N'2021-12-24' AS Date), 32, 4, 172)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (574, NULL, N'A', NULL, 17, N'In fact', N'In spite of', N'On the other hand', N'Even though', NULL, N'Choose the word or phrase that best completes the blanks:', NULL, CAST(N'2021-12-24' AS Date), 32, 4, 173)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (575, NULL, N'A', NULL, 18, N'The man is finishing his meal', N'The customer is waiting for a table', N'The waiter is setting the table', N'The woman is looking at the menu', NULL, N'Choose the word or phrase that best completes the blanks:', NULL, CAST(N'2021-12-24' AS Date), 32, 4, 173)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (576, NULL, N'A', NULL, 19, N'He’s handling a tool', N'He’s cutting grass', N'He’s building a bookshelf', N'He’s walking up to the roof', NULL, N'Choose the word or phrase that best completes the blanks:', NULL, CAST(N'2021-12-24' AS Date), 32, 4, 173)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (577, NULL, N'A', NULL, 20, N'I came in early today', N'Because I had a question', N'By two o’clock at the earliest', N'Because I had a question', NULL, N'Why did you come by yesterday?', NULL, CAST(N'2021-12-24' AS Date), 32, 5, 174)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (578, NULL, N'A', NULL, 21, N'Yes, I can lend it to you', N'The handle is in the front', N'Yes, that would be nice, thanks', N'The handle is in the front', NULL, N'Would you like a hand with your luggage?', NULL, CAST(N'2021-12-24' AS Date), 32, 5, 174)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (579, NULL, N'A', NULL, 22, N'No, it’s in Los Angeles', N'Yes, he is the boss there', N'He’s on a business trip', N'Yes, he is the boss there', NULL, N'Mr. Robertson runs our San Francisco office, doesn’t he?', NULL, CAST(N'2021-12-24' AS Date), 32, 5, 174)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (580, NULL, N'A', NULL, 23, N'100.0', N'200.0', N'300.0', N'400.0', NULL, N' How many pens does the man need?', NULL, CAST(N'2021-12-24' AS Date), 32, 5, 174)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (581, NULL, N'A', NULL, 24, N'To write a book', N'For the office employees', N'To make a large drawing', N'To give away at a conference', NULL, N'Why does he need the pens?', NULL, CAST(N'2021-12-24' AS Date), 32, 5, 174)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (582, NULL, N'A', NULL, 25, N'20.0', N'40.0', N'120.0', N'140.0', NULL, N'How much will he pay for the pens?', NULL, CAST(N'2021-12-24' AS Date), 32, 5, 174)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (583, NULL, N'A', NULL, 26, N'One day', N'One weekend', N'One week', N'One month', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 32, 6, 175)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (584, NULL, N'A', NULL, 27, N'100.0', N'200.0', N'300.0', N'400.0', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 32, 6, 175)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (585, NULL, N'A', NULL, 28, N'People who want to travel overseas', N'Members who belong to the fitness club', N'Staff who work for the Travel Lodge Inn', N'Those who want to get away for the weekend', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 32, 6, 175)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (586, NULL, N'A', NULL, 29, N'nearly', N'immediately', N'precisely', N'significantly', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 32, 6, 176)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (587, NULL, N'A', NULL, 30, N'professional', N'profession', N'professionals', N'professionally', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 32, 6, 176)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (588, NULL, N'A', NULL, 31, N'indicates', N'commands', N'notices ', N'distributes', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 32, 6, 176)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (589, NULL, N'A', NULL, 32, N'just ', N'once', N'such', N'likely', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 32, 7, 177)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (590, NULL, N'A', NULL, 33, N'would have agreed', N'would agree', N'has agree', N' were agreeing', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 32, 7, 177)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (591, NULL, N'A', NULL, 34, N'In fact', N'In spite of', N'On the other hand', N'Even though', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 32, 7, 177)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (592, NULL, N'A', NULL, 35, N'just ', N'once', N'such', N'likely', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 32, 7, 178)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (593, NULL, N'A', NULL, 36, N'would have agreed', N'would agree', N'has agree', N' were agreeing', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 32, 7, 178)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (594, NULL, N'A', NULL, 37, N'In fact', N'In spite of', N'On the other hand', N'Even though', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 32, 7, 178)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (595, NULL, N'A', NULL, 1, NULL, NULL, NULL, NULL, NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 33, 1, 179)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (596, NULL, N'A', NULL, 2, NULL, NULL, NULL, NULL, NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 33, 1, 180)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (597, NULL, N'A', NULL, 3, NULL, NULL, NULL, NULL, NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 33, 2, 181)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (598, NULL, N'A', NULL, 4, NULL, NULL, NULL, NULL, NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 33, 2, 181)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (599, NULL, N'A', NULL, 5, NULL, NULL, NULL, NULL, NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 33, 2, 181)
GO
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (600, NULL, N'A', NULL, 6, NULL, NULL, NULL, NULL, NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 33, 2, 181)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (601, NULL, N'A', NULL, 7, NULL, NULL, NULL, NULL, NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 33, 2, 181)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (602, NULL, N'A', NULL, 8, N'20.0', N'40.0', N'120.0', N'140.0', NULL, N'How much will he pay for the pens?', NULL, CAST(N'2021-12-24' AS Date), 33, 3, 182)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (603, NULL, N'A', NULL, 9, N'One day', N'One weekend', N'One week', N'One month', NULL, N'According to the speaker, how long will the special offer last?', NULL, CAST(N'2021-12-24' AS Date), 33, 3, 182)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (604, NULL, N'A', NULL, 10, N'100.0', N'200.0', N'300.0', N'400.0', NULL, N'How much is the special offer?', NULL, CAST(N'2021-12-24' AS Date), 33, 3, 182)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (605, NULL, N'A', NULL, 11, N'People who want to travel overseas', N'Members who belong to the fitness club', N'Staff who work for the Travel Lodge Inn', N'Those who want to get away for the weekend', NULL, N'Who would be most interested in this advertisement?', NULL, CAST(N'2021-12-24' AS Date), 33, 3, 183)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (606, NULL, N'A', NULL, 12, N'nearly', N'immediately', N'precisely', N'significantly', NULL, N'Employees who have not yet registered on the new company website must do so ------', NULL, CAST(N'2021-12-24' AS Date), 33, 3, 183)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (607, NULL, N'A', NULL, 13, N'professional', N'profession', N'professionals', N'professionally', NULL, N'Rosewater Medical Center employs healthcare -------- affiliated with Huron University.', NULL, CAST(N'2021-12-24' AS Date), 33, 3, 183)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (608, NULL, N'A', NULL, 14, N'indicates', N'commands', N'notices ', N'distributes', NULL, N'Once you have detected a fatal virus on your computer, common sense -------- that you should have your hard drive reformatted by skilled professionals.', NULL, CAST(N'2021-12-24' AS Date), 33, 4, 184)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (609, NULL, N'A', NULL, 15, N'just ', N'once', N'such', N'likely', NULL, N'Choose the word or phrase that best completes the blanks:', NULL, CAST(N'2021-12-24' AS Date), 33, 4, 184)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (610, NULL, N'A', NULL, 16, N'would have agreed', N'would agree', N'has agree', N' were agreeing', NULL, N'Choose the word or phrase that best completes the blanks:', NULL, CAST(N'2021-12-24' AS Date), 33, 4, 184)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (611, NULL, N'A', NULL, 17, N'In fact', N'In spite of', N'On the other hand', N'Even though', NULL, N'Choose the word or phrase that best completes the blanks:', NULL, CAST(N'2021-12-24' AS Date), 33, 4, 185)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (612, NULL, N'A', NULL, 18, N'The man is finishing his meal', N'The customer is waiting for a table', N'The waiter is setting the table', N'The woman is looking at the menu', NULL, N'Choose the word or phrase that best completes the blanks:', NULL, CAST(N'2021-12-24' AS Date), 33, 4, 185)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (613, NULL, N'A', NULL, 19, N'He’s handling a tool', N'He’s cutting grass', N'He’s building a bookshelf', N'He’s walking up to the roof', NULL, N'Choose the word or phrase that best completes the blanks:', NULL, CAST(N'2021-12-24' AS Date), 33, 4, 185)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (614, NULL, N'A', NULL, 20, N'I came in early today', N'Because I had a question', N'By two o’clock at the earliest', N'Because I had a question', NULL, N'Why did you come by yesterday?', NULL, CAST(N'2021-12-24' AS Date), 33, 5, 186)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (615, NULL, N'A', NULL, 21, N'Yes, I can lend it to you', N'The handle is in the front', N'Yes, that would be nice, thanks', N'The handle is in the front', NULL, N'Would you like a hand with your luggage?', NULL, CAST(N'2021-12-24' AS Date), 33, 5, 186)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (616, NULL, N'A', NULL, 22, N'No, it’s in Los Angeles', N'Yes, he is the boss there', N'He’s on a business trip', N'Yes, he is the boss there', NULL, N'Mr. Robertson runs our San Francisco office, doesn’t he?', NULL, CAST(N'2021-12-24' AS Date), 33, 5, 186)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (617, NULL, N'A', NULL, 23, N'100.0', N'200.0', N'300.0', N'400.0', NULL, N' How many pens does the man need?', NULL, CAST(N'2021-12-24' AS Date), 33, 5, 186)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (618, NULL, N'A', NULL, 24, N'To write a book', N'For the office employees', N'To make a large drawing', N'To give away at a conference', NULL, N'Why does he need the pens?', NULL, CAST(N'2021-12-24' AS Date), 33, 5, 186)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (619, NULL, N'A', NULL, 25, N'20.0', N'40.0', N'120.0', N'140.0', NULL, N'How much will he pay for the pens?', NULL, CAST(N'2021-12-24' AS Date), 33, 5, 186)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (620, NULL, N'A', NULL, 26, N'One day', N'One weekend', N'One week', N'One month', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 33, 6, 187)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (621, NULL, N'A', NULL, 27, N'100.0', N'200.0', N'300.0', N'400.0', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 33, 6, 187)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (622, NULL, N'A', NULL, 28, N'People who want to travel overseas', N'Members who belong to the fitness club', N'Staff who work for the Travel Lodge Inn', N'Those who want to get away for the weekend', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 33, 6, 187)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (623, NULL, N'A', NULL, 29, N'nearly', N'immediately', N'precisely', N'significantly', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 33, 6, 188)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (624, NULL, N'A', NULL, 30, N'professional', N'profession', N'professionals', N'professionally', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 33, 6, 188)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (625, NULL, N'A', NULL, 31, N'indicates', N'commands', N'notices ', N'distributes', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 33, 6, 188)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (626, NULL, N'A', NULL, 32, N'just ', N'once', N'such', N'likely', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 33, 7, 189)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (627, NULL, N'A', NULL, 33, N'would have agreed', N'would agree', N'has agree', N' were agreeing', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 33, 7, 189)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (628, NULL, N'A', NULL, 34, N'In fact', N'In spite of', N'On the other hand', N'Even though', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 33, 7, 189)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (629, NULL, N'A', NULL, 35, N'just ', N'once', N'such', N'likely', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 33, 7, 190)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (630, NULL, N'A', NULL, 36, N'would have agreed', N'would agree', N'has agree', N' were agreeing', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 33, 7, 190)
INSERT [dbo].[question] ([cauhoibaithithuid], [audiomp3], [correctanswer], [image], [number], [option1], [option2], [option3], [option4], [paragraph], [question], [update_by], [update_date], [baithithuid], [id_part], [id_set]) VALUES (631, NULL, N'A', NULL, 37, N'In fact', N'In spite of', N'On the other hand', N'Even though', NULL, N'', NULL, CAST(N'2021-12-24' AS Date), 33, 7, 190)
SET IDENTITY_INSERT [dbo].[question] OFF
SET IDENTITY_INSERT [dbo].[role] ON 

INSERT [dbo].[role] ([id_role], [code], [description], [role]) VALUES (1, 1, NULL, N'ROLE_TUTORIAL')
INSERT [dbo].[role] ([id_role], [code], [description], [role]) VALUES (2, 2, NULL, N'ROLE_MEMBER')
INSERT [dbo].[role] ([id_role], [code], [description], [role]) VALUES (3, 3, NULL, N'ROLE_MEMBER_VIP')
INSERT [dbo].[role] ([id_role], [code], [description], [role]) VALUES (4, 4, NULL, N'ROLE_CONTENT')
INSERT [dbo].[role] ([id_role], [code], [description], [role]) VALUES (5, 5, NULL, N'ROLE_MANAGER')
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
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (20, NULL, N'num1', N'Mo ta set question 1', N'image1.jpg', 0, NULL, NULL, 11, 1)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (21, NULL, N'num1', N'Mo ta set question 1', N'image1.jpg', 0, NULL, NULL, 12, 1)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (22, NULL, N'num1', N'Mo ta set question 1', N'image1.jpg', 0, NULL, NULL, 13, 1)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (23, NULL, N'num2', N'Mo ta set question 2', N'image2.jpg', 0, NULL, NULL, 13, 1)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (24, NULL, N'num3', N'Mo ta set question 3', N'', 0, NULL, NULL, 13, 2)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (25, NULL, N'num1', N'Mo ta set question 1', N'image1.jpg', 0, NULL, NULL, 14, 1)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (26, NULL, N'num2', N'Mo ta set question 2', N'image2.jpg', 0, NULL, NULL, 14, 1)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (27, NULL, N'num3', N'Mo ta set question 3', N'', 0, NULL, NULL, 14, 2)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (28, NULL, N'num1', N'Mo ta set question 1', N'image1.jpg', 0, NULL, NULL, 15, 1)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (29, NULL, N'num2', N'Mo ta set question 2', N'image2.jpg', 0, NULL, NULL, 15, 1)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (30, NULL, N'num3', N'Mo ta set question 3', N'', 0, NULL, NULL, 15, 2)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (31, NULL, N'num1', N'Mo ta set question 1', N'image1.jpg', 0, NULL, NULL, 16, 1)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (32, NULL, N'num2', N'Mo ta set question 2', N'image2.jpg', 0, NULL, NULL, 16, 1)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (33, NULL, N'num3', N'Mo ta set question 3', N'', 0, NULL, NULL, 16, 2)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (34, NULL, N'num4', N'Mo ta set question 4', N'', 0, NULL, NULL, 16, 3)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (35, NULL, N'num1', N'Mo ta set question 1', N'image1.jpg', 0, NULL, NULL, 17, 1)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (36, NULL, N'num2', N'Mo ta set question 2', N'image2.jpg', 0, NULL, NULL, 17, 1)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (37, NULL, N'num3', N'Mo ta set question 3', N'', 0, NULL, NULL, 17, 2)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (38, NULL, N'num4', N'Mo ta set question 4', N'', 0, NULL, NULL, 17, 3)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (39, NULL, N'num1', N'Mo ta set question 1', N'image1.jpg', 0, NULL, NULL, 18, 1)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (40, NULL, N'num2', N'Mo ta set question 2', N'image2.jpg', 0, NULL, NULL, 18, 1)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (41, NULL, N'num3', N'Mo ta set question 3', N'', 0, NULL, NULL, 18, 2)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (42, NULL, N'num4', N'Mo ta set question 4', N'', 0, NULL, NULL, 18, 3)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (43, NULL, N'num1', N'Mo ta set question 1', N'image1.jpg', 0, NULL, NULL, 19, 1)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (44, NULL, N'num2', N'Mo ta set question 2', N'image2.jpg', 0, NULL, NULL, 19, 1)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (45, NULL, N'num3', N'Mo ta set question 3', N'', 0, NULL, NULL, 19, 2)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (46, NULL, N'num4', N'Mo ta set question 4', N'', 0, NULL, NULL, 19, 3)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (47, NULL, N'num1', N'Mo ta set question 1', N'image1.jpg', 0, NULL, NULL, 20, 1)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (48, NULL, N'num2', N'Mo ta set question 2', N'image2.jpg', 0, NULL, NULL, 20, 1)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (49, NULL, N'num3', N'Mo ta set question 3', N'', 0, NULL, NULL, 20, 2)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (50, NULL, N'num4', N'Mo ta set question 4', N'', 0, NULL, NULL, 20, 3)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (51, NULL, N'num1', N'Mo ta set question 1', N'image1.jpg', 0, NULL, NULL, 21, 1)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (52, NULL, N'num2', N'Mo ta set question 2', N'image2.jpg', 0, NULL, NULL, 21, 1)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (53, NULL, N'num3', N'Mo ta set question 3', N'', 0, NULL, NULL, 21, 2)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (54, NULL, N'num4', N'Mo ta set question 4', N'', 0, NULL, NULL, 21, 3)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (55, NULL, N'num1', N'Mo ta set question 1', N'image1.jpg', 0, NULL, NULL, 22, 1)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (56, NULL, N'num2', N'Mo ta set question 2', N'image2.jpg', 0, NULL, NULL, 22, 1)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (57, NULL, N'num3', N'Mo ta set question 3', N'', 0, NULL, NULL, 22, 2)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (58, NULL, N'num4', N'Mo ta set question 4', N'', 0, NULL, NULL, 22, 3)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (59, NULL, N'num1', N'Mo ta set question 1', N'image1.jpg', 0, NULL, NULL, 23, 1)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (60, NULL, N'num2', N'Mo ta set question 2', N'image2.jpg', 0, NULL, NULL, 23, 1)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (61, NULL, N'num3', N'Mo ta set question 3', N'', 0, NULL, NULL, 23, 2)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (62, NULL, N'num4', N'Mo ta set question 4', N'', 0, NULL, NULL, 23, 3)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (63, NULL, N'num5', N'Mo ta set question 5', N'', 0, NULL, NULL, 23, 3)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (64, NULL, N'num6', N'Mo ta set question 6', N'', 0, NULL, NULL, 23, 4)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (65, NULL, N'num7', N'Mo ta set question 7', N'', 0, NULL, NULL, 23, 4)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (66, NULL, N'', N'Mo ta set question 8', N'', 0, NULL, NULL, 23, 5)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (67, NULL, N'', N'', N'', 0, NULL, NULL, 23, 5)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (68, NULL, N'', N'Mo ta set question 9', N'', 0, NULL, NULL, 23, 6)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (69, NULL, N'', N'Mo ta set question 10', N'', 0, NULL, NULL, 23, 6)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (70, NULL, N'', N'Mo ta set question 11', N'', 0, NULL, NULL, 23, 7)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (71, NULL, N'num1', N'Mo ta set question 1', N'image1.jpg', 0, NULL, NULL, 24, 1)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (72, NULL, N'num2', N'Mo ta set question 2', N'image2.jpg', 0, NULL, NULL, 24, 1)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (73, NULL, N'num3', N'Mo ta set question 3', N'', 0, NULL, NULL, 24, 2)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (74, NULL, N'num4', N'Mo ta set question 4', N'', 0, NULL, NULL, 24, 3)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (75, NULL, N'num5', N'Mo ta set question 5', N'', 0, NULL, NULL, 24, 3)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (76, NULL, N'num6', N'Mo ta set question 6', N'', 0, NULL, NULL, 24, 4)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (77, NULL, N'num7', N'Mo ta set question 7', N'', 0, NULL, NULL, 24, 4)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (78, NULL, N'', N'Mo ta set question 8', N'', 0, NULL, NULL, 24, 5)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (79, NULL, N'', N'', N'', 0, NULL, NULL, 24, 5)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (80, NULL, N'', N'Mo ta set question 9', N'', 0, NULL, NULL, 24, 6)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (81, NULL, N'', N'Mo ta set question 10', N'', 0, NULL, NULL, 24, 6)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (82, NULL, N'', N'Mo ta set question 11', N'', 0, NULL, NULL, 24, 7)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (83, N'num1', N'Mo ta set question 1', N'image1.jpg', N'', 0, NULL, CAST(N'2021-12-24' AS Date), 25, 1)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (84, N'num2', N'Mo ta set question 2', N'image2.jpg', N'', 0, NULL, CAST(N'2021-12-24' AS Date), 25, 1)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (85, N'num3', N'Mo ta set question 3', N'', N'', 0, NULL, CAST(N'2021-12-24' AS Date), 25, 2)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (86, N'num4', N'Mo ta set question 4', N'', N'', 0, NULL, CAST(N'2021-12-24' AS Date), 25, 3)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (87, N'num5', N'Mo ta set question 5', N'', N'', 0, NULL, CAST(N'2021-12-24' AS Date), 25, 3)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (88, N'num6', N'Mo ta set question 6', N'', N'', 0, NULL, CAST(N'2021-12-24' AS Date), 25, 4)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (89, N'num7', N'Mo ta set question 7', N'', N'', 0, NULL, CAST(N'2021-12-24' AS Date), 25, 4)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (90, N'', N'Mo ta set question 8', N'', N'', 0, NULL, CAST(N'2021-12-24' AS Date), 25, 5)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (91, N'', N'', N'', N'', 0, NULL, CAST(N'2021-12-24' AS Date), 25, 5)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (92, N'', N'Mo ta set question 9', N'', N'Paragraph 1', 0, NULL, CAST(N'2021-12-24' AS Date), 25, 6)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (93, N'', N'Mo ta set question 10', N'', N'Paragraph 2', 0, NULL, CAST(N'2021-12-24' AS Date), 25, 6)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (94, N'', N'Mo ta set question 11', N'', N'Paragraph 3', 0, NULL, CAST(N'2021-12-24' AS Date), 25, 7)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (95, N'num1', N'Mo ta set question 1', N'image1.jpg', N'', 0, NULL, CAST(N'2021-12-24' AS Date), 26, 1)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (96, N'num2', N'Mo ta set question 2', N'image2.jpg', N'', 0, NULL, CAST(N'2021-12-24' AS Date), 26, 1)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (97, N'num3', N'Mo ta set question 3', N'', N'', 0, NULL, CAST(N'2021-12-24' AS Date), 26, 2)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (98, N'num4', N'Mo ta set question 4', N'', N'', 0, NULL, CAST(N'2021-12-24' AS Date), 26, 3)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (99, N'num5', N'Mo ta set question 5', N'', N'', 0, NULL, CAST(N'2021-12-24' AS Date), 26, 3)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (100, N'num6', N'Mo ta set question 6', N'', N'', 0, NULL, CAST(N'2021-12-24' AS Date), 26, 4)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (101, N'num7', N'Mo ta set question 7', N'', N'', 0, NULL, CAST(N'2021-12-24' AS Date), 26, 4)
GO
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (102, N'', N'Mo ta set question 8', N'', N'', 0, NULL, CAST(N'2021-12-24' AS Date), 26, 5)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (103, N'', N'', N'', N'', 0, NULL, CAST(N'2021-12-24' AS Date), 26, 5)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (104, N'', N'Mo ta set question 9', N'', N'Paragraph 1', 0, NULL, CAST(N'2021-12-24' AS Date), 26, 6)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (105, N'', N'Mo ta set question 10', N'', N'Paragraph 2', 0, NULL, CAST(N'2021-12-24' AS Date), 26, 6)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (106, N'', N'Mo ta set question 11', N'', N'Paragraph 3', 0, NULL, CAST(N'2021-12-24' AS Date), 26, 7)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (107, N'num1', N'Mo ta set question 1', N'image1.jpg', N'', 0, NULL, CAST(N'2021-12-24' AS Date), 27, 1)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (108, N'num2', N'Mo ta set question 2', N'image2.jpg', N'', 0, NULL, CAST(N'2021-12-24' AS Date), 27, 1)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (109, N'num3', N'Mo ta set question 3', N'', N'', 0, NULL, CAST(N'2021-12-24' AS Date), 27, 2)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (110, N'num4', N'Mo ta set question 4', N'', N'', 0, NULL, CAST(N'2021-12-24' AS Date), 27, 3)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (111, N'num5', N'Mo ta set question 5', N'', N'', 0, NULL, CAST(N'2021-12-24' AS Date), 27, 3)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (112, N'num6', N'Mo ta set question 6', N'', N'', 0, NULL, CAST(N'2021-12-24' AS Date), 27, 4)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (113, N'num7', N'Mo ta set question 7', N'', N'', 0, NULL, CAST(N'2021-12-24' AS Date), 27, 4)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (114, N'', N'Mo ta set question 8', N'', N'', 0, NULL, CAST(N'2021-12-24' AS Date), 27, 5)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (115, N'', N'', N'', N'', 0, NULL, CAST(N'2021-12-24' AS Date), 27, 5)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (116, N'', N'Mo ta set question 9', N'', N'Paragraph 1', 0, NULL, CAST(N'2021-12-24' AS Date), 27, 6)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (117, N'', N'Mo ta set question 10', N'', N'Paragraph 2', 0, NULL, CAST(N'2021-12-24' AS Date), 27, 6)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (118, N'', N'Mo ta set question 11', N'', N'Paragraph 3', 0, NULL, CAST(N'2021-12-24' AS Date), 27, 7)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (119, N'num1', N'Mo ta set question 1', N'image1.jpg', N'', 0, NULL, CAST(N'2021-12-24' AS Date), 28, 1)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (120, N'num2', N'Mo ta set question 2', N'image2.jpg', N'', 0, NULL, CAST(N'2021-12-24' AS Date), 28, 1)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (121, N'num3', N'Mo ta set question 3', N'', N'', 0, NULL, CAST(N'2021-12-24' AS Date), 28, 2)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (122, N'num4', N'Mo ta set question 4', N'', N'', 0, NULL, CAST(N'2021-12-24' AS Date), 28, 3)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (123, N'num5', N'Mo ta set question 5', N'', N'', 0, NULL, CAST(N'2021-12-24' AS Date), 28, 3)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (124, N'num6', N'Mo ta set question 6', N'', N'', 0, NULL, CAST(N'2021-12-24' AS Date), 28, 4)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (125, N'num7', N'Mo ta set question 7', N'', N'', 0, NULL, CAST(N'2021-12-24' AS Date), 28, 4)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (126, N'', N'Mo ta set question 8', N'', N'', 0, NULL, CAST(N'2021-12-24' AS Date), 28, 5)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (127, N'', N'Mo ta set question 9', N'', N'Paragraph 1', 0, NULL, CAST(N'2021-12-24' AS Date), 28, 6)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (128, N'', N'Mo ta set question 10', N'', N'Paragraph 2', 0, NULL, CAST(N'2021-12-24' AS Date), 28, 6)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (129, N'', N'Mo ta set question 11', N'', N'Paragraph 3', 0, NULL, CAST(N'2021-12-24' AS Date), 28, 7)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (130, N'', N'Mo ta set question 12', N'', N'Paragraph 4', 0, NULL, CAST(N'2021-12-24' AS Date), 28, 7)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (131, N'num1', N'Mo ta set question 1', N'image1.jpg', N'', 0, NULL, CAST(N'2021-12-24' AS Date), 29, 1)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (132, N'num2', N'Mo ta set question 2', N'image2.jpg', N'', 0, NULL, CAST(N'2021-12-24' AS Date), 29, 1)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (133, N'num3', N'Mo ta set question 3', N'', N'', 0, NULL, CAST(N'2021-12-24' AS Date), 29, 2)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (134, N'num4', N'Mo ta set question 4', N'', N'', 0, NULL, CAST(N'2021-12-24' AS Date), 29, 3)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (135, N'num5', N'Mo ta set question 5', N'', N'', 0, NULL, CAST(N'2021-12-24' AS Date), 29, 3)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (136, N'num6', N'Mo ta set question 6', N'', N'', 0, NULL, CAST(N'2021-12-24' AS Date), 29, 4)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (137, N'num7', N'Mo ta set question 7', N'', N'', 0, NULL, CAST(N'2021-12-24' AS Date), 29, 4)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (138, N'', N'Mo ta set question 8', N'', N'', 0, NULL, CAST(N'2021-12-24' AS Date), 29, 5)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (139, N'', N'Mo ta set question 9', N'', N'Paragraph 1', 0, NULL, CAST(N'2021-12-24' AS Date), 29, 6)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (140, N'', N'Mo ta set question 10', N'', N'Paragraph 2', 0, NULL, CAST(N'2021-12-24' AS Date), 29, 6)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (141, N'', N'Mo ta set question 11', N'', N'Paragraph 3', 0, NULL, CAST(N'2021-12-24' AS Date), 29, 7)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (142, N'', N'Mo ta set question 12', N'', N'Paragraph 4', 0, NULL, CAST(N'2021-12-24' AS Date), 29, 7)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (143, N'num1', N'Mo ta set question 1', N'image1.jpg', N'', 0, NULL, CAST(N'2021-12-24' AS Date), 30, 1)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (144, N'num2', N'Mo ta set question 2', N'image2.jpg', N'', 0, NULL, CAST(N'2021-12-24' AS Date), 30, 1)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (145, N'num3', N'Mo ta set question 3', N'', N'', 0, NULL, CAST(N'2021-12-24' AS Date), 30, 2)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (146, N'num4', N'Mo ta set question 4', N'', N'', 0, NULL, CAST(N'2021-12-24' AS Date), 30, 3)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (147, N'num5', N'Mo ta set question 5', N'', N'', 0, NULL, CAST(N'2021-12-24' AS Date), 30, 3)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (148, N'num6', N'Mo ta set question 6', N'', N'', 0, NULL, CAST(N'2021-12-24' AS Date), 30, 4)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (149, N'num7', N'Mo ta set question 7', N'', N'', 0, NULL, CAST(N'2021-12-24' AS Date), 30, 4)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (150, N'', N'Mo ta set question 8', N'', N'', 0, NULL, CAST(N'2021-12-24' AS Date), 30, 5)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (151, N'', N'Mo ta set question 9', N'', N'Paragraph 1', 0, NULL, CAST(N'2021-12-24' AS Date), 30, 6)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (152, N'', N'Mo ta set question 10', N'', N'Paragraph 2', 0, NULL, CAST(N'2021-12-24' AS Date), 30, 6)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (153, N'', N'Mo ta set question 11', N'', N'Paragraph 3', 0, NULL, CAST(N'2021-12-24' AS Date), 30, 7)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (154, N'', N'Mo ta set question 12', N'', N'Paragraph 4', 0, NULL, CAST(N'2021-12-24' AS Date), 30, 7)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (155, N'audio1', N'Mo ta set question 1', N'image1.jpg', N'', 0, NULL, CAST(N'2021-12-24' AS Date), 31, 1)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (156, N'audio2', N'Mo ta set question 2', N'image2.jpg', N'', 0, NULL, CAST(N'2021-12-24' AS Date), 31, 1)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (157, N'audio3', N'Mo ta set question 3', N'', N'', 0, NULL, CAST(N'2021-12-24' AS Date), 31, 2)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (158, N'audio4', N'Mo ta set question 4', N'', N'', 0, NULL, CAST(N'2021-12-24' AS Date), 31, 3)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (159, N'audio5', N'Mo ta set question 5', N'', N'', 0, NULL, CAST(N'2021-12-24' AS Date), 31, 3)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (160, N'audio6', N'Mo ta set question 6', N'', N'', 0, NULL, CAST(N'2021-12-24' AS Date), 31, 4)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (161, N'audio7', N'Mo ta set question 7', N'', N'', 0, NULL, CAST(N'2021-12-24' AS Date), 31, 4)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (162, N'', N'Mo ta set question 8', N'', N'', 0, NULL, CAST(N'2021-12-24' AS Date), 31, 5)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (163, N'', N'Mo ta set question 9', N'', N'Paragraph 1', 0, NULL, CAST(N'2021-12-24' AS Date), 31, 6)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (164, N'', N'Mo ta set question 10', N'', N'Paragraph 2', 0, NULL, CAST(N'2021-12-24' AS Date), 31, 6)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (165, N'', N'Mo ta set question 11', N'', N'Paragraph 3', 0, NULL, CAST(N'2021-12-24' AS Date), 31, 7)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (166, N'', N'Mo ta set question 12', N'', N'Paragraph 4', 0, NULL, CAST(N'2021-12-24' AS Date), 31, 7)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (167, N'audio1.mp3', N'Mo ta set question 1', N'image1.jpg', N'', 0, NULL, CAST(N'2021-12-24' AS Date), 32, 1)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (168, N'audio2.mp3', N'Mo ta set question 2', N'image2.jpg', N'', 0, NULL, CAST(N'2021-12-24' AS Date), 32, 1)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (169, N'audio3.mp3', N'Mo ta set question 3', N'', N'', 0, NULL, CAST(N'2021-12-24' AS Date), 32, 2)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (170, N'audio4.mp3', N'Mo ta set question 4', N'', N'', 0, NULL, CAST(N'2021-12-24' AS Date), 32, 3)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (171, N'audio5.mp3', N'Mo ta set question 5', N'', N'', 0, NULL, CAST(N'2021-12-24' AS Date), 32, 3)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (172, N'audio6.mp3', N'Mo ta set question 6', N'', N'', 0, NULL, CAST(N'2021-12-24' AS Date), 32, 4)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (173, N'audio7.mp3', N'Mo ta set question 7', N'', N'', 0, NULL, CAST(N'2021-12-24' AS Date), 32, 4)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (174, N'', N'Mo ta set question 8', N'', N'', 0, NULL, CAST(N'2021-12-24' AS Date), 32, 5)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (175, N'', N'Mo ta set question 9', N'', N'Paragraph 1', 0, NULL, CAST(N'2021-12-24' AS Date), 32, 6)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (176, N'', N'Mo ta set question 10', N'', N'Paragraph 2', 0, NULL, CAST(N'2021-12-24' AS Date), 32, 6)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (177, N'', N'Mo ta set question 11', N'', N'Paragraph 3', 0, NULL, CAST(N'2021-12-24' AS Date), 32, 7)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (178, N'', N'Mo ta set question 12', N'', N'Paragraph 4', 0, NULL, CAST(N'2021-12-24' AS Date), 32, 7)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (179, N'audio1.mp3', N'Mo ta set question 1', N'image1.jpg', N'', 0, NULL, CAST(N'2021-12-24' AS Date), 33, 1)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (180, N'audio2.mp3', N'Mo ta set question 2', N'image2.jpg', N'', 0, NULL, CAST(N'2021-12-24' AS Date), 33, 1)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (181, N'audio3.mp3', N'Mo ta set question 3', N'', N'', 0, NULL, CAST(N'2021-12-24' AS Date), 33, 2)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (182, N'audio4.mp3', N'Mo ta set question 4', N'', N'', 0, NULL, CAST(N'2021-12-24' AS Date), 33, 3)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (183, N'audio5.mp3', N'Mo ta set question 5', N'', N'', 0, NULL, CAST(N'2021-12-24' AS Date), 33, 3)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (184, N'audio6.mp3', N'Mo ta set question 6', N'', N'', 0, NULL, CAST(N'2021-12-24' AS Date), 33, 4)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (185, N'audio7.mp3', N'Mo ta set question 7', N'', N'', 0, NULL, CAST(N'2021-12-24' AS Date), 33, 4)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (186, N'', N'Mo ta set question 8', N'', N'', 0, NULL, CAST(N'2021-12-24' AS Date), 33, 5)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (187, N'', N'Mo ta set question 9', N'', N'Paragraph 1', 0, NULL, CAST(N'2021-12-24' AS Date), 33, 6)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (188, N'', N'Mo ta set question 10', N'', N'Paragraph 2', 0, NULL, CAST(N'2021-12-24' AS Date), 33, 6)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (189, N'', N'Mo ta set question 11', N'', N'Paragraph 3', 0, NULL, CAST(N'2021-12-24' AS Date), 33, 7)
INSERT [dbo].[set_question] ([id_set], [audio], [content], [image], [paragraph], [total_quest], [update_by], [update_date], [exam_id_exam], [part_toeic_id_part]) VALUES (190, N'', N'Mo ta set question 12', N'', N'Paragraph 4', 0, NULL, CAST(N'2021-12-24' AS Date), 33, 7)
SET IDENTITY_INSERT [dbo].[set_question] OFF
/****** Object:  Index [UK_khw1hu7me9nitob9dhu86p3pa]    Script Date: 12/24/2021 9:40:18 PM ******/
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
