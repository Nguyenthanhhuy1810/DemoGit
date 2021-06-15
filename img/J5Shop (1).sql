USE [master]
GO
/****** Object:  Database [J5Shop]    Script Date: 5/26/2021 19:17:45 ******/
CREATE DATABASE [J5Shop] ON  PRIMARY 
( NAME = N'J5Shop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\J5Shop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'J5Shop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\J5Shop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [J5Shop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [J5Shop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [J5Shop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [J5Shop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [J5Shop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [J5Shop] SET ARITHABORT OFF 
GO
ALTER DATABASE [J5Shop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [J5Shop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [J5Shop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [J5Shop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [J5Shop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [J5Shop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [J5Shop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [J5Shop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [J5Shop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [J5Shop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [J5Shop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [J5Shop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [J5Shop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [J5Shop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [J5Shop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [J5Shop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [J5Shop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [J5Shop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [J5Shop] SET  MULTI_USER 
GO
ALTER DATABASE [J5Shop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [J5Shop] SET DB_CHAINING OFF 
GO
USE [J5Shop]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 5/26/2021 19:17:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Fullname] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Photo] [nvarchar](50) NULL,
	[Ativated] [bit] NOT NULL,
	[Admin] [bit] NOT NULL,
 CONSTRAINT [PK_Accounts] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 5/26/2021 19:17:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [char](4) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 5/26/2021 19:17:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[OrderId] [bigint] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Price] [float] NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 5/26/2021 19:17:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[CreateDate] [date] NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 5/26/2021 19:17:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Image] [nvarchar](50) NULL,
	[Price] [float] NOT NULL,
	[CreateDate] [date] NOT NULL,
	[Available] [bit] NOT NULL,
	[CategoryId] [char](4) NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Ativated], [Admin]) VALUES (N'hainnpc00645', N'123', N'Nguyễn Ngọc Hải', N'hainnpc00645@fpt.edu.vn', N'Boy-1.JPG', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Ativated], [Admin]) VALUES (N'huyntpc00617', N'123', N'Nguyễn Thành Huy', N'huyntpc00617@fpt.edu.vn', N'Boy-2.JPG', 1, 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Ativated], [Admin]) VALUES (N'tramvhpc00644', N'123', N'Võ Hạ Trâm', N'tramvhpc00644@fpt.edu.vn', N'Girl-1.JPG', 0, 0)
GO
INSERT [dbo].[Category] ([Id], [Name]) VALUES (N'AT01', N'Thiết bị âm thanh')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (N'LT01', N'Laptop')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (N'MT01', N'Máy tính 01')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (N'NV01', N'Thiết bị ngoại vi')
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (1, 1, 1, 2000, 2)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (2, 2, 4, 2000, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (3, 3, 2, 1100, 1)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (1, N'hainnpc00645', CAST(N'2021-05-26' AS Date), N'Ninh Kiều, Cần Thơ')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (2, N'tramvhpc00644', CAST(N'2021-05-26' AS Date), N'Ninh Kiều, Cần Thơ')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (3, N'huyntpc00617', CAST(N'2021-05-26' AS Date), N'Ô Môn, Cần Thơ')
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1, N'Laptop Thinkpad X1 Carbon', N'product-01.jpg', 1000, CAST(N'2021-05-25' AS Date), 1, N'LT01')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (2, N'Laptop Asus Vivobook', N'product-02.jpg', 1100, CAST(N'2021-05-25' AS Date), 1, N'LT01')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (3, N'Máy tính Acer Veriton', N'product-03.jpg', 1200, CAST(N'2021-05-24' AS Date), 0, N'MT01')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (4, N'Máy tính Apple Imac', N'product-04.jpg', 2000, CAST(N'2021-05-24' AS Date), 1, N'MT01')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (5, N'Loa Bluetooth Apple', N'product-05.jpg', 100, CAST(N'2021-05-23' AS Date), 1, N'AT01')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (7, N'Chuột Bluetooth Asus', N'product-06.jpg', 200, CAST(N'2021-05-22' AS Date), 0, N'NV01')
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Accounts] FOREIGN KEY([Username])
REFERENCES [dbo].[Accounts] ([Username])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Accounts]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Category]
GO
USE [master]
GO
ALTER DATABASE [J5Shop] SET  READ_WRITE 
GO
