USE [master]
GO
/****** Object:  Database [YTe]    Script Date: 25/03/2022 4:04:42 CH ******/
CREATE DATABASE [YTe]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'YTe', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\YTe.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'YTe_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\YTe_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [YTe] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [YTe].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [YTe] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [YTe] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [YTe] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [YTe] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [YTe] SET ARITHABORT OFF 
GO
ALTER DATABASE [YTe] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [YTe] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [YTe] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [YTe] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [YTe] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [YTe] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [YTe] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [YTe] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [YTe] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [YTe] SET  DISABLE_BROKER 
GO
ALTER DATABASE [YTe] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [YTe] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [YTe] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [YTe] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [YTe] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [YTe] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [YTe] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [YTe] SET RECOVERY FULL 
GO
ALTER DATABASE [YTe] SET  MULTI_USER 
GO
ALTER DATABASE [YTe] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [YTe] SET DB_CHAINING OFF 
GO
ALTER DATABASE [YTe] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [YTe] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [YTe] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [YTe] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'YTe', N'ON'
GO
ALTER DATABASE [YTe] SET QUERY_STORE = OFF
GO
USE [YTe]
GO
/****** Object:  Table [dbo].[About]    Script Date: 25/03/2022 4:04:42 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[About](
	[ID] [bigint] NOT NULL,
	[Name] [nvarchar](250) NULL,
	[MetaTitle] [varchar](250) NULL,
	[Description] [nvarchar](500) NULL,
	[Image] [nvarchar](250) NULL,
	[Detail] [ntext] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDescriptions] [nchar](250) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_About] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 25/03/2022 4:04:42 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[IdBill] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Phone] [nvarchar](15) NULL,
	[DeliveryAddress] [nvarchar](max) NULL,
	[DeliveryTime] [nchar](50) NULL,
	[TotalMoney] [float] NULL,
	[Status] [nvarchar](50) NULL,
	[CreatedDate] [nvarchar](50) NULL,
	[GhiChu] [ntext] NULL,
	[Duyet] [bit] NULL,
 CONSTRAINT [PK_Bill] PRIMARY KEY CLUSTERED 
(
	[IdBill] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 25/03/2022 4:04:42 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](250) NULL,
	[MetaTitle] [varchar](250) NULL,
	[ParentId] [int] NULL,
	[DisplayOrder] [int] NULL,
	[SeoTitle] [nvarchar](250) NULL,
	[CreatedTime] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedBy] [varchar](50) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDescriptions] [nchar](250) NULL,
	[Status] [bit] NULL,
	[ShowOnHome] [bit] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 25/03/2022 4:04:42 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[ID] [int] NOT NULL,
	[Content] [ntext] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 25/03/2022 4:04:42 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[ID] [int] NULL,
	[FullName] [nvarchar](50) NULL,
	[UserName] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetailBill]    Script Date: 25/03/2022 4:04:42 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetailBill](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdBill] [int] NOT NULL,
	[IdProduct] [int] NULL,
	[NameProduct] [nvarchar](250) NULL,
	[NumberProduct] [int] NULL,
	[TotalMoney] [float] NULL,
 CONSTRAINT [PK_DetailBill] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doctor]    Script Date: 25/03/2022 4:04:42 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctor](
	[IdDoctor] [int] NOT NULL,
 CONSTRAINT [PK_Doctor] PRIMARY KEY CLUSTERED 
(
	[IdDoctor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 25/03/2022 4:04:42 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[Content] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Feedback] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LichHen]    Script Date: 25/03/2022 4:04:42 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LichHen](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TenKH] [nvarchar](50) NULL,
	[GioiTinh] [nvarchar](5) NULL,
	[NgaySinh] [datetime] NULL,
	[DiaChi] [nvarchar](50) NULL,
	[ThuDienTu] [nvarchar](50) NULL,
	[SoDienThoai] [nvarchar](12) NULL,
	[KhoaKham] [nvarchar](50) NULL,
	[GioHen] [nvarchar](50) NULL,
	[NgayHen] [datetime] NULL,
	[GhiChu] [ntext] NULL,
	[DaDuyet] [bit] NULL,
 CONSTRAINT [PK__LichHen__3214EC27DC600807] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[News]    Script Date: 25/03/2022 4:04:42 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[MetaTitle] [varchar](250) NULL,
	[Description] [nvarchar](500) NULL,
	[Image] [nvarchar](250) NULL,
	[CategoryID] [bigint] NULL,
	[Detail] [ntext] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDescriptions] [nchar](250) NULL,
	[Status] [bit] NOT NULL,
	[ViewCount] [int] NULL,
	[Tags] [nvarchar](500) NULL,
	[Language] [varchar](2) NULL,
 CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patient]    Script Date: 25/03/2022 4:04:42 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patient](
	[IdPatient] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Patient] PRIMARY KEY CLUSTERED 
(
	[IdPatient] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permission]    Script Date: 25/03/2022 4:04:42 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permission](
	[UserGroupID] [varchar](20) NOT NULL,
	[RoleID] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Permission] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 25/03/2022 4:04:42 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Code] [varchar](50) NULL,
	[Amount] [int] NULL,
	[Price] [decimal](18, 2) NULL,
	[ImportPrice] [int] NULL,
	[Image] [varchar](250) NULL,
	[MoreImages] [xml] NULL,
	[Describe] [ntext] NULL,
	[Detail] [ntext] NULL,
	[CategoryID] [int] NULL,
	[Status] [nchar](10) NULL,
	[MetaTitel] [varchar](250) NULL,
	[CreatedTime] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedBy] [varchar](50) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDescriptions] [nchar](250) NULL,
	[ViewCount] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 25/03/2022 4:04:42 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [varchar](20) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 25/03/2022 4:04:42 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[Password] [varchar](32) NOT NULL,
	[GroupID] [varchar](20) NULL,
	[Name] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Sex] [bit] NULL,
	[DateOfBirth] [datetime] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserGroup]    Script Date: 25/03/2022 4:04:42 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserGroup](
	[Id] [varchar](20) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_UserGroup] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Bill] ON 

INSERT [dbo].[Bill] ([IdBill], [Name], [Email], [Phone], [DeliveryAddress], [DeliveryTime], [TotalMoney], [Status], [CreatedDate], [GhiChu], [Duyet]) VALUES (1020, N'132', N'231', N'132', N'312', NULL, 37000, NULL, N'20/06/2021 5:54:02 CH', NULL, NULL)
INSERT [dbo].[Bill] ([IdBill], [Name], [Email], [Phone], [DeliveryAddress], [DeliveryTime], [TotalMoney], [Status], [CreatedDate], [GhiChu], [Duyet]) VALUES (1021, N'', N'', N'', N'', NULL, 27000, NULL, N'20/06/2021 5:56:44 CH', NULL, NULL)
INSERT [dbo].[Bill] ([IdBill], [Name], [Email], [Phone], [DeliveryAddress], [DeliveryTime], [TotalMoney], [Status], [CreatedDate], [GhiChu], [Duyet]) VALUES (1022, N'', N'', N'', N'', NULL, 27000, NULL, N'20/06/2021 5:57:27 CH', NULL, NULL)
INSERT [dbo].[Bill] ([IdBill], [Name], [Email], [Phone], [DeliveryAddress], [DeliveryTime], [TotalMoney], [Status], [CreatedDate], [GhiChu], [Duyet]) VALUES (1024, N'thuốc', N'123', N'', N'312', NULL, 89000, NULL, N'20/06/2021 6:09:40 CH', NULL, NULL)
INSERT [dbo].[Bill] ([IdBill], [Name], [Email], [Phone], [DeliveryAddress], [DeliveryTime], [TotalMoney], [Status], [CreatedDate], [GhiChu], [Duyet]) VALUES (1025, N'', N'', N'', N'', NULL, 37000, NULL, N'20/06/2021 6:10:22 CH', NULL, NULL)
INSERT [dbo].[Bill] ([IdBill], [Name], [Email], [Phone], [DeliveryAddress], [DeliveryTime], [TotalMoney], [Status], [CreatedDate], [GhiChu], [Duyet]) VALUES (1026, N'nguyen van a', N'23', N'312', N'132', NULL, 31313, NULL, N'20/06/2021 8:51:32 CH', NULL, NULL)
INSERT [dbo].[Bill] ([IdBill], [Name], [Email], [Phone], [DeliveryAddress], [DeliveryTime], [TotalMoney], [Status], [CreatedDate], [GhiChu], [Duyet]) VALUES (1027, N'Nguyễn Quốc Khải', N'n2k29102000@gmail.com', N'03498629210', N'Thái Nguyên', NULL, 124000, NULL, N'20/06/2021 9:56:52 CH', NULL, NULL)
INSERT [dbo].[Bill] ([IdBill], [Name], [Email], [Phone], [DeliveryAddress], [DeliveryTime], [TotalMoney], [Status], [CreatedDate], [GhiChu], [Duyet]) VALUES (1028, N'', N'', N'', N'', NULL, 105000, NULL, N'20/06/2021 10:00:13 CH', NULL, NULL)
INSERT [dbo].[Bill] ([IdBill], [Name], [Email], [Phone], [DeliveryAddress], [DeliveryTime], [TotalMoney], [Status], [CreatedDate], [GhiChu], [Duyet]) VALUES (1029, N'', N'', N'', N'', NULL, 16000, NULL, N'20/06/2021 10:00:42 CH', NULL, NULL)
INSERT [dbo].[Bill] ([IdBill], [Name], [Email], [Phone], [DeliveryAddress], [DeliveryTime], [TotalMoney], [Status], [CreatedDate], [GhiChu], [Duyet]) VALUES (1030, N'', N'', N'21', N'', NULL, 105000, NULL, N'20/06/2021 10:07:18 CH', NULL, NULL)
INSERT [dbo].[Bill] ([IdBill], [Name], [Email], [Phone], [DeliveryAddress], [DeliveryTime], [TotalMoney], [Status], [CreatedDate], [GhiChu], [Duyet]) VALUES (1031, N'', N'adfdsf', N'', N'', NULL, 89000, NULL, N'20/06/2021 10:13:48 CH', NULL, NULL)
INSERT [dbo].[Bill] ([IdBill], [Name], [Email], [Phone], [DeliveryAddress], [DeliveryTime], [TotalMoney], [Status], [CreatedDate], [GhiChu], [Duyet]) VALUES (1032, N'', N'123321', N'', N'321132', NULL, 16000, NULL, N'20/06/2021 10:16:42 CH', NULL, NULL)
INSERT [dbo].[Bill] ([IdBill], [Name], [Email], [Phone], [DeliveryAddress], [DeliveryTime], [TotalMoney], [Status], [CreatedDate], [GhiChu], [Duyet]) VALUES (1033, N'', N'213', N'', N'132213', NULL, 43000, NULL, N'20/06/2021 10:17:54 CH', NULL, NULL)
INSERT [dbo].[Bill] ([IdBill], [Name], [Email], [Phone], [DeliveryAddress], [DeliveryTime], [TotalMoney], [Status], [CreatedDate], [GhiChu], [Duyet]) VALUES (1034, N'', N'ádf', N'fadfa', N'', NULL, 89000, NULL, N'20/06/2021 10:20:30 CH', NULL, NULL)
INSERT [dbo].[Bill] ([IdBill], [Name], [Email], [Phone], [DeliveryAddress], [DeliveryTime], [TotalMoney], [Status], [CreatedDate], [GhiChu], [Duyet]) VALUES (1035, N'', N'', N'', N'', NULL, 16000, NULL, N'20/06/2021 10:21:57 CH', NULL, 1)
INSERT [dbo].[Bill] ([IdBill], [Name], [Email], [Phone], [DeliveryAddress], [DeliveryTime], [TotalMoney], [Status], [CreatedDate], [GhiChu], [Duyet]) VALUES (1036, N'', N'', N'', N'', NULL, 16000, NULL, N'20/06/2021 10:22:45 CH', NULL, NULL)
INSERT [dbo].[Bill] ([IdBill], [Name], [Email], [Phone], [DeliveryAddress], [DeliveryTime], [TotalMoney], [Status], [CreatedDate], [GhiChu], [Duyet]) VALUES (1037, N'', N'', N'', N'', NULL, 16000, NULL, N'20/06/2021 10:23:43 CH', NULL, NULL)
INSERT [dbo].[Bill] ([IdBill], [Name], [Email], [Phone], [DeliveryAddress], [DeliveryTime], [TotalMoney], [Status], [CreatedDate], [GhiChu], [Duyet]) VALUES (1038, N'', N'', N'', N'', NULL, 16000, NULL, N'20/06/2021 10:30:09 CH', NULL, NULL)
INSERT [dbo].[Bill] ([IdBill], [Name], [Email], [Phone], [DeliveryAddress], [DeliveryTime], [TotalMoney], [Status], [CreatedDate], [GhiChu], [Duyet]) VALUES (1039, N'', N'', N'', N'', NULL, 0, NULL, N'20/06/2021 10:30:56 CH', NULL, NULL)
INSERT [dbo].[Bill] ([IdBill], [Name], [Email], [Phone], [DeliveryAddress], [DeliveryTime], [TotalMoney], [Status], [CreatedDate], [GhiChu], [Duyet]) VALUES (1040, N'213', N'', N'', N'', NULL, 0, NULL, N'20/06/2021 10:31:20 CH', NULL, NULL)
INSERT [dbo].[Bill] ([IdBill], [Name], [Email], [Phone], [DeliveryAddress], [DeliveryTime], [TotalMoney], [Status], [CreatedDate], [GhiChu], [Duyet]) VALUES (1041, N'Nguyễn Quốc Khải', N'', N'', N'', NULL, 27000, NULL, N'20/06/2021 10:58:03 CH', NULL, NULL)
INSERT [dbo].[Bill] ([IdBill], [Name], [Email], [Phone], [DeliveryAddress], [DeliveryTime], [TotalMoney], [Status], [CreatedDate], [GhiChu], [Duyet]) VALUES (1042, N'Nguyễn Quốc Khải', N'', N'', N'', NULL, 0, NULL, N'20/06/2021 10:58:08 CH', NULL, NULL)
INSERT [dbo].[Bill] ([IdBill], [Name], [Email], [Phone], [DeliveryAddress], [DeliveryTime], [TotalMoney], [Status], [CreatedDate], [GhiChu], [Duyet]) VALUES (1044, N'', N'n2k29102000@gmail.com', N'', N'', NULL, 0, NULL, N'20/06/2021 11:06:03 CH', NULL, NULL)
INSERT [dbo].[Bill] ([IdBill], [Name], [Email], [Phone], [DeliveryAddress], [DeliveryTime], [TotalMoney], [Status], [CreatedDate], [GhiChu], [Duyet]) VALUES (1045, N'', N'n2k29102000@gmail.com', N'', N'', NULL, 16000, NULL, N'20/06/2021 11:07:28 CH', NULL, NULL)
INSERT [dbo].[Bill] ([IdBill], [Name], [Email], [Phone], [DeliveryAddress], [DeliveryTime], [TotalMoney], [Status], [CreatedDate], [GhiChu], [Duyet]) VALUES (1047, N'Nguyen Quoc Khai', N'n2k29102000@gmail.com', N'034986532', N'Thai Nguyen', NULL, 56000, NULL, N'21/06/2021 6:47:12 SA', NULL, 1)
INSERT [dbo].[Bill] ([IdBill], [Name], [Email], [Phone], [DeliveryAddress], [DeliveryTime], [TotalMoney], [Status], [CreatedDate], [GhiChu], [Duyet]) VALUES (1048, N'3242423', N'n2k29102000@gmail.com', N'1111111111', N'312312', NULL, 124387567, NULL, N'14/02/2022 2:45:24 CH', NULL, 1)
INSERT [dbo].[Bill] ([IdBill], [Name], [Email], [Phone], [DeliveryAddress], [DeliveryTime], [TotalMoney], [Status], [CreatedDate], [GhiChu], [Duyet]) VALUES (2048, N'Nguyen Quoc Khai', N'n2k29102000@gmail.com', N'2121121221', N'12, Cầu Giấy, Hà Nội', NULL, 315000, NULL, N'14/03/2022 3:46:49 CH', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Bill] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryID], [CategoryName], [MetaTitle], [ParentId], [DisplayOrder], [SeoTitle], [CreatedTime], [CreatedBy], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (1, N'Gout', NULL, NULL, 0, NULL, CAST(N'2021-05-03T19:17:51.400' AS DateTime), NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [MetaTitle], [ParentId], [DisplayOrder], [SeoTitle], [CreatedTime], [CreatedBy], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (2, N'Mụn', NULL, NULL, 0, NULL, CAST(N'2021-05-03T19:17:51.400' AS DateTime), NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [MetaTitle], [ParentId], [DisplayOrder], [SeoTitle], [CreatedTime], [CreatedBy], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (3, N'Dạ dày', NULL, NULL, 0, NULL, CAST(N'2021-05-03T19:17:51.400' AS DateTime), NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [MetaTitle], [ParentId], [DisplayOrder], [SeoTitle], [CreatedTime], [CreatedBy], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (4, N'Thực phẩm chức năng', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [MetaTitle], [ParentId], [DisplayOrder], [SeoTitle], [CreatedTime], [CreatedBy], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (5, N'Thuốc không kê đơn', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [MetaTitle], [ParentId], [DisplayOrder], [SeoTitle], [CreatedTime], [CreatedBy], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (6, N'Chăm sóc sức khỏe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [MetaTitle], [ParentId], [DisplayOrder], [SeoTitle], [CreatedTime], [CreatedBy], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (7, N'Chăm sóc cá nhân', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [MetaTitle], [ParentId], [DisplayOrder], [SeoTitle], [CreatedTime], [CreatedBy], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (10, N'Sản phẩm tiện lợi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[DetailBill] ON 

INSERT [dbo].[DetailBill] ([Id], [IdBill], [IdProduct], [NameProduct], [NumberProduct], [TotalMoney]) VALUES (1, 1024, NULL, N'Khẩu trang than hoạt tính 4 lớp Pharmacity (50 cái/hộp)', 1, 89000)
INSERT [dbo].[DetailBill] ([Id], [IdBill], [IdProduct], [NameProduct], [NumberProduct], [TotalMoney]) VALUES (2, 1025, NULL, N'Dầu gió Trường Sơn (6ml)', 1, 37000)
INSERT [dbo].[DetailBill] ([Id], [IdBill], [IdProduct], [NameProduct], [NumberProduct], [TotalMoney]) VALUES (3, 1025, NULL, N'Bao cao su Ok Orginal (3 cái/hộp)', 1, 37000)
INSERT [dbo].[DetailBill] ([Id], [IdBill], [IdProduct], [NameProduct], [NumberProduct], [TotalMoney]) VALUES (4, 1025, NULL, N'XỊT RỬA TAY HƯƠNG TRÀ XANH', 1, 37000)
INSERT [dbo].[DetailBill] ([Id], [IdBill], [IdProduct], [NameProduct], [NumberProduct], [TotalMoney]) VALUES (5, 1026, NULL, N'thuốc ngon nghọt', 1, 31313)
INSERT [dbo].[DetailBill] ([Id], [IdBill], [IdProduct], [NameProduct], [NumberProduct], [TotalMoney]) VALUES (6, 1026, NULL, N'Dầu gió Trường Sơn (6ml)', 1, 31313)
INSERT [dbo].[DetailBill] ([Id], [IdBill], [IdProduct], [NameProduct], [NumberProduct], [TotalMoney]) VALUES (7, 1026, NULL, N'Bao cao su Ok Orginal (3 cái/hộp)', 1, 31313)
INSERT [dbo].[DetailBill] ([Id], [IdBill], [IdProduct], [NameProduct], [NumberProduct], [TotalMoney]) VALUES (8, 1027, NULL, N'Khẩu trang than hoạt tính 4 lớp Pharmacity (50 cái/hộp)', 1, 124000)
INSERT [dbo].[DetailBill] ([Id], [IdBill], [IdProduct], [NameProduct], [NumberProduct], [TotalMoney]) VALUES (9, 1027, NULL, N'Khăn ướt kháng khuẩn Pharmacity (30 tờ/gói)', 1, 124000)
INSERT [dbo].[DetailBill] ([Id], [IdBill], [IdProduct], [NameProduct], [NumberProduct], [TotalMoney]) VALUES (10, 1027, NULL, N'Fugacar Mebendazole (500mg)', 1, 124000)
INSERT [dbo].[DetailBill] ([Id], [IdBill], [IdProduct], [NameProduct], [NumberProduct], [TotalMoney]) VALUES (11, 1028, NULL, N'Khẩu trang than hoạt tính 4 lớp Pharmacity (50 cái/hộp)', 1, 105000)
INSERT [dbo].[DetailBill] ([Id], [IdBill], [IdProduct], [NameProduct], [NumberProduct], [TotalMoney]) VALUES (12, 1028, NULL, N'Khăn ướt kháng khuẩn Pharmacity (30 tờ/gói)', 1, 105000)
INSERT [dbo].[DetailBill] ([Id], [IdBill], [IdProduct], [NameProduct], [NumberProduct], [TotalMoney]) VALUES (13, 1029, NULL, N'Khăn ướt kháng khuẩn Pharmacity (30 tờ/gói)', 1, 16000)
INSERT [dbo].[DetailBill] ([Id], [IdBill], [IdProduct], [NameProduct], [NumberProduct], [TotalMoney]) VALUES (14, 1030, NULL, N'Khẩu trang than hoạt tính 4 lớp Pharmacity (50 cái/hộp)', 1, 105000)
INSERT [dbo].[DetailBill] ([Id], [IdBill], [IdProduct], [NameProduct], [NumberProduct], [TotalMoney]) VALUES (15, 1030, NULL, N'Khăn ướt kháng khuẩn Pharmacity (30 tờ/gói)', 1, 105000)
INSERT [dbo].[DetailBill] ([Id], [IdBill], [IdProduct], [NameProduct], [NumberProduct], [TotalMoney]) VALUES (16, 1031, NULL, N'Khẩu trang than hoạt tính 4 lớp Pharmacity (50 cái/hộp)', 1, 89000)
INSERT [dbo].[DetailBill] ([Id], [IdBill], [IdProduct], [NameProduct], [NumberProduct], [TotalMoney]) VALUES (17, 1032, NULL, N'Khăn ướt kháng khuẩn Pharmacity (30 tờ/gói)', 1, 16000)
INSERT [dbo].[DetailBill] ([Id], [IdBill], [IdProduct], [NameProduct], [NumberProduct], [TotalMoney]) VALUES (18, 1033, NULL, N'Khăn ướt kháng khuẩn Pharmacity (30 tờ/gói)', 1, 43000)
INSERT [dbo].[DetailBill] ([Id], [IdBill], [IdProduct], [NameProduct], [NumberProduct], [TotalMoney]) VALUES (19, 1033, NULL, N'XỊT RỬA TAY HƯƠNG TRÀ XANH', 1, 43000)
INSERT [dbo].[DetailBill] ([Id], [IdBill], [IdProduct], [NameProduct], [NumberProduct], [TotalMoney]) VALUES (20, 1034, NULL, N'Khẩu trang than hoạt tính 4 lớp Pharmacity (50 cái/hộp)', 1, 89000)
INSERT [dbo].[DetailBill] ([Id], [IdBill], [IdProduct], [NameProduct], [NumberProduct], [TotalMoney]) VALUES (21, 1035, NULL, N'Khăn ướt kháng khuẩn Pharmacity (30 tờ/gói)', 1, 16000)
INSERT [dbo].[DetailBill] ([Id], [IdBill], [IdProduct], [NameProduct], [NumberProduct], [TotalMoney]) VALUES (22, 1036, NULL, N'Khăn ướt kháng khuẩn Pharmacity (30 tờ/gói)', 1, 16000)
INSERT [dbo].[DetailBill] ([Id], [IdBill], [IdProduct], [NameProduct], [NumberProduct], [TotalMoney]) VALUES (23, 1037, NULL, N'Khăn ướt kháng khuẩn Pharmacity (30 tờ/gói)', 1, 16000)
INSERT [dbo].[DetailBill] ([Id], [IdBill], [IdProduct], [NameProduct], [NumberProduct], [TotalMoney]) VALUES (24, 1038, NULL, N'Khăn ướt kháng khuẩn Pharmacity (30 tờ/gói)', 1, 16000)
INSERT [dbo].[DetailBill] ([Id], [IdBill], [IdProduct], [NameProduct], [NumberProduct], [TotalMoney]) VALUES (25, 1041, NULL, N'XỊT RỬA TAY HƯƠNG TRÀ XANH', 1, 27000)
INSERT [dbo].[DetailBill] ([Id], [IdBill], [IdProduct], [NameProduct], [NumberProduct], [TotalMoney]) VALUES (26, 1045, NULL, N'Khăn ướt kháng khuẩn Pharmacity (30 tờ/gói)', 1, 16000)
INSERT [dbo].[DetailBill] ([Id], [IdBill], [IdProduct], [NameProduct], [NumberProduct], [TotalMoney]) VALUES (27, 1047, NULL, N'XỊT RỬA TAY HƯƠNG TRÀ XANH', 1, 56000)
INSERT [dbo].[DetailBill] ([Id], [IdBill], [IdProduct], [NameProduct], [NumberProduct], [TotalMoney]) VALUES (28, 1047, NULL, N'Dầu gió Trường Sơn (6ml)', 2, 56000)
INSERT [dbo].[DetailBill] ([Id], [IdBill], [IdProduct], [NameProduct], [NumberProduct], [TotalMoney]) VALUES (29, 1047, NULL, N'Fugacar Mebendazole (500mg)', 1, 56000)
INSERT [dbo].[DetailBill] ([Id], [IdBill], [IdProduct], [NameProduct], [NumberProduct], [TotalMoney]) VALUES (30, 1048, NULL, N'Dầu gió Trường Sơn (6ml)', 3, 124387567)
INSERT [dbo].[DetailBill] ([Id], [IdBill], [IdProduct], [NameProduct], [NumberProduct], [TotalMoney]) VALUES (31, 1048, NULL, N'XỊT RỬA TAY HƯƠNG TRÀ XANH', 1, 124387567)
INSERT [dbo].[DetailBill] ([Id], [IdBill], [IdProduct], [NameProduct], [NumberProduct], [TotalMoney]) VALUES (32, 1048, NULL, N'Viên uống thay cơm', 1, 124387567)
INSERT [dbo].[DetailBill] ([Id], [IdBill], [IdProduct], [NameProduct], [NumberProduct], [TotalMoney]) VALUES (33, 1048, NULL, N'12321', 1, 124387567)
INSERT [dbo].[DetailBill] ([Id], [IdBill], [IdProduct], [NameProduct], [NumberProduct], [TotalMoney]) VALUES (1030, 2048, NULL, N'Khăn ướt kháng khuẩn Pharmacity (30 tờ/gói)', 3, 315000)
INSERT [dbo].[DetailBill] ([Id], [IdBill], [IdProduct], [NameProduct], [NumberProduct], [TotalMoney]) VALUES (1031, 2048, NULL, N'Khẩu trang than hoạt tính 4 lớp Pharmacity (50 cái/hộp)', 3, 315000)
SET IDENTITY_INSERT [dbo].[DetailBill] OFF
GO
SET IDENTITY_INSERT [dbo].[LichHen] ON 

INSERT [dbo].[LichHen] ([ID], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [ThuDienTu], [SoDienThoai], [KhoaKham], [GioHen], [NgayHen], [GhiChu], [DaDuyet]) VALUES (1, N'Nguyễn Văn A', N'Nam', CAST(N'2000-02-12T00:00:00.000' AS DateTime), N'A, B, C', N'a@gmail.com', N'1111', N'Khoa ngoại', NULL, NULL, NULL, 1)
INSERT [dbo].[LichHen] ([ID], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [ThuDienTu], [SoDienThoai], [KhoaKham], [GioHen], [NgayHen], [GhiChu], [DaDuyet]) VALUES (2, N'Nguyễn Văn B', N'Nữ', CAST(N'2001-01-29T00:00:00.000' AS DateTime), N'', N'b@bb.b', N'01231322414', N'Khoa nội', N'', CAST(N'2022-02-12T00:00:00.000' AS DateTime), N'', NULL)
INSERT [dbo].[LichHen] ([ID], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [ThuDienTu], [SoDienThoai], [KhoaKham], [GioHen], [NgayHen], [GhiChu], [DaDuyet]) VALUES (3, N'Nguyễn Thị Nở', N'Nữ', CAST(N'2021-05-01T00:00:00.000' AS DateTime), N'', N'', N'', N'Khoa nội', N'', CAST(N'2021-12-12T00:00:00.000' AS DateTime), N'', 1)
INSERT [dbo].[LichHen] ([ID], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [ThuDienTu], [SoDienThoai], [KhoaKham], [GioHen], [NgayHen], [GhiChu], [DaDuyet]) VALUES (4, N'Nguyễn Thị Nởn', N'Nữ', CAST(N'2021-05-08T00:00:00.000' AS DateTime), N'', N'', N'', N'Khoa chuẩn đoán hình ảnh', N'12', CAST(N'2022-02-12T00:00:00.000' AS DateTime), N'', 1)
INSERT [dbo].[LichHen] ([ID], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [ThuDienTu], [SoDienThoai], [KhoaKham], [GioHen], [NgayHen], [GhiChu], [DaDuyet]) VALUES (5, N'Nguyễn Thị Nởn2', N'Nữ', CAST(N'2021-05-05T00:00:00.000' AS DateTime), N'', N'', N'', N'Khoa ngoại', NULL, CAST(N'2021-05-13T00:00:00.000' AS DateTime), N'', NULL)
INSERT [dbo].[LichHen] ([ID], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [ThuDienTu], [SoDienThoai], [KhoaKham], [GioHen], [NgayHen], [GhiChu], [DaDuyet]) VALUES (6, N'Nguyễn Văn B', N'Nữ', CAST(N'2002-07-24T00:00:00.000' AS DateTime), N'2131', N'b@bb.b', N'01231322414', N'Khoa ngoại', NULL, CAST(N'2021-05-14T00:00:00.000' AS DateTime), N'123', NULL)
INSERT [dbo].[LichHen] ([ID], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [ThuDienTu], [SoDienThoai], [KhoaKham], [GioHen], [NgayHen], [GhiChu], [DaDuyet]) VALUES (7, N'Nguyễn Thị N', N'Nữ', CAST(N'2021-05-01T00:00:00.000' AS DateTime), N'', N'', N'', N'Khoa chuẩn đoán hình ảnh', NULL, CAST(N'2021-05-11T00:00:00.000' AS DateTime), N'', 1)
INSERT [dbo].[LichHen] ([ID], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [ThuDienTu], [SoDienThoai], [KhoaKham], [GioHen], [NgayHen], [GhiChu], [DaDuyet]) VALUES (8, N'Nguyễn Thị Nởn', N'', CAST(N'2021-05-09T00:00:00.000' AS DateTime), N'', N'', N'', N'Chưa chọn khoa khám', NULL, CAST(N'2021-05-05T15:48:00.000' AS DateTime), N'', NULL)
INSERT [dbo].[LichHen] ([ID], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [ThuDienTu], [SoDienThoai], [KhoaKham], [GioHen], [NgayHen], [GhiChu], [DaDuyet]) VALUES (9, N'Vũ Văn Thành Đô', N'Nam', CAST(N'2021-05-14T15:47:00.000' AS DateTime), N'A, B, C', N'A@ab.c', N'0123456789', N'Khoa chuẩn đoán hình ảnh', NULL, CAST(N'2021-05-13T05:50:00.000' AS DateTime), N'', 1)
INSERT [dbo].[LichHen] ([ID], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [ThuDienTu], [SoDienThoai], [KhoaKham], [GioHen], [NgayHen], [GhiChu], [DaDuyet]) VALUES (10, N'Nguyễn Văn B', N'Nam', CAST(N'2021-04-30T23:02:00.000' AS DateTime), N'', N'', N'', N'Khoa ngoại', NULL, CAST(N'2021-05-07T13:03:00.000' AS DateTime), N'', NULL)
INSERT [dbo].[LichHen] ([ID], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [ThuDienTu], [SoDienThoai], [KhoaKham], [GioHen], [NgayHen], [GhiChu], [DaDuyet]) VALUES (11, N'Nguyễn Thị N', N'Nam', CAST(N'2021-05-14T09:08:00.000' AS DateTime), N'', N'', N'', N'Khoa ngoại', NULL, CAST(N'2021-05-19T09:11:00.000' AS DateTime), N'', 1)
INSERT [dbo].[LichHen] ([ID], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [ThuDienTu], [SoDienThoai], [KhoaKham], [GioHen], [NgayHen], [GhiChu], [DaDuyet]) VALUES (12, N'1231231', N'132', CAST(N'2021-04-28T09:14:00.000' AS DateTime), N'', N'', N'', N'Khoa ngoại', NULL, CAST(N'2021-05-15T09:11:00.000' AS DateTime), N'', 1)
INSERT [dbo].[LichHen] ([ID], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [ThuDienTu], [SoDienThoai], [KhoaKham], [GioHen], [NgayHen], [GhiChu], [DaDuyet]) VALUES (13, N'Đặng Hoàng Duy', N'Nam', CAST(N'2021-05-14T18:51:00.000' AS DateTime), N'', N'', N'', N'Khoa nhi', NULL, CAST(N'2021-05-13T17:50:00.000' AS DateTime), N'', 1)
INSERT [dbo].[LichHen] ([ID], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [ThuDienTu], [SoDienThoai], [KhoaKham], [GioHen], [NgayHen], [GhiChu], [DaDuyet]) VALUES (14, N'Vương A A', N'Nam', CAST(N'2021-05-13T00:00:00.000' AS DateTime), N'', N'', N'2121312313', N'Khoa chuẩn đoán hình ảnh', NULL, CAST(N'2021-05-13T20:30:00.000' AS DateTime), N'', 1)
INSERT [dbo].[LichHen] ([ID], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [ThuDienTu], [SoDienThoai], [KhoaKham], [GioHen], [NgayHen], [GhiChu], [DaDuyet]) VALUES (15, N'Đặng Hoàng Duy ', N'Nam', CAST(N'2021-05-05T00:00:00.000' AS DateTime), N'', N'duy@gmail.com', N'', N'Khoa chuẩn đoán hình ảnh', NULL, CAST(N'2021-05-21T13:16:00.000' AS DateTime), N'Khám trực tiếp', 1)
INSERT [dbo].[LichHen] ([ID], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [ThuDienTu], [SoDienThoai], [KhoaKham], [GioHen], [NgayHen], [GhiChu], [DaDuyet]) VALUES (16, N'Nguyễn Anh Hiếu', N'Nam', CAST(N'2021-06-11T00:00:00.000' AS DateTime), N'', N'', N'', N'Khoa chuẩn đoán hình ảnh', NULL, CAST(N'2021-06-24T11:32:00.000' AS DateTime), N'', NULL)
INSERT [dbo].[LichHen] ([ID], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [ThuDienTu], [SoDienThoai], [KhoaKham], [GioHen], [NgayHen], [GhiChu], [DaDuyet]) VALUES (17, N'Nguyễn Anh Hiếu', N'Nam', CAST(N'2021-06-10T00:00:00.000' AS DateTime), N'', N'', N'', N'Khoa chuẩn đoán hình ảnh', NULL, CAST(N'2021-06-09T17:01:00.000' AS DateTime), N'', NULL)
INSERT [dbo].[LichHen] ([ID], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [ThuDienTu], [SoDienThoai], [KhoaKham], [GioHen], [NgayHen], [GhiChu], [DaDuyet]) VALUES (1017, N'Nguyễn Anh Hiếu', N'Nam', CAST(N'2022-03-10T00:00:00.000' AS DateTime), N'', N'', N'', N'Khoa chuẩn đoán hình ảnh', NULL, CAST(N'2022-03-19T16:50:00.000' AS DateTime), N'', NULL)
SET IDENTITY_INSERT [dbo].[LichHen] OFF
GO
SET IDENTITY_INSERT [dbo].[News] ON 

INSERT [dbo].[News] ([ID], [Name], [MetaTitle], [Description], [Image], [CategoryID], [Detail], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ViewCount], [Tags], [Language]) VALUES (2, N'a', NULL, NULL, N'28.5.2021. BT NTL hop (1).jpg', NULL, N'', CAST(N'2021-05-29T09:29:07.453' AS DateTime), N'admin', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[News] ([ID], [Name], [MetaTitle], [Description], [Image], [CategoryID], [Detail], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ViewCount], [Tags], [Language]) VALUES (3, N'123132', NULL, NULL, N'28.5.2021. BT NTL hop (1).jpg', NULL, N'', CAST(N'2021-05-29T09:29:42.263' AS DateTime), N'admin', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[News] ([ID], [Name], [MetaTitle], [Description], [Image], [CategoryID], [Detail], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ViewCount], [Tags], [Language]) VALUES (4, N'Tờ quyết định “bỏ trống ngày về” của bác sĩ vùng cao chi viện Bắc Giang chống dịch ', NULL, NULL, N'unnamed (2).jpg', NULL, N'', CAST(N'2021-05-29T15:51:34.963' AS DateTime), N'admin', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[News] ([ID], [Name], [MetaTitle], [Description], [Image], [CategoryID], [Detail], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ViewCount], [Tags], [Language]) VALUES (5, N'14214', NULL, NULL, N'28.5.2021. BT NTL hop (1).jpg', NULL, N'', CAST(N'2021-05-29T16:26:18.013' AS DateTime), N'admin', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[News] ([ID], [Name], [MetaTitle], [Description], [Image], [CategoryID], [Detail], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ViewCount], [Tags], [Language]) VALUES (6, N'123123', NULL, NULL, N'28.5.2021. BT NTL hop (1).jpg', NULL, N'21323123', CAST(N'2021-05-29T18:01:20.077' AS DateTime), N'admin', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[News] ([ID], [Name], [MetaTitle], [Description], [Image], [CategoryID], [Detail], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ViewCount], [Tags], [Language]) VALUES (7, N'12321', NULL, NULL, N'28.5.2021. BT NTL hop (1).jpg', NULL, N'123123132', CAST(N'2021-05-29T18:06:05.697' AS DateTime), N'admin', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[News] ([ID], [Name], [MetaTitle], [Description], [Image], [CategoryID], [Detail], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ViewCount], [Tags], [Language]) VALUES (8, N'a123321', NULL, NULL, N'28.5.2021. BT NTL hop (1).jpg', NULL, N'', CAST(N'2021-05-29T18:07:10.853' AS DateTime), N'admin', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[News] ([ID], [Name], [MetaTitle], [Description], [Image], [CategoryID], [Detail], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ViewCount], [Tags], [Language]) VALUES (9, N'124', NULL, NULL, N'28.5.2021. BT NTL hop (1).jpg', NULL, N'', CAST(N'2021-05-29T18:18:20.423' AS DateTime), N'admin', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[News] ([ID], [Name], [MetaTitle], [Description], [Image], [CategoryID], [Detail], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ViewCount], [Tags], [Language]) VALUES (10, N'nguyen van a', NULL, NULL, N'28.5.2021. BT NTL hop (1).jpg', NULL, N'', CAST(N'2021-05-29T18:19:44.543' AS DateTime), N'admin', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[News] ([ID], [Name], [MetaTitle], [Description], [Image], [CategoryID], [Detail], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ViewCount], [Tags], [Language]) VALUES (11, N'a213321', NULL, NULL, N'28.5.2021. BT NTL hop (1).jpg', NULL, N'', CAST(N'2021-05-29T18:59:39.197' AS DateTime), N'admin', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[News] ([ID], [Name], [MetaTitle], [Description], [Image], [CategoryID], [Detail], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ViewCount], [Tags], [Language]) VALUES (12, N'thuốc', NULL, NULL, N'28.5.2021. BT NTL hop (1).jpg', NULL, N'123123', CAST(N'2021-05-29T19:12:11.850' AS DateTime), N'admin', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[News] ([ID], [Name], [MetaTitle], [Description], [Image], [CategoryID], [Detail], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ViewCount], [Tags], [Language]) VALUES (13, N'123213', NULL, NULL, N'28.5.2021. BT NTL hop (1).jpg', NULL, N'<p>
	2132132311 123333</p>
', CAST(N'2021-05-29T19:13:09.297' AS DateTime), N'admin', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[News] ([ID], [Name], [MetaTitle], [Description], [Image], [CategoryID], [Detail], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ViewCount], [Tags], [Language]) VALUES (14, N'Bộ Y tế thông tin về đột biến gene trên mẫu bệnh phẩm COVID-19 ', NULL, NULL, N'anh-chup-man-hinh-2020-08-24-luc-165731-15982638864291869683028.jpg', NULL, N'<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: rgb(41, 41, 41); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 16px;">
	<span class="text-muted" style="box-sizing: border-box; font-weight: bolder; color: rgb(108, 117, 125) !important;">Theo th&ocirc;ng tin từ Viện Vệ sinh dịch tễ Trung ương, qua giải tr&igrave;nh gene c&aacute;c mẫu bệnh phẩm COVID-19, c&aacute;c nh&agrave; khoa học của Viện đ&atilde; ph&aacute;t hiện đột biến gene trong 4/32 mẫu bệnh phẩm.</span></p>
<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: rgb(41, 41, 41); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 16px;">
	&nbsp;</p>
<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: rgb(41, 41, 41); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 16px;">
	GS.TS L&ecirc; Thị Quỳnh Mai, Ph&oacute; Viện trưởng Viện Vệ sinh Dịch tễ Trung ương, cho biết: &quot;<i style="box-sizing: border-box;">Ch&uacute;ng t&ocirc;i ph&aacute;t hiện có đột biến mất Y144 tr&ecirc;n protein S của virus B.1.167.2&nbsp; (lần đầu ph&aacute;t hiện tại Ấn Độ). Đột biến n&agrave;y giống đột biến ph&aacute;t hiện tr&ecirc;n biến thể B.1.1.7 (lần đầu ph&aacute;t hiện tại Anh</i>)&quot;.</p>
<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: rgb(41, 41, 41); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 16px;">
	Nhưng theo GS.TS L&ecirc; Thị Quỳnh Mai, dữ liệu B.1.167.2 tr&ecirc;n GISAID hiện tại chưa ghi nhận đột biến mất Y144, n&ecirc;n đột biến n&agrave;y cần quan t&acirc;m, tiếp tục theo d&otilde;i v&agrave; nghi&ecirc;n cứu th&ecirc;m.</p>
<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: rgb(41, 41, 41); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 16px;">
	GISAID l&agrave; bản đồ cập nhật kết quả giải tr&igrave;nh tự gene SARS-CoV-2, được c&aacute;c nh&agrave; học tr&ecirc;n to&agrave;n cầu cập nhật li&ecirc;n tục; bản đồ n&agrave;y được c&aacute;c nh&agrave; khoa học tại c&aacute;c quốc gia c&ugrave;ng tham khảo, theo s&aacute;t sự biến đổi của SARS-CoV-2.</p>
<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: rgb(41, 41, 41); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 16px;">
	<img alt="Bộ Y tế thông tin về đột biến gene trên mẫu bệnh phẩm COVID-19 - Ảnh 2." data-original="https://giadinh.mediacdn.vn/2020/8/24/anh-chup-man-hinh-2020-08-24-luc-165731-15982638864291869683028.png" h="555" height="" id="img_302132443032424448" photoid="302132443032424448" rel="lightbox" src="https://giadinh.mediacdn.vn/thumb_w/640/2020/8/24/anh-chup-man-hinh-2020-08-24-luc-165731-15982638864291869683028.png" style="box-sizing: border-box; vertical-align: middle; border-style: none; max-width: 100%;" title="Bộ Y tế thông tin về đột biến gene trên mẫu bệnh phẩm COVID-19 - Ảnh 2." type="photo" w="767" width="" /></p>
<p data-placeholder="[nhập chú thích]" style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: rgb(41, 41, 41); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 16px;">
	Ảnh minh hoạ</p>
<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: rgb(41, 41, 41); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 16px;">
	Bộ trưởng Bộ Y tế Nguyễn Thanh Long trong phi&ecirc;n họp Ch&iacute;nh phủ s&aacute;ng 29/5 đ&atilde; th&ocirc;ng tin chủng phổ biến hiện nay tại Việt Nam l&agrave; chủng virus lần đầu ph&aacute;t hiện ở Ấn Độ đ&atilde; c&oacute; c&aacute;c dấu hiệu tăng khả năng l&acirc;y nhiễm v&agrave; bệnh tăng nặng hơn so với c&aacute;c đợt dịch trước.</p>
', CAST(N'2021-05-29T20:26:48.980' AS DateTime), N'admin', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[News] ([ID], [Name], [MetaTitle], [Description], [Image], [CategoryID], [Detail], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ViewCount], [Tags], [Language]) VALUES (15, N'TP.HCM kêu gọi những người sinh hoạt tại Hội thánh chủ động khai báo y tế ', NULL, NULL, N'hoi-thanh-truyen-giao-phuc-hung-1-16222851450221116667594.jpg', NULL, N'<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: rgb(41, 41, 41); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 16px;">
	<span class="text-muted" style="box-sizing: border-box; font-weight: bolder; color: rgb(108, 117, 125) !important;">Người li&ecirc;n quan đến Hội th&aacute;nh truyền gi&aacute;o Phục Hưng c&oacute; nguy cơ l&acirc;y nhiễm rất cao. Nếu kh&ocirc;ng t&igrave;m ra hết th&igrave; sẽ l&agrave; nguồn l&acirc;y rất nguy hiểm, đặc biệt ở những người kh&ocirc;ng c&oacute; triệu chứng.</span></p>
<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: rgb(41, 41, 41); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 16px;">
	&nbsp;</p>
<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: rgb(41, 41, 41); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 16px;">
	Theo b&aacute;c sĩ Đinh Thị Hải Yến, Trung t&acirc;m Kiểm so&aacute;t Bệnh tật TP.HCM (HCDC), TP.HCM ch&iacute;nh thức bước v&agrave;o cuộc chiến l&agrave;n s&oacute;ng dịch thứ tư với một kịch bản kh&ocirc;ng ai ngờ đến l&agrave; li&ecirc;n quan đến t&ocirc;n gi&aacute;o.</p>
<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: rgb(41, 41, 41); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 16px;">
	Chiều tối ng&agrave;y 27/5, HCDC nhận được th&ocirc;ng tin về một ca rồi th&ecirc;m hai ca nghi mắc COVID-19 từ bệnh viện. Điểm chung của 3 ca n&agrave;y l&agrave; họ sinh hoạt chung trong một nh&oacute;m t&ocirc;n gi&aacute;o c&oacute; trụ sở tại quận G&ograve; Vấp. Đ&oacute; l&agrave; Hội th&aacute;nh truyền gi&aacute;o Phục Hưng.</p>
<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: rgb(41, 41, 41); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 16px;">
	Hội nh&oacute;m n&agrave;y sinh hoạt c&ugrave;ng nhau trong một kh&ocirc;ng gian nhỏ hẹp, k&eacute;m th&ocirc;ng tho&aacute;ng, kh&ocirc;ng đeo khẩu trang. Điều kiện kh&ocirc;ng đảm bảo như tr&ecirc;n c&ugrave;ng với biến chủng virus Ấn Độ đ&atilde; tạo th&agrave;nh một chuỗi l&acirc;y nhiễm mạnh, số lượng nhiễm cao.</p>
<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: rgb(41, 41, 41); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 16px;">
	Sau 3 ng&agrave;y, t&iacute;nh đến trưa nay (29/5) đ&atilde; c&oacute; 85 trường hợp mắc COVID-19 li&ecirc;n quan, trong đ&oacute; đ&atilde; xuất hiện trường hợp F2. Biến chủng mới nguy hiểm v&igrave; t&iacute;nh chất l&acirc;y lan nhanh, thời gian l&acirc;y nhiễm ngắn. Nếu kh&ocirc;ng khoanh v&ugrave;ng, t&igrave;m ra sớm bệnh nh&acirc;n th&igrave; sẽ l&agrave; nguồn l&acirc;y cho cộng đồng.</p>
<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: rgb(41, 41, 41); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 16px;">
	<img alt="TP.HCM kêu gọi những người sinh hoạt tại Hội thánh chủ động khai báo y tế - Ảnh 1." data-original="https://giadinh.mediacdn.vn/296230595582509056/2021/5/29/hoi-thanh-truyen-giao-phuc-hung-1-16222851450221116667594.jpg" h="1707" height="" id="img_323050108060958720" photoid="323050108060958720" rel="lightbox" src="https://giadinh.mediacdn.vn/thumb_w/640/296230595582509056/2021/5/29/hoi-thanh-truyen-giao-phuc-hung-1-16222851450221116667594.jpg" style="box-sizing: border-box; vertical-align: middle; border-style: none; max-width: 100%;" title="TP.HCM kêu gọi những người sinh hoạt tại Hội thánh chủ động khai báo y tế - Ảnh 1." type="photo" w="2560" width="" /></p>
<p data-placeholder="[nhập chú thích]" style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: rgb(41, 41, 41); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 16px;">
	Hẻm 415, đường Nguyễn Văn C&ocirc;ng, Phường 3, quận G&ograve; Vấp - nơi trụ sở Hội th&aacute;nh truyền gi&aacute;o Phục Hưng hoạt động bị phong tỏa do li&ecirc;n quan đến nhiều trường hợp mắc COVID-19.</p>
<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: rgb(41, 41, 41); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 16px;">
	Theo HCDC, để chặn đứng ho&agrave;n to&agrave;n chuỗi l&acirc;y nhiễm n&agrave;y, b&ecirc;n cạnh việc đẩy nhanh x&eacute;t nghiệm, truy vết để dịch kh&ocirc;ng l&acirc;y lan tiếp tục từ những trường hợp đ&atilde; biết th&igrave; việc cần phải l&agrave;m nữa l&agrave; t&igrave;m ra tất cả những người sinh hoạt chung trong Hội th&aacute;nh n&agrave;y bởi nguy cơ l&acirc;y nhiễm trong Hội th&aacute;nh n&agrave;y rất cao. Những người n&agrave;y nếu c&ograve;n trong cộng đồng th&igrave; sẽ th&agrave;nh nguồn l&acirc;y rất nguy hiểm, đặc biệt ở những người kh&ocirc;ng c&oacute; triệu chứng.</p>
<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: rgb(41, 41, 41); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 16px;">
	Hội th&aacute;nh c&oacute; cam kết số lượng hội vi&ecirc;n l&agrave; 48 người. Tuy nhi&ecirc;n, th&agrave;nh phố đ&aacute;nh gi&aacute; c&oacute; thể con số n&agrave;y cao hơn v&agrave; vẫn c&ograve;n những hội vi&ecirc;n chưa ra khai b&aacute;o. V&igrave; nhiều l&yacute; do m&agrave; họ kh&ocirc;ng d&aacute;m khai b&aacute;o cho đến khi c&oacute; dấu hiệu bệnh. Bằng chứng l&agrave; đ&atilde; c&oacute; những trường hợp c&oacute; triệu chứng đến bệnh viện khai b&aacute;o v&agrave; ph&aacute;t hiện mắc COVID-19.</p>
<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: rgb(41, 41, 41); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 16px;">
	Theo b&aacute;c sĩ Hải Yến, xảy ra hai t&igrave;nh huống. T&igrave;nh huống thứ nhất l&agrave; người d&acirc;n e ngại khai b&aacute;o v&igrave; sợ sẽ l&agrave;m ảnh hưởng đến c&ocirc;ng việc của họ. Tuy nhi&ecirc;n, việc kh&ocirc;ng khai b&aacute;o n&agrave;y kh&ocirc;ng những ảnh hưởng đến c&ocirc;ng việc của c&aacute; nh&acirc;n người đ&oacute; m&agrave; c&ograve;n của rất nhiều người kh&aacute;c. Thực tế cho thấy, đ&atilde; c&oacute; 700 c&ocirc;ng nh&acirc;n tại một c&ocirc;ng ty ở Khu c&ocirc;ng nghiệp T&acirc;n B&igrave;nh phải c&aacute;ch ly tại c&ocirc;ng ty do li&ecirc;n quan đến bệnh nh&acirc;n từng đến l&agrave;m việc tại căng tin cũng như rất nhiều địa điểm phải phỏng toả để ph&ograve;ng chống dịch.</p>
<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: rgb(41, 41, 41); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 16px;">
	T&igrave;nh huống thứ hai l&agrave;, người d&acirc;n kh&ocirc;ng d&aacute;m khai b&aacute;o v&igrave; lo sợ vi phạm ph&aacute;p luật. Song thực tế, kh&ocirc;ng khai b&aacute;o hoặc khai b&aacute;o kh&ocirc;ng trung thực mới ch&iacute;nh l&agrave; vi phạm ph&aacute;p luật.</p>
<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: rgb(41, 41, 41); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 16px;">
	Hơn 1 năm qua cho thấy, t&aacute;c động của COVID-19 đến sức khoẻ v&agrave; t&agrave;n ph&aacute; nền kinh tế rất r&otilde;. TP.HCM đ&atilde; bước v&agrave;o chỉ thị 15, c&aacute;c hoạt động x&atilde; hội, hoạt động tập trung đ&ocirc;ng người đ&atilde; tạm dừng. Nhưng biện ph&aacute;p n&agrave;y chỉ l&agrave;m chậm việc l&acirc;y lan chứ kh&ocirc;ng thể chấm dứt được chuỗi l&acirc;y lan. Muốn chấm dứt chuỗi l&acirc;y lan th&igrave; phải t&igrave;m ra được tất cả nguồn l&acirc;y.</p>
<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: rgb(41, 41, 41); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 16px;">
	Do vậy, Trung t&acirc;m Kiểm so&aacute;t Bệnh tật TP.HCM đề nghị những người tham gia Hội th&aacute;nh truyền gi&aacute;o Phục Hưng chủ động li&ecirc;n hệ y tế địa phương để khai b&aacute;o kể cả khi kh&ocirc;ng c&oacute; bất cứ dấu hiệu mắc bệnh v&agrave; kh&ocirc;ng đợi đến khi c&oacute; dấu hiệu bệnh mới đi khai b&aacute;o. Ngo&agrave;i ra, mọi người nếu biết con em m&igrave;nh sinh hoạt tại Hội th&aacute;nh truyền gi&aacute;o Phục Hưng h&atilde;y vận động họ khai b&aacute;o y tế c&agrave;ng sớm c&agrave;ng tốt. Nếu bạn c&oacute; th&ocirc;ng tin về những trường hợp li&ecirc;n quan đến Hội th&aacute;nh n&agrave;y th&igrave; h&atilde;y cung cấp cho ch&iacute;nh quyền địa phương.</p>
<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: rgb(41, 41, 41); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 16px;">
	<span style="box-sizing: border-box; font-weight: bolder;">Gia đ&igrave;nh mục sư Hội Th&aacute;nh truyền gi&aacute;o Phục hưng kh&ocirc;ng hợp t&aacute;c truy vết</span></p>
<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: rgb(41, 41, 41); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 16px;">
	Theo GS.TS Nguyễn Tấn Bỉnh, Gi&aacute;m đốc Sở Y tế TPHCM, vợ của &ocirc;ng mục sư Hội Th&aacute;nh truyền gi&aacute;o Phục Hưng l&agrave; b&agrave; V&otilde; Xu&acirc;n Loan đ&atilde; từng đi H&agrave; Nội từ ng&agrave;y 23 - 29/4. Tuy nhi&ecirc;n, khi khai th&aacute;c dịch tễ, lịch tr&igrave;nh di chuyển v&agrave; tiếp x&uacute;c, bệnh nh&acirc;n n&agrave;y kh&ocirc;ng chủ động khai b&aacute;o m&agrave; c&ograve;n cố t&igrave;nh giấu giếm.</p>
<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: rgb(41, 41, 41); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 16px;">
	Sở Y tế đ&atilde; phối hợp c&ugrave;ng lực lượng c&ocirc;ng an v&agrave; ng&agrave;nh h&agrave;ng kh&ocirc;ng mới x&aacute;c định được h&agrave;nh tr&igrave;nh di chuyển của bệnh nh&acirc;n n&agrave;y. Đến ng&agrave;y 13/5, b&agrave; Loan c&oacute; triệu chứng h&ocirc; hấp, cũng l&agrave; người đầu ti&ecirc;n khởi ph&aacute;t bệnh trong Hội th&aacute;nh.</p>
<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: rgb(41, 41, 41); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 16px;">
	Tuy nhi&ecirc;n kh&ocirc;ng chỉ ri&ecirc;ng gia đ&igrave;nh mục sư kh&ocirc;ng chịu hợp t&aacute;c, ng&agrave;nh Y tế phải nhờ đến c&aacute;c lực lượng c&ocirc;ng an c&ugrave;ng phối hợp, nhưng nhiều hội vi&ecirc;n trong Hội th&aacute;nh n&agrave;y đều kh&ocirc;ng trung thực, c&oacute; nhiều h&agrave;nh vi gian dối, cố &yacute; x&oacute;a dấu vết.</p>
<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: rgb(41, 41, 41); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 16px; text-align: justify;">
	Ngay như mẹ vợ của Mục sư, sống ở nh&agrave; b&ecirc;n cạnh nhưng khi được mời ra để lấy mẫu x&eacute;t nghiệm vẫn từ chối với l&yacute; do kh&ocirc;ng li&ecirc;n quan đến Hội Th&aacute;nh hay gia đ&igrave;nh mục sư, n&ecirc;n kh&ocirc;ng cần x&eacute;t nghiệm. Cho đến khi c&oacute; kết quả x&eacute;t nghiệm dương t&iacute;nh với SARS-CoV-2 mới ph&aacute;t hiện đ&acirc;y l&agrave; mẹ vợ của mục sư. Thậm ch&iacute; c&oacute; t&igrave;nh huống khi lực lượng chức năng kiểm tra sổ hoạt động của Hội th&aacute;nh, một hội vi&ecirc;n cố t&igrave;nh x&oacute;a danh s&aacute;ch hội vi&ecirc;n chỉ để lại t&ecirc;n 20 người để đủ ti&ecirc;u chuẩn hoạt động kh&ocirc;ng tập trung đ&ocirc;ng người.</p>
', CAST(N'2021-05-29T22:12:28.037' AS DateTime), N'admin', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[News] ([ID], [Name], [MetaTitle], [Description], [Image], [CategoryID], [Detail], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ViewCount], [Tags], [Language]) VALUES (16, N'Không để dịch COVID-19 ở Bắc Giang, Bắc Ninh lây ra vùng an toàn khác ', NULL, NULL, N'BG 30.jpg', NULL, N'<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: rgb(41, 41, 41); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 16px;">
	<span class="text-muted" style="box-sizing: border-box; font-weight: bolder; color: rgb(108, 117, 125) !important;">Tr&ecirc;n địa b&agrave;n tỉnh Bắc Ninh v&agrave; Bắc Giang đều c&oacute; nơi thực hiện gi&atilde;n c&aacute;ch x&atilde; hội theo Chỉ thị 15/CT-TTg, Chỉ thị 16/CT-TTg v&agrave; một số nơi vẫn được coi l&agrave; v&ugrave;ng an to&agrave;n. Do đ&oacute;, tuyệt đối kh&ocirc;ng để dịch COVID-19 ở những địa b&agrave;n gi&atilde;n c&aacute;ch x&atilde; hội, c&aacute;ch ly, phong tỏa l&acirc;y lan sang c&aacute;c v&ugrave;ng an to&agrave;n trong tỉnh cũng như c&aacute;c địa phương l&acirc;n cận.</span></p>
<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: rgb(41, 41, 41); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 16px;">
	&nbsp;</p>
<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: rgb(41, 41, 41); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 16px;">
	Đ&acirc;y l&agrave; y&ecirc;u cầu của Ph&oacute; Thủ tướng Ch&iacute;nh phủ Vũ Đức Đam, Trưởng Ban Chỉ đạo Quốc gia ph&ograve;ng, chống dịch COVID-19 tại cuộc họp trực tuyến với l&atilde;nh đạo tỉnh Bắc Ninh, Bắc Giang về c&ocirc;ng t&aacute;c ph&ograve;ng, chống dịch của địa phương, v&agrave;o chiều 30/5, tại Trụ sở Ch&iacute;nh phủ.</p>
<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: rgb(41, 41, 41); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 16px;">
	<img alt="BG 30" src="https://media.suckhoedoisong.vn/Images/thaibinh/2021/05/30/BG%2030.jpg" style="box-sizing: border-box; vertical-align: middle; border-style: none; max-width: 100%;" /></p>
<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: rgb(41, 41, 41); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 16px;">
	<em style="box-sizing: border-box;">Ph&oacute; Thủ tướng Vũ Đức Đam, Trưởng Ban Chỉ đạo quốc gia về ph&ograve;ng, chống dịch COVID-19 họp trực tuyến với tỉnh Bắc Ninh v&agrave; Bắc Giang về c&aacute;c biện ph&aacute;p cấp b&aacute;ch chống dịch trong cụm c&ocirc;ng nghiệp, khu c&ocirc;ng nghiệp v&agrave; khu vực d&acirc;n cư. Ảnh VGP/Đ&igrave;nh Nam</em></p>
<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: rgb(41, 41, 41); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 16px;">
	&nbsp;<span style="box-sizing: border-box; font-weight: bolder;">Chủ động s&agrave;ng lọc&nbsp;c&ocirc;ng nh&acirc;n trước khi v&agrave;o nh&agrave; m&aacute;y l&agrave;m việc</span></p>
<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: rgb(41, 41, 41); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 16px;">
	Từ điểm cầu Bắc Ninh, Chủ tịch UBND tỉnh Bắc Ninh Nguyễn Thị Hương Giang cho biết, t&igrave;nh h&igrave;nh dịch bệnh tại c&aacute;c khu c&ocirc;ng nghiệp, cụm c&ocirc;ng nghiệp cơ bản được kiểm so&aacute;t. Tr&ecirc;n địa b&agrave;n tỉnh c&oacute; 1.120 doanh nghiệp nằm trong 10 khu c&ocirc;ng nghiệp tập trung v&agrave; 26 cụm c&ocirc;ng nghiệp với khoảng 450.000 c&ocirc;ng nh&acirc;n.</p>
<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: rgb(41, 41, 41); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 16px;">
	T&iacute;nh đến hết ng&agrave;y 30/5, Bắc Ninh ghi nhận tổng số 176 ca mắc COVID-19 tại 49 doanh nghiệp trong c&aacute;c khu c&ocirc;ng nghiệp, cụm c&ocirc;ng nghiệp. Đ&aacute;ng ch&uacute; &yacute;, từ khi dịch COVID-19 xuất hiện thời gian qua, hơn 400 doanh nghiệp phải dừng sản xuất, khoảng 65.000 lao động buộc phải nghỉ l&agrave;m.</p>
<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: rgb(41, 41, 41); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 16px;">
	Ng&agrave;nh y tế Bắc Ninh đ&atilde; phối hợp với Bộ phận thường trực của Bộ Y tế x&acirc;y dựng ti&ecirc;u ch&iacute; về đối tượng ti&ecirc;m vắc xin ph&ograve;ng COVID-19 tr&ecirc;n địa b&agrave;n;&nbsp;x&acirc;y dựng ti&ecirc;u ch&iacute; lựa chọn c&ocirc;ng ty, đối tượng ti&ecirc;m&nbsp; ph&ograve;ng COVID-19 cho c&aacute;c cụm c&ocirc;ng nghiệp, khu c&ocirc;ng nghiệp tr&ecirc;n địa b&agrave;n; x&acirc;y dựng hướng dẫn tạm thời về ph&ograve;ng, chống dịch COVID-19 đối với nơi lưu tr&uacute; tập trung cho người lao động khi quay trở lại l&agrave;m việc tại c&aacute;c khu c&ocirc;ng nghiệp tr&ecirc;n địa b&agrave;n tỉnh&hellip; v&agrave; r&agrave; so&aacute;t kế hoạch điều trị bệnh nh&acirc;n COVID-19.</p>
<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: rgb(41, 41, 41); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 16px;">
	L&atilde;nh đạo tỉnh Bắc Ninh khẳng định, c&aacute;c lực lượng đang tiếp tục đẩy nhanh truy vết, y&ecirc;u cầu khai b&aacute;o y tế, ti&ecirc;m vắc xin cho đối tượng đ&atilde; ti&ecirc;m mũi 1 v&agrave; cho c&ocirc;ng nh&acirc;n m&ocirc;i trường.</p>
<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: rgb(41, 41, 41); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 16px;">
	Tiếp tục lấy mẫu x&eacute;t nghiệm cho c&aacute;c trường hợp c&oacute; li&ecirc;n quan đến bệnh nh&acirc;n COVID-19 v&agrave; lấy mẫu x&eacute;t nghiệm s&agrave;ng lọc trong cộng đồng. Trong ng&agrave;y 30/5, dự kiến lấy 19.000 mẫu x&eacute;t nghiệm tại Ti&ecirc;n Du, Y&ecirc;n Phong TP. Bắc Ninh&hellip;</p>
<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: rgb(41, 41, 41); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 16px;">
	&nbsp;</p>
<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: rgb(41, 41, 41); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 16px;">
	<img alt="BN 30" src="https://media.suckhoedoisong.vn/Images/thaibinh/2021/05/30/BN%2030.jpg" style="box-sizing: border-box; vertical-align: middle; border-style: none; max-width: 100%;" /></p>
<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: rgb(41, 41, 41); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 16px;">
	<em style="box-sizing: border-box;">L&atilde;nh đạo tỉnh Bắc Ninh b&aacute;o c&aacute;o Ph&oacute; Thủ tướng. Ảnh VGP/Đ&igrave;nh Nam</em></p>
<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: rgb(41, 41, 41); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 16px;">
	Từ ng&agrave;y 30/5, Sở Y tế tỉnh Bắc Ninh triển khai tất cả c&aacute;n bộ y tế v&agrave; c&aacute;c trung t&acirc;m y tế chủ động tự lấy mẫu, sau đ&oacute; x&eacute;t nghiệm. Sau khi l&agrave;m được, từng trung t&acirc;m đến từng nh&agrave; trọ hướng dẫn v&agrave; lấy mẫu đối chiếu.</p>
<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: rgb(41, 41, 41); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 16px;">
	Về x&eacute;t nghiệm PCR, Bắc Ninh ho&agrave;n to&agrave;n đ&aacute;p ứng đủ c&ocirc;ng suất. Tuy nhi&ecirc;n, với x&eacute;t nghiệm nhanh Bắc Ninh cũng cần hỗ trợ th&ecirc;m khoảng 200.000 bộ sinh phẩm.</p>
<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: rgb(41, 41, 41); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 16px;">
	Thực hiện&nbsp;phương &aacute;n bố tr&iacute; người lao động ăn, ở, l&agrave;m việc trong khu vực nh&agrave; m&aacute;y vừa đảm bảo sản xuất,&nbsp;504/1.120 doanh nghiệp đ&atilde; triển khai cụ thể, s&aacute;ng tạo; qua đ&oacute; hướng dẫn c&aacute;c doanh nghiệp kh&aacute;c c&ograve;n kh&oacute; khăn, l&uacute;ng t&uacute;ng trong việc triển khai.</p>
<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: rgb(41, 41, 41); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 16px;">
	Li&ecirc;n quan đến vấn đề n&agrave;y, Gi&aacute;m đốc Sở Y tế T&ocirc; Thị Mai Hoa cho biết, c&aacute;c doanh nghiệp căn cứ v&agrave;o t&igrave;nh h&igrave;nh thực tế v&agrave; t&iacute;nh chất quan trọng của d&acirc;y chuyền để giảm tối thiểu 50% số lượng c&ocirc;ng nh&acirc;n đi l&agrave;m trong c&aacute;c nh&agrave; m&aacute;y; đồng thời xem x&eacute;t tạm dừng d&acirc;y chuyền sản xuất kh&ocirc;ng cần thiết để giảm lượng c&ocirc;ng nh&acirc;n đi l&agrave;m. Do cần x&eacute;t nghiệm đầu v&agrave;o cho c&ocirc;ng nh&acirc;n trước khi đi l&agrave;m n&ecirc;n c&aacute;c doanh nghiệp đề nghị c&aacute;c đơn vị c&oacute; năng lực hỗ trợ doanh nghiệp x&eacute;t nghiệm để chủ động s&agrave;ng lọc&nbsp;c&ocirc;ng nh&acirc;n trước khi đưa v&agrave;o nh&agrave; m&aacute;y.</p>
<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: rgb(41, 41, 41); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 16px;">
	Gi&aacute;m đốc Sở Y tế tỉnh Bắc Ninh cho biết, c&aacute;c lực lượng đang bước v&agrave;o giai đoạn căng thẳng hơn, vừa chống dịch, vừa triển khai chiến dịch ti&ecirc;m ph&ograve;ng vắc xin cho c&ocirc;ng nh&acirc;n theo y&ecirc;u cầu của Bộ Y tế. Tuy nhi&ecirc;n, thời tiết nắng n&oacute;ng khiến c&ocirc;ng t&aacute;c truy vết, lấy mẫu x&eacute;t nghiệm kh&ocirc;ng hề dễ d&agrave;ng với c&aacute;n bộ y tế. Do đ&oacute;, Sở Y tế tỉnh sắp xếp thời gian lấy mẫu ph&ugrave; hợp, tr&aacute;nh mất sức cho c&aacute;n bộ y tế. Đ&acirc;y l&agrave; yếu tố rất quan trọng trong thời gian tới.</p>
<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: rgb(41, 41, 41); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 16px;">
	<span style="box-sizing: border-box; font-weight: bolder;">Bắc Giang di chuyển 3.000 c&ocirc;ng nh&acirc;n l&agrave; F1 nguy cơ thấp ra khỏi &quot;điểm n&oacute;ng&quot; N&uacute;i Hiểu</span></p>
<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: rgb(41, 41, 41); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 16px;">
	Từ điểm cầu Bắc Giang, l&atilde;nh đạo UBND tỉnh cho biết trong ng&agrave;y 30/5 c&oacute; 124 ca, chủ yếu l&agrave; c&aacute;c F1 trong c&aacute;c khu c&aacute;ch ly v&agrave; tại th&ocirc;n N&uacute;i Hiểu v&agrave; Tam Tầng, huyện Việt Y&ecirc;n cũng đ&atilde; được phong toả.</p>
<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: rgb(41, 41, 41); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 16px;">
	Đối với c&ocirc;ng t&aacute;c ph&ograve;ng, chống dịch tại Bắc Giang, l&atilde;nh đạo UBND tỉnh cho biết, thực hiện chỉ đạo của Ph&oacute; Thủ tướng Vũ Đức Đam về việc x&eacute;t nghiệm tầm so&aacute;t tại những &ldquo;điểm n&oacute;ng&rdquo; về dịch bệnh như bến xe, chợ, điểm thuộc huyện Việt Y&ecirc;n c&oacute; mật độ c&ocirc;ng nh&acirc;n cao... tr&ecirc;n to&agrave;n tỉnh, trong hai ng&agrave;y (28-29/5), Bắc Giang đ&atilde; lấy được 45.500 mẫu. Đến nay, 36.750 mẫu đều cho kết quả &acirc;m t&iacute;nh với virus SARS-Co-V-2.</p>
<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: rgb(41, 41, 41); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 16px;">
	Huyện Việt Y&ecirc;n đ&atilde; tổ chức di chuyển 3.000 c&ocirc;ng nh&acirc;n l&agrave; F1 nguy cơ thấp (đ&atilde; c&oacute; 2 lần x&eacute;t nghiệm &acirc;m t&iacute;nh) ra khỏi &ldquo;điểm n&oacute;ng&rdquo; th&ocirc;n N&uacute;i Hiểu về những điểm c&aacute;ch ly ở c&aacute;c huyện trong tỉnh, đảm bảo an to&agrave;n v&agrave; giảm mật độ c&ocirc;ng nh&acirc;n tập trung tại địa phương xuống c&ograve;n 4.100 c&ocirc;ng nh&acirc;n.</p>
<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: rgb(41, 41, 41); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 16px;">
	<img alt="BG 301" src="https://media.suckhoedoisong.vn/Images/thaibinh/2021/05/30/BG%20301.jpg" style="box-sizing: border-box; vertical-align: middle; border-style: none; max-width: 100%;" /></p>
<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: rgb(41, 41, 41); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 16px;">
	<em style="box-sizing: border-box;">L&atilde;nh đạo tỉnh Bắc Giang b&aacute;o c&aacute;o tại điểm cầu Bắc Giang&nbsp; &nbsp;Ảnh VGP/Đ&igrave;nh Nam</em></p>
<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: rgb(41, 41, 41); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 16px;">
	<span style="box-sizing: border-box; font-weight: bolder;">Doanh nghiệp hoạt động trở lại phải tuyệt đối an to&agrave;n</span></p>
<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: rgb(41, 41, 41); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 16px;">
	Ph&aacute;t biểu tại cuộc họp, Ph&oacute; Thủ tướng Ch&iacute;nh phủ Vũ Đức Đam n&ecirc;u r&otilde;: tuyệt đối kh&ocirc;ng để dịch bệnh ở những địa b&agrave;n gi&atilde;n c&aacute;ch x&atilde; hội, c&aacute;ch ly, phong tỏa l&acirc;y lan sang c&aacute;c v&ugrave;ng an to&agrave;n trong tỉnh v&agrave; c&aacute;c địa phương l&acirc;n cận. Trong c&aacute;c khu c&aacute;ch ly, phong tỏa, gi&atilde;n c&aacute;ch x&atilde; hội phải đảm bảo c&ocirc;ng t&aacute;c hậu cần, tiếp tục giảm mật độ c&ocirc;ng nh&acirc;n cư tr&uacute; ở c&aacute;c &ldquo;điểm n&oacute;ng&rdquo;; việc đ&oacute;n người đến c&aacute;ch ly tập trung phải tuyệt đối an to&agrave;n.</p>
<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: rgb(41, 41, 41); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 16px;">
	Ph&oacute; Thủ tướng lưu &yacute; c&aacute;c lực lượng kh&ocirc;ng chỉ tập trung ph&ograve;ng, chống dịch tại c&aacute;c khu c&ocirc;ng nghiệp, cụm c&ocirc;ng nghiệp m&agrave; cần quan t&acirc;m đến việc kh&ocirc;i phục sản xuất ở những cơ sở, nh&agrave; m&aacute;y ở b&ecirc;n ngo&agrave;i khu c&ocirc;ng nghiệp. &ldquo;Doanh nghiệp hoạt động trở lại phải tuyệt đối an to&agrave;n. Kh&ocirc;ng an to&agrave;n kh&ocirc;ng được hoạt động trở lại&rdquo;, Ph&oacute; Thủ tướng nhấn mạnh; đồng thời y&ecirc;u cầu tỉnh Bắc Giang tiếp tục đẩy mạnh c&ocirc;ng t&aacute;c x&eacute;t nghiệm s&agrave;ng lọc, tầm so&aacute;t diện rộng.</p>
<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: rgb(41, 41, 41); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 16px;">
	Tại cuộc l&agrave;m việc, đại diện Tổ Th&ocirc;ng tin của Ban Chỉ đạo quốc gia cho biết từ 5 ng&agrave;y nay c&aacute;c lực lượng tập trung nỗ lực, quyết liệt hơn nữa trong thực hiện c&ocirc;ng t&aacute;c chống dịch. Đến thời điểm n&agrave;y, ph&acirc;n t&iacute;ch dữ liệu của Tổ Th&ocirc;ng tin ghi nhận th&ecirc;m nguy cơ dịch bệnh của TPHCM.<br style="box-sizing: border-box;" />
	<br style="box-sizing: border-box;" />
	Để hỗ trợ thực hiện gi&atilde;n c&aacute;ch x&atilde; hội tr&ecirc;n địa b&agrave;n của TP Hồ Ch&iacute; Minh, Ph&oacute; Thủ tướng đề nghị Bộ Giao th&ocirc;ng vận tải theo s&aacute;t t&igrave;nh h&igrave;nh, hướng dẫn kịp thời; c&ugrave;ng c&aacute;c địa phương l&acirc;n cận phối hợp chặt chẽ để kiểm s&aacute;t dịch, quản l&yacute; người qua lại nhưng kh&ocirc;ng g&acirc;y &aacute;ch tắc, lưu th&ocirc;ng h&agrave;ng ho&aacute;.<br style="box-sizing: border-box;" />
	<br style="box-sizing: border-box;" />
	Về việc điều phối chuyến bay đưa người Việt Nam bị kẹt ở nước ngo&agrave;i về nước, kh&ocirc;ng hạ c&aacute;nh xuống TP Hồ Ch&iacute; Minh, Ph&oacute; Thủ tướng y&ecirc;u cầu Bộ Giao th&ocirc;ng vận tải tiếp tục thực hiện trong v&ograve;ng 14 ng&agrave;y kể từ khi TP Hồ Ch&iacute; Minh thực hiện gi&atilde;n c&aacute;ch x&atilde; hội. Tương tự, trước mắt, th&agrave;nh phố H&agrave; Nội sẽ kh&ocirc;ng tiếp nhận chuyến bay đưa người Việt Nam bị kẹt ở nước ngo&agrave;i về nước trong v&ograve;ng 1 tuần.<br style="box-sizing: border-box;" />
	<br style="box-sizing: border-box;" />
	Ngo&agrave;i ra, Ph&oacute; Thủ tướng lưu &yacute; c&aacute;c lực lượng phải tiếp tục quản l&yacute; chặt chẽ xuất nhập cảnh, đặc biệt đối tượng nhập cảnh tr&aacute;i ph&eacute;p.</p>
', CAST(N'2021-05-30T23:41:01.593' AS DateTime), N'admin', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[News] ([ID], [Name], [MetaTitle], [Description], [Image], [CategoryID], [Detail], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ViewCount], [Tags], [Language]) VALUES (17, N'Mua vaccine AZD1222 được lựa chọn nhà thầu trong trường hợp đặc biệt', NULL, NULL, N'vaccinecovid.jpg', NULL, N'<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: rgb(41, 41, 41); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 16px;">
	<span class="text-muted-ncov" style="box-sizing: border-box; font-weight: bolder; color: rgb(108, 117, 125);">Thường trực Ch&iacute;nh phủ&nbsp;<a style="box-sizing: border-box; color: inherit; background-color: transparent;" title="Nhấn enter để kich hoạt">đồng &yacute;</a>&nbsp;chủ trương thực hiện phương &aacute;n lựa chọn nh&agrave; thầu trong trường hợp đặc biệt được quy định tại Điều 26 Luật Đấu thầu đối với việc mua vaccine AZD1222 do AstraZeneca sản xuất, của C&ocirc;ng ty cổ phần Vắc xin Việt Nam (VNVC).</span></p>
<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: rgb(41, 41, 41); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 16px;">
	&nbsp;</p>
<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: rgb(41, 41, 41); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 16px;">
	<img src="http://baochinhphu.vn/Uploaded/hoangtrongdien/2021_06_15/vaccinecovid.jpg" style="box-sizing: border-box; vertical-align: middle; border-style: none; max-width: 100%; font-size: 1rem;" /></p>
<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: rgb(41, 41, 41); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 16px;">
	<em style="box-sizing: border-box;">Ảnh minh họa</em></p>
<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: rgb(41, 41, 41); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 16px;">
	<span style="box-sizing: border-box; font-size: 1rem;">Th&ocirc;ng b&aacute;o n&ecirc;u r&otilde;, Thường trực Ch&iacute;nh phủ đ&atilde; thống nhất, đồng &yacute; với đề nghị của Bộ Y tế về chủ trương thực hiện phương &aacute;n lựa chọn nh&agrave; thầu trong trường hợp đặc biệt được quy định tại Điều 26 Luật Đấu thầu đối với việc mua vaccine AZD1222 do AstraZeneca sản xuất của VNVC với c&aacute;c điều kiện đặc th&ugrave; đ&atilde; được Bộ Kế hoạch v&agrave; Đầu tư thẩm định tại văn bản số 3118/BKHĐT-QLĐT ng&agrave;y 25/5/2021.</span>Văn ph&ograve;ng Ch&iacute;nh phủ vừa c&oacute; Th&ocirc;ng b&aacute;o Kết luận của Thủ tướng Ch&iacute;nh phủ Phạm Minh Ch&iacute;nh tại cuộc họp Thường trực Ch&iacute;nh phủ về việc VNVC mua vaccine AZD1222 do AstraZeneca sản xuất.</p>
<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: rgb(41, 41, 41); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 16px;">
	Thủ tướng Ch&iacute;nh phủ Phạm Minh Ch&iacute;nh giao Bộ Y tế khẩn trương chủ tr&igrave;, phối hợp với Bộ Kế hoạch v&agrave; Đầu tư, Bộ Tư ph&aacute;p tiếp thu &yacute; kiến của c&aacute;c đại biểu dự họp, &yacute; kiến bằng văn bản của c&aacute;c cơ quan li&ecirc;n quan, &yacute; kiến thẩm định của Bộ Kế hoạch v&agrave; Đầu tư tại văn bản số 3118/BKHĐT-QLĐT để ho&agrave;n thiện hồ sơ tr&igrave;nh xin &yacute; kiến th&agrave;nh vi&ecirc;n Ch&iacute;nh phủ (tờ tr&igrave;nh, phiếu xin &yacute; kiến v&agrave; dự thảo Nghị quyết của Ch&iacute;nh phủ); b&aacute;o c&aacute;o Thủ tướng Ch&iacute;nh phủ.</p>
<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: rgb(41, 41, 41); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 16px;">
	Sau khi Nghị quyết của Ch&iacute;nh phủ được ban h&agrave;nh, giao Bộ Kế hoạch v&agrave; Đầu tư chủ tr&igrave;, phối hợp với Bộ Y tế dự thảo Quyết định ph&ecirc; duyệt phương &aacute;n lựa chọn nh&agrave; thầu trong trường hợp đặc biệt theo quy định tại Điều 26 của Luật Đấu thầu, b&aacute;o c&aacute;o Thủ tướng Ch&iacute;nh phủ.</p>
<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: rgb(41, 41, 41); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 16px;">
	Thủ tướng Ch&iacute;nh phủ cũng y&ecirc;u cầu Bộ Y tế khẩn trương c&acirc;n đối, cấp bổ sung vaccine ph&ograve;ng COVID-19 cho c&aacute;c địa phương gồm Bắc Giang, Bắc Ninh v&agrave; Th&agrave;nh phố Hồ Ch&iacute; Minh để ti&ecirc;m cho c&aacute;c đối tượng ưu ti&ecirc;n theo quy định.</p>
<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: rgb(41, 41, 41); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 16px;">
	Đồng thời, Bộ Y tế chủ tr&igrave;, phối hợp với c&aacute;c cơ quan li&ecirc;n quan trong th&aacute;ng 6/2021 ban h&agrave;nh văn bản bổ sung c&aacute;c đối tượng được ưu ti&ecirc;n ti&ecirc;m vaccine ph&ograve;ng dịch COVID-19 theo đ&uacute;ng nhiệm vụ được Ch&iacute;nh phủ giao tại Nghị quyết số&nbsp;<a href="http://vanban.chinhphu.vn/portal/page/portal/chinhphu/hethongvanban?class_id=2&amp;_page=1&amp;mode=detail&amp;document_id=203374" style="box-sizing: border-box; color: rgb(0, 123, 255); text-decoration-line: none; background-color: transparent;" title="Nhấn enter để kich hoạt">58/NQ-CP</a>&nbsp;ng&agrave;y 8/6/2021 v&agrave; Nghị quyết số&nbsp;<a href="http://vanban.chinhphu.vn/portal/page/portal/chinhphu/hethongvanban?class_id=2&amp;_page=1&amp;mode=detail&amp;document_id=202715" style="box-sizing: border-box; color: rgb(0, 123, 255); text-decoration-line: none; background-color: transparent;" title="Nhấn enter để kich hoạt">21/NQ-CP</a>&nbsp;ng&agrave;y 26/2/2021; b&aacute;o c&aacute;o Ph&oacute; Thủ tướng Vũ Đức Đam để chỉ đạo v&agrave; quyết định theo thẩm quyền về Đề &aacute;n &quot;Nhập khẩu, sản xuất, tổ chức chiến dịch ti&ecirc;m vaccine ph&ograve;ng COVID-19 v&agrave; bố tr&iacute; huy động nguồn lực để thực hiện&quot;.</p>
<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: rgb(41, 41, 41); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 16px;">
	<span style="box-sizing: border-box; font-weight: bolder;">Vũ Phương Nhi</span></p>
', CAST(N'2021-06-16T21:54:50.387' AS DateTime), N'admin', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[News] ([ID], [Name], [MetaTitle], [Description], [Image], [CategoryID], [Detail], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ViewCount], [Tags], [Language]) VALUES (1017, N'Giải pháp đảm bảo an tòa cho bệnh nhân và nhân viên y tế tại bệnh viện điều trị COVID-19 Củ Chi', NULL, NULL, N'18.6.2021 BV Củ Chi 1.jpg', NULL, N'<p class="text-change-size" style="margin: 0px 0px 6pt; padding: 0px; font-family: &quot;Open Sans&quot;, Helvetica, Arial, sans-serif; font-size: 14px; line-height: 35px; box-sizing: border-box; color: rgb(51, 51, 51); text-align: justify; text-indent: 0.5in;">
	<span style="margin: 0px; padding: 0px; box-sizing: border-box; font-size: 18px;"><span style="margin: 0px; padding: 0px; box-sizing: border-box; font-family: arial, sans-serif;">PGS.TS Nguy&ecirc;̃n Trường Sơn, Thứ trưởng B&ocirc;̣ Y t&ecirc;́, Trưởng Bộ phận thường trực đặc biệt của Bộ Y tế hỗ trợ TP.HCM ph&ograve;ng, chống dịch COVID-19 nh&acirc;́n mạnh cần đảm bảo an to&agrave;n tuyệt đối cho bệnh nh&acirc;n v&agrave; nh&acirc;n vi&ecirc;n y tế tại Bệnh viện Điều trị COVID-19 Củ Chi (TP. Hồ Ch&iacute; Minh).</span></span></p>
<p align="center" class="text-change-size" style="margin: 0px 0px 10px; padding: 0px; font-family: &quot;Open Sans&quot;, Helvetica, Arial, sans-serif; font-size: 14px; line-height: 1.6; box-sizing: border-box; color: rgb(51, 51, 51); text-align: center;">
	<img alt="" src="https://moh.gov.vn/documents/20182/229168/18.6.2021+BV+C%E1%BB%A7+Chi+1.jpg/87e16218-d61f-4314-af3c-a9fd3007de96?t=1624007749678" style="margin: 0px; padding: 0px; box-sizing: border-box; border: 0px; vertical-align: middle; max-width: 100%; height: 427px; width: 640px;" /></p>
<p align="center" class="text-change-size" style="margin: 0px 0px 10px; padding: 0px; font-family: &quot;Open Sans&quot;, Helvetica, Arial, sans-serif; font-size: 14px; line-height: 1.6; box-sizing: border-box; color: rgb(51, 51, 51); text-align: center;">
	<span style="margin: 0px; padding: 0px; box-sizing: border-box; font-size: 18px;"><em style="margin: 0px; padding: 0px; box-sizing: border-box;"><span style="margin: 0px; padding: 0px; box-sizing: border-box; font-family: &quot;times new roman&quot;, serif;">Thứ trưởng Bộ Y tế Nguyễn Trường Sơn chủ tr&igrave; cuộc họp tại Bệnh viện huyện Củ Chi ng&agrave;y 17/6/2021</span></em></span></p>
<p class="text-change-size" style="margin: 0px 0px 6pt; padding: 0px; font-family: &quot;Open Sans&quot;, Helvetica, Arial, sans-serif; font-size: 14px; line-height: 35px; box-sizing: border-box; color: rgb(51, 51, 51); text-align: justify; text-indent: 0.5in;">
	<span style="margin: 0px; padding: 0px; box-sizing: border-box; font-size: 18px;"><span style="margin: 0px; padding: 0px; box-sizing: border-box; font-family: arial, sans-serif;">Báo cáo B&ocirc;̣ ph&acirc;̣n Thường trực đặc bi&ecirc;̣t của Bộ Y tế tại cuộc họp ng&agrave;y 17/6, BSCKII Trần Ch&aacute;nh Xu&acirc;n -Giám đ&ocirc;́c BV đi&ecirc;̀u trị COVID-19 Củ Chi cho bi&ecirc;́t, BV đi vào hoạt đ&ocirc;̣ng từ ngày 12/6/2021 tr&ecirc;n cơ sở chuy&ecirc;̉n đ&ocirc;̉i c&ocirc;ng năng từ BV huyện Củ Chi với quy m&ocirc; 500 giường trong đó có 20 giường h&ocirc;̀i sức t&iacute;ch cực (ICU).</span></span></p>
<p class="text-change-size" style="margin: 0px 0px 6pt; padding: 0px; font-family: &quot;Open Sans&quot;, Helvetica, Arial, sans-serif; font-size: 14px; line-height: 35px; box-sizing: border-box; color: rgb(51, 51, 51); text-align: justify; text-indent: 0.5in;">
	<span style="margin: 0px; padding: 0px; box-sizing: border-box; font-size: 18px;"><span style="margin: 0px; padding: 0px; box-sizing: border-box; font-family: arial, sans-serif;">BV được Sở Y t&ecirc;́ TP.HCM ph&acirc;n c&ocirc;ng chịu tr&aacute;ch nhiệm tiếp nhận, điều trị c&aacute;c trường hợp b&ecirc;̣nh nh&acirc;n mắc COVID-19 ở nhi&ecirc;̀u mức đ&ocirc;̣ khác nhau, c&aacute;c trường hợp b&ecirc;̣nh nh&acirc;n mắc COVID-19 cần chạy thận nh&acirc;n tạo, cần can thiệp phẫu thuật cấp cứu, cấp cứu sản phụ khoa, nhi khoa&hellip;</span></span></p>
<p class="text-change-size" style="margin: 0px 0px 6pt; padding: 0px; font-family: &quot;Open Sans&quot;, Helvetica, Arial, sans-serif; font-size: 14px; line-height: 35px; box-sizing: border-box; color: rgb(51, 51, 51); text-align: justify; text-indent: 0.5in;">
	<span style="margin: 0px; padding: 0px; box-sizing: border-box; font-size: 18px;"><span style="margin: 0px; padding: 0px; box-sizing: border-box; font-family: arial, sans-serif;">Trước khi chuy&ecirc;̉n đ&ocirc;̉i c&ocirc;ng năng, BV huyện Củ Chi v&ocirc;́n là BV đa khoa hạng 2, đã t&ocirc;̉ chức được r&acirc;́t nhi&ecirc;̀u khoa khác nhau, trong đó có đơn vị ICU, khoa c&acirc;́p cứu, khoa h&ocirc;̀i sức, th&acirc;̣n nh&acirc;n tạo, n&ocirc;̣i, ngoại, sản nhi&hellip; tạo n&ecirc;̀n tảng thu&acirc;̣n lợi cho sự hoạt đ&ocirc;̣ng của BV sau khi chuy&ecirc;̉n đ&ocirc;̉i.</span></span></p>
<p class="text-change-size" style="margin: 0px 0px 6pt; padding: 0px; font-family: &quot;Open Sans&quot;, Helvetica, Arial, sans-serif; font-size: 14px; line-height: 35px; box-sizing: border-box; color: rgb(51, 51, 51); text-align: justify;">
	<span style="margin: 0px; padding: 0px; box-sizing: border-box; font-size: 18px;"><strong style="margin: 0px; padding: 0px; box-sizing: border-box;"><em style="margin: 0px; padding: 0px; box-sizing: border-box;"><span style="margin: 0px; padding: 0px; box-sizing: border-box; font-family: arial, sans-serif;">Chia lửa hi&ecirc;̣u quả cho các b&ecirc;̣nh vi&ecirc;̣n tuy&ecirc;́n thành ph&ocirc;́.</span></em></strong></span></p>
<p align="center" class="text-change-size" style="margin: 0px 0px 10px; padding: 0px; font-family: &quot;Open Sans&quot;, Helvetica, Arial, sans-serif; font-size: 14px; line-height: 1.6; box-sizing: border-box; color: rgb(51, 51, 51); text-align: center;">
	<img alt="" src="https://moh.gov.vn/documents/20182/229168/18.6.2021+BV+C%E1%BB%A7+Chi+2.jpg/df453aaf-1a38-41a8-abcc-b949010d4a5d?t=1624007753769" style="margin: 0px; padding: 0px; box-sizing: border-box; border: 0px; vertical-align: middle; max-width: 100%; height: 427px; width: 640px;" /></p>
<p align="center" class="text-change-size" style="margin: 0px 0px 10px; padding: 0px; font-family: &quot;Open Sans&quot;, Helvetica, Arial, sans-serif; font-size: 14px; line-height: 1.6; box-sizing: border-box; color: rgb(51, 51, 51); text-align: center;">
	<span style="margin: 0px; padding: 0px; box-sizing: border-box; font-size: 18px;"><em style="margin: 0px; padding: 0px; box-sizing: border-box;"><span style="margin: 0px; padding: 0px; box-sizing: border-box; font-family: &quot;times new roman&quot;, serif;">BSCKII Trần Ch&aacute;nh Xu&acirc;n -Giám đ&ocirc;́c BV đi&ecirc;̀u trị COVID-19 huyện Củ Chi b&aacute;o c&aacute;o tại cuộc họp</span></em></span></p>
<p class="text-change-size" style="margin: 0px 0px 6pt; padding: 0px; font-family: &quot;Open Sans&quot;, Helvetica, Arial, sans-serif; font-size: 14px; line-height: 35px; box-sizing: border-box; color: rgb(51, 51, 51); text-align: justify; text-indent: 0.5in;">
	<span style="margin: 0px; padding: 0px; box-sizing: border-box; font-size: 18px;"><span style="margin: 0px; padding: 0px; box-sizing: border-box; font-family: arial, sans-serif;">V&ecirc;̀ vi&ecirc;̣c ti&ecirc;́p nh&acirc;̣n và đi&ecirc;̀u trị cho b&ecirc;̣nh nh&acirc;n COVID-19, BSCKII Trần Ch&aacute;nh Xu&acirc;n cho bi&ecirc;́t, tính đ&ecirc;́n sáng ngày 17/6/2021, BV đang ti&ecirc;́p nh&acirc;̣n đi&ecirc;̀u trị cho 307 trường hợp b&ecirc;̣nh nh&acirc;n, trong đó có 44 trường hợp nghi nhi&ecirc;̃m, 5 trường hợp b&ecirc;̣nh nh&acirc;n nặng.</span></span></p>
<p class="text-change-size" style="margin: 0px 0px 6pt; padding: 0px; font-family: &quot;Open Sans&quot;, Helvetica, Arial, sans-serif; font-size: 14px; line-height: 35px; box-sizing: border-box; color: rgb(51, 51, 51); text-align: justify; text-indent: 0.5in;">
	<span style="margin: 0px; padding: 0px; box-sizing: border-box; font-size: 18px;"><span style="margin: 0px; padding: 0px; box-sizing: border-box; font-family: arial, sans-serif;">Đ&ocirc;́i với các trường hợp nghi nhi&ecirc;̃m tại BV, đ&acirc;y là những trường hợp test nhanh, có k&ecirc;́t quả dương tính với SARS-COV-2, được ph&acirc;n lu&ocirc;̀ng, b&ocirc;́ trí khu vực ri&ecirc;ng; Nếu có k&ecirc;́t quả xét nghi&ecirc;̣m &acirc;m tính 2 l&acirc;̀n với SARS-CoV-2 trong vòng 48 ti&ecirc;́ng bằng phương pháp RT-PCR sẽ được chuy&ecirc;̉n v&ecirc;̀ khu cách ly đ&ecirc;̉ ti&ecirc;́p tục cách ly theo quy định.</span></span></p>
<p class="text-change-size" style="margin: 0px 0px 6pt; padding: 0px; font-family: &quot;Open Sans&quot;, Helvetica, Arial, sans-serif; font-size: 14px; line-height: 35px; box-sizing: border-box; color: rgb(51, 51, 51); text-align: justify; text-indent: 0.5in;">
	<span style="margin: 0px; padding: 0px; box-sizing: border-box; font-size: 18px;"><span style="margin: 0px; padding: 0px; box-sizing: border-box; font-family: arial, sans-serif;">Trong những đợt ti&ecirc;́p nh&acirc;̣n vừa qua, BV đã tiếp nhận b&ecirc;̣nh nh&acirc;n ở nhi&ecirc;̀u đ&ocirc;̣ tu&ocirc;̉i khác nhau, có sự đa dạng v&ecirc;̀ mặt đặc đi&ecirc;̉m th&ecirc;̉ trạng, sức khỏe cũng như các v&acirc;́n đ&ecirc;̀ b&ecirc;̣nh lý n&ecirc;̀n mà b&ecirc;̣nh nh&acirc;n mắc phải.</span></span></p>
<p class="text-change-size" style="margin: 0px 0px 6pt; padding: 0px; font-family: &quot;Open Sans&quot;, Helvetica, Arial, sans-serif; font-size: 14px; line-height: 35px; box-sizing: border-box; color: rgb(51, 51, 51); text-align: justify; text-indent: 0.5in;">
	<span style="margin: 0px; padding: 0px; box-sizing: border-box; font-size: 18px;"><span style="margin: 0px; padding: 0px; box-sizing: border-box; font-family: arial, sans-serif;">Hi&ecirc;̣n BV đã ti&ecirc;́p nh&acirc;̣n 5 b&ecirc;̣nh nh&acirc;n chạy th&acirc;̣n nh&acirc;n tạo, đảm bảo đáp ứng vừa chạy th&acirc;̣n nh&acirc;n tạo vừa đi&ecirc;̀u trị COVID-19 cho b&ecirc;̣nh nh&acirc;n; Các trường hợp b&ecirc;̣nh nh&acirc;n là thai phụ cũng được t&ocirc;̉ chức thăm khám ngay tại BV&hellip;</span></span></p>
<p class="text-change-size" style="margin: 0px 0px 6pt; padding: 0px; font-family: &quot;Open Sans&quot;, Helvetica, Arial, sans-serif; font-size: 14px; line-height: 35px; box-sizing: border-box; color: rgb(51, 51, 51); text-align: justify; text-indent: 0.5in;">
	<span style="margin: 0px; padding: 0px; box-sizing: border-box; font-size: 18px;"><span style="margin: 0px; padding: 0px; box-sizing: border-box; font-family: arial, sans-serif;">Đ&ocirc;́i với các b&ecirc;̣nh nh&acirc;n n&ocirc;̣i trú đang được đi&ecirc;̀u trị tại BV trước khi được chuy&ecirc;̉n đ&ocirc;̉i c&ocirc;ng năng đã được chuy&ecirc;̉n sang cơ sở khác của BV là Ph&ograve;ng khám đa khoa T&acirc;n Quy và Bệnh viện Đa khoa khu vực Củ Chi đ&ecirc;̉ ti&ecirc;́p tục theo dõi, đi&ecirc;̀u trị.</span></span></p>
<p class="text-change-size" style="margin: 0px 0px 6pt; padding: 0px; font-family: &quot;Open Sans&quot;, Helvetica, Arial, sans-serif; font-size: 14px; line-height: 35px; box-sizing: border-box; color: rgb(51, 51, 51); text-align: justify; text-indent: 0.5in;">
	<span style="margin: 0px; padding: 0px; box-sizing: border-box; font-size: 18px;"><span style="margin: 0px; padding: 0px; box-sizing: border-box; font-family: arial, sans-serif;">V&ecirc;̀ nh&acirc;n sự của BV, ngoài lực lượng cán b&ocirc;̣ c&ocirc;ng nh&acirc;n vi&ecirc;n c&ocirc;ng tác tại BV huy&ecirc;̣n Củ Chi được cơ c&acirc;́u lại phù hợp, ng&agrave;nh Y tế TP.HCM cũng đã huy động c&aacute;c b&aacute;c sĩ chuy&ecirc;n khoa của c&aacute;c bệnh viện th&agrave;nh phố lu&acirc;n phi&ecirc;n hỗ trợ chuy&ecirc;n m&ocirc;n v&agrave; can thiệp tại chỗ.</span></span></p>
<p class="text-change-size" style="margin: 0px 0px 6pt; padding: 0px; font-family: &quot;Open Sans&quot;, Helvetica, Arial, sans-serif; font-size: 14px; line-height: 35px; box-sizing: border-box; color: rgb(51, 51, 51); text-align: justify; text-indent: 0.5in;">
	<span style="margin: 0px; padding: 0px; box-sizing: border-box; font-size: 18px;"><span style="margin: 0px; padding: 0px; box-sizing: border-box; font-family: arial, sans-serif;">Trong giai đoạn hi&ecirc;̣n nay, BV đi&ecirc;̀u trị COVID-19 Củ Chi đang được 4 BV h&ocirc;̃ trợ v&ecirc;̀ h&ocirc;̀i sức c&acirc;́p cứu, 2 BV h&ocirc;̃ trợ v&ecirc;̀ ki&ecirc;̉m soát nhi&ecirc;̃m khu&acirc;̉n, đ&ocirc;̀ng thời k&ecirc;́t n&ocirc;́i h&ocirc;̃ trợ, t&acirc;̣p hu&acirc;́n trực tuy&ecirc;́n từ BV B&ecirc;̣nh Nhi&ecirc;̣t đới TP.HCM.</span></span></p>
<p class="text-change-size" style="margin: 0px 0px 6pt; padding: 0px; font-family: &quot;Open Sans&quot;, Helvetica, Arial, sans-serif; font-size: 14px; line-height: 35px; box-sizing: border-box; color: rgb(51, 51, 51); text-align: justify; text-indent: 0.5in;">
	<span style="margin: 0px; padding: 0px; box-sizing: border-box; font-size: 18px;"><span style="margin: 0px; padding: 0px; box-sizing: border-box; font-family: arial, sans-serif;">Đ&ocirc;́i với nhu c&acirc;̀u v&ecirc;̀ trang thi&ecirc;́t bị, ngoài ngu&ocirc;̀n sẵn có, BV cũng đã l&acirc;̣p danh sách các trang thi&ecirc;́t bị c&acirc;̀n được trang bị th&ecirc;m đ&ecirc;̉ Sở Y t&ecirc;́ có k&ecirc;́ hoạch đi&ecirc;̀u ph&ocirc;́i phù hợp. Ngoài ra, BV cũng đã có k&ecirc;́ hoạch ph&ocirc;́i hợp tri&ecirc;̉n khai h&ecirc;̣ th&ocirc;́ng xét nghi&ecirc;̣m PCR đ&ecirc;̉ phục vụ cho nhu c&acirc;̀u xét nghi&ecirc;̣m của BV, đ&ocirc;̀ng thời đáp ứng nhu c&acirc;̀u xét nghi&ecirc;̣m của BV Dã chiến Củ Chi và nhu c&acirc;̀u trong khu vực với c&ocirc;ng su&acirc;́t khoảng 1.000 m&acirc;̃u/ngày.</span></span></p>
<p class="text-change-size" style="margin: 0px 0px 6pt; padding: 0px; font-family: &quot;Open Sans&quot;, Helvetica, Arial, sans-serif; font-size: 14px; line-height: 35px; box-sizing: border-box; color: rgb(51, 51, 51); text-align: justify;">
	<span style="margin: 0px; padding: 0px; box-sizing: border-box; font-size: 18px;"><strong style="margin: 0px; padding: 0px; box-sizing: border-box;"><em style="margin: 0px; padding: 0px; box-sizing: border-box;"><span style="margin: 0px; padding: 0px; box-sizing: border-box; font-family: arial, sans-serif;">Chu&acirc;̉n bị sẵn sàng cho kịch bản s&ocirc;́ b&ecirc;̣nh nh&acirc;n nặng gia tăng</span></em></strong></span></p>
<p class="text-change-size" style="margin: 0px 0px 6pt; padding: 0px; font-family: &quot;Open Sans&quot;, Helvetica, Arial, sans-serif; font-size: 14px; line-height: 35px; box-sizing: border-box; color: rgb(51, 51, 51); text-align: justify; text-indent: 0.5in;">
	<span style="margin: 0px; padding: 0px; box-sizing: border-box; font-size: 18px;"><span style="margin: 0px; padding: 0px; box-sizing: border-box; font-family: arial, sans-serif;">Phát bi&ecirc;̉u tại bu&ocirc;̉i làm vi&ecirc;̣c, Thứ trưởng Bộ Y tế Nguy&ecirc;̃n Trường Sơn khuy&ecirc;́n cáo: Đ&ocirc;́i với chủng Delta, s&ocirc;́ lượng b&ecirc;̣nh nh&acirc;n nặng có th&ecirc;̉ sẽ ra tăng nhanh. Do đó c&acirc;̀n h&ecirc;́t sức cảnh giác đ&ocirc;̀ng thời chu&acirc;̉n bị sẵn sàng các kịch bản v&ecirc;̀ nh&acirc;n lực, v&acirc;̣t lực đ&ecirc;̉ kịp thời đáp ứng c&ocirc;ng tác đi&ecirc;̀u trị cho b&ecirc;̣nh nh&acirc;n.</span></span></p>
<p class="text-change-size" style="margin: 0px 0px 6pt; padding: 0px; font-family: &quot;Open Sans&quot;, Helvetica, Arial, sans-serif; font-size: 14px; line-height: 35px; box-sizing: border-box; color: rgb(51, 51, 51); text-align: justify; text-indent: 0.5in;">
	<span style="margin: 0px; padding: 0px; box-sizing: border-box; font-size: 18px;"><span style="margin: 0px; padding: 0px; box-sizing: border-box; font-family: arial, sans-serif;">Trong thời đi&ecirc;̉m hi&ecirc;̣n tại, khi s&ocirc;́ trường hợp b&ecirc;̣nh nh&acirc;n nặng còn ít, các c&ocirc;ng tác t&acirc;̣p hu&acirc;́n c&acirc;̀n được tri&ecirc;̉n khai thực hi&ecirc;̣n tr&ecirc;n các mặt h&ocirc;̀i sức c&acirc;́p cứu; c&acirc;̣p nh&acirc;̣t các phác đ&ocirc;̀ đi&ecirc;̀u trị, các chỉ định đi&ecirc;̀u trị như thu&ocirc;́c ch&ocirc;́ng đ&ocirc;ng, thở máy, thở máy x&acirc;m nh&acirc;̣p&hellip; Đ&ocirc;̀ng thời, c&acirc;̀n chú trọng c&ocirc;ng tác ki&ecirc;̉m soát nhi&ecirc;̃m khu&acirc;̉n đ&ecirc;̉ đảm bảo an toàn cho cả b&ecirc;̣nh nh&acirc;n và nh&acirc;n vi&ecirc;n y t&ecirc;́, b&ocirc;́ trí nh&acirc;n vi&ecirc;n ki&ecirc;̉m soát vi&ecirc;̣c mặc, thay trang phục bảo h&ocirc;̣.</span></span></p>
<p align="center" class="text-change-size" style="margin: 0px 0px 10px; padding: 0px; font-family: &quot;Open Sans&quot;, Helvetica, Arial, sans-serif; font-size: 14px; line-height: 1.6; box-sizing: border-box; color: rgb(51, 51, 51); text-align: center;">
	<img alt="" src="https://moh.gov.vn/documents/20182/229168/18.6.2021+BV+C%E1%BB%A7+Chi+3.jpg/2a5b72f3-66f9-4695-9d07-d9f64b9a6f46?t=1624007761451" style="margin: 0px; padding: 0px; box-sizing: border-box; border: 0px; vertical-align: middle; max-width: 100%; height: 427px; width: 640px;" /></p>
<p align="center" class="text-change-size" style="margin: 0px 0px 10px; padding: 0px; font-family: &quot;Open Sans&quot;, Helvetica, Arial, sans-serif; font-size: 14px; line-height: 1.6; box-sizing: border-box; color: rgb(51, 51, 51); text-align: center;">
	<span style="margin: 0px; padding: 0px; box-sizing: border-box; font-size: 18px;"><em style="margin: 0px; padding: 0px; box-sizing: border-box;"><span style="margin: 0px; padding: 0px; box-sizing: border-box; font-family: &quot;times new roman&quot;, serif;">Trong đơn nguy&ecirc;n ICU của BV điều trị COVID-19 huyện Củ Chi.</span></em></span></p>
<p class="text-change-size" style="margin: 0px 0px 6pt; padding: 0px; font-family: &quot;Open Sans&quot;, Helvetica, Arial, sans-serif; font-size: 14px; line-height: 35px; box-sizing: border-box; color: rgb(51, 51, 51); text-align: justify; text-indent: 0.5in;">
	<span style="margin: 0px; padding: 0px; box-sizing: border-box; font-size: 18px;"><span style="margin: 0px; padding: 0px; box-sizing: border-box; font-family: arial, sans-serif;">Thứ trưởng lưu &yacute; toàn b&ocirc;̣ nh&acirc;n vi&ecirc;n c&ocirc;ng tác tại BV đ&ecirc;̀u phải được ti&ecirc;m đủ 2 mũi vaccine phòng COVID-19. Các trường hợp kh&ocirc;ng được ti&ecirc;m vaccine hoặc ch&ocirc;́ng chỉ định thì kh&ocirc;ng tham gia c&ocirc;ng tác đi&ecirc;̀u trị bệnh nh&acirc;n. Ngoài ra BV c&acirc;̀n nhanh chóng th&ocirc;́ng k&ecirc; nhu c&acirc;̀u, s&ocirc;́ lượng trang thi&ecirc;́t bị phục vụ c&ocirc;ng tác đi&ecirc;̀u trị cho b&ecirc;̣nh nh&acirc;n COVID-19, đặc bi&ecirc;̣t là các thi&ecirc;́t bị phục vụ đi&ecirc;̀u trị cho các trường hợp b&ecirc;̣nh nh&acirc;n nặng đ&ecirc;̉ có bi&ecirc;̣n pháp đi&ecirc;̀u đ&ocirc;̣ng trong h&ecirc;̣ th&ocirc;́ng ngành Y t&ecirc;́ TP.HCM cũng như sự h&ocirc;̃ trợ từ B&ocirc;̣ Y t&ecirc;́.</span></span></p>
<p class="text-change-size" style="margin: 0px 0px 6pt; padding: 0px; font-family: &quot;Open Sans&quot;, Helvetica, Arial, sans-serif; font-size: 14px; line-height: 35px; box-sizing: border-box; color: rgb(51, 51, 51); text-align: justify; text-indent: 0.5in;">
	<span style="margin: 0px; padding: 0px; box-sizing: border-box; font-size: 18px;"><span style="margin: 0px; padding: 0px; box-sizing: border-box; font-family: arial, sans-serif;">Thứ trưởng Bộ Y tế Nguy&ecirc;̃n Trường Sơn cho bi&ecirc;́t, B&ocirc;̣ Y t&ecirc;́ đã giao BV Chợ R&acirc;̃y TP.HCM chu&acirc;̉n bị lực lượng sẵn sàng tham gia h&ocirc;̃ trợ BV trong khi có y&ecirc;u c&acirc;̀u. BV có th&ecirc;̉ chủ đ&ocirc;̣ng y&ecirc;u c&acirc;̀u BV Chợ R&acirc;̃y cử &ecirc; kíp trực ti&ecirc;́p đ&ecirc;́n BV h&ocirc;̃ trợ và đào tạo.</span></span></p>
<p class="text-change-size" style="margin: 0px 0px 6pt; padding: 0px; font-family: &quot;Open Sans&quot;, Helvetica, Arial, sans-serif; font-size: 14px; line-height: 35px; box-sizing: border-box; color: rgb(51, 51, 51); text-align: justify;">
	<span style="margin: 0px; padding: 0px; box-sizing: border-box; font-size: 18px;"><strong style="margin: 0px; padding: 0px; box-sizing: border-box;"><em style="margin: 0px; padding: 0px; box-sizing: border-box;"><span style="margin: 0px; padding: 0px; box-sizing: border-box; font-family: arial, sans-serif;">Bảo v&ecirc;̣ ngu&ocirc;̀n nh&acirc;n lực trước m&ocirc;́i nguy l&acirc;y nhi&ecirc;̃m</span></em></strong></span></p>
<p class="text-change-size" style="margin: 0px 0px 6pt; padding: 0px; font-family: &quot;Open Sans&quot;, Helvetica, Arial, sans-serif; font-size: 14px; line-height: 35px; box-sizing: border-box; color: rgb(51, 51, 51); text-align: justify; text-indent: 0.5in;">
	<span style="margin: 0px; padding: 0px; box-sizing: border-box; font-size: 18px;"><span style="margin: 0px; padding: 0px; box-sizing: border-box; font-family: arial, sans-serif;">Theo PGS.TS Tăng Ch&iacute; Thượng, Phó Giám đ&ocirc;́c Sở Y t&ecirc;́ TP.HCM: BV đã tri&ecirc;̉n khai b&ocirc;́ trí khu vực lưu trú cho lực lượng nh&acirc;n vi&ecirc;n, y bác sĩ tại BV, theo đó sau khi h&ecirc;́t thời gian c&ocirc;ng tác tại BV, các nh&acirc;n vi&ecirc;n sẽ v&ecirc;̀ nơi lưu trú được b&ocirc;́ trí, thay vì v&ecirc;̀ thẳng nhà; đi&ecirc;̀u này vừa giúp đảm bảo c&ocirc;ng tác phòng ch&ocirc;́ng dịch vừa giúp hạn ch&ecirc;́ nguy cơ dịch b&ecirc;̣nh x&acirc;m nh&acirc;̣p BV.</span></span></p>
<p class="text-change-size" style="margin: 0px 0px 6pt; padding: 0px; font-family: &quot;Open Sans&quot;, Helvetica, Arial, sans-serif; font-size: 14px; line-height: 35px; box-sizing: border-box; color: rgb(51, 51, 51); text-align: justify; text-indent: 0.5in;">
	<span style="margin: 0px; padding: 0px; box-sizing: border-box; font-size: 18px;"><span style="margin: 0px; padding: 0px; box-sizing: border-box; font-family: arial, sans-serif;">BV hi&ecirc;̣n đã b&ocirc;́ trí được 40 phòng lưu trú, hai người một phòng; đ&ocirc;̀ng thời b&ocirc;́ trí m&ocirc;̣t ph&acirc;̀n nh&acirc;n lực lưu trú tại khu nhà ở chuy&ecirc;n gia của BV; BV cũng đang áp dụng ch&ecirc;́ đ&ocirc;̣ lu&acirc;n phi&ecirc;n c&ocirc;ng tác tương tự như m&ocirc; hình đã được áp dụng tại BV dã chi&ecirc;́n Củ Chi trong thời gian qua. Hi&ecirc;̣n ngành Y t&ecirc;́ TP. HCM cũng đang v&acirc;̣n đ&ocirc;̣ng các khách sạn trong khu vực đ&ecirc;̉ ph&acirc;n chia khu vực lưu trú của các nh&acirc;n vi&ecirc;n khách sạn.</span></span></p>
<p class="text-change-size" style="margin: 0px 0px 6pt; padding: 0px; font-family: &quot;Open Sans&quot;, Helvetica, Arial, sans-serif; font-size: 14px; line-height: 35px; box-sizing: border-box; color: rgb(51, 51, 51); text-align: justify; text-indent: 0.5in;">
	<span style="margin: 0px; padding: 0px; box-sizing: border-box; font-size: 18px;"><span style="margin: 0px; padding: 0px; box-sizing: border-box; font-family: arial, sans-serif;">Đ&ocirc;́i với vi&ecirc;̣c lưu trú của nh&acirc;n vi&ecirc;n y t&ecirc;́, Thứ trưởng Bộ Y tế Nguy&ecirc;̃n Trường Sơn đ&ecirc;̀ xu&acirc;́t, c&acirc;̀n đảm bảo tuy&ecirc;̣t đ&ocirc;́i an toàn cho nh&acirc;n vi&ecirc;n y t&ecirc;́, BV n&ecirc;n ph&acirc;n chia nh&acirc;n lực thành các kíp; Các nh&acirc;n sự trong cùng m&ocirc;̣t kíp sẽ cùng làm vi&ecirc;̣c, di chuy&ecirc;̉n và sinh hoạt; Giữa các kíp c&acirc;̀n có sự tách bi&ecirc;̣t, khi thay đ&ocirc;̉i kíp nh&acirc;n vi&ecirc;n c&acirc;̀n thực hi&ecirc;̣n toàn di&ecirc;̣n các bi&ecirc;̣n pháp khử khu&acirc;̉n theo quy định đ&ecirc;̉ đảm bảo an toàn và phòng ch&ocirc;́ng l&acirc;y nhi&ecirc;̃m chéo.</span></span></p>
', CAST(N'2021-06-18T20:27:40.963' AS DateTime), N'admin', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[News] ([ID], [Name], [MetaTitle], [Description], [Image], [CategoryID], [Detail], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ViewCount], [Tags], [Language]) VALUES (1018, N'Phấn đấu không kéo dài giãn cách xã hội trên diện rộng tại TP Hồ Chí Minh', NULL, NULL, N'NQH_1967.jpg', NULL, N'<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: rgb(41, 41, 41); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 16px;">
	<span class="text-muted-ncov" style="box-sizing: border-box; font-weight: bolder; color: rgb(108, 117, 125);">Lực lượng chống dịch của TP Hồ Ch&iacute; Minh khẩn trương điều tra dịch tễ, x&aacute;c định c&aacute;c ổ dịch COVID-19, c&aacute;c nguồn l&acirc;y, quy m&ocirc; để khoanh v&ugrave;ng thật gọn, thật chặt, phấn đấu kh&ocirc;ng để tiếp tục k&eacute;o d&agrave;i t&igrave;nh trạng gi&atilde;n c&aacute;ch x&atilde; hội tr&ecirc;n diện rộng.</span></p>
<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: rgb(41, 41, 41); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 16px;">
	&nbsp;</p>
<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: rgb(41, 41, 41); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 16px;">
	Đ&acirc;y l&agrave; ph&aacute;t biểu của Ph&oacute; Thủ tướng&nbsp;Ch&iacute;nh phủ Vũ Đức Đam, Trưởng Ban Chỉ đạo Quốc gia ph&ograve;ng, chống dịch COVID-19 chủ tr&igrave; cuộc họp trực tuyến với l&atilde;nh đạo&nbsp;TP Hồ Ch&iacute; Minh về c&aacute;c biện ph&aacute;p ph&ograve;ng, chống dịch, diễn ra chiều tối 17/6, tại Trụ sở Ch&iacute;nh phủ.</p>
<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: rgb(41, 41, 41); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 16px;">
	<img alt="NQH_1967" src="https://media.suckhoedoisong.vn/Images/toanthang/2021/06/17/NQH_1967.jpg" style="box-sizing: border-box; vertical-align: middle; border-style: none; max-width: 100%;" /></p>
<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: rgb(41, 41, 41); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 16px;">
	<em style="box-sizing: border-box;">Ph&oacute; Thủ tướng Ch&iacute;nh phủ Vũ Đức Đam ph&aacute;t biểu tại cuộc họp.&nbsp; &nbsp;Ảnh:VGP/Đ&igrave;nh Nam</em></p>
<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: rgb(41, 41, 41); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 16px;">
	<span style="box-sizing: border-box; font-weight: bolder;">Tăng năng lực x&eacute;t nghiệm l&ecirc;n 30.000 test đơn/ng&agrave;y;&nbsp;Ti&ecirc;m 836.000 liều vắc xin trong 5 ng&agrave;y</span></p>
<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: rgb(41, 41, 41); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 16px;">
	Ph&aacute;t biểu tại cuộc họp, Ph&oacute; Chủ tịch UBND TP Hồ Ch&iacute; Minh Dương Anh Đức cho biết, trước diễn biến dịch COVID-19, để đảm bảo c&ocirc;ng t&aacute;c ph&ograve;ng, chống dịch bệnh, h&agrave;ng ng&agrave;y, Ban Chỉ đạo ph&ograve;ng, chống dịch của TP Hồ Ch&iacute; Minh tổ chức họp, tổ chức c&aacute;c đo&agrave;n kiểm tra thường xuy&ecirc;n.</p>
<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: rgb(41, 41, 41); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 16px;">
	Bắt đầu từ ng&agrave;y 17/6, c&aacute;c quận, huyện th&agrave;nh lập lại c&aacute;c đo&agrave;n kiểm tra để kiểm tra việc thực hiện Chỉ thị 15/CT-TTg cộng với 1 số biện ph&aacute;p của th&agrave;nh phố.</p>
<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: rgb(41, 41, 41); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 16px;">
	Hiện c&oacute; 7 doanh nghiệp trong khu c&ocirc;ng nghiệp ở TP Hồ Ch&iacute; Minh c&oacute; ca mắc COVID-19. Phần lớn mỗi nơi chỉ c&oacute; từ 1-2 ca mắc, chưa c&oacute; dấu hiệu l&acirc;y lan ra c&aacute;c nơi kh&aacute;c; c&oacute; 2 doanh nghiệp c&oacute; t&iacute;nh chất giống nhau (chế biến hải sản, c&ocirc;ng nh&acirc;n l&agrave;m việc chung trong m&ocirc;i trường kh&ocirc;ng gian lạnh v&agrave; k&iacute;n) n&ecirc;n c&oacute; số lượng ca mắc lớn hơn (6 v&agrave; 11 ca)&hellip;</p>
<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: rgb(41, 41, 41); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 16px;">
	Sau khi tiếp nhận 836.000 liều vắc xin ph&ograve;ng COVID-19 của AstraZeneca, &ocirc;ng Dương Anh Đức cho biết: &ldquo;TP Hồ Ch&iacute; Minh đ&atilde; họp, l&ecirc;n phương &aacute;n x&aacute;c định c&aacute;c đối tượng ưu ti&ecirc;n, kế hoạch ti&ecirc;m; phấn đấu ti&ecirc;m vắc xin cho 200.000 người/ng&agrave;y; đồng thời tăng năng lực x&eacute;t nghiệm l&ecirc;n 30.000 test đơn/ng&agrave;y&rdquo;.</p>
<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: rgb(41, 41, 41); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 16px;">
	Tại điểm cầu TP Hồ Ch&iacute; Minh, Thứ trưởng Bộ Y tế Nguyễn Trường Sơn- Tổ trưởng Tổ thường trực đặc biệt của Bộ Y tế hỗ trợ TP Hồ Ch&iacute; Minh chống dịch COVID-19 nhận định, trải qua 15 ng&agrave;y đầu ti&ecirc;n, t&igrave;nh h&igrave;nh dịch bệnh tại th&agrave;nh phố đến nay vẫn &ldquo;rất phức tạp&rdquo;; vẫn c&ograve;n 1 số chuỗi được ph&aacute;t hiện ngo&agrave;i cộng đồng.</p>
<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: rgb(41, 41, 41); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 16px;">
	&ldquo;Tuy nhi&ecirc;n, về mặt dịch tễ, ch&uacute;ng ta c&oacute; cơ hội kiểm so&aacute;t được c&aacute;c chuỗi l&acirc;y nhiễm&rdquo;- Thứ trưởng Bộ Y tế cho biết.</p>
<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: rgb(41, 41, 41); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 16px;">
	Hiện nay, một số bệnh viện triển khai c&ocirc;ng t&aacute;c r&agrave; so&aacute;t kỹ nhưng &ldquo;bị lọt nh&acirc;n vi&ecirc;n&rdquo;, điển h&igrave;nh tại Bệnh viện Đại học Y dược TP Hồ Ch&iacute; Minh, Bệnh viện Bệnh Nhiệt đới TP Hồ Ch&iacute; Minh - đang được phong tỏa v&agrave; r&agrave; so&aacute;t lại, sau đ&oacute; sẽ cho một số bộ phận tiếp tục hoạt động. Đối với c&aacute;c khu c&ocirc;ng nghiệp, một số doanh nghiệp c&oacute; đ&ocirc;ng c&ocirc;ng nh&acirc;n ghi nhận ca mắc COVID-19, TP Hồ Ch&iacute; Minh dự kiến sẽ th&agrave;nh lập khoảng 100 đo&agrave;n để kiểm tra tất cả c&aacute;c nh&agrave; m&aacute;y đang hoạt động.</p>
<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: rgb(41, 41, 41); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 16px;">
	Những nh&agrave; m&aacute;y, doanh nghiệp lớn cần c&oacute; phương &aacute;n bố tr&iacute; cho c&ocirc;ng nh&acirc;n, người lao động cốt l&otilde;i ăn ở trong nh&agrave; m&aacute;y hoặc tổ chức quy tr&igrave;nh kh&eacute;p k&iacute;n từ nơi ở trọ, k&yacute; t&uacute;c x&aacute;, việc đưa đ&oacute;n đến nh&agrave; m&aacute;y l&agrave;m việc, sinh hoạt.</p>
<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: rgb(41, 41, 41); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 16px;">
	Thứ trưởng Nguyễn Trường Sơn n&oacute;i th&ecirc;m, trong thời gian tới, TP Hồ Ch&iacute; Minh đ&atilde; chuẩn bị phương &aacute;n điều trị cho 5.000 bệnh nh&acirc;n; dự tr&ugrave; trang thiết bị, sẵn s&agrave;ng cấp cứu, điều trị bệnh nh&acirc;n nặng, cần thở m&aacute;y; đồng thời x&acirc;y dựng kế hoạch tổ chức chiến dịch ti&ecirc;m chủng, bảo đảm ti&ecirc;m hết trong v&ograve;ng 5 ng&agrave;y, dự kiến thực hiện từ ng&agrave;y 19/6.<br style="box-sizing: border-box;" />
	<br style="box-sizing: border-box;" />
	Từ ng&agrave;y mai, 18/6, TP Hồ Ch&iacute; Minh sẽ th&iacute; điểm tự lấy mẫu x&eacute;t nghiệm; đồng thời tổ chức r&agrave; so&aacute;t để bảo đảm an to&agrave;n trong khu c&aacute;ch ly tập trung, chống l&acirc;y nhiễm ch&eacute;o; tăng cường tiến h&agrave;nh r&agrave; so&aacute;t ngo&agrave;i cộng đồng v&agrave; c&aacute;c khu c&ocirc;ng nghiệp.</p>
<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: rgb(41, 41, 41); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 16px;">
	<span style="box-sizing: border-box; font-weight: bolder;">Gi&atilde;n c&aacute;ch x&atilde; hội, c&aacute;ch ly, phong tỏa phải thực hiện tr&ecirc;n tinh thần &ldquo;cố gắng gọn nhất c&oacute; thể&rdquo;</span></p>
<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: rgb(41, 41, 41); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 16px;">
	Ph&aacute;t biểu chỉ đạo tại cuộc họp, Ph&oacute; Thủ tướng Ch&iacute;nh phủ Vũ Đức Đam nhấn mạnh, TP Hồ Ch&iacute; Minh l&agrave; đ&ocirc; thị lớn, đ&atilde; c&oacute; kinh nghiệm thực tiễn ph&ograve;ng, chống dịch trước đ&oacute;. V&igrave; vậy, c&aacute;c quyết định gi&atilde;n c&aacute;ch x&atilde; hội, c&aacute;ch ly, phong tỏa phải thực hiện tr&ecirc;n tinh thần &ldquo;cố gắng gọn nhất c&oacute; thể&rdquo;.</p>
<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: rgb(41, 41, 41); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 16px;">
	Mục đ&iacute;ch của việc gi&atilde;n c&aacute;ch x&atilde; hội nhằm l&agrave;m chậm tốc độ l&acirc;y lan của dịch, t&igrave;m ra c&aacute;c ổ dịch v&agrave; nguồn l&acirc;y, từ đ&oacute; x&aacute;c định quy m&ocirc; khoanh v&ugrave;ng, do đ&oacute;, TP Hồ Ch&iacute; Minh phấn đấu kh&ocirc;ng để tiếp tục k&eacute;o d&agrave;i t&igrave;nh trạng gi&atilde;n c&aacute;ch x&atilde; hội tr&ecirc;n diện rộng.</p>
<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: rgb(41, 41, 41); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 16px;">
	Đ&atilde; qua 14 ng&agrave;y gi&atilde;n c&aacute;ch x&atilde; hội, TP Hồ Ch&iacute; Minh phải khẩn trương điều tra dịch tễ, ph&acirc;n loại những khu vực an to&agrave;n trong t&igrave;nh h&igrave;nh hiện nay để c&oacute; giải ph&aacute;p nới lỏng; những khu vực c&oacute; nguy cơ phải siết chặt hơn nữa, triển khai tr&ecirc;n tinh thần &ldquo;kh&ocirc;ng c&agrave;o bằng hết tất cả để phục vụ mục ti&ecirc;u k&eacute;p&rdquo;.</p>
<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: rgb(41, 41, 41); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 16px;">
	<img alt="tpchm17" src="https://media.suckhoedoisong.vn/Images/toanthang/2021/06/17/tpchm17.jpg" style="box-sizing: border-box; vertical-align: middle; border-style: none; max-width: 100%;" /></p>
<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: rgb(41, 41, 41); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 16px;">
	<em style="box-sizing: border-box;">Thứ trưởng Bộ Y tế Nguyễn Trường Sơn (&aacute;o trắng) v&agrave; Ph&oacute; Chủ tịch UBND TP Hồ Ch&iacute; Minh Dương Anh Đức tại điểm cầu TPHCM&nbsp; &nbsp; Ảnh: VGP/Đ&igrave;nh Nam</em></p>
<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: rgb(41, 41, 41); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 16px;">
	Những khu vực đ&atilde; khoanh v&ugrave;ng, c&aacute;ch ly y tế phải tuyệt đối thực hiện nghi&ecirc;m t&uacute;c, kh&ocirc;ng để xuất hiện t&igrave;nh trạng tập trung đ&ocirc;ng người như người d&acirc;n đ&atilde; phản &aacute;nh; kiểm so&aacute;t luồng giao th&ocirc;ng từ những nơi c&oacute; ổ dịch trong th&agrave;nh phố.</p>
<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: rgb(41, 41, 41); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 16px;">
	Đối với c&aacute;c khu c&ocirc;ng nghiệp, Ph&oacute; Thủ tướng y&ecirc;u cầu TP Hồ Ch&iacute; Minh phải &ldquo;giữ bằng được bằng những biện ph&aacute;p mạnh tay&rdquo;; tăng cường x&eacute;t nghiệm cảnh b&aacute;o để nhanh ch&oacute;ng ph&aacute;t hiện ca mắc COVID-19 trong 3 ng&agrave;y đầu ti&ecirc;n.</p>
<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: rgb(41, 41, 41); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 16px;">
	Năng lực x&eacute;t nghiệm của TP Hồ Ch&iacute; Minh rất tốt so với c&aacute;c địa phương kh&aacute;c, tuy nhi&ecirc;n, Ph&oacute; Thủ tướng lưu &yacute;, với d&acirc;n số 10 triệu người, tập trung nhiều khu c&ocirc;ng nghiệp, th&agrave;nh phố phải c&oacute; phương &aacute;n tăng cường c&ocirc;ng suất x&eacute;t nghiệm trong t&igrave;nh huống dịch xuất hiện trong c&aacute;c khu c&ocirc;ng nghiệp.</p>
<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: rgb(41, 41, 41); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 16px;">
	Đặc biệt, c&ocirc;ng t&aacute;c điều phối x&eacute;t nghiệm bảo đảm thống nhất giữa c&aacute;c đơn vị tham gia, đ&aacute;p ứng tốc độ lấy mẫu, truy vết bắt kịp tốc độ l&acirc;y lan, tuyệt đối kh&ocirc;ng để t&igrave;nh trạng x&eacute;t nghiệm chậm hoặc nhầm đ&atilde; xảy ra ở một số địa phương trước đ&oacute;. Khi ph&aacute;t hiện ca mắc ở nh&agrave; m&aacute;y, x&iacute; nghiệp trong khu c&ocirc;ng nghiệp, Ph&oacute; Thủ tướng y&ecirc;u cầu c&ocirc;ng t&aacute;c khoanh v&ugrave;ng, c&aacute;ch ly, phong tỏa ch&uacute; &yacute; đến c&aacute;c khu c&oacute; mật độ d&agrave;y đặc c&ocirc;ng nh&acirc;n thu&ecirc; trọ.</p>
<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: rgb(41, 41, 41); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 16px;">
	Trong thời gian tới, TP Hồ Ch&iacute; Minh khẩn trương ho&agrave;n thiện hướng dẫn th&iacute; điểm c&aacute;ch ly F1 tại nh&agrave;, bảo đảm an to&agrave;n, chặt chẽ về y tế cũng như quyền ri&ecirc;ng tư của người d&acirc;n, ph&ugrave; hợp với điều kiện của th&agrave;nh phố trong t&igrave;nh trạng c&oacute; đ&ocirc;ng người bị nhiễm; đồng thời khẩn trương triển khai th&iacute; điểm hướng dẫn c&ocirc;ng nh&acirc;n, người d&acirc;n tự lấy mẫu x&eacute;t nghiệm.</p>
', CAST(N'2021-06-18T21:38:33.510' AS DateTime), N'admin', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[News] ([ID], [Name], [MetaTitle], [Description], [Image], [CategoryID], [Detail], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ViewCount], [Tags], [Language]) VALUES (1019, N'Tin tức Covid-19 TP.HCM: Thực tế có bao nhiêu ca mắc/ngày?', NULL, NULL, N'dien-bien-dich-3203.jpg', NULL, N'<div class="sapo cms-desc" id="chapeau" style="box-sizing: border-box; outline: 0px; font-size: 18px; line-height: 28px; margin-bottom: 20px; color: rgb(51, 51, 51); font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;">
	<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; display: inline;">
		Số ca mắc&nbsp;<a href="https://thanhnien.vn/covid-19/" rel="noopener noreferrer" style="box-sizing: border-box; background-color: transparent; text-decoration-line: none; color: rgb(0, 115, 159); display: inline; outline: 0px; transition: all 0.2s ease-in-out 0s;" target="_blank" title="Covid-19">Covid-19</a>&nbsp;mới mỗi ng&agrave;y tại TP.HCM gia tăng; trẻ em v&agrave; phụ nữ mang thai mắc Covid-19 cũng c&oacute; xu hướng gia tăng theo tỷ lệ thuận.</p>
</div>
<div class="details__content" id="abdf" style="box-sizing: border-box; outline: 0px; width: 639px; float: none; color: rgb(51, 51, 51); font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px;">
	<div class="cms-body detail" id="abody" itemprop="articleBody" style="box-sizing: border-box; outline: 0px; color: rgb(17, 17, 17); font-size: 1.8rem !important; line-height: 3rem !important; margin-bottom: 20px;">
		<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; font-size: 1.8rem !important; line-height: 3rem !important;">
			Theo b&aacute;o c&aacute;o mới nhất của&nbsp;<a href="https://thanhnien.vn/dieu-tra-vu-gia-lam-bac-si-dieu-tri-covid-19-trong-khu-cach-ly-post1432158.html" style="box-sizing: border-box; background-color: transparent; text-decoration-line: none; color: rgb(0, 115, 159); display: inline; outline: 0px; transition: all 0.2s ease-in-out 0s; font-size: 1.8rem !important; line-height: 3rem !important;" title="Điều tra vụ giả làm bác sĩ điều trị Covid-19 trong khu cách ly">Sở Y tế TP.HCM,</a>&nbsp;ng&agrave;y 22.2, TP.HCM c&oacute; 1.356 ca mắc Covid-19 khẳng định v&agrave; 1.367 ca<a href="https://thanhnien.vn/ha-noi-chay-kit-test-covid-19-gia-tang-chong-mat-post1432056.html" style="box-sizing: border-box; background-color: transparent; text-decoration-line: none; color: rgb(0, 115, 159); display: inline; outline: 0px; transition: all 0.2s ease-in-out 0s; font-size: 1.8rem !important; line-height: 3rem !important;" title="Hà Nội ''cháy'' kit test Covid-19, giá tăng chóng mặt">&nbsp;test nhanh</a>. Như vậy, ng&agrave;y 22.2, TP.HCM c&oacute; tổng cộng 2.723 ca mắc v&agrave; nghi mắc Covid-19. Cao gấp h&agrave;ng chục lần so với thời điểm đầu th&aacute;ng 2.2022.</p>
		<table align="center" class="picture" style="border-collapse: collapse; width: 639px; max-width: 100%; margin-bottom: 20px; font-size: 1.8rem !important; line-height: 3rem !important;">
			<tbody style="box-sizing: border-box; font-size: 1.8rem !important; line-height: 3rem !important;">
				<tr style="box-sizing: border-box; font-size: 1.8rem !important; line-height: 3rem !important;">
					<td class="pic" style="box-sizing: border-box; border-width: 0px; border-style: initial; border-color: initial; padding-bottom: 10px; font-size: 1.8rem !important; line-height: 3rem !important;">
						<img alt="Tin tức Covid-19 TP.HCM: Thực tế có bao nhiêu ca mắc/ngày? - ảnh 1" caption="Tin tức Covid-19 TP.HCM: Thực tế có bao nhiêu ca mắc/ngày? - ảnh 1" class="cms-photo" data-height="302" data-image-id="3751706" data-width="645" src="https://image.thanhnien.vn/w2048/Uploaded/2022/kbfapuo/2022_02_23/dien-bien-dich-3203.jpg" style="box-sizing: border-box; vertical-align: middle; border-style: none; max-width: 100%; display: block; margin: auto; font-size: 1.8rem !important; line-height: 3rem !important;" /></td>
				</tr>
				<tr style="box-sizing: border-box; font-size: 1.8rem !important; line-height: 3rem !important;">
					<td class="caption" style="box-sizing: border-box; color: rgb(85, 85, 85); border-top: 0px; border-right: 0px; border-left: 0px; border-bottom-color: rgb(194, 194, 194); padding-bottom: 10px; font-size: 14px !important; line-height: 1.5 !important;">
						<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; line-height: 1.5 !important;">
							Diễn biến dịch bệnh Covid-19 tại TP.HCM</p>
						<div class="source" style="box-sizing: border-box; outline: 0px; color: rgb(170, 170, 170); font-size: 12px !important; line-height: 1.5 !important; margin: 3px auto 0px; text-transform: uppercase;">
							<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; line-height: 1.5 !important;">
								CỔNG TH&Ocirc;NG TIN COVID-19 TP.HCM</p>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
		<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; font-size: 1.8rem !important; line-height: 3rem !important;">
			Trong số 1.356 ca mắc Covid-19 khẳng định, c&oacute; 896 ca s&agrave;ng lọc tại bệnh viện, 440 ca ph&aacute;t hiện tại cộng đồng v&agrave; 47 ca lấy mẫu sau khi chuyển v&agrave;o khu c&aacute;ch ly tập trung quận, huyện v&agrave;&nbsp;<a href="https://thanhnien.vn/benh-vien-da-chien/" rel="noopener noreferrer" style="box-sizing: border-box; background-color: transparent; text-decoration-line: none; color: rgb(0, 115, 159); display: inline; outline: 0px; transition: all 0.2s ease-in-out 0s; font-size: 1.8rem !important; line-height: 3rem !important;" target="_blank" title="bệnh viện dã chiến">bệnh viện d&atilde; chiến</a>.</p>
		<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; font-size: 1.8rem !important; line-height: 3rem !important;">
			Theo l&atilde;nh đạo Sở Y tế TP.HCM, kết quả tầm so&aacute;t ngẫu nhi&ecirc;n biến thể&nbsp;<a href="https://thanhnien.vn/omicron/" rel="noopener noreferrer" style="box-sizing: border-box; background-color: transparent; text-decoration-line: none; color: rgb(0, 115, 159); display: inline; outline: 0px; transition: all 0.2s ease-in-out 0s; font-size: 1.8rem !important; line-height: 3rem !important;" target="_blank" title="Omicron">Omicron</a>&nbsp;bằng&nbsp;<a href="https://thanhnien.vn/tinh-hinh-covid-19-hom-nay-22-2-tre-em-mac-covid-19-o-tp-hcm-tang-cao-post1432046.html" style="box-sizing: border-box; background-color: transparent; text-decoration-line: none; color: rgb(0, 115, 159); display: inline; outline: 0px; transition: all 0.2s ease-in-out 0s; font-size: 1.8rem !important; line-height: 3rem !important;" title="Tình hình Covid-19 hôm nay 22.2: Trẻ em mắc Covid-19 ở TP.HCM tăng cao">x&eacute;t nghiệm PCR</a>&nbsp;tại TP.HCM từ ng&agrave;y 10 - 17.2, c&oacute; 70/92 mẫu bệnh phẩm cho kết quả dương t&iacute;nh với biến thể Omicron, chiếm 76%. Lấy ngẫu nhi&ecirc;n 26/70 mẫu s&agrave;ng lọc dương t&iacute;nh n&agrave;y để thực hiện giải tr&igrave;nh tự gen, x&aacute;c định 100% l&agrave; biến chủng Omicron. Như vậy Omicron đang l&agrave; biến chủng g&acirc;y bệnh chủ yếu tại TP.HCM, ph&ugrave; hợp với t&igrave;nh h&igrave;nh dịch bệnh đang gia tăng thời gian gần đ&acirc;y.</p>
		<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; font-size: 1.8rem !important; line-height: 3rem !important;">
			Số ca nhiễm<a href="https://thanhnien.vn/giam-doc-so-y-te-tp-hcm-so-ca-mac-bien-chung-omicron-dang-chiem-uu-the-post1431985.html" style="box-sizing: border-box; background-color: transparent; text-decoration-line: none; color: rgb(0, 115, 159); display: inline; outline: 0px; transition: all 0.2s ease-in-out 0s; font-size: 1.8rem !important; line-height: 3rem !important;" title="Giám đốc Sở Y tế TP.HCM: Số ca mắc biến chủng Omicron đang chiếm ưu thế">&nbsp;biến thể Omicron</a>&nbsp;tại TP.HCM l&agrave; 183 ca, trong đ&oacute; c&oacute; 172 ca nhập cảnh v&agrave; 11 ca cộng đồng.</p>
	</div>
</div>
<p>
	&nbsp;</p>
', CAST(N'2022-02-23T14:43:59.690' AS DateTime), N'admin', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[News] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Id], [Name], [Code], [Amount], [Price], [ImportPrice], [Image], [MoreImages], [Describe], [Detail], [CategoryID], [Status], [MetaTitel], [CreatedTime], [CreatedBy], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [ViewCount]) VALUES (3, N'Cao gắm nguyên chất (Cao khô)', NULL, 3, CAST(250000.00 AS Decimal(18, 2)), 220000, N'cao-gam-nguyen-chat.jpg', NULL, NULL, NULL, 1, NULL, NULL, CAST(N'2021-05-03T19:17:51.700' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Code], [Amount], [Price], [ImportPrice], [Image], [MoreImages], [Describe], [Detail], [CategoryID], [Status], [MetaTitel], [CreatedTime], [CreatedBy], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [ViewCount]) VALUES (4, N'Trà an gút 25 túi lọc 5 gam', NULL, 5, CAST(45000.00 AS Decimal(18, 2)), 40000, N'd2cd9e322c39d1e858715e9d3ef10518.jpg', NULL, NULL, NULL, 1, NULL, NULL, CAST(N'2021-05-03T19:17:51.700' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Code], [Amount], [Price], [ImportPrice], [Image], [MoreImages], [Describe], [Detail], [CategoryID], [Status], [MetaTitel], [CreatedTime], [CreatedBy], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [ViewCount]) VALUES (5, N'Viên Khớp OSA Break Học Viện Quân Y chính hãng hộp 30 viên', NULL, 5, CAST(165000.00 AS Decimal(18, 2)), 125000, N'vien-khop-osa-breck-hoc-vien-quan-y_56505f8574654c31b1b37bf4d4c210bf_grande.jpg', NULL, NULL, NULL, 1, NULL, NULL, CAST(N'2021-05-03T19:17:51.700' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Code], [Amount], [Price], [ImportPrice], [Image], [MoreImages], [Describe], [Detail], [CategoryID], [Status], [MetaTitel], [CreatedTime], [CreatedBy], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [ViewCount]) VALUES (6, N'Hoàng Thống Phong', NULL, 4, CAST(250000.00 AS Decimal(18, 2)), 220000, N'hoang-thong-phong-suadocx-1555327810007.jpeg', NULL, NULL, NULL, 1, NULL, NULL, CAST(N'2021-05-03T19:17:51.700' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Code], [Amount], [Price], [ImportPrice], [Image], [MoreImages], [Describe], [Detail], [CategoryID], [Status], [MetaTitel], [CreatedTime], [CreatedBy], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [ViewCount]) VALUES (7, N' SANGU Tinh Chất Tiêu Gout Số Một Nhật Bản', NULL, 8, CAST(860000.00 AS Decimal(18, 2)), 800000, N'sangu.jpg', NULL, NULL, NULL, 1, NULL, NULL, CAST(N'2021-05-03T19:17:51.700' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Code], [Amount], [Price], [ImportPrice], [Image], [MoreImages], [Describe], [Detail], [CategoryID], [Status], [MetaTitel], [CreatedTime], [CreatedBy], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [ViewCount]) VALUES (11, N'Swisse Viên Uống Điều Trị Gout Từ Cần Tây 5000mg 50 Viên', NULL, 8, CAST(555000.00 AS Decimal(18, 2)), 490000, N'thuoc-dieu-tri-gut-swisse-high-strength-celery-5000mg.jpg', NULL, NULL, NULL, 1, NULL, NULL, CAST(N'2021-05-03T19:17:51.700' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Code], [Amount], [Price], [ImportPrice], [Image], [MoreImages], [Describe], [Detail], [CategoryID], [Status], [MetaTitel], [CreatedTime], [CreatedBy], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [ViewCount]) VALUES (12, N'Viên uống hỗ trợ thận Swanson Uric Acid Cleanse Kidney Support 60 viên', NULL, 3, CAST(395000.00 AS Decimal(18, 2)), 300000, N'9ff49b1758b4d10b992587e266d441f6.png_1200x1200q80.jpg', NULL, NULL, NULL, 1, NULL, NULL, CAST(N'2021-05-03T19:17:51.700' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Code], [Amount], [Price], [ImportPrice], [Image], [MoreImages], [Describe], [Detail], [CategoryID], [Status], [MetaTitel], [CreatedTime], [CreatedBy], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [ViewCount]) VALUES (13, N'Viên Uống Trankal Thái Lan Hỗ Trợ Thấp Khớp', NULL, 8, CAST(15200008.00 AS Decimal(18, 2)), 300000, N'trankal1.jpg', NULL, NULL, NULL, 1, NULL, NULL, CAST(N'2021-05-03T19:17:51.700' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Code], [Amount], [Price], [ImportPrice], [Image], [MoreImages], [Describe], [Detail], [CategoryID], [Status], [MetaTitel], [CreatedTime], [CreatedBy], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [ViewCount]) VALUES (14, N'Make p:rem', NULL, 89, CAST(5000000.00 AS Decimal(18, 2)), 300000, N'zoom-back-207665.jpg', NULL, NULL, NULL, 2, NULL, NULL, CAST(N'2021-05-03T19:17:51.700' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Code], [Amount], [Price], [ImportPrice], [Image], [MoreImages], [Describe], [Detail], [CategoryID], [Status], [MetaTitel], [CreatedTime], [CreatedBy], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [ViewCount]) VALUES (29, N'Nano Fast viên sủi trị Gout', NULL, 3, CAST(1580000.00 AS Decimal(18, 2)), 790000, N'vien-sui-nano-fast-1.jpg', NULL, NULL, NULL, 1, NULL, NULL, CAST(N'2021-05-03T19:17:51.700' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Code], [Amount], [Price], [ImportPrice], [Image], [MoreImages], [Describe], [Detail], [CategoryID], [Status], [MetaTitel], [CreatedTime], [CreatedBy], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [ViewCount]) VALUES (31, N'thuốc không đường', NULL, 6, CAST(1213123213.00 AS Decimal(18, 2)), NULL, N'trankal1.jpg', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Code], [Amount], [Price], [ImportPrice], [Image], [MoreImages], [Describe], [Detail], [CategoryID], [Status], [MetaTitel], [CreatedTime], [CreatedBy], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [ViewCount]) VALUES (32, N'Thuốc Dạ Dày Chữ Y (Yumangel)', NULL, 4, CAST(100000.00 AS Decimal(18, 2)), NULL, N'thuoc-dieu-tri-gut-swisse-high-strength-celery-5000mg.jpg', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Code], [Amount], [Price], [ImportPrice], [Image], [MoreImages], [Describe], [Detail], [CategoryID], [Status], [MetaTitel], [CreatedTime], [CreatedBy], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [ViewCount]) VALUES (33, N'thuốc siêu xịn', NULL, 3, CAST(11212.00 AS Decimal(18, 2)), NULL, N'thuoc-dieu-tri-gut-swisse-high-strength-celery-5000mg.jpg', NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Code], [Amount], [Price], [ImportPrice], [Image], [MoreImages], [Describe], [Detail], [CategoryID], [Status], [MetaTitel], [CreatedTime], [CreatedBy], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [ViewCount]) VALUES (34, N'thuốc không ngọt', NULL, 2, CAST(213.00 AS Decimal(18, 2)), NULL, N'vien-sui-nano-fast-1.jpg', NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Code], [Amount], [Price], [ImportPrice], [Image], [MoreImages], [Describe], [Detail], [CategoryID], [Status], [MetaTitel], [CreatedTime], [CreatedBy], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [ViewCount]) VALUES (35, N'thuốc ngon', NULL, 12, CAST(213.00 AS Decimal(18, 2)), NULL, N'sangu.jpg', NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Code], [Amount], [Price], [ImportPrice], [Image], [MoreImages], [Describe], [Detail], [CategoryID], [Status], [MetaTitel], [CreatedTime], [CreatedBy], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [ViewCount]) VALUES (36, N'thuốc bn', NULL, 12, CAST(5000000.00 AS Decimal(18, 2)), NULL, N'vien-khop-osa-breck-hoc-vien-quan-y_56505f8574654c31b1b37bf4d4c210bf_grande.jpg', NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Code], [Amount], [Price], [ImportPrice], [Image], [MoreImages], [Describe], [Detail], [CategoryID], [Status], [MetaTitel], [CreatedTime], [CreatedBy], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [ViewCount]) VALUES (37, N'thuốc', NULL, 12, CAST(1222444.00 AS Decimal(18, 2)), NULL, N'trankal1.jpg', NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Code], [Amount], [Price], [ImportPrice], [Image], [MoreImages], [Describe], [Detail], [CategoryID], [Status], [MetaTitel], [CreatedTime], [CreatedBy], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [ViewCount]) VALUES (38, N'thuốc', NULL, 2, CAST(1222444.00 AS Decimal(18, 2)), NULL, N'd2cd9e322c39d1e858715e9d3ef10518.jpg', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Code], [Amount], [Price], [ImportPrice], [Image], [MoreImages], [Describe], [Detail], [CategoryID], [Status], [MetaTitel], [CreatedTime], [CreatedBy], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [ViewCount]) VALUES (41, N'thuốc có đường phèn', NULL, 3, CAST(123213.00 AS Decimal(18, 2)), NULL, N'cao-gam-nguyen-chat.jpg', NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Code], [Amount], [Price], [ImportPrice], [Image], [MoreImages], [Describe], [Detail], [CategoryID], [Status], [MetaTitel], [CreatedTime], [CreatedBy], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [ViewCount]) VALUES (42, N'Viên uống thay cơm', NULL, 4, CAST(1222444.00 AS Decimal(18, 2)), NULL, N'zoom-back-207665.jpg', NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Code], [Amount], [Price], [ImportPrice], [Image], [MoreImages], [Describe], [Detail], [CategoryID], [Status], [MetaTitel], [CreatedTime], [CreatedBy], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [ViewCount]) VALUES (43, N'Thuốc siệu sị', NULL, 2, CAST(12.00 AS Decimal(18, 2)), NULL, N'sangu.jpg', NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Code], [Amount], [Price], [ImportPrice], [Image], [MoreImages], [Describe], [Detail], [CategoryID], [Status], [MetaTitel], [CreatedTime], [CreatedBy], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [ViewCount]) VALUES (44, N'Combo phòng vệ: Nước muối Pharmacity 0,9% (500ml x 24 chai)', NULL, 20, CAST(9417.00 AS Decimal(18, 2)), NULL, N'covid-5-2.jpg', NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Code], [Amount], [Price], [ImportPrice], [Image], [MoreImages], [Describe], [Detail], [CategoryID], [Status], [MetaTitel], [CreatedTime], [CreatedBy], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [ViewCount]) VALUES (45, N'Fugacar Mebendazole (500mg)', NULL, 122, CAST(19000.00 AS Decimal(18, 2)), NULL, N'P00779_1_l.jpg', NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Code], [Amount], [Price], [ImportPrice], [Image], [MoreImages], [Describe], [Detail], [CategoryID], [Status], [MetaTitel], [CreatedTime], [CreatedBy], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [ViewCount]) VALUES (46, N'Khăn ướt kháng khuẩn Pharmacity (30 tờ/gói)', NULL, 21, CAST(16000.00 AS Decimal(18, 2)), NULL, N'P10900_1_l.jpg', NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Code], [Amount], [Price], [ImportPrice], [Image], [MoreImages], [Describe], [Detail], [CategoryID], [Status], [MetaTitel], [CreatedTime], [CreatedBy], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [ViewCount]) VALUES (47, N'Khẩu trang than hoạt tính 4 lớp Pharmacity (50 cái/hộp)', NULL, 21, CAST(89000.00 AS Decimal(18, 2)), NULL, N'P17947_1_l.jpg', NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Code], [Amount], [Price], [ImportPrice], [Image], [MoreImages], [Describe], [Detail], [CategoryID], [Status], [MetaTitel], [CreatedTime], [CreatedBy], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [ViewCount]) VALUES (48, N'XỊT RỬA TAY HƯƠNG TRÀ XANH', NULL, 21, CAST(27000.00 AS Decimal(18, 2)), NULL, N'P13021_1_l.jpg', NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Code], [Amount], [Price], [ImportPrice], [Image], [MoreImages], [Describe], [Detail], [CategoryID], [Status], [MetaTitel], [CreatedTime], [CreatedBy], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [ViewCount]) VALUES (1043, N'12321', NULL, 9, CAST(123123123.00 AS Decimal(18, 2)), NULL, N'covid-5-2.jpg', NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
INSERT [dbo].[Role] ([Id], [Name]) VALUES (N'', N'')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (N'ADD_CONTENT', N'Thêm tin tức')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (N'ADD_USER', N'Thêm user')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (N'DELETE_USER', N'Xoá user')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (N'EDIT_CONTENT', N'Sửa tin tức')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (N'EDIT_USER', N'Sửa user')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (N'VIEW_USER', N'Xem danh sách user')
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([ID], [UserName], [Password], [GroupID], [Name], [Address], [Email], [Phone], [Sex], [DateOfBirth], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (17, N'123', N'12', N'DOCTOR', N'Nguyễn Thị Nở', N'He_thong_ho_tro_y_te.Models.DB.User.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'unnamed (1).png', NULL)
INSERT [dbo].[User] ([ID], [UserName], [Password], [GroupID], [Name], [Address], [Email], [Phone], [Sex], [DateOfBirth], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (18, N'doctor', N'123456', N'DOCTOR', N'Nguyễn Văn A', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'unnamed.jpg', 1)
INSERT [dbo].[User] ([ID], [UserName], [Password], [GroupID], [Name], [Address], [Email], [Phone], [Sex], [DateOfBirth], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (20, N'DOCTOR2', N'1', N'DOCTOR', N'Vũ Văn Thành Đô', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'user.png', 1)
INSERT [dbo].[User] ([ID], [UserName], [Password], [GroupID], [Name], [Address], [Email], [Phone], [Sex], [DateOfBirth], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (21, N'Benh2', N'1', N'PATIENT', N'Vũ Văn Ương', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'thete-52-min-1.png', NULL)
INSERT [dbo].[User] ([ID], [UserName], [Password], [GroupID], [Name], [Address], [Email], [Phone], [Sex], [DateOfBirth], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (22, N'1221', N'123', N'PATIENT', N'abab', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'd2cd9e322c39d1e858715e9d3ef10518.jpg', NULL)
INSERT [dbo].[User] ([ID], [UserName], [Password], [GroupID], [Name], [Address], [Email], [Phone], [Sex], [DateOfBirth], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (23, N'admin', N'123456', N'ADMIN', N'', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'user.png', NULL)
INSERT [dbo].[User] ([ID], [UserName], [Password], [GroupID], [Name], [Address], [Email], [Phone], [Sex], [DateOfBirth], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (1023, N'123123', N'213123', N'ADMIN', N'213', NULL, N'', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([ID], [UserName], [Password], [GroupID], [Name], [Address], [Email], [Phone], [Sex], [DateOfBirth], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (1024, N'oc', N'123', N'DOCTOR', N'Son Son', NULL, N'', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
INSERT [dbo].[UserGroup] ([Id], [Name]) VALUES (N'ADMIN', N'Quản trị')
INSERT [dbo].[UserGroup] ([Id], [Name]) VALUES (N'DOCTOR', N'Bác sĩ')
INSERT [dbo].[UserGroup] ([Id], [Name]) VALUES (N'MEMBER', N'Khách hàng')
INSERT [dbo].[UserGroup] ([Id], [Name]) VALUES (N'PATIENT', N'Bệnh nhân')
GO
ALTER TABLE [dbo].[About] ADD  CONSTRAINT [DF_About_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[About] ADD  CONSTRAINT [DF_About_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_DisplayOrder]  DEFAULT ((0)) FOR [DisplayOrder]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_CreatedTime]  DEFAULT (getdate()) FOR [CreatedTime]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_ShowOnHome]  DEFAULT ((0)) FOR [ShowOnHome]
GO
ALTER TABLE [dbo].[Feedback] ADD  CONSTRAINT [DF_Feedback_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[LichHen] ADD  CONSTRAINT [DF__LichHen__DaDuyet__0D44F85C]  DEFAULT ((0)) FOR [DaDuyet]
GO
ALTER TABLE [dbo].[News] ADD  CONSTRAINT [DF_News_CreatedDate_1]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[News] ADD  CONSTRAINT [DF_News_Status_1]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[News] ADD  CONSTRAINT [DF_News_ViewCount_1]  DEFAULT ((0)) FOR [ViewCount]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_CreatedTime]  DEFAULT (getdate()) FOR [CreatedTime]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_GroupID]  DEFAULT ('MEMBER') FOR [GroupID]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[DetailBill]  WITH CHECK ADD  CONSTRAINT [FK_DetailBill_Bill] FOREIGN KEY([IdBill])
REFERENCES [dbo].[Bill] ([IdBill])
GO
ALTER TABLE [dbo].[DetailBill] CHECK CONSTRAINT [FK_DetailBill_Bill]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category1] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category1]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_UserGroup] FOREIGN KEY([GroupID])
REFERENCES [dbo].[UserGroup] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_UserGroup]
GO
/****** Object:  StoredProcedure [dbo].[Sp_Account_Login]    Script Date: 25/03/2022 4:04:42 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Sp_Account_Login]
	 @UserName varchar(50),
	 @Password varchar(50)

as
begin 
	declare @count int
	declare @res bit
	select @count = count(*) 
	from Account
	where UserName = @UserName and Password = @Password
	if @count>0 
		set @res = 1
	else 
		set @res=0

	select @res
end
GO
USE [master]
GO
ALTER DATABASE [YTe] SET  READ_WRITE 
GO
