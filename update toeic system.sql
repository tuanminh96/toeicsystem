USE [ToeicSystem]
GO
/****** Object:  Table [dbo].[account]    Script Date: 12/13/2021 9:26:10 PM ******/
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
/****** Object:  Table [dbo].[exam]    Script Date: 12/13/2021 9:26:10 PM ******/
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
/****** Object:  Table [dbo].[explain_detail]    Script Date: 12/13/2021 9:26:10 PM ******/
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
/****** Object:  Table [dbo].[group_member]    Script Date: 12/13/2021 9:26:10 PM ******/
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
/****** Object:  Table [dbo].[group_team]    Script Date: 12/13/2021 9:26:10 PM ******/
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
/****** Object:  Table [dbo].[nguoi_dung]    Script Date: 12/13/2021 9:26:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nguoi_dung](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[description] [varchar](255) NULL,
	[dia_chi] [varchar](255) NULL,
	[email] [varchar](255) NULL,
	[gender] [int] NOT NULL,
	[ho_ten] [varchar](255) NULL,
	[is_delete] [bit] NOT NULL,
	[join_date] [date] NULL,
	[password] [varchar](255) NULL,
	[so_dien_thoai] [varchar](255) NULL,
	[role_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[notification]    Script Date: 12/13/2021 9:26:10 PM ******/
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
/****** Object:  Table [dbo].[part]    Script Date: 12/13/2021 9:26:10 PM ******/
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
/****** Object:  Table [dbo].[post]    Script Date: 12/13/2021 9:26:10 PM ******/
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
/****** Object:  Table [dbo].[question]    Script Date: 12/13/2021 9:26:10 PM ******/
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
/****** Object:  Table [dbo].[rating]    Script Date: 12/13/2021 9:26:10 PM ******/
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
/****** Object:  Table [dbo].[role]    Script Date: 12/13/2021 9:26:10 PM ******/
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
/****** Object:  Table [dbo].[set_question]    Script Date: 12/13/2021 9:26:10 PM ******/
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
/****** Object:  Table [dbo].[slidebanner]    Script Date: 12/13/2021 9:26:10 PM ******/
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
/****** Object:  Table [dbo].[teacher_remark]    Script Date: 12/13/2021 9:26:10 PM ******/
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
/****** Object:  Table [dbo].[test_result]    Script Date: 12/13/2021 9:26:10 PM ******/
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
ALTER TABLE [dbo].[nguoi_dung]  WITH CHECK ADD  CONSTRAINT [FK3r2pr803ynddfxbcu6r8mnuo5] FOREIGN KEY([role_id])
REFERENCES [dbo].[role] ([id_role])
GO
ALTER TABLE [dbo].[nguoi_dung] CHECK CONSTRAINT [FK3r2pr803ynddfxbcu6r8mnuo5]
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
