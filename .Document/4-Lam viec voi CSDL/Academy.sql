USE [master]
GO
/****** Object:  Database [Academy]    Script Date: 2/8/2017 7:13:57 PM ******/
CREATE DATABASE [Academy] 
GO
USE [Academy]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 2/8/2017 7:13:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [char](3) NOT NULL,
	[Name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 2/8/2017 7:13:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Courses](
	[Id] [char](3) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Schoolfee] [float] NULL,
	[LearnerCount] [int] NULL,
	[StartDate] [date] NULL,
	[Fnished] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Products]    Script Date: 2/8/2017 7:13:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1000,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[CategoryId] [char](3) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'MOB', N'Mobile')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'MOT', N'Motobike')
INSERT [dbo].[Courses] ([Id], [Name], [Schoolfee], [LearnerCount], [StartDate], [Fnished]) VALUES (N'ASP', N'Lập trình web với ASP.NET', 3500000, 26, CAST(0x2A3C0B00 AS Date), 0)
INSERT [dbo].[Courses] ([Id], [Name], [Schoolfee], [LearnerCount], [StartDate], [Fnished]) VALUES (N'JAV', N'Lập trình web với Java', 4000000, 23, CAST(0x383C0B00 AS Date), 0)
INSERT [dbo].[Courses] ([Id], [Name], [Schoolfee], [LearnerCount], [StartDate], [Fnished]) VALUES (N'MVC', N'Lập trình web với MS.NET MVC', 3500000, 20, CAST(0x493C0B00 AS Date), 0)
INSERT [dbo].[Courses] ([Id], [Name], [Schoolfee], [LearnerCount], [StartDate], [Fnished]) VALUES (N'PHP', N'Lập trình PHP', 2500000, 25, CAST(0x103C0B00 AS Date), 1)
INSERT [dbo].[Courses] ([Id], [Name], [Schoolfee], [LearnerCount], [StartDate], [Fnished]) VALUES (N'SQL', N'Hệ quản trị CSDL SQL Server', 1500000, 27, CAST(0x133C0B00 AS Date), 0)
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [CategoryId]) VALUES (1003, N'Dell Star', NULL)
INSERT [dbo].[Products] ([Id], [Name], [CategoryId]) VALUES (1004, N'Sony Vio', NULL)
INSERT [dbo].[Products] ([Id], [Name], [CategoryId]) VALUES (1005, N'Canon 2017', N'MOB')
SET IDENTITY_INSERT [dbo].[Products] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Courses__737584F66089DE2F]    Script Date: 2/8/2017 7:13:57 PM ******/
ALTER TABLE [dbo].[Courses] ADD UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Courses] ADD  DEFAULT (getdate()) FOR [StartDate]
GO
ALTER TABLE [dbo].[Courses] ADD  DEFAULT ((0)) FOR [Fnished]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ('MOB') FOR [CategoryId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK__Products__Catego__267ABA7A] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK__Products__Catego__267ABA7A]
GO
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD CHECK  (([LearnerCount]>=(15)))
GO
USE [master]
GO
ALTER DATABASE [Academy] SET  READ_WRITE 
GO
