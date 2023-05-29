/*
 Navicat Premium Data Transfer

 Source Server         : AWS
 Source Server Type    : SQL Server
 Source Server Version : 14003451 (14.00.3451)
 Source Host           : web-security.cavbb1j8mm0m.us-east-1.rds.amazonaws.com:1433
 Source Catalog        : ECOM12
 Source Schema         : dbo

 Target Server Type    : SQL Server
 Target Server Version : 14003451 (14.00.3451)
 File Encoding         : 65001

 Date: 27/05/2023 13:55:01
*/


-- ----------------------------
-- Table structure for caritem
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[caritem]') AND type IN ('U'))
	DROP TABLE [dbo].[caritem]
GO

CREATE TABLE [dbo].[caritem] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [count] int  NULL,
  [createat] date  NULL,
  [updateat] date  NULL,
  [cartid] int  NULL,
  [productid] int  NULL
)
GO

ALTER TABLE [dbo].[caritem] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of caritem
-- ----------------------------
SET IDENTITY_INSERT [dbo].[caritem] ON
GO

INSERT INTO [dbo].[caritem] ([id], [count], [createat], [updateat], [cartid], [productid]) VALUES (N'1', N'3', N'2022-08-03', N'2022-06-18', N'1', N'1')
GO

INSERT INTO [dbo].[caritem] ([id], [count], [createat], [updateat], [cartid], [productid]) VALUES (N'2', N'2', N'2022-05-30', N'2022-02-21', N'1', N'1')
GO

INSERT INTO [dbo].[caritem] ([id], [count], [createat], [updateat], [cartid], [productid]) VALUES (N'3', N'2', N'2022-08-03', N'2022-05-29', N'1', N'1')
GO

INSERT INTO [dbo].[caritem] ([id], [count], [createat], [updateat], [cartid], [productid]) VALUES (N'4', N'2', N'2022-03-24', N'2022-10-25', N'1', N'1')
GO

INSERT INTO [dbo].[caritem] ([id], [count], [createat], [updateat], [cartid], [productid]) VALUES (N'5', N'2', N'2022-05-18', N'2022-04-25', N'1', N'1')
GO

INSERT INTO [dbo].[caritem] ([id], [count], [createat], [updateat], [cartid], [productid]) VALUES (N'67', N'1', N'2023-05-25', N'2023-05-25', N'75', N'16')
GO

INSERT INTO [dbo].[caritem] ([id], [count], [createat], [updateat], [cartid], [productid]) VALUES (N'59', N'1', N'2023-04-25', N'2023-04-25', N'3', N'5')
GO

SET IDENTITY_INSERT [dbo].[caritem] OFF
GO


-- ----------------------------
-- Table structure for cart
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[cart]') AND type IN ('U'))
	DROP TABLE [dbo].[cart]
GO

CREATE TABLE [dbo].[cart] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [createat] date  NULL,
  [updateat] date  NULL,
  [storeid] int  NULL,
  [userid] int  NULL
)
GO

ALTER TABLE [dbo].[cart] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of cart
-- ----------------------------
SET IDENTITY_INSERT [dbo].[cart] ON
GO

INSERT INTO [dbo].[cart] ([id], [createat], [updateat], [storeid], [userid]) VALUES (N'1', N'2022-11-21', N'2022-07-15', N'2', N'1')
GO

INSERT INTO [dbo].[cart] ([id], [createat], [updateat], [storeid], [userid]) VALUES (N'2', N'2022-01-04', N'2022-05-01', N'2', N'2')
GO

INSERT INTO [dbo].[cart] ([id], [createat], [updateat], [storeid], [userid]) VALUES (N'3', N'2022-01-14', N'2022-07-09', N'3', N'3')
GO

INSERT INTO [dbo].[cart] ([id], [createat], [updateat], [storeid], [userid]) VALUES (N'4', N'2022-06-12', N'2022-08-05', N'4', N'4')
GO

INSERT INTO [dbo].[cart] ([id], [createat], [updateat], [storeid], [userid]) VALUES (N'5', N'2022-02-28', N'2022-10-01', N'5', N'5')
GO

INSERT INTO [dbo].[cart] ([id], [createat], [updateat], [storeid], [userid]) VALUES (N'6', N'2022-11-21', N'2022-07-15', N'2', N'1')
GO

INSERT INTO [dbo].[cart] ([id], [createat], [updateat], [storeid], [userid]) VALUES (N'7', N'2022-01-04', N'2022-05-01', N'2', N'2')
GO

INSERT INTO [dbo].[cart] ([id], [createat], [updateat], [storeid], [userid]) VALUES (N'8', N'2022-01-14', N'2022-07-09', N'3', N'3')
GO

INSERT INTO [dbo].[cart] ([id], [createat], [updateat], [storeid], [userid]) VALUES (N'9', N'2022-06-12', N'2022-08-05', N'4', N'4')
GO

INSERT INTO [dbo].[cart] ([id], [createat], [updateat], [storeid], [userid]) VALUES (N'10', N'2022-02-28', N'2022-10-01', N'5', N'5')
GO

INSERT INTO [dbo].[cart] ([id], [createat], [updateat], [storeid], [userid]) VALUES (N'71', N'2023-04-27', N'2023-04-27', NULL, N'258')
GO

INSERT INTO [dbo].[cart] ([id], [createat], [updateat], [storeid], [userid]) VALUES (N'73', N'2023-05-25', N'2023-05-25', NULL, N'260')
GO

INSERT INTO [dbo].[cart] ([id], [createat], [updateat], [storeid], [userid]) VALUES (N'74', N'2023-05-25', N'2023-05-25', NULL, N'261')
GO

INSERT INTO [dbo].[cart] ([id], [createat], [updateat], [storeid], [userid]) VALUES (N'77', N'2023-05-25', N'2023-05-25', NULL, N'301')
GO

INSERT INTO [dbo].[cart] ([id], [createat], [updateat], [storeid], [userid]) VALUES (N'78', N'2023-05-25', N'2023-05-25', NULL, N'318')
GO

INSERT INTO [dbo].[cart] ([id], [createat], [updateat], [storeid], [userid]) VALUES (N'80', N'2023-05-25', N'2023-05-25', NULL, N'329')
GO

INSERT INTO [dbo].[cart] ([id], [createat], [updateat], [storeid], [userid]) VALUES (N'82', N'2023-05-25', N'2023-05-25', NULL, N'349')
GO

INSERT INTO [dbo].[cart] ([id], [createat], [updateat], [storeid], [userid]) VALUES (N'84', N'2023-05-25', N'2023-05-25', NULL, N'357')
GO

INSERT INTO [dbo].[cart] ([id], [createat], [updateat], [storeid], [userid]) VALUES (N'85', N'2023-05-25', N'2023-05-25', NULL, N'364')
GO

INSERT INTO [dbo].[cart] ([id], [createat], [updateat], [storeid], [userid]) VALUES (N'87', N'2023-05-25', N'2023-05-25', NULL, N'460')
GO

INSERT INTO [dbo].[cart] ([id], [createat], [updateat], [storeid], [userid]) VALUES (N'88', N'2023-05-25', N'2023-05-25', NULL, N'461')
GO

INSERT INTO [dbo].[cart] ([id], [createat], [updateat], [storeid], [userid]) VALUES (N'72', N'2023-05-01', N'2023-05-01', NULL, N'259')
GO

INSERT INTO [dbo].[cart] ([id], [createat], [updateat], [storeid], [userid]) VALUES (N'75', N'2023-05-25', N'2023-05-25', NULL, N'266')
GO

INSERT INTO [dbo].[cart] ([id], [createat], [updateat], [storeid], [userid]) VALUES (N'76', N'2023-05-25', N'2023-05-25', NULL, N'269')
GO

INSERT INTO [dbo].[cart] ([id], [createat], [updateat], [storeid], [userid]) VALUES (N'79', N'2023-05-25', N'2023-05-25', NULL, N'324')
GO

INSERT INTO [dbo].[cart] ([id], [createat], [updateat], [storeid], [userid]) VALUES (N'81', N'2023-05-25', N'2023-05-25', NULL, N'344')
GO

INSERT INTO [dbo].[cart] ([id], [createat], [updateat], [storeid], [userid]) VALUES (N'83', N'2023-05-25', N'2023-05-25', NULL, N'354')
GO

INSERT INTO [dbo].[cart] ([id], [createat], [updateat], [storeid], [userid]) VALUES (N'86', N'2023-05-25', N'2023-05-25', NULL, N'459')
GO

SET IDENTITY_INSERT [dbo].[cart] OFF
GO


-- ----------------------------
-- Table structure for category
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[category]') AND type IN ('U'))
	DROP TABLE [dbo].[category]
GO

CREATE TABLE [dbo].[category] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [createat] date  NULL,
  [image] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [isdeleted] bit  NULL,
  [name] nvarchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [updateat] date  NULL
)
GO

ALTER TABLE [dbo].[category] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of category
-- ----------------------------
SET IDENTITY_INSERT [dbo].[category] ON
GO

INSERT INTO [dbo].[category] ([id], [createat], [image], [isdeleted], [name], [updateat]) VALUES (N'1', N'2023-04-25', N'https://res.cloudinary.com/djzwxw0ao/image/upload/v1682360919/hf5h8dkk2scajdmgts4o.png', N'1', N'Iamalele Airport', N'2023-04-25')
GO

INSERT INTO [dbo].[category] ([id], [createat], [image], [isdeleted], [name], [updateat]) VALUES (N'2', N'2022-05-06', N'gallery-01.jpg', N'1', N'Jaime Gonzalez Airport', N'2022-11-26')
GO

INSERT INTO [dbo].[category] ([id], [createat], [image], [isdeleted], [name], [updateat]) VALUES (N'3', N'2022-06-26', N'gallery-04.jpg', N'1', N'Allen Army Airfield', N'2022-05-15')
GO

INSERT INTO [dbo].[category] ([id], [createat], [image], [isdeleted], [name], [updateat]) VALUES (N'4', N'2022-07-02', N'gallery-03.jpg', N'1', N'Kokonau Airport', N'2022-01-25')
GO

INSERT INTO [dbo].[category] ([id], [createat], [image], [isdeleted], [name], [updateat]) VALUES (N'5', N'2022-08-11', N'gallery-01.jpg', N'1', N'Margaret River Airport', N'2022-11-21')
GO

INSERT INTO [dbo].[category] ([id], [createat], [image], [isdeleted], [name], [updateat]) VALUES (N'6', N'2022-03-31', N'gallery-02.jpg', N'1', N'St Mary''s Airport', N'2022-03-05')
GO

SET IDENTITY_INSERT [dbo].[category] OFF
GO


-- ----------------------------
-- Table structure for delivery
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[delivery]') AND type IN ('U'))
	DROP TABLE [dbo].[delivery]
GO

CREATE TABLE [dbo].[delivery] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [createat] date  NULL,
  [desciption] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [isdeleted] bit  NULL,
  [name] nvarchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [price] float(53)  NULL,
  [updateat] date  NULL
)
GO

ALTER TABLE [dbo].[delivery] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of delivery
-- ----------------------------
SET IDENTITY_INSERT [dbo].[delivery] ON
GO

INSERT INTO [dbo].[delivery] ([id], [createat], [desciption], [isdeleted], [name], [price], [updateat]) VALUES (N'1', N'2022-11-04', N'Giao Hàng Nhanh Trong 2G', N'0', N'JumpXS', N'17', N'2022-09-01')
GO

INSERT INTO [dbo].[delivery] ([id], [createat], [desciption], [isdeleted], [name], [price], [updateat]) VALUES (N'2', N'2022-04-27', N'Giao Hàng Nhanh Trong 2G', N'0', N'Quinu', N'4', N'2022-11-14')
GO

INSERT INTO [dbo].[delivery] ([id], [createat], [desciption], [isdeleted], [name], [price], [updateat]) VALUES (N'3', N'2022-10-05', N'Giao Hàng Nhanh Trong 2G', N'0', N'Edgewire', N'49', N'2022-03-31')
GO

INSERT INTO [dbo].[delivery] ([id], [createat], [desciption], [isdeleted], [name], [price], [updateat]) VALUES (N'4', N'2022-01-08', N'Giao Hàng Nhanh Trong 2G', N'0', N'Katz', N'80', N'2022-06-29')
GO

INSERT INTO [dbo].[delivery] ([id], [createat], [desciption], [isdeleted], [name], [price], [updateat]) VALUES (N'5', N'2022-06-30', N'Giao Hàng Nhanh Trong 2G', N'0', N'Twitternation', N'52', N'2022-02-20')
GO

SET IDENTITY_INSERT [dbo].[delivery] OFF
GO


-- ----------------------------
-- Table structure for filter
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[filter]') AND type IN ('U'))
	DROP TABLE [dbo].[filter]
GO

CREATE TABLE [dbo].[filter] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [timelogin] date  NULL,
  [userid] int  NULL
)
GO

ALTER TABLE [dbo].[filter] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of filter
-- ----------------------------
SET IDENTITY_INSERT [dbo].[filter] ON
GO

INSERT INTO [dbo].[filter] ([id], [timelogin], [userid]) VALUES (N'508', N'2023-04-24', N'2')
GO

INSERT INTO [dbo].[filter] ([id], [timelogin], [userid]) VALUES (N'509', N'2023-04-24', N'2')
GO

INSERT INTO [dbo].[filter] ([id], [timelogin], [userid]) VALUES (N'510', N'2023-04-25', N'3')
GO

INSERT INTO [dbo].[filter] ([id], [timelogin], [userid]) VALUES (N'511', N'2023-04-25', N'2')
GO

INSERT INTO [dbo].[filter] ([id], [timelogin], [userid]) VALUES (N'557', N'2023-05-25', N'269')
GO

INSERT INTO [dbo].[filter] ([id], [timelogin], [userid]) VALUES (N'558', N'2023-05-25', N'269')
GO

INSERT INTO [dbo].[filter] ([id], [timelogin], [userid]) VALUES (N'559', N'2023-05-25', N'266')
GO

INSERT INTO [dbo].[filter] ([id], [timelogin], [userid]) VALUES (N'560', N'2023-05-25', N'269')
GO

INSERT INTO [dbo].[filter] ([id], [timelogin], [userid]) VALUES (N'561', N'2023-05-25', N'266')
GO

INSERT INTO [dbo].[filter] ([id], [timelogin], [userid]) VALUES (N'562', N'2023-05-25', N'266')
GO

INSERT INTO [dbo].[filter] ([id], [timelogin], [userid]) VALUES (N'563', N'2023-05-25', N'266')
GO

INSERT INTO [dbo].[filter] ([id], [timelogin], [userid]) VALUES (N'564', N'2023-05-25', N'266')
GO

INSERT INTO [dbo].[filter] ([id], [timelogin], [userid]) VALUES (N'565', N'2023-05-25', N'258')
GO

INSERT INTO [dbo].[filter] ([id], [timelogin], [userid]) VALUES (N'566', N'2023-05-25', N'258')
GO

INSERT INTO [dbo].[filter] ([id], [timelogin], [userid]) VALUES (N'567', N'2023-05-25', N'258')
GO

INSERT INTO [dbo].[filter] ([id], [timelogin], [userid]) VALUES (N'568', N'2023-05-25', N'258')
GO

INSERT INTO [dbo].[filter] ([id], [timelogin], [userid]) VALUES (N'569', N'2023-05-25', N'258')
GO

INSERT INTO [dbo].[filter] ([id], [timelogin], [userid]) VALUES (N'570', N'2023-05-25', N'258')
GO

INSERT INTO [dbo].[filter] ([id], [timelogin], [userid]) VALUES (N'571', N'2023-05-25', N'258')
GO

INSERT INTO [dbo].[filter] ([id], [timelogin], [userid]) VALUES (N'572', N'2023-05-25', N'258')
GO

INSERT INTO [dbo].[filter] ([id], [timelogin], [userid]) VALUES (N'573', N'2023-05-25', N'258')
GO

INSERT INTO [dbo].[filter] ([id], [timelogin], [userid]) VALUES (N'574', N'2023-05-25', N'258')
GO

INSERT INTO [dbo].[filter] ([id], [timelogin], [userid]) VALUES (N'575', N'2023-05-27', N'266')
GO

INSERT INTO [dbo].[filter] ([id], [timelogin], [userid]) VALUES (N'576', N'2023-05-27', N'266')
GO

INSERT INTO [dbo].[filter] ([id], [timelogin], [userid]) VALUES (N'577', N'2023-05-27', N'266')
GO

INSERT INTO [dbo].[filter] ([id], [timelogin], [userid]) VALUES (N'578', N'2023-05-27', N'266')
GO

SET IDENTITY_INSERT [dbo].[filter] OFF
GO


-- ----------------------------
-- Table structure for orderitem
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[orderitem]') AND type IN ('U'))
	DROP TABLE [dbo].[orderitem]
GO

CREATE TABLE [dbo].[orderitem] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [count] int  NULL,
  [createat] date  NULL,
  [updateat] date  NULL,
  [orderid] int  NULL,
  [productid] int  NULL
)
GO

ALTER TABLE [dbo].[orderitem] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of orderitem
-- ----------------------------
SET IDENTITY_INSERT [dbo].[orderitem] ON
GO

INSERT INTO [dbo].[orderitem] ([id], [count], [createat], [updateat], [orderid], [productid]) VALUES (N'1', N'1', N'2023-04-25', N'2023-04-25', N'11', N'2')
GO

INSERT INTO [dbo].[orderitem] ([id], [count], [createat], [updateat], [orderid], [productid]) VALUES (N'2', N'1', N'2023-04-25', N'2023-04-25', N'12', N'4')
GO

INSERT INTO [dbo].[orderitem] ([id], [count], [createat], [updateat], [orderid], [productid]) VALUES (N'3', N'1', N'2023-04-26', N'2023-04-26', N'13', N'15')
GO

INSERT INTO [dbo].[orderitem] ([id], [count], [createat], [updateat], [orderid], [productid]) VALUES (N'4', N'1', N'2023-04-26', N'2023-04-26', N'13', N'1')
GO

INSERT INTO [dbo].[orderitem] ([id], [count], [createat], [updateat], [orderid], [productid]) VALUES (N'5', N'1', N'2023-04-26', N'2023-04-26', N'13', N'9')
GO

INSERT INTO [dbo].[orderitem] ([id], [count], [createat], [updateat], [orderid], [productid]) VALUES (N'6', N'1', N'2023-05-25', N'2023-05-25', N'14', N'2')
GO

INSERT INTO [dbo].[orderitem] ([id], [count], [createat], [updateat], [orderid], [productid]) VALUES (N'7', N'1', N'2023-05-25', N'2023-05-25', N'15', N'19')
GO

SET IDENTITY_INSERT [dbo].[orderitem] OFF
GO


-- ----------------------------
-- Table structure for orders
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[orders]') AND type IN ('U'))
	DROP TABLE [dbo].[orders]
GO

CREATE TABLE [dbo].[orders] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [address] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [createat] date  NULL,
  [isactive] bit  NULL,
  [phone] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [price] float(53)  NULL,
  [status] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [updateat] date  NULL,
  [deliveryid] int  NULL,
  [storeid] int  NULL,
  [userid] int  NULL
)
GO

ALTER TABLE [dbo].[orders] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of orders
-- ----------------------------
SET IDENTITY_INSERT [dbo].[orders] ON
GO

INSERT INTO [dbo].[orders] ([id], [address], [createat], [isactive], [phone], [price], [status], [updateat], [deliveryid], [storeid], [userid]) VALUES (N'11', N'Vân Trình, xã Phong Bình, huy?n phong di?n, t?nh Th?a Thiên Hu?', N'2023-04-25', N'1', N'0982238302', N'317', N'1', N'2023-04-25', N'1', N'3', N'3')
GO

INSERT INTO [dbo].[orders] ([id], [address], [createat], [isactive], [phone], [price], [status], [updateat], [deliveryid], [storeid], [userid]) VALUES (N'12', N'Alola', N'2023-04-25', N'1', N'0982238302', N'1187', N'1', N'2023-04-25', N'1', N'3', N'3')
GO

INSERT INTO [dbo].[orders] ([id], [address], [createat], [isactive], [phone], [price], [status], [updateat], [deliveryid], [storeid], [userid]) VALUES (N'13', N'thu duc city', N'2023-04-26', N'1', N'1234567890', N'4357', N'1', N'2023-04-26', N'3', N'2', N'2')
GO

INSERT INTO [dbo].[orders] ([id], [address], [createat], [isactive], [phone], [price], [status], [updateat], [deliveryid], [storeid], [userid]) VALUES (N'14', NULL, N'2023-05-25', N'1', NULL, N'317', N'1', N'2023-05-25', N'1', NULL, N'266')
GO

INSERT INTO [dbo].[orders] ([id], [address], [createat], [isactive], [phone], [price], [status], [updateat], [deliveryid], [storeid], [userid]) VALUES (N'15', N'Huy?n Mang Yang', N'2023-05-25', N'1', N'0925058597', N'1025', N'1', N'2023-05-25', N'2', NULL, N'266')
GO

INSERT INTO [dbo].[orders] ([id], [address], [createat], [isactive], [phone], [price], [status], [updateat], [deliveryid], [storeid], [userid]) VALUES (N'16', N'c:/Windows/system.ini', N'2023-05-25', N'1', N'9999999999', N'4', N'1', N'2023-05-25', N'2', NULL, N'258')
GO

INSERT INTO [dbo].[orders] ([id], [address], [createat], [isactive], [phone], [price], [status], [updateat], [deliveryid], [storeid], [userid]) VALUES (N'17', N'../../../../../../../../../../../../../../../../Windows/system.ini', N'2023-05-25', N'1', N'9999999999', N'4', N'1', N'2023-05-25', N'2', NULL, N'258')
GO

INSERT INTO [dbo].[orders] ([id], [address], [createat], [isactive], [phone], [price], [status], [updateat], [deliveryid], [storeid], [userid]) VALUES (N'18', N'c:\Windows\system.ini', N'2023-05-25', N'1', N'9999999999', N'4', N'1', N'2023-05-25', N'2', NULL, N'258')
GO

INSERT INTO [dbo].[orders] ([id], [address], [createat], [isactive], [phone], [price], [status], [updateat], [deliveryid], [storeid], [userid]) VALUES (N'19', N'..\..\..\..\..\..\..\..\..\..\..\..\..\..\..\..\Windows\system.ini', N'2023-05-25', N'1', N'9999999999', N'4', N'1', N'2023-05-25', N'2', NULL, N'258')
GO

INSERT INTO [dbo].[orders] ([id], [address], [createat], [isactive], [phone], [price], [status], [updateat], [deliveryid], [storeid], [userid]) VALUES (N'20', N'/etc/passwd', N'2023-05-25', N'1', N'9999999999', N'4', N'1', N'2023-05-25', N'2', NULL, N'258')
GO

INSERT INTO [dbo].[orders] ([id], [address], [createat], [isactive], [phone], [price], [status], [updateat], [deliveryid], [storeid], [userid]) VALUES (N'21', N'../../../../../../../../../../../../../../../../etc/passwd', N'2023-05-25', N'1', N'9999999999', N'4', N'1', N'2023-05-25', N'2', NULL, N'258')
GO

INSERT INTO [dbo].[orders] ([id], [address], [createat], [isactive], [phone], [price], [status], [updateat], [deliveryid], [storeid], [userid]) VALUES (N'22', N'c:/', N'2023-05-25', N'1', N'9999999999', N'4', N'1', N'2023-05-25', N'2', NULL, N'258')
GO

INSERT INTO [dbo].[orders] ([id], [address], [createat], [isactive], [phone], [price], [status], [updateat], [deliveryid], [storeid], [userid]) VALUES (N'23', N'/', N'2023-05-25', N'1', N'9999999999', N'4', N'1', N'2023-05-25', N'2', NULL, N'258')
GO

INSERT INTO [dbo].[orders] ([id], [address], [createat], [isactive], [phone], [price], [status], [updateat], [deliveryid], [storeid], [userid]) VALUES (N'24', N'c:\', N'2023-05-25', N'1', N'9999999999', N'4', N'1', N'2023-05-25', N'2', NULL, N'258')
GO

INSERT INTO [dbo].[orders] ([id], [address], [createat], [isactive], [phone], [price], [status], [updateat], [deliveryid], [storeid], [userid]) VALUES (N'25', N'../../../../../../../../../../../../../../../../', N'2023-05-25', N'1', N'9999999999', N'4', N'1', N'2023-05-25', N'2', NULL, N'258')
GO

INSERT INTO [dbo].[orders] ([id], [address], [createat], [isactive], [phone], [price], [status], [updateat], [deliveryid], [storeid], [userid]) VALUES (N'26', N'WEB-INF/web.xml', N'2023-05-25', N'1', N'9999999999', N'4', N'1', N'2023-05-25', N'2', NULL, N'258')
GO

INSERT INTO [dbo].[orders] ([id], [address], [createat], [isactive], [phone], [price], [status], [updateat], [deliveryid], [storeid], [userid]) VALUES (N'27', N'WEB-INF\web.xml', N'2023-05-25', N'1', N'9999999999', N'4', N'1', N'2023-05-25', N'2', NULL, N'258')
GO

INSERT INTO [dbo].[orders] ([id], [address], [createat], [isactive], [phone], [price], [status], [updateat], [deliveryid], [storeid], [userid]) VALUES (N'28', N'/WEB-INF/web.xml', N'2023-05-25', N'1', N'9999999999', N'4', N'1', N'2023-05-25', N'2', NULL, N'258')
GO

INSERT INTO [dbo].[orders] ([id], [address], [createat], [isactive], [phone], [price], [status], [updateat], [deliveryid], [storeid], [userid]) VALUES (N'29', N'\WEB-INF\web.xml', N'2023-05-25', N'1', N'9999999999', N'4', N'1', N'2023-05-25', N'2', NULL, N'258')
GO

INSERT INTO [dbo].[orders] ([id], [address], [createat], [isactive], [phone], [price], [status], [updateat], [deliveryid], [storeid], [userid]) VALUES (N'30', N'thishouldnotexistandhopefullyitwillnot', N'2023-05-25', N'1', N'9999999999', N'4', N'1', N'2023-05-25', N'2', NULL, N'258')
GO

INSERT INTO [dbo].[orders] ([id], [address], [createat], [isactive], [phone], [price], [status], [updateat], [deliveryid], [storeid], [userid]) VALUES (N'31', N'add', N'2023-05-25', N'1', N'9999999999', N'4', N'1', N'2023-05-25', N'2', NULL, N'258')
GO

INSERT INTO [dbo].[orders] ([id], [address], [createat], [isactive], [phone], [price], [status], [updateat], [deliveryid], [storeid], [userid]) VALUES (N'32', N'/add', N'2023-05-25', N'1', N'9999999999', N'4', N'1', N'2023-05-25', N'2', NULL, N'258')
GO

INSERT INTO [dbo].[orders] ([id], [address], [createat], [isactive], [phone], [price], [status], [updateat], [deliveryid], [storeid], [userid]) VALUES (N'33', N'\add', N'2023-05-25', N'1', N'9999999999', N'4', N'1', N'2023-05-25', N'2', NULL, N'258')
GO

INSERT INTO [dbo].[orders] ([id], [address], [createat], [isactive], [phone], [price], [status], [updateat], [deliveryid], [storeid], [userid]) VALUES (N'34', N'688 Zaproxy Ridge', N'2023-05-25', N'1', N'c:/Windows/system.ini', N'4', N'1', N'2023-05-25', N'2', NULL, N'258')
GO

INSERT INTO [dbo].[orders] ([id], [address], [createat], [isactive], [phone], [price], [status], [updateat], [deliveryid], [storeid], [userid]) VALUES (N'35', N'688 Zaproxy Ridge', N'2023-05-25', N'1', N'../../../../../../../../../../../../../../../../Windows/system.ini', N'4', N'1', N'2023-05-25', N'2', NULL, N'258')
GO

INSERT INTO [dbo].[orders] ([id], [address], [createat], [isactive], [phone], [price], [status], [updateat], [deliveryid], [storeid], [userid]) VALUES (N'36', N'688 Zaproxy Ridge', N'2023-05-25', N'1', N'c:\Windows\system.ini', N'4', N'1', N'2023-05-25', N'2', NULL, N'258')
GO

INSERT INTO [dbo].[orders] ([id], [address], [createat], [isactive], [phone], [price], [status], [updateat], [deliveryid], [storeid], [userid]) VALUES (N'37', N'688 Zaproxy Ridge', N'2023-05-25', N'1', N'..\..\..\..\..\..\..\..\..\..\..\..\..\..\..\..\Windows\system.ini', N'4', N'1', N'2023-05-25', N'2', NULL, N'258')
GO

INSERT INTO [dbo].[orders] ([id], [address], [createat], [isactive], [phone], [price], [status], [updateat], [deliveryid], [storeid], [userid]) VALUES (N'38', N'688 Zaproxy Ridge', N'2023-05-25', N'1', N'/etc/passwd', N'4', N'1', N'2023-05-25', N'2', NULL, N'258')
GO

INSERT INTO [dbo].[orders] ([id], [address], [createat], [isactive], [phone], [price], [status], [updateat], [deliveryid], [storeid], [userid]) VALUES (N'39', N'688 Zaproxy Ridge', N'2023-05-25', N'1', N'../../../../../../../../../../../../../../../../etc/passwd', N'4', N'1', N'2023-05-25', N'2', NULL, N'258')
GO

INSERT INTO [dbo].[orders] ([id], [address], [createat], [isactive], [phone], [price], [status], [updateat], [deliveryid], [storeid], [userid]) VALUES (N'40', N'688 Zaproxy Ridge', N'2023-05-25', N'1', N'c:/', N'4', N'1', N'2023-05-25', N'2', NULL, N'258')
GO

INSERT INTO [dbo].[orders] ([id], [address], [createat], [isactive], [phone], [price], [status], [updateat], [deliveryid], [storeid], [userid]) VALUES (N'41', N'688 Zaproxy Ridge', N'2023-05-25', N'1', N'/', N'4', N'1', N'2023-05-25', N'2', NULL, N'258')
GO

INSERT INTO [dbo].[orders] ([id], [address], [createat], [isactive], [phone], [price], [status], [updateat], [deliveryid], [storeid], [userid]) VALUES (N'42', N'688 Zaproxy Ridge', N'2023-05-25', N'1', N'c:\', N'4', N'1', N'2023-05-25', N'2', NULL, N'258')
GO

INSERT INTO [dbo].[orders] ([id], [address], [createat], [isactive], [phone], [price], [status], [updateat], [deliveryid], [storeid], [userid]) VALUES (N'43', N'688 Zaproxy Ridge', N'2023-05-25', N'1', N'../../../../../../../../../../../../../../../../', N'4', N'1', N'2023-05-25', N'2', NULL, N'258')
GO

INSERT INTO [dbo].[orders] ([id], [address], [createat], [isactive], [phone], [price], [status], [updateat], [deliveryid], [storeid], [userid]) VALUES (N'44', N'688 Zaproxy Ridge', N'2023-05-25', N'1', N'WEB-INF/web.xml', N'4', N'1', N'2023-05-25', N'2', NULL, N'258')
GO

INSERT INTO [dbo].[orders] ([id], [address], [createat], [isactive], [phone], [price], [status], [updateat], [deliveryid], [storeid], [userid]) VALUES (N'45', N'688 Zaproxy Ridge', N'2023-05-25', N'1', N'WEB-INF\web.xml', N'4', N'1', N'2023-05-25', N'2', NULL, N'258')
GO

INSERT INTO [dbo].[orders] ([id], [address], [createat], [isactive], [phone], [price], [status], [updateat], [deliveryid], [storeid], [userid]) VALUES (N'46', N'688 Zaproxy Ridge', N'2023-05-25', N'1', N'/WEB-INF/web.xml', N'4', N'1', N'2023-05-25', N'2', NULL, N'258')
GO

INSERT INTO [dbo].[orders] ([id], [address], [createat], [isactive], [phone], [price], [status], [updateat], [deliveryid], [storeid], [userid]) VALUES (N'47', N'688 Zaproxy Ridge', N'2023-05-25', N'1', N'\WEB-INF\web.xml', N'4', N'1', N'2023-05-25', N'2', NULL, N'258')
GO

INSERT INTO [dbo].[orders] ([id], [address], [createat], [isactive], [phone], [price], [status], [updateat], [deliveryid], [storeid], [userid]) VALUES (N'48', N'688 Zaproxy Ridge', N'2023-05-25', N'1', N'thishouldnotexistandhopefullyitwillnot', N'4', N'1', N'2023-05-25', N'2', NULL, N'258')
GO

INSERT INTO [dbo].[orders] ([id], [address], [createat], [isactive], [phone], [price], [status], [updateat], [deliveryid], [storeid], [userid]) VALUES (N'49', N'688 Zaproxy Ridge', N'2023-05-25', N'1', N'add', N'4', N'1', N'2023-05-25', N'2', NULL, N'258')
GO

INSERT INTO [dbo].[orders] ([id], [address], [createat], [isactive], [phone], [price], [status], [updateat], [deliveryid], [storeid], [userid]) VALUES (N'50', N'688 Zaproxy Ridge', N'2023-05-25', N'1', N'/add', N'4', N'1', N'2023-05-25', N'2', NULL, N'258')
GO

INSERT INTO [dbo].[orders] ([id], [address], [createat], [isactive], [phone], [price], [status], [updateat], [deliveryid], [storeid], [userid]) VALUES (N'51', N'688 Zaproxy Ridge', N'2023-05-25', N'1', N'\add', N'4', N'1', N'2023-05-25', N'2', NULL, N'258')
GO

SET IDENTITY_INSERT [dbo].[orders] OFF
GO


-- ----------------------------
-- Table structure for product
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[product]') AND type IN ('U'))
	DROP TABLE [dbo].[product]
GO

CREATE TABLE [dbo].[product] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [createat] date  NULL,
  [desciption] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [isselling] bit  NULL,
  [listimage] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [name] nvarchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [price] float(53)  NULL,
  [promotionaprice] float(53)  NULL,
  [quantity] int  NULL,
  [rating] int  NULL,
  [sold] int  NULL,
  [updateat] date  NULL,
  [categoryid] int  NULL,
  [storeid] int  NULL
)
GO

ALTER TABLE [dbo].[product] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of product
-- ----------------------------
SET IDENTITY_INSERT [dbo].[product] ON
GO

INSERT INTO [dbo].[product] ([id], [createat], [desciption], [isselling], [listimage], [name], [price], [promotionaprice], [quantity], [rating], [sold], [updateat], [categoryid], [storeid]) VALUES (N'1', N'2022-04-03', N'Realfire', N'1', N'https://dummyimage.com/136x100.png/dddddd/000000', N'Goose Feathers', N'1397', N'676', N'51', N'4', N'20', N'2022-12-04', N'1', N'2')
GO

INSERT INTO [dbo].[product] ([id], [createat], [desciption], [isselling], [listimage], [name], [price], [promotionaprice], [quantity], [rating], [sold], [updateat], [categoryid], [storeid]) VALUES (N'2', N'2022-06-09', N'Dynabox', N'1', N'product-02.jpg', N'levonorgestrel and ethinyl estradiol', N'300', N'162', N'93', N'4', N'20', N'2022-11-13', N'2', N'2')
GO

INSERT INTO [dbo].[product] ([id], [createat], [desciption], [isselling], [listimage], [name], [price], [promotionaprice], [quantity], [rating], [sold], [updateat], [categoryid], [storeid]) VALUES (N'4', N'2022-09-04', N'Tekfly', N'1', N'product-03.jpg', N'Octinoxate and Titanium Dioxide', N'1170', N'784', N'92', N'4', N'20', N'2022-12-08', N'3', N'3')
GO

INSERT INTO [dbo].[product] ([id], [createat], [desciption], [isselling], [listimage], [name], [price], [promotionaprice], [quantity], [rating], [sold], [updateat], [categoryid], [storeid]) VALUES (N'5', N'2022-08-03', N'Feednation', N'1', N'product-04.jpg', N'Octocrylene,Zinc Oxide, Avobenzone, Ensulizone, Titanium Dioxide', N'1890', N'394', N'91', N'4', N'20', N'2022-01-29', N'1', N'4')
GO

INSERT INTO [dbo].[product] ([id], [createat], [desciption], [isselling], [listimage], [name], [price], [promotionaprice], [quantity], [rating], [sold], [updateat], [categoryid], [storeid]) VALUES (N'6', N'2022-02-24', N'Twitterworks', N'1', N'product-05.jpg', N'fenofibrate', N'744', N'400', N'92', N'4', N'20', N'2022-12-10', N'2', N'5')
GO

INSERT INTO [dbo].[product] ([id], [createat], [desciption], [isselling], [listimage], [name], [price], [promotionaprice], [quantity], [rating], [sold], [updateat], [categoryid], [storeid]) VALUES (N'7', N'2021-12-13', N'Kwideo', N'1', N'product-06.jpg', N'Naproxen sodium', N'830', N'792', N'76', N'4', N'20', N'2022-06-08', N'3', N'3')
GO

INSERT INTO [dbo].[product] ([id], [createat], [desciption], [isselling], [listimage], [name], [price], [promotionaprice], [quantity], [rating], [sold], [updateat], [categoryid], [storeid]) VALUES (N'8', N'2022-10-20', N'Skiba', N'1', N'product-07.jpg', N'hydrocortisone acetate and pramoxine hydrochloride', N'1979', N'840', N'92', N'4', N'20', N'2022-10-07', N'3', N'4')
GO

INSERT INTO [dbo].[product] ([id], [createat], [desciption], [isselling], [listimage], [name], [price], [promotionaprice], [quantity], [rating], [sold], [updateat], [categoryid], [storeid]) VALUES (N'9', N'2022-11-27', N'Voonder', N'1', N'product-08.jpg', N'PREGABALIN', N'1021', N'159', N'64', N'4', N'20', N'2022-04-05', N'2', N'2')
GO

INSERT INTO [dbo].[product] ([id], [createat], [desciption], [isselling], [listimage], [name], [price], [promotionaprice], [quantity], [rating], [sold], [updateat], [categoryid], [storeid]) VALUES (N'10', N'2022-08-09', N'Meezzy', N'1', N'product-09.jpg', N'BENZETHONIUM CHLORIDE', N'946', N'372', N'80', N'4', N'20', N'2022-09-16', N'1', N'2')
GO

INSERT INTO [dbo].[product] ([id], [createat], [desciption], [isselling], [listimage], [name], [price], [promotionaprice], [quantity], [rating], [sold], [updateat], [categoryid], [storeid]) VALUES (N'11', N'2022-04-03', N'Realfire', N'1', N'product-10.jpg', N'Goose Feathers', N'1397', N'676', N'51', N'4', N'20', N'2022-12-04', N'2', N'2')
GO

INSERT INTO [dbo].[product] ([id], [createat], [desciption], [isselling], [listimage], [name], [price], [promotionaprice], [quantity], [rating], [sold], [updateat], [categoryid], [storeid]) VALUES (N'12', N'2022-06-09', N'Dynabox', N'1', N'product-11.jpg', N'levonorgestrel and ethinyl estradiol', N'300', N'162', N'93', N'4', N'20', N'2022-11-13', N'1', N'3')
GO

INSERT INTO [dbo].[product] ([id], [createat], [desciption], [isselling], [listimage], [name], [price], [promotionaprice], [quantity], [rating], [sold], [updateat], [categoryid], [storeid]) VALUES (N'14', N'2022-09-04', N'Tekfly', N'1', N'product-12.jpg', N'Octinoxate and Titanium Dioxide', N'1170', N'784', N'92', N'4', N'20', N'2022-12-08', N'3', N'4')
GO

INSERT INTO [dbo].[product] ([id], [createat], [desciption], [isselling], [listimage], [name], [price], [promotionaprice], [quantity], [rating], [sold], [updateat], [categoryid], [storeid]) VALUES (N'15', N'2022-08-03', N'Feednation', N'1', N'product-15.jpg', N'Octocrylene,Zinc Oxide, Avobenzone, Ensulizone, Titanium Dioxide', N'1890', N'394', N'91', N'4', N'20', N'2022-01-29', N'2', N'5')
GO

INSERT INTO [dbo].[product] ([id], [createat], [desciption], [isselling], [listimage], [name], [price], [promotionaprice], [quantity], [rating], [sold], [updateat], [categoryid], [storeid]) VALUES (N'16', N'2022-02-24', N'Twitterworks', N'1', N'product-16.jpg', N'fenofibrate', N'744', N'400', N'92', N'4', N'20', N'2022-12-10', N'1', N'2')
GO

INSERT INTO [dbo].[product] ([id], [createat], [desciption], [isselling], [listimage], [name], [price], [promotionaprice], [quantity], [rating], [sold], [updateat], [categoryid], [storeid]) VALUES (N'17', N'2021-12-13', N'Kwideo', N'1', N'product-13.jpg', N'Naproxen sodium', N'830', N'792', N'76', N'4', N'20', N'2022-06-08', N'3', N'3')
GO

INSERT INTO [dbo].[product] ([id], [createat], [desciption], [isselling], [listimage], [name], [price], [promotionaprice], [quantity], [rating], [sold], [updateat], [categoryid], [storeid]) VALUES (N'18', N'2022-10-20', N'Skiba', N'1', N'product-14.jpg', N'hydrocortisone acetate and pramoxine hydrochloride', N'1979', N'840', N'92', N'4', N'20', N'2022-10-07', N'2', N'2')
GO

INSERT INTO [dbo].[product] ([id], [createat], [desciption], [isselling], [listimage], [name], [price], [promotionaprice], [quantity], [rating], [sold], [updateat], [categoryid], [storeid]) VALUES (N'19', N'2022-11-27', N'Voonder', N'1', N'aomangto.jpg', N'PREGABALIN', N'1021', N'159', N'64', N'4', N'20', N'2022-04-05', N'1', N'3')
GO

SET IDENTITY_INSERT [dbo].[product] OFF
GO


-- ----------------------------
-- Table structure for review
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[review]') AND type IN ('U'))
	DROP TABLE [dbo].[review]
GO

CREATE TABLE [dbo].[review] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [content] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [createat] date  NULL,
  [rating] int  NULL,
  [updateat] date  NULL,
  [productid] int  NULL,
  [userid] int  NULL
)
GO

ALTER TABLE [dbo].[review] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of review
-- ----------------------------
SET IDENTITY_INSERT [dbo].[review] ON
GO

SET IDENTITY_INSERT [dbo].[review] OFF
GO


-- ----------------------------
-- Table structure for store
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[store]') AND type IN ('U'))
	DROP TABLE [dbo].[store]
GO

CREATE TABLE [dbo].[store] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [about] nvarchar(1000) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [avatar] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [bio] nvarchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [createat] date  NULL,
  [featuredimages] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [isactive] bit  NULL,
  [name] nvarchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [rating] int  NULL,
  [updaeat] date  NULL,
  [ownerid] int  NULL
)
GO

ALTER TABLE [dbo].[store] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of store
-- ----------------------------
SET IDENTITY_INSERT [dbo].[store] ON
GO

INSERT INTO [dbo].[store] ([id], [about], [avatar], [bio], [createat], [featuredimages], [isactive], [name], [rating], [updaeat], [ownerid]) VALUES (N'2', NULL, N'https://res.cloudinary.com/djzwxw0ao/image/upload/v1682362448/yxvoro9awvlvt8hlpdj7.jpg', N'Day la bioo', N'2023-04-25', N'https://res.cloudinary.com/djzwxw0ao/image/upload/v1682362451/tysyvgv1rnrvbpykww3e.png', N'0', N'Cozaa', NULL, N'2023-04-25', N'20')
GO

INSERT INTO [dbo].[store] ([id], [about], [avatar], [bio], [createat], [featuredimages], [isactive], [name], [rating], [updaeat], [ownerid]) VALUES (N'3', N'B? Th? Thao Nam Ch?t N? 4 Màu Tr? Trung Nang Ð?ng Th?i Trang Cao C?p VICERO

??  CHÍNH SÁCH

Là khách hàng c?a VICERO, b?n s? du?c:', N'http://dummyimage.com/136x100.png/dddddd/000000', N'T2K', N'2022-11-11', N'https://images.unsplash.com/photo-1627394167140-2b480fcaf416?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80', N'1', N'Dukey', N'4', N'2022-01-22', N'1')
GO

INSERT INTO [dbo].[store] ([id], [about], [avatar], [bio], [createat], [featuredimages], [isactive], [name], [rating], [updaeat], [ownerid]) VALUES (N'4', N'B? Th? Thao Nam Ch?t N? 4 Màu Tr? Trung Nang Ð?ng Th?i Trang Cao C?p VICERO

?? FREESHIP cho t?t c? các don hàng t? 150K

?? Cam k?t ch?t lu?ng và m?u mã s?n ph?m gi?ng v?i hình ?nh.

?? Hoàn ti?n n?u s?n ph?m không gi?ng v?i mô t?.', N'http://dummyimage.com/188x100.png/5fa2dd/ffffff', N'HMK', N'2022-03-26', N'https://images.unsplash.com/photo-1595665593673-bf1ad72905c0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1028&q=80', N'1', N'Jolyn', N'4', N'2022-10-14', N'6')
GO

INSERT INTO [dbo].[store] ([id], [about], [avatar], [bio], [createat], [featuredimages], [isactive], [name], [rating], [updaeat], [ownerid]) VALUES (N'5', N'B? Th? Thao Nam Ch?t N? 4 Màu Tr? Trung Nang Ð?ng Th?i Trang Cao C?p VICERO


?? FREESHIP cho t?t c? các don hàng t? 150K

?? Cam k?t ch?t lu?ng và m?u mã s?n ph?m gi?ng v?i hình ?nh.

?? Hoàn ti?n n?u s?n ph?m không gi?ng v?i mô t?.
', N'http://dummyimage.com/158x100.png/ff4444/ffffff', N'VPT', N'2022-03-23', N'https://media.istockphoto.com/photos/luxury-clothing-store-for-men-picture-id831656828?k=6&m=831656828&s=612x612&w=0&h=NVsZnoxXAdjLJFzt56ZOVzMgSEV7O0jmBKoDqhAKjtQ=', N'1', N'Meryl', N'4', N'2022-01-03', N'3')
GO

INSERT INTO [dbo].[store] ([id], [about], [avatar], [bio], [createat], [featuredimages], [isactive], [name], [rating], [updaeat], [ownerid]) VALUES (N'6', N'B? Th? Thao Nam Ch?t N? 4 Màu Tr? Trung Nang Ð?ng Th?i Trang Cao C?p VICERO

?? FREESHIP cho t?t c? các don hàng t? 150K

?? Cam k?t ch?t lu?ng và m?u mã s?n ph?m gi?ng v?i hình ?nh.

?? Hoàn ti?n n?u s?n ph?m không gi?ng v?i mô t?.', N'http://dummyimage.com/246x100.png/cc0000/ffffff', N'Thuong hi?u Vi?t', N'2022-03-25', N'https://aitvietnam.com/wp-content/uploads/2022/04/thiet-ke-noi-that-shop-thoi-trang-1.jpg', N'1', N'Clerkclaude', N'4', N'2022-04-23', N'4')
GO

INSERT INTO [dbo].[store] ([id], [about], [avatar], [bio], [createat], [featuredimages], [isactive], [name], [rating], [updaeat], [ownerid]) VALUES (N'7', N'B? Th? Thao Nam Ch?t N? 4 Màu Tr? Trung Nang Ð?ng Th?i Trang Cao C?p VICERO


?? FREESHIP cho t?t c? các don hàng t? 150K

?? Cam k?t ch?t lu?ng và m?u mã s?n ph?m gi?ng v?i hình ?nh.

?? Hoàn ti?n n?u s?n ph?m không gi?ng v?i mô t?.', N'https://thing.vn/wp-content/uploads/2022/02/y-tuong-thiet-ke-shop-quan-ao-9.jpg', N'Thuong hi?u Vi?t', N'2022-11-24', N'https://thing.vn/wp-content/uploads/2022/02/y-tuong-thiet-ke-shop-quan-ao-9.jpg', N'1', N'Lennie', N'4', N'2022-03-11', N'5')
GO

SET IDENTITY_INSERT [dbo].[store] OFF
GO


-- ----------------------------
-- Table structure for transactions
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[transactions]') AND type IN ('U'))
	DROP TABLE [dbo].[transactions]
GO

CREATE TABLE [dbo].[transactions] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [amount] float(53)  NULL,
  [createat] date  NULL,
  [isup] bit  NULL,
  [updaeat] date  NULL,
  [storeid] int  NULL,
  [userid] int  NULL
)
GO

ALTER TABLE [dbo].[transactions] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of transactions
-- ----------------------------
SET IDENTITY_INSERT [dbo].[transactions] ON
GO

SET IDENTITY_INSERT [dbo].[transactions] OFF
GO


-- ----------------------------
-- Table structure for users
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[users]') AND type IN ('U'))
	DROP TABLE [dbo].[users]
GO

CREATE TABLE [dbo].[users] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [address] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [avatar] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [createat] date  NULL,
  [email] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [first_name] nvarchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [is_active] bit  NULL,
  [last_name] nvarchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [password] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [phone] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [resetpasswordtoken] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [role] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [updateat] date  NULL,
  [username] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[users] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of users
-- ----------------------------
SET IDENTITY_INSERT [dbo].[users] ON
GO

INSERT INTO [dbo].[users] ([id], [address], [avatar], [createat], [email], [first_name], [is_active], [last_name], [password], [phone], [resetpasswordtoken], [role], [updateat], [username]) VALUES (N'1', N'0725 Summit Street', N'http://dummyimage.com/117x100.png/5fa2dd/ffffff', N'2001-01-01', N'pjohnke0@cdbaby.com', N'Pall', N'1', N'Johnke', N'123', N'253-430-0059', NULL, N'ROLE_ADMIN', N'2001-01-01', N'huy')
GO

INSERT INTO [dbo].[users] ([id], [address], [avatar], [createat], [email], [first_name], [is_active], [last_name], [password], [phone], [resetpasswordtoken], [role], [updateat], [username]) VALUES (N'2', N'46606 Del Mar Street', N'http://dummyimage.com/234x100.png/dddddd/000000', N'2001-01-01', N'qglitherow1@weibo.com', N'Quill', N'1', N'Glitherow', N'123', N'647-937-6599', NULL, N'ROLE_USER', N'2001-01-01', N'huy01')
GO

INSERT INTO [dbo].[users] ([id], [address], [avatar], [createat], [email], [first_name], [is_active], [last_name], [password], [phone], [resetpasswordtoken], [role], [updateat], [username]) VALUES (N'3', N'198 Huxley Point', N'https://res.cloudinary.com/djzwxw0ao/image/upload/v1682361795/z8zbmrto7qlingq8srss.jpg', N'2023-04-25', N'adome2@angelfire.com', N'Aileen', N'1', N'Dome', N'DVfiPSG7p', N'773-219-4723', NULL, N'ROLE_USER', N'2023-04-25', N'adome2')
GO

INSERT INTO [dbo].[users] ([id], [address], [avatar], [createat], [email], [first_name], [is_active], [last_name], [password], [phone], [resetpasswordtoken], [role], [updateat], [username]) VALUES (N'4', N'8158 Crescent Oaks Hill', N'http://dummyimage.com/230x100.png/ff4444/ffffff', N'2001-01-01', N'asertin3@arstechnica.com', N'Abdel', N'1', N'Sertin', N'vyPVXDQa5v9', N'583-426-4356', NULL, N'ROLE_USER', N'2001-01-01', N'asertin3')
GO

INSERT INTO [dbo].[users] ([id], [address], [avatar], [createat], [email], [first_name], [is_active], [last_name], [password], [phone], [resetpasswordtoken], [role], [updateat], [username]) VALUES (N'5', N'369 Nobel Place', N'http://dummyimage.com/219x100.png/cc0000/ffffff', N'2001-01-01', N'klinnard4@hugedomains.com', N'Kerr', N'1', N'Linnard', N'KZeGGM62', N'506-872-4593', NULL, N'ROLE_USER', N'2001-01-01', N'klinnard4')
GO

INSERT INTO [dbo].[users] ([id], [address], [avatar], [createat], [email], [first_name], [is_active], [last_name], [password], [phone], [resetpasswordtoken], [role], [updateat], [username]) VALUES (N'6', N'080 Riverside Park', N'http://dummyimage.com/142x100.png/5fa2dd/ffffff', N'2001-01-01', N'jivie5@cdbaby.com', N'Jobye', N'1', N'Ivie', N'y2dj1t7XwQ', N'726-719-2437', NULL, N'ROLE_USER', N'2001-01-01', N'jivie5')
GO

INSERT INTO [dbo].[users] ([id], [address], [avatar], [createat], [email], [first_name], [is_active], [last_name], [password], [phone], [resetpasswordtoken], [role], [updateat], [username]) VALUES (N'7', N'96720 Stephen Street', N'http://dummyimage.com/151x100.png/5fa2dd/ffffff', N'2001-01-01', N'dgiffard6@google.fr', N'Dan', N'1', N'Giffard', N'tFHXkT4Ck', N'473-183-1708', NULL, N'ROLE_USER', N'2001-01-01', N'dgiffard6')
GO

INSERT INTO [dbo].[users] ([id], [address], [avatar], [createat], [email], [first_name], [is_active], [last_name], [password], [phone], [resetpasswordtoken], [role], [updateat], [username]) VALUES (N'8', N'7 Oxford Hill', N'http://dummyimage.com/115x100.png/cc0000/ffffff', N'2001-01-01', N'cmaddin7@usnews.com', N'Cedric', N'1', N'Maddin', N'oODYye', N'287-990-5429', NULL, N'ROLE_USER', N'2001-01-01', N'cmaddin7')
GO

INSERT INTO [dbo].[users] ([id], [address], [avatar], [createat], [email], [first_name], [is_active], [last_name], [password], [phone], [resetpasswordtoken], [role], [updateat], [username]) VALUES (N'9', N'4386 Ohio Pass', N'http://dummyimage.com/195x100.png/ff4444/ffffff', N'2001-01-01', N'fcheccuzzi8@joomla.org', N'Faustina', N'1', N'Checcuzzi', N'oelswjj3mJF', N'349-370-2444', NULL, N'ROLE_USER', N'2001-01-01', N'fcheccuzzi8')
GO

INSERT INTO [dbo].[users] ([id], [address], [avatar], [createat], [email], [first_name], [is_active], [last_name], [password], [phone], [resetpasswordtoken], [role], [updateat], [username]) VALUES (N'10', N'8 Jackson Plaza', N'http://dummyimage.com/246x100.png/ff4444/ffffff', N'2001-01-01', N'mhabbes9@dailymotion.com', N'Michelina', N'1', N'Habbes', N'wyrsbnDcaWS', N'537-446-8642', NULL, N'ROLE_USER', N'2001-01-01', N'mhabbes9')
GO

INSERT INTO [dbo].[users] ([id], [address], [avatar], [createat], [email], [first_name], [is_active], [last_name], [password], [phone], [resetpasswordtoken], [role], [updateat], [username]) VALUES (N'11', N'0725 Summit Street', N'http://dummyimage.com/117x100.png/5fa2dd/ffffff', N'2001-01-01', N'pjohnke0@cdbaby.com', N'Pall', N'1', N'Johnke', N'lr2K9w', N'253-430-0059', NULL, N'ROLE_USER', N'2001-01-01', N'pjohnke0')
GO

INSERT INTO [dbo].[users] ([id], [address], [avatar], [createat], [email], [first_name], [is_active], [last_name], [password], [phone], [resetpasswordtoken], [role], [updateat], [username]) VALUES (N'12', N'46606 Del Mar Street', N'http://dummyimage.com/234x100.png/dddddd/000000', N'2001-01-01', N'qglitherow1@weibo.com', N'Quill', N'1', N'Glitherow', N'7fbkGvMKHhXu', N'647-937-6599', NULL, N'ROLE_USER', N'2001-01-01', N'qglitherow1')
GO

INSERT INTO [dbo].[users] ([id], [address], [avatar], [createat], [email], [first_name], [is_active], [last_name], [password], [phone], [resetpasswordtoken], [role], [updateat], [username]) VALUES (N'13', N'198 Huxley Point', N'http://dummyimage.com/243x100.png/cc0000/ffffff', N'2001-01-01', N'adome2@angelfire.com', N'Aileen', N'1', N'Dome', N'DVfiPSG7p', N'773-219-4723', NULL, N'ROLE_USER', N'2001-01-01', N'adome2')
GO

INSERT INTO [dbo].[users] ([id], [address], [avatar], [createat], [email], [first_name], [is_active], [last_name], [password], [phone], [resetpasswordtoken], [role], [updateat], [username]) VALUES (N'14', N'8158 Crescent Oaks Hill', N'http://dummyimage.com/230x100.png/ff4444/ffffff', N'2001-01-01', N'asertin3@arstechnica.com', N'Abdel', N'1', N'Sertin', N'vyPVXDQa5v9', N'583-426-4356', NULL, N'ROLE_USER', N'2001-01-01', N'asertin3')
GO

INSERT INTO [dbo].[users] ([id], [address], [avatar], [createat], [email], [first_name], [is_active], [last_name], [password], [phone], [resetpasswordtoken], [role], [updateat], [username]) VALUES (N'15', N'369 Nobel Place', N'http://dummyimage.com/219x100.png/cc0000/ffffff', N'2001-01-01', N'klinnard4@hugedomains.com', N'Kerr', N'1', N'Linnard', N'KZeGGM62', N'506-872-4593', NULL, N'ROLE_USER', N'2001-01-01', N'klinnard4')
GO

INSERT INTO [dbo].[users] ([id], [address], [avatar], [createat], [email], [first_name], [is_active], [last_name], [password], [phone], [resetpasswordtoken], [role], [updateat], [username]) VALUES (N'16', N'080 Riverside Park', N'http://dummyimage.com/142x100.png/5fa2dd/ffffff', N'2001-01-01', N'jivie5@cdbaby.com', N'Jobye', N'1', N'Ivie', N'y2dj1t7XwQ', N'726-719-2437', NULL, N'ROLE_USER', N'2001-01-01', N'jivie5')
GO

INSERT INTO [dbo].[users] ([id], [address], [avatar], [createat], [email], [first_name], [is_active], [last_name], [password], [phone], [resetpasswordtoken], [role], [updateat], [username]) VALUES (N'17', N'96720 Stephen Street', N'http://dummyimage.com/151x100.png/5fa2dd/ffffff', N'2001-01-01', N'dgiffard6@google.fr', N'Dan', N'1', N'Giffard', N'tFHXkT4Ck', N'473-183-1708', NULL, N'ROLE_USER', N'2001-01-01', N'dgiffard6')
GO

INSERT INTO [dbo].[users] ([id], [address], [avatar], [createat], [email], [first_name], [is_active], [last_name], [password], [phone], [resetpasswordtoken], [role], [updateat], [username]) VALUES (N'18', N'7 Oxford Hill', N'http://dummyimage.com/115x100.png/cc0000/ffffff', N'2001-01-01', N'cmaddin7@usnews.com', N'Cedric', N'1', N'Maddin', N'oODYye', N'287-990-5429', NULL, N'ROLE_USER', N'2001-01-01', N'cmaddin7')
GO

INSERT INTO [dbo].[users] ([id], [address], [avatar], [createat], [email], [first_name], [is_active], [last_name], [password], [phone], [resetpasswordtoken], [role], [updateat], [username]) VALUES (N'19', N'4386 Ohio Pass', N'http://dummyimage.com/195x100.png/ff4444/ffffff', N'2001-01-01', N'fcheccuzzi8@joomla.org', N'Faustina', N'1', N'Checcuzzi', N'oelswjj3mJF', N'349-370-2444', NULL, N'ROLE_USER', N'2001-01-01', N'fcheccuzzi8')
GO

INSERT INTO [dbo].[users] ([id], [address], [avatar], [createat], [email], [first_name], [is_active], [last_name], [password], [phone], [resetpasswordtoken], [role], [updateat], [username]) VALUES (N'20', N'8 Jackson Plaza', N'http://dummyimage.com/246x100.png/ff4444/ffffff', N'2001-01-01', N'mhabbes9@dailymotion.com', N'Michelina', N'1', N'Habbes', N'123', N'537-446-8642', NULL, N'ROLE_USER', N'2001-01-01', N'hh')
GO

INSERT INTO [dbo].[users] ([id], [address], [avatar], [createat], [email], [first_name], [is_active], [last_name], [password], [phone], [resetpasswordtoken], [role], [updateat], [username]) VALUES (N'258', NULL, NULL, N'2023-04-27', NULL, N'ZAP', NULL, N'ZAP', N'ZAP', NULL, NULL, N'ROLE_USER', N'2023-04-27', N'ZAP')
GO

INSERT INTO [dbo].[users] ([id], [address], [avatar], [createat], [email], [first_name], [is_active], [last_name], [password], [phone], [resetpasswordtoken], [role], [updateat], [username]) VALUES (N'259', NULL, NULL, N'2023-05-01', NULL, N'quocchi@gmail.com', NULL, N'quocchi@gmail.com', N'123456', NULL, NULL, N'ROLE_USER', N'2023-05-01', N'quocchi@gmail.com')
GO

INSERT INTO [dbo].[users] ([id], [address], [avatar], [createat], [email], [first_name], [is_active], [last_name], [password], [phone], [resetpasswordtoken], [role], [updateat], [username]) VALUES (N'260', NULL, NULL, N'2023-05-25', NULL, N'toan', NULL, N'toan', N'$2a$12$DTNJkTMBhNWqD6oJV5mfDeEu5SzpujNhNVnvxMtpQymoHSZoE358i', NULL, NULL, N'ROLE_USER', N'2023-05-25', N'toan')
GO

INSERT INTO [dbo].[users] ([id], [address], [avatar], [createat], [email], [first_name], [is_active], [last_name], [password], [phone], [resetpasswordtoken], [role], [updateat], [username]) VALUES (N'261', NULL, NULL, N'2023-05-25', NULL, N'quocchi', NULL, N'quocchi', N'19052002', NULL, NULL, N'ROLE_USER', N'2023-05-25', N'quocchi')
GO

INSERT INTO [dbo].[users] ([id], [address], [avatar], [createat], [email], [first_name], [is_active], [last_name], [password], [phone], [resetpasswordtoken], [role], [updateat], [username]) VALUES (N'266', N'TP HCM', N'https://res.cloudinary.com/djzwxw0ao/image/upload/v1685027547/cxgsiswxcskltievx5ps.png', N'2023-05-25', N'ngoquanghuy0510@gmail.com', N'Ngô', NULL, N'Huy', N'$2a$12$DezzhFRgep8wSq/KvuFE.OVELb2nv.0Ye1RzGdSdZ7bGg8ONrt/N2', N'0925058597', NULL, N'ROLE_USER', N'2023-05-25', N'quanghuy01')
GO

INSERT INTO [dbo].[users] ([id], [address], [avatar], [createat], [email], [first_name], [is_active], [last_name], [password], [phone], [resetpasswordtoken], [role], [updateat], [username]) VALUES (N'269', NULL, NULL, N'2023-05-25', NULL, N'trvankiet02', NULL, N'trvankiet02', N'123456', NULL, NULL, N'ROLE_USER', N'2023-05-25', N'trvankiet02')
GO

INSERT INTO [dbo].[users] ([id], [address], [avatar], [createat], [email], [first_name], [is_active], [last_name], [password], [phone], [resetpasswordtoken], [role], [updateat], [username]) VALUES (N'301', NULL, NULL, N'2023-05-25', NULL, N'/etc/passwd', NULL, N'/etc/passwd', N'ZAP', NULL, NULL, N'ROLE_USER', N'2023-05-25', N'/etc/passwd')
GO

INSERT INTO [dbo].[users] ([id], [address], [avatar], [createat], [email], [first_name], [is_active], [last_name], [password], [phone], [resetpasswordtoken], [role], [updateat], [username]) VALUES (N'318', NULL, NULL, N'2023-05-25', NULL, N'c:/', NULL, N'c:/', N'ZAP', NULL, NULL, N'ROLE_USER', N'2023-05-25', N'c:/')
GO

INSERT INTO [dbo].[users] ([id], [address], [avatar], [createat], [email], [first_name], [is_active], [last_name], [password], [phone], [resetpasswordtoken], [role], [updateat], [username]) VALUES (N'324', NULL, NULL, N'2023-05-25', NULL, N'/', NULL, N'/', N'ZAP', NULL, NULL, N'ROLE_USER', N'2023-05-25', N'/')
GO

INSERT INTO [dbo].[users] ([id], [address], [avatar], [createat], [email], [first_name], [is_active], [last_name], [password], [phone], [resetpasswordtoken], [role], [updateat], [username]) VALUES (N'329', NULL, NULL, N'2023-05-25', NULL, N'c:\', NULL, N'c:\', N'ZAP', NULL, NULL, N'ROLE_USER', N'2023-05-25', N'c:\')
GO

INSERT INTO [dbo].[users] ([id], [address], [avatar], [createat], [email], [first_name], [is_active], [last_name], [password], [phone], [resetpasswordtoken], [role], [updateat], [username]) VALUES (N'344', NULL, NULL, N'2023-05-25', NULL, N'WEB-INF/web.xml', NULL, N'WEB-INF/web.xml', N'ZAP', NULL, NULL, N'ROLE_USER', N'2023-05-25', N'WEB-INF/web.xml')
GO

INSERT INTO [dbo].[users] ([id], [address], [avatar], [createat], [email], [first_name], [is_active], [last_name], [password], [phone], [resetpasswordtoken], [role], [updateat], [username]) VALUES (N'349', NULL, NULL, N'2023-05-25', NULL, N'WEB-INF\web.xml', NULL, N'WEB-INF\web.xml', N'ZAP', NULL, NULL, N'ROLE_USER', N'2023-05-25', N'WEB-INF\web.xml')
GO

INSERT INTO [dbo].[users] ([id], [address], [avatar], [createat], [email], [first_name], [is_active], [last_name], [password], [phone], [resetpasswordtoken], [role], [updateat], [username]) VALUES (N'354', NULL, NULL, N'2023-05-25', NULL, N'/WEB-INF/web.xml', NULL, N'/WEB-INF/web.xml', N'ZAP', NULL, NULL, N'ROLE_USER', N'2023-05-25', N'/WEB-INF/web.xml')
GO

INSERT INTO [dbo].[users] ([id], [address], [avatar], [createat], [email], [first_name], [is_active], [last_name], [password], [phone], [resetpasswordtoken], [role], [updateat], [username]) VALUES (N'357', NULL, NULL, N'2023-05-25', NULL, N'\WEB-INF\web.xml', NULL, N'\WEB-INF\web.xml', N'ZAP', NULL, NULL, N'ROLE_USER', N'2023-05-25', N'\WEB-INF\web.xml')
GO

INSERT INTO [dbo].[users] ([id], [address], [avatar], [createat], [email], [first_name], [is_active], [last_name], [password], [phone], [resetpasswordtoken], [role], [updateat], [username]) VALUES (N'364', NULL, NULL, N'2023-05-25', NULL, N'resgiter', NULL, N'resgiter', N'ZAP', NULL, NULL, N'ROLE_USER', N'2023-05-25', N'resgiter')
GO

INSERT INTO [dbo].[users] ([id], [address], [avatar], [createat], [email], [first_name], [is_active], [last_name], [password], [phone], [resetpasswordtoken], [role], [updateat], [username]) VALUES (N'459', NULL, NULL, N'2023-05-25', NULL, N'www.google.com/', NULL, N'www.google.com/', N'ZAP', NULL, NULL, N'ROLE_USER', N'2023-05-25', N'www.google.com/')
GO

INSERT INTO [dbo].[users] ([id], [address], [avatar], [createat], [email], [first_name], [is_active], [last_name], [password], [phone], [resetpasswordtoken], [role], [updateat], [username]) VALUES (N'460', NULL, NULL, N'2023-05-25', NULL, N'www.google.com:80/', NULL, N'www.google.com:80/', N'ZAP', NULL, NULL, N'ROLE_USER', N'2023-05-25', N'www.google.com:80/')
GO

INSERT INTO [dbo].[users] ([id], [address], [avatar], [createat], [email], [first_name], [is_active], [last_name], [password], [phone], [resetpasswordtoken], [role], [updateat], [username]) VALUES (N'461', NULL, NULL, N'2023-05-25', NULL, N'www.google.com', NULL, N'www.google.com', N'ZAP', NULL, NULL, N'ROLE_USER', N'2023-05-25', N'www.google.com')
GO

SET IDENTITY_INSERT [dbo].[users] OFF
GO


-- ----------------------------
-- Auto increment value for caritem
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[caritem]', RESEED, 67)
GO


-- ----------------------------
-- Auto increment value for cart
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[cart]', RESEED, 88)
GO


-- ----------------------------
-- Auto increment value for category
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[category]', RESEED, 14)
GO


-- ----------------------------
-- Primary Key structure for table category
-- ----------------------------
ALTER TABLE [dbo].[category] ADD CONSTRAINT [PK__category__3213E83F798CE7D6] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for delivery
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[delivery]', RESEED, 5)
GO


-- ----------------------------
-- Primary Key structure for table delivery
-- ----------------------------
ALTER TABLE [dbo].[delivery] ADD CONSTRAINT [PK__delivery__3213E83F241DC38E] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for filter
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[filter]', RESEED, 578)
GO


-- ----------------------------
-- Primary Key structure for table filter
-- ----------------------------
ALTER TABLE [dbo].[filter] ADD CONSTRAINT [PK__filter__3213E83F951624C9] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for orderitem
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[orderitem]', RESEED, 7)
GO


-- ----------------------------
-- Primary Key structure for table orderitem
-- ----------------------------
ALTER TABLE [dbo].[orderitem] ADD CONSTRAINT [PK__orderite__3213E83F2D3F6596] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for orders
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[orders]', RESEED, 51)
GO


-- ----------------------------
-- Primary Key structure for table orders
-- ----------------------------
ALTER TABLE [dbo].[orders] ADD CONSTRAINT [PK__orders__3213E83F55CCC390] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for product
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[product]', RESEED, 20)
GO


-- ----------------------------
-- Primary Key structure for table product
-- ----------------------------
ALTER TABLE [dbo].[product] ADD CONSTRAINT [PK__product__3213E83F85B256BB] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for review
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[review]', RESEED, 1)
GO


-- ----------------------------
-- Primary Key structure for table review
-- ----------------------------
ALTER TABLE [dbo].[review] ADD CONSTRAINT [PK__review__3213E83F7F1A3966] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for store
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[store]', RESEED, 8)
GO


-- ----------------------------
-- Primary Key structure for table store
-- ----------------------------
ALTER TABLE [dbo].[store] ADD CONSTRAINT [PK__store__3213E83F977C4C7D] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for transactions
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[transactions]', RESEED, 1)
GO


-- ----------------------------
-- Primary Key structure for table transactions
-- ----------------------------
ALTER TABLE [dbo].[transactions] ADD CONSTRAINT [PK__transact__3213E83FAC83DADC] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for users
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[users]', RESEED, 469)
GO


-- ----------------------------
-- Primary Key structure for table users
-- ----------------------------
ALTER TABLE [dbo].[users] ADD CONSTRAINT [PK__users__3213E83F30C9073A] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Foreign Keys structure for table caritem
-- ----------------------------
ALTER TABLE [dbo].[caritem] ADD CONSTRAINT [FKbhsyayx6sjblvuhntt9f6i4yw] FOREIGN KEY ([productid]) REFERENCES [dbo].[product] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table cart
-- ----------------------------
ALTER TABLE [dbo].[cart] ADD CONSTRAINT [FK1f3la5ofi3papq9kbt0yqkab7] FOREIGN KEY ([userid]) REFERENCES [dbo].[users] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[cart] ADD CONSTRAINT [FKo204qeqhir5hy0snq6wl1yeqg] FOREIGN KEY ([storeid]) REFERENCES [dbo].[store] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table filter
-- ----------------------------
ALTER TABLE [dbo].[filter] ADD CONSTRAINT [FKvxf8igjm0qlxmyxrr7aagx83] FOREIGN KEY ([userid]) REFERENCES [dbo].[users] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table orderitem
-- ----------------------------
ALTER TABLE [dbo].[orderitem] ADD CONSTRAINT [FKqyadddw5faraw73978ak51y4n] FOREIGN KEY ([orderid]) REFERENCES [dbo].[orders] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[orderitem] ADD CONSTRAINT [FK7up44in2o6bxxl23owsoydldr] FOREIGN KEY ([productid]) REFERENCES [dbo].[product] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table orders
-- ----------------------------
ALTER TABLE [dbo].[orders] ADD CONSTRAINT [FKaf8ont73ql85qfhon2r064tbu] FOREIGN KEY ([deliveryid]) REFERENCES [dbo].[delivery] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[orders] ADD CONSTRAINT [FK41c95whj2f4fqcgs1623jao4m] FOREIGN KEY ([storeid]) REFERENCES [dbo].[store] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[orders] ADD CONSTRAINT [FKpnm1eeupqm4tykds7k3okqegv] FOREIGN KEY ([userid]) REFERENCES [dbo].[users] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table product
-- ----------------------------
ALTER TABLE [dbo].[product] ADD CONSTRAINT [FK4ort9abhumpx4t2mlngljr1vi] FOREIGN KEY ([categoryid]) REFERENCES [dbo].[category] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[product] ADD CONSTRAINT [FK9v9pxncccv2bwg4dgni5s9tbn] FOREIGN KEY ([storeid]) REFERENCES [dbo].[store] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table review
-- ----------------------------
ALTER TABLE [dbo].[review] ADD CONSTRAINT [FKg69bbwjotlkw04k2hqguscgbo] FOREIGN KEY ([productid]) REFERENCES [dbo].[product] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[review] ADD CONSTRAINT [FKr5b7ngwds9au4py4plwik2ojf] FOREIGN KEY ([userid]) REFERENCES [dbo].[users] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table store
-- ----------------------------
ALTER TABLE [dbo].[store] ADD CONSTRAINT [FK9ofnkfv7a7l9tfu911yo7o7f7] FOREIGN KEY ([ownerid]) REFERENCES [dbo].[users] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table transactions
-- ----------------------------
ALTER TABLE [dbo].[transactions] ADD CONSTRAINT [FK4rp1dgpg8y4ywe736485xtpd4] FOREIGN KEY ([storeid]) REFERENCES [dbo].[store] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[transactions] ADD CONSTRAINT [FKf4xayc06sikj4iwfrfi38o4eh] FOREIGN KEY ([userid]) REFERENCES [dbo].[users] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

