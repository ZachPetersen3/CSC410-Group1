-- QUERY TO DROP/RECREATE AGAPE DATABASE
-- RENAME SCHEMA TO CORRECT NAME 



/****** Object:  Table [MS\PeterseZ].[User]    Script Date: 8/7/2018 4:31:14 PM ******/
DROP TABLE [MS\PeterseZ].[User]
GO

/****** Object:  Table [MS\PeterseZ].[User]    Script Date: 8/7/2018 4:31:14 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [MS\PeterseZ].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Email] [varchar](100) NULL,
	[Avatar_Id] [int] NULL,
	[Location] [varchar](100) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO



/****** Object:  Table [MS\PeterseZ].[Task]    Script Date: 8/7/2018 4:31:37 PM ******/
DROP TABLE [MS\PeterseZ].[Task]
GO

/****** Object:  Table [MS\PeterseZ].[Task]    Script Date: 8/7/2018 4:31:37 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [MS\PeterseZ].[Task](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](500) NOT NULL,
	[Points] [int] NULL,
 CONSTRAINT [PK_Task] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO





ALTER TABLE [MS\PeterseZ].[UserTask] DROP CONSTRAINT [FK_UserTask_User]
GO

ALTER TABLE [MS\PeterseZ].[UserTask] DROP CONSTRAINT [FK_UserTask_Task]
GO

/****** Object:  Table [MS\PeterseZ].[UserTask]    Script Date: 8/7/2018 4:31:53 PM ******/
DROP TABLE [MS\PeterseZ].[UserTask]
GO

/****** Object:  Table [MS\PeterseZ].[UserTask]    Script Date: 8/7/2018 4:31:53 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [MS\PeterseZ].[UserTask](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[TaskId] [int] NOT NULL,
	[Date] [datetime] NULL,
	[Status] [varchar](100) NULL,
 CONSTRAINT [PK_UserTask] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [MS\PeterseZ].[UserTask]  WITH CHECK ADD  CONSTRAINT [FK_UserTask_Task] FOREIGN KEY([TaskId])
REFERENCES [MS\PeterseZ].[Task] ([Id])
GO

ALTER TABLE [MS\PeterseZ].[UserTask] CHECK CONSTRAINT [FK_UserTask_Task]
GO

ALTER TABLE [MS\PeterseZ].[UserTask]  WITH CHECK ADD  CONSTRAINT [FK_UserTask_User] FOREIGN KEY([UserId])
REFERENCES [MS\PeterseZ].[User] ([Id])
GO

ALTER TABLE [MS\PeterseZ].[UserTask] CHECK CONSTRAINT [FK_UserTask_User]
GO


