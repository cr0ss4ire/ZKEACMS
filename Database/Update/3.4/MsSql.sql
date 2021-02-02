﻿IF NOT EXISTS (SELECT 1 FROM sysobjects WHERE name = N'FluidContentType' AND TYPE = 'u')
BEGIN
	CREATE TABLE [dbo].[FluidContentType](
		[ID] [int] IDENTITY(1,1) NOT NULL,
		[Title] [nvarchar](100) NULL,
		[ContentSchema] [nvarchar](max) NULL,
		[Description] [nvarchar](500) NULL,
		[Status] [int] NULL,
		[CreateBy] [nvarchar](50) NULL,
		[CreatebyName] [nvarchar](100) NULL,
		[CreateDate] [datetime] NULL,
		[LastUpdateBy] [nvarchar](50) NULL,
		[LastUpdateByName] [nvarchar](100) NULL,
		[LastUpdateDate] [datetime] NULL
	) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
IF NOT EXISTS (SELECT 1 FROM sysobjects WHERE name = N'FluidContentValue' AND TYPE = 'u')
BEGIN
	CREATE TABLE [dbo].[FluidContentValue](
		[ID] [int] IDENTITY(1,1) NOT NULL,
		[ContentTypeID] [int] NULL,
		[Title] [nvarchar](100) NULL,
		[Content] [nvarchar](max) NULL,
		[Description] [nvarchar](500) NULL,
		[Status] [int] NULL,
		[CreateBy] [nvarchar](50) NULL,
		[CreatebyName] [nvarchar](100) NULL,
		[CreateDate] [datetime] NULL,
		[LastUpdateBy] [nvarchar](50) NULL,
		[LastUpdateByName] [nvarchar](100) NULL,
		[LastUpdateDate] [datetime] NULL,
		[ContentID] [nvarchar](100) NULL,
		[CultureID] [int] NULL,
		[Url] [nvarchar](200) NULL,
		[SEOTitle] [nvarchar](200) NULL,
		[SEOKeyWord] [nvarchar](200) NULL,
		[SEODescription] [nvarchar](200) NULL
	) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
IF NOT EXISTS (SELECT 1 FROM sysobjects WHERE name = N'FluidContentTemplate' AND TYPE = 'u')
BEGIN
	CREATE TABLE [dbo].[FluidContentTemplate](
		[ID] [int] IDENTITY(1,1) NOT NULL,
		[Title] [nvarchar](100) NULL,
		[ApplyTo] [nvarchar](100) NULL,
		[Template] [nvarchar](max) NULL,
		[Description] [nvarchar](500) NULL,
		[Status] [int] NULL,
		[CreateBy] [nvarchar](50) NULL,
		[CreatebyName] [nvarchar](100) NULL,
		[CreateDate] [datetime] NULL,
		[LastUpdateBy] [nvarchar](50) NULL,
		[LastUpdateByName] [nvarchar](100) NULL,
		[LastUpdateDate] [datetime] NULL
	) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END

CREATE TABLE [dbo].[FluidContentGroup](
	[ID] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[Title] [nvarchar](255) NULL,	
	[Icon] [nvarchar](100) NULL,
	[Description] [nvarchar](255) NULL,
	[Status] [int] NULL,	
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL
)

ALTER TABLE FluidContentType ADD GroupID int null;
ALTER TABLE FluidContentType ADD RoleID int null;
ALTER TABLE FluidContentType ADD Icon nvarchar(100) null;


CREATE TABLE [dbo].[ArticleGallery](
	[ID] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[Title] [nvarchar](255) NULL,	
	[Description] [nvarchar](255) NULL,
	[RawData] [nvarchar](max) NULL,
	[Status] [int] NULL,	
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE TABLE [dbo].[ProductGallery](
	[ID] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[Title] [nvarchar](255) NULL,	
	[Description] [nvarchar](255) NULL,
	[RawData] [nvarchar](max) NULL,
	[Status] [int] NULL,	
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [Order] ADD ShippingOption int null;
ALTER TABLE [Order] ADD SubTotal money null;
ALTER TABLE [Order] ADD Tax money null;
ALTER TABLE [Order] ADD Shipping money null;

CREATE TABLE [dbo].[ShippingOption](
	[ID] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[Title] [nvarchar](255) NULL,	
	[Description] [nvarchar](255) NULL,
	[Price] money null,
	[Rule] nvarchar(max) null,
	[ContentID] nvarchar(100) null,
	[CultureID] int null,
	[Status] [int] NULL,	
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

DELETE FROM [Language] WHERE LanKey = N'CreatebyName' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'CreatebyName',N'zh-CN',N'创建人');

DELETE FROM [Language] WHERE LanKey = N'CreateDate' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'CreateDate',N'zh-CN',N'创建日期');

DELETE FROM [Language] WHERE LanKey = N'LastUpdateByName' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'LastUpdateByName',N'zh-CN',N'更新人');

DELETE FROM [Language] WHERE LanKey = N'LastUpdateDate' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'LastUpdateDate',N'zh-CN',N'更新日期');

DELETE FROM [Language] WHERE LanKey = N'Articles' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'Articles',N'zh-CN',N'文章');

DELETE FROM [Language] WHERE LanKey = N'Products' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'Products',N'zh-CN',N'产品');

DELETE FROM [Language] WHERE LanKey = N'Article Gallery' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'Article Gallery',N'zh-CN',N'文章组');

DELETE FROM [Language] WHERE LanKey = N'Product Gallery' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'Product Gallery',N'zh-CN',N'产品组');

DELETE FROM [Language] WHERE LanKey = N'ArticleGalleryWidget@DetailPageUrl' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'ArticleGalleryWidget@DetailPageUrl',N'zh-CN',N'详细页面');

DELETE FROM [Language] WHERE LanKey = N'ArticleGalleryWidget@ArticleGalleryId' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'ArticleGalleryWidget@ArticleGalleryId',N'zh-CN',N'文章组');

DELETE FROM [Language] WHERE LanKey = N'ProductGalleryWidget@DetailPageUrl' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'ProductGalleryWidget@DetailPageUrl',N'zh-CN',N'详细页面');

DELETE FROM [Language] WHERE LanKey = N'ProductGalleryWidget@ProductGalleryId' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'ProductGalleryWidget@ProductGalleryId',N'zh-CN',N'产品组');

DELETE FROM [Language] WHERE LanKey = N'Icon' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'Icon',N'zh-CN',N'图标');

DELETE FROM [Language] WHERE LanKey = N'Content Group' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'Content Group',N'zh-CN',N'内容分组');

DELETE FROM [Language] WHERE LanKey = N'GroupID' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'GroupID',N'zh-CN',N'分组');

DELETE FROM [Language] WHERE LanKey = N'RoleID' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'RoleID',N'zh-CN',N'角色');

DELETE FROM [Language] WHERE LanKey = N'Subtotal' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'Subtotal',N'zh-CN',N'小计');

DELETE FROM [Language] WHERE LanKey = N'Shipping' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'Shipping',N'zh-CN',N'运费');

DELETE FROM [Language] WHERE LanKey = N'Tax' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'Tax',N'zh-CN',N'税');

DELETE FROM [Language] WHERE LanKey = N'Shipping Option' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'Shipping Option',N'zh-CN',N'物流选项');

DELETE FROM [Language] WHERE LanKey = N'Contact Info' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'Contact Info',N'zh-CN',N'联系人信息');

DELETE FROM [Language] WHERE LanKey = N'Secure Payment' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'Secure Payment',N'zh-CN',N'安全支付');

DELETE FROM [Language] WHERE LanKey = N'Summary' AND CultureName = N'zh-CN';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'Summary',N'zh-CN',N'摘要');