USE [master]
GO
/****** Object:  Database [SmartTrafficDB]    Script Date: 3/29/2019 7:44:59 AM ******/
CREATE DATABASE [SmartTrafficDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SmartTraffic', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\SmartTraffic.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SmartTraffic_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\SmartTraffic_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [SmartTrafficDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SmartTrafficDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SmartTrafficDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SmartTrafficDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SmartTrafficDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SmartTrafficDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SmartTrafficDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [SmartTrafficDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SmartTrafficDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SmartTrafficDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SmartTrafficDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SmartTrafficDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SmartTrafficDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SmartTrafficDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SmartTrafficDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SmartTrafficDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SmartTrafficDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SmartTrafficDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SmartTrafficDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SmartTrafficDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SmartTrafficDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SmartTrafficDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SmartTrafficDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SmartTrafficDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SmartTrafficDB] SET RECOVERY FULL 
GO
ALTER DATABASE [SmartTrafficDB] SET  MULTI_USER 
GO
ALTER DATABASE [SmartTrafficDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SmartTrafficDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SmartTrafficDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SmartTrafficDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [SmartTrafficDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'SmartTrafficDB', N'ON'
GO
ALTER DATABASE [SmartTrafficDB] SET QUERY_STORE = OFF
GO
USE [SmartTrafficDB]
GO
/****** Object:  Table [dbo].[tblCategory]    Script Date: 3/29/2019 7:45:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategory](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblCategory] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblComplaint]    Script Date: 3/29/2019 7:45:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblComplaint](
	[ComplaintID] [int] IDENTITY(1000000,1) NOT NULL,
	[ComplaintTitle] [nvarchar](50) NOT NULL,
	[ComplaintDescription] [nvarchar](max) NOT NULL,
	[CategoryID] [int] NOT NULL,
	[UserID] [bigint] NOT NULL,
	[ComplaintStatus] [nvarchar](50) NOT NULL,
	[ComplaintDate] [datetime] NOT NULL,
	[IsSeen] [bit] NOT NULL,
 CONSTRAINT [PK_tblComplaint] PRIMARY KEY CLUSTERED 
(
	[ComplaintID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEmergency]    Script Date: 3/29/2019 7:45:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmergency](
	[EmergencyID] [int] IDENTITY(1000000,1) NOT NULL,
	[EmergencyTitle] [nvarchar](50) NOT NULL,
	[UserID] [bigint] NOT NULL,
	[EmergencyStatus] [nvarchar](50) NOT NULL,
	[EmergencyLatitude] [float] NOT NULL,
	[EmergencyLongitude] [float] NOT NULL,
	[IsSeen] [bit] NOT NULL,
	[EmergencyDate] [datetime] NOT NULL,
 CONSTRAINT [PK_tblEmergency] PRIMARY KEY CLUSTERED 
(
	[EmergencyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblFeedback]    Script Date: 3/29/2019 7:45:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblFeedback](
	[FeedbackID] [int] IDENTITY(1000000,1) NOT NULL,
	[UserID] [bigint] NOT NULL,
	[FeedbackDate] [datetime] NOT NULL,
	[FeedbackDescription] [nvarchar](max) NOT NULL,
	[IsSeen] [bit] NOT NULL,
 CONSTRAINT [PK_tblFeedback] PRIMARY KEY CLUSTERED 
(
	[FeedbackID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblNotification]    Script Date: 3/29/2019 7:45:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblNotification](
	[NotificationID] [int] IDENTITY(1000000,1) NOT NULL,
	[NotificationMessage] [nvarchar](50) NOT NULL,
	[NotificationDateTime] [datetime] NOT NULL,
	[NotificationType] [nvarchar](50) NOT NULL,
	[NotificationLink] [nvarchar](50) NOT NULL,
	[IsSeen] [bit] NOT NULL,
	[UserID] [bigint] NULL,
 CONSTRAINT [PK_tblNotification] PRIMARY KEY CLUSTERED 
(
	[NotificationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSession]    Script Date: 3/29/2019 7:45:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSession](
	[SessionID] [int] IDENTITY(1,1) NOT NULL,
	[SessionBegin] [datetime] NOT NULL,
	[SessionEnd] [datetime] NULL,
	[UserID] [bigint] NOT NULL,
	[SessionLatitude] [float] NOT NULL,
	[SessionLongitude] [float] NOT NULL,
 CONSTRAINT [PK_tblSession] PRIMARY KEY CLUSTERED 
(
	[SessionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 3/29/2019 7:45:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUser](
	[UserID] [bigint] IDENTITY(1000000000000000,1) NOT NULL,
	[UserFName] [nvarchar](50) NOT NULL,
	[UserLName] [nvarchar](50) NOT NULL,
	[UserEmail] [nvarchar](50) NOT NULL,
	[UserPassword] [nvarchar](max) NOT NULL,
	[UserContact] [nvarchar](50) NOT NULL,
	[UserProof] [nvarchar](50) NOT NULL,
	[UserAddress] [nvarchar](max) NOT NULL,
	[IsVerified] [bit] NOT NULL,
	[IsVisible] [bit] NOT NULL,
	[UserRegDateTime] [datetime] NOT NULL,
	[UserTypeID] [int] NOT NULL,
 CONSTRAINT [PK_tblUser] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUserType]    Script Date: 3/29/2019 7:45:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUserType](
	[UserTypeID] [int] IDENTITY(1,1) NOT NULL,
	[UserTypeName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblUserType] PRIMARY KEY CLUSTERED 
(
	[UserTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblCategory] ON 

INSERT [dbo].[tblCategory] ([CategoryID], [CategoryName]) VALUES (1, N'Natural Calamities')
INSERT [dbo].[tblCategory] ([CategoryID], [CategoryName]) VALUES (2, N'Traffic')
INSERT [dbo].[tblCategory] ([CategoryID], [CategoryName]) VALUES (3, N'Fire')
INSERT [dbo].[tblCategory] ([CategoryID], [CategoryName]) VALUES (4, N'Terrorist Attack')
INSERT [dbo].[tblCategory] ([CategoryID], [CategoryName]) VALUES (5, N'Violence')
SET IDENTITY_INSERT [dbo].[tblCategory] OFF
SET IDENTITY_INSERT [dbo].[tblNotification] ON 

INSERT [dbo].[tblNotification] ([NotificationID], [NotificationMessage], [NotificationDateTime], [NotificationType], [NotificationLink], [IsSeen], [UserID]) VALUES (1000024, N'An account verification request has been received!', CAST(N'2019-03-29T02:40:53.303' AS DateTime), N'A', N'Requests.aspx', 1, NULL)
SET IDENTITY_INSERT [dbo].[tblNotification] OFF
SET IDENTITY_INSERT [dbo].[tblSession] ON 

INSERT [dbo].[tblSession] ([SessionID], [SessionBegin], [SessionEnd], [UserID], [SessionLatitude], [SessionLongitude]) VALUES (114, CAST(N'2019-03-29T07:43:45.263' AS DateTime), NULL, 1000000000000024, 0, 0)
SET IDENTITY_INSERT [dbo].[tblSession] OFF
SET IDENTITY_INSERT [dbo].[tblUser] ON 

INSERT [dbo].[tblUser] ([UserID], [UserFName], [UserLName], [UserEmail], [UserPassword], [UserContact], [UserProof], [UserAddress], [IsVerified], [IsVisible], [UserRegDateTime], [UserTypeID]) VALUES (1000000000000024, N'ApTech', N'Admin', N'aptech@domain.com', N'EdcxeNo9r1L0KbmvrV1QqKX6EwEKqXqR5Wt9CB6pBi1frenm29RojXZ6ZUI+t4+RNi9xa31csghCvPPUqf8Itpiiuq/tRKJJWNN3aYWq/smKVCWeKEHCLeWbyN6MqEtc', N'1234567890', N'1234567890.png', N'Aptech RWP', 1, 1, CAST(N'2019-03-29T02:40:53.280' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[tblUser] OFF
SET IDENTITY_INSERT [dbo].[tblUserType] ON 

INSERT [dbo].[tblUserType] ([UserTypeID], [UserTypeName]) VALUES (1, N'Official')
INSERT [dbo].[tblUserType] ([UserTypeID], [UserTypeName]) VALUES (2, N'Traffic Police')
INSERT [dbo].[tblUserType] ([UserTypeID], [UserTypeName]) VALUES (3, N'Vehicle Owner')
INSERT [dbo].[tblUserType] ([UserTypeID], [UserTypeName]) VALUES (4, N'Pedestrian')
SET IDENTITY_INSERT [dbo].[tblUserType] OFF
ALTER TABLE [dbo].[tblComplaint]  WITH CHECK ADD  CONSTRAINT [FK_tblComplaint_tblCategory] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[tblCategory] ([CategoryID])
GO
ALTER TABLE [dbo].[tblComplaint] CHECK CONSTRAINT [FK_tblComplaint_tblCategory]
GO
ALTER TABLE [dbo].[tblComplaint]  WITH CHECK ADD  CONSTRAINT [FK_tblComplaint_tblUser] FOREIGN KEY([UserID])
REFERENCES [dbo].[tblUser] ([UserID])
GO
ALTER TABLE [dbo].[tblComplaint] CHECK CONSTRAINT [FK_tblComplaint_tblUser]
GO
ALTER TABLE [dbo].[tblEmergency]  WITH CHECK ADD  CONSTRAINT [FK_tblEmergency_tblUser] FOREIGN KEY([UserID])
REFERENCES [dbo].[tblUser] ([UserID])
GO
ALTER TABLE [dbo].[tblEmergency] CHECK CONSTRAINT [FK_tblEmergency_tblUser]
GO
ALTER TABLE [dbo].[tblFeedback]  WITH CHECK ADD  CONSTRAINT [FK_tblFeedback_tblUser] FOREIGN KEY([UserID])
REFERENCES [dbo].[tblUser] ([UserID])
GO
ALTER TABLE [dbo].[tblFeedback] CHECK CONSTRAINT [FK_tblFeedback_tblUser]
GO
ALTER TABLE [dbo].[tblNotification]  WITH CHECK ADD  CONSTRAINT [FK_tblNotification_tblUser] FOREIGN KEY([UserID])
REFERENCES [dbo].[tblUser] ([UserID])
GO
ALTER TABLE [dbo].[tblNotification] CHECK CONSTRAINT [FK_tblNotification_tblUser]
GO
ALTER TABLE [dbo].[tblSession]  WITH CHECK ADD  CONSTRAINT [FK_tblSession_tblUser] FOREIGN KEY([UserID])
REFERENCES [dbo].[tblUser] ([UserID])
GO
ALTER TABLE [dbo].[tblSession] CHECK CONSTRAINT [FK_tblSession_tblUser]
GO
ALTER TABLE [dbo].[tblUser]  WITH CHECK ADD  CONSTRAINT [FK_tblUser_tblUserType] FOREIGN KEY([UserTypeID])
REFERENCES [dbo].[tblUserType] ([UserTypeID])
GO
ALTER TABLE [dbo].[tblUser] CHECK CONSTRAINT [FK_tblUser_tblUserType]
GO
USE [master]
GO
ALTER DATABASE [SmartTrafficDB] SET  READ_WRITE 
GO
