USE [master]
GO
/****** Object:  Database [WebStore.ProductsModel]    Script Date: 10.12.2020 0:54:00 ******/
CREATE DATABASE [WebStore.ProductsModel]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ElectronicsStoreDB', FILENAME = N'C:\Users\Gleb\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\ElectronicsStoreDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ElectronicsStoreDB_log', FILENAME = N'C:\Users\Gleb\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\ElectronicsStoreDB.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [WebStore.ProductsModel] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WebStore.ProductsModel].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WebStore.ProductsModel] SET ANSI_NULL_DEFAULT ON 
GO
ALTER DATABASE [WebStore.ProductsModel] SET ANSI_NULLS ON 
GO
ALTER DATABASE [WebStore.ProductsModel] SET ANSI_PADDING ON 
GO
ALTER DATABASE [WebStore.ProductsModel] SET ANSI_WARNINGS ON 
GO
ALTER DATABASE [WebStore.ProductsModel] SET ARITHABORT ON 
GO
ALTER DATABASE [WebStore.ProductsModel] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WebStore.ProductsModel] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WebStore.ProductsModel] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WebStore.ProductsModel] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WebStore.ProductsModel] SET CURSOR_DEFAULT  LOCAL 
GO
ALTER DATABASE [WebStore.ProductsModel] SET CONCAT_NULL_YIELDS_NULL ON 
GO
ALTER DATABASE [WebStore.ProductsModel] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WebStore.ProductsModel] SET QUOTED_IDENTIFIER ON 
GO
ALTER DATABASE [WebStore.ProductsModel] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WebStore.ProductsModel] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WebStore.ProductsModel] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WebStore.ProductsModel] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WebStore.ProductsModel] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WebStore.ProductsModel] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WebStore.ProductsModel] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WebStore.ProductsModel] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WebStore.ProductsModel] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WebStore.ProductsModel] SET RECOVERY FULL 
GO
ALTER DATABASE [WebStore.ProductsModel] SET  MULTI_USER 
GO
ALTER DATABASE [WebStore.ProductsModel] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WebStore.ProductsModel] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WebStore.ProductsModel] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WebStore.ProductsModel] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [WebStore.ProductsModel] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [WebStore.ProductsModel] SET QUERY_STORE = OFF
GO
USE [WebStore.ProductsModel]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [WebStore.ProductsModel]
GO
/****** Object:  Table [dbo].[City]    Script Date: 10.12.2020 0:54:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DescriptionHelper]    Script Date: 10.12.2020 0:54:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DescriptionHelper](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ModelType]    Script Date: 10.12.2020 0:54:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ModelType](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[PTDId] [int] NOT NULL,
	[DescriptionValues] [text] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 10.12.2020 0:54:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] NOT NULL,
	[ProductTypeId] [int] NOT NULL,
	[Producer] [nvarchar](50) NOT NULL,
	[ModelTypeId] [int] NOT NULL,
	[Price] [money] NOT NULL,
	[Info] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductSet]    Script Date: 10.12.2020 0:54:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSet](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductType]    Script Date: 10.12.2020 0:54:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductType](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[ProductSetId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductTypeDescription]    Script Date: 10.12.2020 0:54:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductTypeDescription](
	[Id] [int] NOT NULL,
	[ProductTypeId] [int] NOT NULL,
	[Description] [text] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Storage]    Script Date: 10.12.2020 0:54:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Storage](
	[ProductId] [int] NOT NULL,
	[Count] [int] NOT NULL,
	[CityId] [int] NOT NULL
) ON [PRIMARY]
GO
INSERT [dbo].[ModelType] ([Id], [Name], [PTDId], [DescriptionValues]) VALUES (1, N'3200', 1, N'800 mA,1.3'',-,-,-,100 g,Linux,2003,0.1 Mp,-,1 Mb,intel core i7,100 Mhz')
INSERT [dbo].[ModelType] ([Id], [Name], [PTDId], [DescriptionValues]) VALUES (2, N'galaxy a50', 1, N'4200 mA,5.5'',5,802.11 n,jack 3.5,120 g,Android 9.0,2019,16 Mp,12 Mp,8 Gb,Snap Dragon,1400 Mhz')
INSERT [dbo].[ModelType] ([Id], [Name], [PTDId], [DescriptionValues]) VALUES (3, N'p30 lite', 1, N'4000 mA,5'',5,802.11 n,jack 3.5,110 g,Android 11.0,2020,32 Mp,16 Mp,8 Gb,Snap Dragon,1800 Mhz')
INSERT [dbo].[ModelType] ([Id], [Name], [PTDId], [DescriptionValues]) VALUES (4, N'X', 1, N'4000 mA,5.5'',5,802.11 n,jack 3.5,115 g,IOS,2019,40 Mp,20 Mp,4 Gb,Apple A11,2000 Mhz')
INSERT [dbo].[ModelType] ([Id], [Name], [PTDId], [DescriptionValues]) VALUES (5, N'xperia z5', 1, N'2800 mA,4.5'',4.5,802.11 n,jack 3.5,135 g,Android 7.2,2015,40 Mp,8 Mp,2 Gb,Snap Dragon,1000 Mhz')
INSERT [dbo].[ModelType] ([Id], [Name], [PTDId], [DescriptionValues]) VALUES (6, N'Q6', 1, N'3000 mA,5.0'',5,802.11 n,jack 3.5,125g,Android 8.0,2018,12 Mp,6 Mp,2 Gb,intel core i3,1200 Mhz')
GO
INSERT [dbo].[Product] ([Id], [ProductTypeId], [Producer], [ModelTypeId], [Price], [Info]) VALUES (1, 3, N'Nokia', 1, 300.0000, N'Nokia 3200 is global roaming GSM phone, which features EDGE high speed data plus GPRS, HSCSD, voice memos, color display and camera, Java and MMS. The european version has 900mhz support instead of 850mhz.')
INSERT [dbo].[Product] ([Id], [ProductTypeId], [Producer], [ModelTypeId], [Price], [Info]) VALUES (2, 3, N'Sumsung', 2, 500.0000, N'The Samsung Galaxy A50 is a smartphone that was tested with the Android 9 operating system. This model weighs 5.8 ounces, has a 6.4 inch display, 25-megapixel main camera, and 25-megapixel selfie camera. It comes with 4GB of RAM. It was tested with 128GB of storage and has a memory card slot for expanded storage.')
INSERT [dbo].[Product] ([Id], [ProductTypeId], [Producer], [ModelTypeId], [Price], [Info]) VALUES (3, 3, N'Huawei', 3, 400.0000, N'Huawei P30 Lite smartphone was launched in March 2019. The phone comes with a 6.15-inch touchscreen display with a resolution of 1080x2312 pixels at a pixel density of 415 pixels per inch (ppi). It comes with 4GB of RAM. The Huawei P30 Lite runs Android 9 Pie and is powered by a 3340mAh battery. The Huawei P30 Lite supports proprietary fast charging.')
INSERT [dbo].[Product] ([Id], [ProductTypeId], [Producer], [ModelTypeId], [Price], [Info]) VALUES (4, 3, N'iPhone', 4, 1000.0000, N'The iPhone X has two cameras on the rear. One is a 12-megapixel wide-angle camera with f/1.8 aperture, with support for face detection, high dynamic range and optical image stabilization. ... A secondary, telephoto lens features 2× optical zoom and 10× digital zoom with an aperture of f/2.4 and optical image stabilization.Packed with Innovative Features Including a Super Retina Display, TrueDepth Camera System, Face ID and A11 Bionic Chip with Neural Engine')
INSERT [dbo].[Product] ([Id], [ProductTypeId], [Producer], [ModelTypeId], [Price], [Info]) VALUES (5, 3, N'Sony', 5, 400.0000, N'The phone comes with a 5.50-inch touchscreen display with a resolution of 2160x3840 pixels at a pixel density of 806 pixels per inch (ppi). Sony Xperia Z5 Premium Dual is powered by an octa-core Qualcomm Snapdragon 810 processor. It comes with 3GB of RAM.')
INSERT [dbo].[Product] ([Id], [ProductTypeId], [Producer], [ModelTypeId], [Price], [Info]) VALUES (6, 3, N'LG', 6, 500.0000, N'The LG Q6 is a mid-range device from the Korean smartphone maker. ... The Q6 is powered by a Snapdragon 435 which is a octa-core processor clocked at 1.4GHz, and offers decent performance but struggles with heavy games. There is 3GB of RAM and 32GB of storage which is expandable via a dedicated microSD card slot.')
GO
INSERT [dbo].[ProductSet] ([Id], [Name]) VALUES (1, N'TVs, video')
INSERT [dbo].[ProductSet] ([Id], [Name]) VALUES (2, N'Telephones')
INSERT [dbo].[ProductSet] ([Id], [Name]) VALUES (3, N'
XL-appliances')
INSERT [dbo].[ProductSet] ([Id], [Name]) VALUES (4, N'
Home Appliances')
INSERT [dbo].[ProductSet] ([Id], [Name]) VALUES (5, N'
Auto goods')
INSERT [dbo].[ProductSet] ([Id], [Name]) VALUES (6, N'
Computers')
INSERT [dbo].[ProductSet] ([Id], [Name]) VALUES (7, N'Kitchen appliances')
INSERT [dbo].[ProductSet] ([Id], [Name]) VALUES (8, N'Power tools')
INSERT [dbo].[ProductSet] ([Id], [Name]) VALUES (9, N'
Memory cards')
INSERT [dbo].[ProductSet] ([Id], [Name]) VALUES (10, N'Net hardware')
INSERT [dbo].[ProductSet] ([Id], [Name]) VALUES (11, N'eBooks')
INSERT [dbo].[ProductSet] ([Id], [Name]) VALUES (12, N'Smart watch')
GO
INSERT [dbo].[ProductType] ([Id], [Name], [ProductSetId]) VALUES (1, N'Wall', 5)
INSERT [dbo].[ProductType] ([Id], [Name], [ProductSetId]) VALUES (2, N'Chair', 5)
INSERT [dbo].[ProductType] ([Id], [Name], [ProductSetId]) VALUES (3, N'Mobile phones', 2)
INSERT [dbo].[ProductType] ([Id], [Name], [ProductSetId]) VALUES (4, N'Walkie-talkies', 2)
INSERT [dbo].[ProductType] ([Id], [Name], [ProductSetId]) VALUES (5, N'Safety glass', 2)
INSERT [dbo].[ProductType] ([Id], [Name], [ProductSetId]) VALUES (6, N'
Landline phones', 2)
INSERT [dbo].[ProductType] ([Id], [Name], [ProductSetId]) VALUES (7, N'
Сovers', 2)
GO
INSERT [dbo].[ProductTypeDescription] ([Id], [ProductTypeId], [Description]) VALUES (1, 3, N'batary,screen,bluetooth,wi-fi,audio,weight,OS,age,main camera,front camera,RAM,processor,clock rate')
GO
ALTER TABLE [dbo].[Storage] ADD  DEFAULT ((0)) FOR [Count]
GO
ALTER TABLE [dbo].[ModelType]  WITH CHECK ADD  CONSTRAINT [FK_ModelType_ProductTypeDescription] FOREIGN KEY([PTDId])
REFERENCES [dbo].[ProductTypeDescription] ([Id])
GO
ALTER TABLE [dbo].[ModelType] CHECK CONSTRAINT [FK_ModelType_ProductTypeDescription]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ModelType] FOREIGN KEY([ModelTypeId])
REFERENCES [dbo].[ModelType] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ModelType]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductType] FOREIGN KEY([ProductTypeId])
REFERENCES [dbo].[ProductType] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductType]
GO
ALTER TABLE [dbo].[ProductType]  WITH CHECK ADD  CONSTRAINT [FK_ProductType_ProductSet] FOREIGN KEY([ProductSetId])
REFERENCES [dbo].[ProductSet] ([Id])
GO
ALTER TABLE [dbo].[ProductType] CHECK CONSTRAINT [FK_ProductType_ProductSet]
GO
ALTER TABLE [dbo].[ProductTypeDescription]  WITH CHECK ADD  CONSTRAINT [FK_ProductTypeDescription_ProductType] FOREIGN KEY([ProductTypeId])
REFERENCES [dbo].[ProductType] ([Id])
GO
ALTER TABLE [dbo].[ProductTypeDescription] CHECK CONSTRAINT [FK_ProductTypeDescription_ProductType]
GO
ALTER TABLE [dbo].[Storage]  WITH CHECK ADD  CONSTRAINT [FK_Storage_City] FOREIGN KEY([CityId])
REFERENCES [dbo].[City] ([Id])
GO
ALTER TABLE [dbo].[Storage] CHECK CONSTRAINT [FK_Storage_City]
GO
USE [master]
GO
ALTER DATABASE [WebStore.ProductsModel] SET  READ_WRITE 
GO
