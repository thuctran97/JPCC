CREATE DATABASE Training
USE Training
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 01/01/2002 02:21:39 ******/
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
	[Status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Courses] ([Id], [Name], [Schoolfee], [LearnerCount], [StartDate], [Status]) VALUES (N'AND', N'Lập trinh Android', 2500000, 28, CAST(0xE2260B00 AS Date), 0)
INSERT [dbo].[Courses] ([Id], [Name], [Schoolfee], [LearnerCount], [StartDate], [Status]) VALUES (N'JAV', N'Lập trinh Java', 4000000, 21, CAST(0xE2260B00 AS Date), 0)
INSERT [dbo].[Courses] ([Id], [Name], [Schoolfee], [LearnerCount], [StartDate], [Status]) VALUES (N'JVS', N'Lập trinh JavaScript', 2000000, 17, CAST(0xE2260B00 AS Date), 0)
INSERT [dbo].[Courses] ([Id], [Name], [Schoolfee], [LearnerCount], [StartDate], [Status]) VALUES (N'MVC', N'Lập trinh MS.MVC', 3000000, 22, CAST(0xE2260B00 AS Date), 0)
INSERT [dbo].[Courses] ([Id], [Name], [Schoolfee], [LearnerCount], [StartDate], [Status]) VALUES (N'PHP', N'Lập trinh PHP', 2500000, 25, CAST(0xE2260B00 AS Date), 0)
INSERT [dbo].[Courses] ([Id], [Name], [Schoolfee], [LearnerCount], [StartDate], [Status]) VALUES (N'SEO', N'Internet Marketing', 2000000, 18, CAST(0xE2260B00 AS Date), 0)
/****** Object:  Table [dbo].[Categories]    Script Date: 01/01/2002 02:21:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [char](3) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'LAB', N'Laptop')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'MOB', N'Mobile')
/****** Object:  Table [dbo].[Products]    Script Date: 01/01/2002 02:21:39 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON
INSERT [dbo].[Products] ([Id], [Name], [CategoryId]) VALUES (1000, N'iPhone 9', N'MOB')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId]) VALUES (1001, N'Samsung Note7', N'MOB')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId]) VALUES (1002, N'Nokia Star', N'MOB')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId]) VALUES (1003, N'Sony Vio4', NULL)
INSERT [dbo].[Products] ([Id], [Name], [CategoryId]) VALUES (1004, N'Acer New', NULL)
SET IDENTITY_INSERT [dbo].[Products] OFF
/****** Object:  Default [DF__Courses__StartDa__0425A276]    Script Date: 01/01/2002 02:21:39 ******/
ALTER TABLE [dbo].[Courses] ADD  DEFAULT (getdate()) FOR [StartDate]
GO
/****** Object:  Default [DF__Courses__Status__0519C6AF]    Script Date: 01/01/2002 02:21:39 ******/
ALTER TABLE [dbo].[Courses] ADD  DEFAULT ((0)) FOR [Status]
GO
/****** Object:  Default [DF__Products__Catego__182C9B23]    Script Date: 01/01/2002 02:21:39 ******/
ALTER TABLE [dbo].[Products] ADD  DEFAULT ('MOB') FOR [CategoryId]
GO
/****** Object:  Check [CK__Courses__060DEAE8]    Script Date: 01/01/2002 02:21:39 ******/
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD CHECK  (([Schoolfee]>(0) AND [LearnerCount]>(15)))
GO
/****** Object:  ForeignKey [FK__Products__Catego__1920BF5C]    Script Date: 01/01/2002 02:21:39 ******/
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
ON UPDATE SET NULL
GO
