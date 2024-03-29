USE [EZclo]
GO
/****** Object:  Table [dbo].[FileFolder]    Script Date: 2019/7/29 下午 03:37:31 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FileFolder](
	[F_Number] [int] IDENTITY(1,1) NOT NULL,
	[F_Name] [nvarchar](20) NULL,
	[F_Able] [int] NULL,
	[M_Number] [int] NULL,
 CONSTRAINT [XPKFolder] PRIMARY KEY NONCLUSTERED 
(
	[F_Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Member]    Script Date: 2019/7/29 下午 03:37:31 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Member](
	[M_Number] [int] IDENTITY(1,1) NOT NULL,
	[M_Born] [date] NULL,
	[M_Gender] [varchar](1) NULL,
	[M_Active] [bit] NULL,
	[M_PW] [varchar](20) NULL,
	[M_Email] [varchar](50) NULL,
 CONSTRAINT [XPKMember] PRIMARY KEY NONCLUSTERED 
(
	[M_Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Result]    Script Date: 2019/7/29 下午 03:37:31 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Result](
	[R_Number] [int] IDENTITY(1,1) NOT NULL,
	[R_Right] [int] NULL,
	[R_Wrong] [int] NULL,
	[R_TestTime] [date] NULL,
	[T_Number] [int] NULL,
 CONSTRAINT [XPKResult] PRIMARY KEY NONCLUSTERED 
(
	[R_Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Test]    Script Date: 2019/7/29 下午 03:37:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Test](
	[T_Number] [int] IDENTITY(1,1) NOT NULL,
	[T_Name] [nvarchar](20) NULL,
	[T_Content] [varbinary](max) NULL,
	[T_Letter] [varbinary](max) NULL,
	[T_BuildTime] [date] NULL,
	[T_Able] [int] NULL,
	[F_Number] [int] NULL,
 CONSTRAINT [XPKTest] PRIMARY KEY NONCLUSTERED 
(
	[T_Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
ALTER TABLE [dbo].[Member] ADD  CONSTRAINT [DF_Member_M_Active]  DEFAULT ((0)) FOR [M_Active]
GO
ALTER TABLE [dbo].[Result] ADD  CONSTRAINT [DF_Result_R_TestTime]  DEFAULT (getdate()) FOR [R_TestTime]
GO
ALTER TABLE [dbo].[Test] ADD  CONSTRAINT [DF_Test_T_BuildTime]  DEFAULT (getdate()) FOR [T_BuildTime]
GO
ALTER TABLE [dbo].[FileFolder]  WITH CHECK ADD  CONSTRAINT [R_1] FOREIGN KEY([M_Number])
REFERENCES [dbo].[Member] ([M_Number])
GO
ALTER TABLE [dbo].[FileFolder] CHECK CONSTRAINT [R_1]
GO
ALTER TABLE [dbo].[Result]  WITH CHECK ADD  CONSTRAINT [R_4] FOREIGN KEY([T_Number])
REFERENCES [dbo].[Test] ([T_Number])
GO
ALTER TABLE [dbo].[Result] CHECK CONSTRAINT [R_4]
GO
ALTER TABLE [dbo].[Test]  WITH CHECK ADD  CONSTRAINT [R_3] FOREIGN KEY([F_Number])
REFERENCES [dbo].[FileFolder] ([F_Number])
GO
ALTER TABLE [dbo].[Test] CHECK CONSTRAINT [R_3]
GO
