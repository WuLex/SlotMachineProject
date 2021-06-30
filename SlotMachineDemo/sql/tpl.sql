USE [LmDB]
GO
/************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Basicinfo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[cityid] [int] NULL,
	[cityname] [nvarchar](100) NULL,
	[shopname] [nvarchar](100) NULL,
	[orderid] [varchar](50) NULL,
	[amount] [decimal](18, 0) NULL,
	[openId] [varchar](50) NULL,
	[createdate] [datetime] NULL,
	[provinceid] [varchar](50) NULL,
	[provincename] [nvarchar](100) NULL,
	[cellphone] [varchar](20) NULL,
 CONSTRAINT [PK_basicinfo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ElevenRewardControl](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[rangeid] [int] NULL,
	[controldata] [varchar](100) NULL,
	[prizeid] [int] NULL,
	[prizelevel] [int] NULL,
	[ischosen] [int] NULL,
	[createdate] [datetime] NULL,
 CONSTRAINT [PK_RewardControl] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ElevenRewardInfo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[prizelevel] [int] NULL,
	[prizevalue] [varchar](50) NULL,
	[prizedesc] [nvarchar](100) NULL,
	[prizenumber] [int] NULL,
	[winproductid] [int] NULL,
	[status] [int] NULL,
	[createdate] [datetime] NOT NULL,
 CONSTRAINT [PK_RewardInfo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ElevenRewardLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_ElevenRewardLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ElevenRewardWin](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[pidsquence] [varchar](100) NULL,
	[prizeid] [nchar](10) NULL,
	[reel1] [varchar](50) NULL,
	[reel2] [varchar](50) NULL,
	[reel3] [varchar](50) NULL,
	[reel4] [varchar](50) NULL,
	[status] [int] NULL,
	[openid] [varchar](50) NULL,
	[operatorid] [varchar](50) NULL,
	[createdate] [datetime] NULL,
 CONSTRAINT [PK_DoubleElevenReward] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItem](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[orderid] [varchar](50) NULL,
	[Openid] [varchar](50) NULL,
	[productvals] [varchar](50) NULL,
	[product1] [int] NULL,
	[product2] [int] NULL,
	[product3] [int] NULL,
	[product4] [int] NULL,
	[createtime] [datetime] NULL,
 CONSTRAINT [PK_orderItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[productid] [int] NULL,
	[productname] [nvarchar](50) NULL,
	[status] [int] NULL,
	[prodesc] [nvarchar](200) NULL,
	[imgurl] [nvarchar](100) NULL,
	[imgurltwo] [nvarchar](100) NULL,
	[gameimgurl] [nvarchar](100) NULL,
	[createdate] [datetime] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Basicinfo] ADD  CONSTRAINT [DF_basicinfo_createdate]  DEFAULT (getdate()) FOR [createdate]
GO
ALTER TABLE [dbo].[ElevenRewardControl] ADD  CONSTRAINT [DF_ElevenRewardControl_createdate]  DEFAULT (getdate()) FOR [createdate]
GO
ALTER TABLE [dbo].[ElevenRewardInfo] ADD  CONSTRAINT [DF_RewardInfo_createdate]  DEFAULT (getdate()) FOR [createdate]
GO
ALTER TABLE [dbo].[ElevenRewardWin] ADD  CONSTRAINT [DF_DoubleElevenReward_createdate]  DEFAULT (getdate()) FOR [createdate]
GO
ALTER TABLE [dbo].[OrderItem] ADD  CONSTRAINT [DF_orderItem_createtime]  DEFAULT (getdate()) FOR [createtime]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_createdate]  DEFAULT (getdate()) FOR [createdate]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'奖品描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ElevenRewardInfo', @level2type=N'COLUMN',@level2name=N'prizedesc'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'奖品状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ElevenRewardInfo', @level2type=N'COLUMN',@level2name=N'status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'对应的签注序列' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ElevenRewardWin', @level2type=N'COLUMN',@level2name=N'pidsquence'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'此签注序列对应的奖品信息的ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ElevenRewardWin', @level2type=N'COLUMN',@level2name=N'prizeid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'签注结果页需要的图片' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'imgurltwo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'摇奖机需要用的图片' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'gameimgurl'
GO
