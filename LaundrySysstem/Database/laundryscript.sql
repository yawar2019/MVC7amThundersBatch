USE [master]
GO
/****** Object:  Database [LaundryManagmentSystem]    Script Date: 26/03/2021 07:58:13 ******/
CREATE DATABASE [LaundryManagmentSystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LaundryDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\LaundryDb.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'LaundryDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\LaundryDb_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [LaundryManagmentSystem] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LaundryManagmentSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LaundryManagmentSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LaundryManagmentSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LaundryManagmentSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LaundryManagmentSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LaundryManagmentSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [LaundryManagmentSystem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LaundryManagmentSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LaundryManagmentSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LaundryManagmentSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LaundryManagmentSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LaundryManagmentSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LaundryManagmentSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LaundryManagmentSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LaundryManagmentSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LaundryManagmentSystem] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LaundryManagmentSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LaundryManagmentSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LaundryManagmentSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LaundryManagmentSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LaundryManagmentSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LaundryManagmentSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LaundryManagmentSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LaundryManagmentSystem] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [LaundryManagmentSystem] SET  MULTI_USER 
GO
ALTER DATABASE [LaundryManagmentSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LaundryManagmentSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LaundryManagmentSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LaundryManagmentSystem] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [LaundryManagmentSystem] SET DELAYED_DURABILITY = DISABLED 
GO
USE [LaundryManagmentSystem]
GO
/****** Object:  Table [dbo].[tbl_Billing]    Script Date: 26/03/2021 07:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Billing](
	[BillingId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NULL,
	[Products] [varchar](100) NULL,
	[BillDateTime] [datetime] NULL,
	[TotalAmount] [float] NULL,
	[PaidAmount] [float] NULL,
	[DueAmount] [float] NULL,
	[Discount] [float] NOT NULL,
	[BillingStatus] [varchar](25) NULL,
	[DeliveredDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdateBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_tbl_Billing] PRIMARY KEY CLUSTERED 
(
	[BillingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Customer]    Script Date: 26/03/2021 07:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Customer](
	[CustId] [int] IDENTITY(1000,1) NOT NULL,
	[CustName] [varchar](100) NULL,
	[CustMobileNumber] [varchar](20) NULL,
	[CustEmailId] [varchar](50) NULL,
	[CustEntryDate] [date] NULL,
	[CustEntryTime] [time](7) NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_tbl_Customer] PRIMARY KEY CLUSTERED 
(
	[CustId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Employee]    Script Date: 26/03/2021 07:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Employee](
	[EmpId] [int] IDENTITY(1,1) NOT NULL,
	[EmpName] [varchar](50) NULL,
	[EmpRole] [int] NULL,
	[Password] [varchar](50) NULL,
	[EmpDesignation] [varchar](50) NULL,
	[EmpEmail] [varchar](50) NULL,
	[EmpDob] [date] NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_tbl_Employee] PRIMARY KEY CLUSTERED 
(
	[EmpId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Product]    Script Date: 26/03/2021 07:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [varchar](50) NULL,
	[PGroupId] [varchar](50) NULL,
	[Description] [varchar](250) NULL,
	[Price] [float] NULL,
	[PriceRateType] [nchar](10) NULL,
	[LocalName] [nvarchar](250) NULL,
	[Status] [bit] NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_tbl_Product] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblGroup]    Script Date: 26/03/2021 07:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblGroup](
	[GroupId] [int] IDENTITY(1,1) NOT NULL,
	[GroupName] [nvarchar](50) NULL,
	[IsActive] [bit] NULL CONSTRAINT [DF_Group_IsActive]  DEFAULT ((0)),
	[Code] [nvarchar](50) NULL,
	[ColorCode] [nvarchar](50) NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_Group] PRIMARY KEY CLUSTERED 
(
	[GroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblProductGroup]    Script Date: 26/03/2021 07:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblProductGroup](
	[productgrpId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NULL,
	[PItemId] [int] NULL,
	[ProductName] [varchar](50) NULL,
	[PitemName] [varchar](50) NULL,
	[ProductPrice] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[productgrpId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Employee] ON 

INSERT [dbo].[tbl_Employee] ([EmpId], [EmpName], [EmpRole], [Password], [EmpDesignation], [EmpEmail], [EmpDob], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1, N'Admin', 1, N'Admin', N'Admin', N'Admin@gmail.com', NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[tbl_Employee] OFF
SET IDENTITY_INSERT [dbo].[tbl_Product] ON 

INSERT [dbo].[tbl_Product] ([ProductId], [ProductName], [PGroupId], [Description], [Price], [PriceRateType], [LocalName], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1, N'Shirt', N'1,2', N'Plain Shirt', 2000, N'Fixed     ', N'قميص', 1, 1, CAST(N'2020-02-12 00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[tbl_Product] ([ProductId], [ProductName], [PGroupId], [Description], [Price], [PriceRateType], [LocalName], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (2, N'Jeans', N'1,3', N'Style Jeans', 3000, N'Variable  ', N'جينز', 0, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[tbl_Product] OFF
SET IDENTITY_INSERT [dbo].[tblGroup] ON 

INSERT [dbo].[tblGroup] ([GroupId], [GroupName], [IsActive], [Code], [ColorCode], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (1, N'Dry Cleaner', 0, N'DC', N'#d21e1e', 1, 1, NULL, CAST(N'2020-11-22 22:56:29.210' AS DateTime))
INSERT [dbo].[tblGroup] ([GroupId], [GroupName], [IsActive], [Code], [ColorCode], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (6, N'Washing', 1, N'WC', N'Green', 1, 1, CAST(N'2020-11-17 20:46:00.547' AS DateTime), CAST(N'2020-11-17 20:46:00.547' AS DateTime))
INSERT [dbo].[tblGroup] ([GroupId], [GroupName], [IsActive], [Code], [ColorCode], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (7, N'Washing Express', 0, N'WEX', N'blue', 1, 1, CAST(N'2020-11-17 20:58:24.217' AS DateTime), CAST(N'2020-11-17 20:58:24.217' AS DateTime))
INSERT [dbo].[tblGroup] ([GroupId], [GroupName], [IsActive], [Code], [ColorCode], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (1002, N'IRon', 0, N'IR', N'#36d372', 1, 1, CAST(N'2020-11-19 12:17:08.780' AS DateTime), CAST(N'2020-11-22 05:23:37.750' AS DateTime))
INSERT [dbo].[tblGroup] ([GroupId], [GroupName], [IsActive], [Code], [ColorCode], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (1003, N'IRon', 1, N'IR', N'blue', 1, 1, CAST(N'2020-11-19 12:17:19.060' AS DateTime), CAST(N'2020-11-19 12:17:19.060' AS DateTime))
INSERT [dbo].[tblGroup] ([GroupId], [GroupName], [IsActive], [Code], [ColorCode], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (1004, N'Washing', 0, N'IR', N'blue', 1, 1, CAST(N'2020-11-19 12:18:17.307' AS DateTime), CAST(N'2020-11-19 12:18:17.307' AS DateTime))
INSERT [dbo].[tblGroup] ([GroupId], [GroupName], [IsActive], [Code], [ColorCode], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (1005, N'Washing Express', 0, N'WC', N'blue', 1, 1, CAST(N'2020-11-19 12:20:05.563' AS DateTime), CAST(N'2020-11-19 12:20:05.563' AS DateTime))
INSERT [dbo].[tblGroup] ([GroupId], [GroupName], [IsActive], [Code], [ColorCode], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (1006, N'Washing', 1, N'WC', N'blue', 1, 1, CAST(N'2020-11-19 12:27:10.120' AS DateTime), CAST(N'2020-11-19 12:27:10.120' AS DateTime))
INSERT [dbo].[tblGroup] ([GroupId], [GroupName], [IsActive], [Code], [ColorCode], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (1007, N'Washing', 0, N'test', N'blue', 1, 1, CAST(N'2020-11-19 13:21:53.100' AS DateTime), CAST(N'2020-11-19 13:21:53.100' AS DateTime))
INSERT [dbo].[tblGroup] ([GroupId], [GroupName], [IsActive], [Code], [ColorCode], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (1008, N'Washing', 0, N'WCqw', N'blue', 1, 1, CAST(N'2020-11-19 13:33:42.157' AS DateTime), CAST(N'2020-11-19 13:33:42.157' AS DateTime))
INSERT [dbo].[tblGroup] ([GroupId], [GroupName], [IsActive], [Code], [ColorCode], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (1009, N'Pavan shirt', 0, N'asf', N'#ca2f2f', 1, 1, CAST(N'2020-11-19 14:11:06.917' AS DateTime), CAST(N'2020-11-22 22:55:59.470' AS DateTime))
INSERT [dbo].[tblGroup] ([GroupId], [GroupName], [IsActive], [Code], [ColorCode], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (1010, N'IRon', 0, N'IR', N'blue', 1, 1, CAST(N'2020-11-19 14:11:25.397' AS DateTime), CAST(N'2020-11-19 14:11:25.397' AS DateTime))
SET IDENTITY_INSERT [dbo].[tblGroup] OFF
SET IDENTITY_INSERT [dbo].[tblProductGroup] ON 

INSERT [dbo].[tblProductGroup] ([productgrpId], [ProductId], [PItemId], [ProductName], [PitemName], [ProductPrice]) VALUES (1, 1, 1, N'shirt', N'DC', 100)
INSERT [dbo].[tblProductGroup] ([productgrpId], [ProductId], [PItemId], [ProductName], [PitemName], [ProductPrice]) VALUES (2, 1, 2, N'shirt', N'IRon', 100)
INSERT [dbo].[tblProductGroup] ([productgrpId], [ProductId], [PItemId], [ProductName], [PitemName], [ProductPrice]) VALUES (3, 2, 1, N'jeans', N'DC', 200)
INSERT [dbo].[tblProductGroup] ([productgrpId], [ProductId], [PItemId], [ProductName], [PitemName], [ProductPrice]) VALUES (4, 3, 1, N'trouser', N'DC', 400)
INSERT [dbo].[tblProductGroup] ([productgrpId], [ProductId], [PItemId], [ProductName], [PitemName], [ProductPrice]) VALUES (5, 3, 2, N'trouser', N'IRon', 400)
SET IDENTITY_INSERT [dbo].[tblProductGroup] OFF
ALTER TABLE [dbo].[tbl_Customer] ADD  CONSTRAINT [DF_tbl_Customer_CustEntryDate]  DEFAULT (getdate()) FOR [CustEntryDate]
GO
ALTER TABLE [dbo].[tbl_Customer] ADD  CONSTRAINT [DF_tbl_Customer_CustEntryTime]  DEFAULT (getdate()) FOR [CustEntryTime]
GO
/****** Object:  StoredProcedure [dbo].[GetProduct]    Script Date: 26/03/2021 07:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[GetProduct]
 AS
 BEGIN
 SELECT * FROM (
  SELECT
    ProductName,
    PitemName,
    ProductPrice
  FROM tblProductGroup 
  
) StudentResults
PIVOT (
  SUM([ProductPrice])
  FOR [PItemName]
  IN ( [WC],[DC],[IRon])
) AS PivotTable

END
GO
/****** Object:  StoredProcedure [dbo].[sp_AddBilling]    Script Date: 26/03/2021 07:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_AddBilling]
@CustomerId int,
@Products varchar(100),
@TotalAmount float,
@PaidAmount float,
@DueAmount float,
@Discount float,
@BillingStatus varchar(25),
@CreatedBy int,
@UpdateBy int,
@DeliveredDate datetime
AS
BEGIN

	INSERT INTO tbl_Billing
		(CustomerId,
		 Products,	 
		 TotalAmount,
		 PaidAmount,
		 DueAmount,
		 Discount,
		 BillingStatus,
		 CreatedBy,
		 UpdateBy,
		 DeliveredDate)
	 VALUES
		(@CustomerId,
		 @Products,	 
		 @TotalAmount,
		 @PaidAmount,
		 @DueAmount,
		 @Discount,
		 @BillingStatus,
		 @CreatedBy,
		 @UpdateBy,
		 @DeliveredDate)
END

GO
/****** Object:  StoredProcedure [dbo].[sp_AddCustomer]    Script Date: 26/03/2021 07:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_AddCustomer]
@CustName varchar(100),
@CustMobileNumber varchar(20),
@CustEmailId varchar(50)
as
begin
	insert into tbl_Customer (CustName, CustMobileNumber, CustEmailId) 
	values (@CustName, @CustMobileNumber, @CustEmailId )
end

GO
/****** Object:  StoredProcedure [dbo].[sp_AddProduct]    Script Date: 26/03/2021 07:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_AddProduct]
@ProductName varchar(50),
@PGroupId int,
@Description varchar(250),
@Price float,
@Status bit,
@CreatedBy int,
@UpdatedBy int
AS
BEGIN
	INSERT INTO tbl_Product (ProductName,PGroupId,Description,Price,Status,CreatedBy,CreatedDate,UpdatedBy,UpdatedDate)  
	VALUES (@ProductName, @PGroupId, @Description, @Price, @Status,@CreatedBy,GETDATE(),@UpdatedBy,getdate())
END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllBillings]    Script Date: 26/03/2021 07:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_GetAllBillings]
AS
BEGIN
	SELECT  BillingId,
			CustomerId,
			Products,
			BillDateTime,
			TotalAmount,
			PaidAmount,
			DueAmount,
			Discount,
			BillingStatus,
			CreatedBy,
			UpdateBy,
			DeliveredDate
	
	FROM	tbl_Billing		
END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllCustomers]    Script Date: 26/03/2021 07:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_GetAllCustomers]
AS
BEGIN
	SELECT CustId, CustName, CustMobileNumber, CustEmailId, CustEntryDate, CustEntryTime
	FROM tbl_Customer;
END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllProducts]    Script Date: 26/03/2021 07:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_GetAllProducts]
AS
BEGIN
	SELECT ProductId, ProductName, PGroupId, Description, Price, Status
	FROM tbl_Product;
END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetBilling]    Script Date: 26/03/2021 07:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_GetBilling]
@BillingId int
AS
BEGIN
	SELECT  BillingId,
			CustomerId,
			Products,
			BillDateTime,
			TotalAmount,
			PaidAmount,
			DueAmount,
			Discount,
			BillingStatus,
			CreatedBy,
			UpdateBy,
			DeliveredDate
	
	FROM	tbl_Billing
	WHERE	BillingId = @BillingId;			
END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetCustomer]    Script Date: 26/03/2021 07:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_GetCustomer]
@CustMobileNumber varchar(20)
AS
BEGIN
	SELECT CustId,
	       CustName,
		   CustMobileNumber,
		   CustEmailId,
		   CustEntryDate,
		   CustEntryTime 
	FROM tbl_Customer
	WHERE CustMobileNumber = @CustMobileNumber;	
END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetProductById]    Script Date: 26/03/2021 07:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_GetProductById]
@ProductId int
AS
BEGIN
	SELECT ProductId, ProductName, PGroupId, Description, Price, Status
	FROM tbl_Product where ProductId = @ProductId;
END

GO
/****** Object:  StoredProcedure [dbo].[sp_InsertlndryGroup]    Script Date: 26/03/2021 07:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[sp_InsertlndryGroup]
      (@GroupName nvarchar(50),
	  @Code   nvarchar(50),
	  @ColorCode nvarchar(50),
	  @IsActive  bit,
	  @CreatedBy int,
	  @UpdatedBy int)
AS
BEGIN
Insert into  [dbo].[tblGroup]
      ([GroupName]
      ,[Code]
      ,[ColorCode]
	   ,[IsActive]
      ,[CreatedBy]
      ,[UpdatedBy]
      ,[CreatedOn]
      ,[UpdatedOn]
	  )
	  values(

     @GroupName,
	 @Code,   
	 @ColorCode,
	 @IsActive,
	 @CreatedBy,
	 @UpdatedBy,
	 GETDATE(),
	 GETDATE())

END
GO
/****** Object:  StoredProcedure [dbo].[sp_lndryDeleteGroupById]    Script Date: 26/03/2021 07:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[sp_lndryDeleteGroupById]
 @GroupId int
,@CreatedBy  int
,@UpdatedBy int
AS
BEGIN
DELETE from [dbo].[tblGroup]
       
     where GroupId=@GroupId

END
GO
/****** Object:  StoredProcedure [dbo].[sp_lndryGroup]    Script Date: 26/03/2021 07:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[sp_lndryGroup]
AS
BEGIN
SELECT [GroupId]
      ,[GroupName]
      ,[IsActive]
      ,[Code]
      ,[ColorCode]
      ,[CreatedBy]
      ,[UpdatedBy]
      ,[CreatedOn]
      ,[UpdatedOn]
  FROM [dbo].[tblGroup]

END
GO
/****** Object:  StoredProcedure [dbo].[sp_lndryGroupById]    Script Date: 26/03/2021 07:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[sp_lndryGroupById]
@GroupId int
AS
BEGIN
SELECT [GroupId]
      ,[GroupName]
      ,[IsActive]
      ,[Code]
      ,[ColorCode]
      ,[CreatedBy]
      ,[UpdatedBy]
      ,[CreatedOn]
      ,[UpdatedOn]
  FROM [dbo].[tblGroup] where GroupId=@GroupId

END
GO
/****** Object:  StoredProcedure [dbo].[sp_lndryUpdateGroupById]    Script Date: 26/03/2021 07:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[sp_lndryUpdateGroupById]
@GroupId int
,@GroupName varchar(50)
,@IsActive  bit
,@Code varchar(50)
,@ColorCode varchar(50)
,@CreatedBy  int
,@UpdatedBy int
AS
BEGIN
Update [dbo].[tblGroup]
      set GroupName=@GroupName
      ,IsActive=@IsActive
      ,Code=@Code
      ,ColorCode=@ColorCode
      ,UpdatedBy=@UpdatedBy
      ,UpdatedOn=getdate()
     where GroupId=@GroupId

END
GO
USE [master]
GO
ALTER DATABASE [LaundryManagmentSystem] SET  READ_WRITE 
GO
