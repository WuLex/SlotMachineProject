USE [taipuer]
GO
/************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ElevenRewardWin]    Script Date: 2020/11/13 13:31:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TEMPUR_DAZHUANPAN_USERINFO](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Time] [datetime] NOT NULL,
	[OpenId] [nvarchar](50) NOT NULL,
	[NickName] [nvarchar](50) NULL,
	[HeadImg] [nvarchar](500) NULL,
	[ShopName] [nvarchar](100) NULL,
	[City] [nvarchar](50) NULL,
	[OrderId] [nvarchar](100) NULL,
	[Amount] [int] NULL,
	[Phone] [nvarchar](50) NULL,
	[NumberOfDraws] [int] NULL,
	[Prize] [nvarchar](500) NULL,
 CONSTRAINT [PK__Tempur_D__3214EC2773D00A73] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TEMPUR_DAZHUANPAN_WINNINGRECORD](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Time] [datetime] NOT NULL,
	[OpenId] [nvarchar](50) NOT NULL,
	[CouponsCode] [nvarchar](500) NULL,
	[Prize] [nvarchar](50) NULL,
	[OrderId] [nvarchar](100) NULL,
	[WriteOffCode] [nvarchar](100) NULL,
	[WriteOffTime] [nvarchar](50) NULL,
 CONSTRAINT [PK__Tempur_D__3214EC2777A09B57] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[THREEM_MSG_IP](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[IP] [nvarchar](25) NULL,
	[Tel] [nvarchar](20) NULL,
	[RegDate] [datetime] NULL
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Basicinfo] ON 

INSERT [dbo].[Basicinfo] ([Id], [cityid], [cityname], [shopname], [orderid], [amount], [openId], [createdate], [provinceid], [provincename], [cellphone]) VALUES (1, NULL, N'法库', N'华西旗舰店', N'123456wer', CAST(70000 AS Decimal(18, 0)), N'oif30jomPl978ugIvJRspwtmSGYw', CAST(0x0000AC6200A74A8B AS DateTime), NULL, NULL, N'18234562178')
INSERT [dbo].[Basicinfo] ([Id], [cityid], [cityname], [shopname], [orderid], [amount], [openId], [createdate], [provinceid], [provincename], [cellphone]) VALUES (2, NULL, N'上海', N'外滩旗舰店', N'123456wer', CAST(56000 AS Decimal(18, 0)), N'oif30jv7GwaNDZge77qXPur0d5jE', CAST(0x0000AC6200A74A8B AS DateTime), NULL, NULL, N'18634566558')
SET IDENTITY_INSERT [dbo].[Basicinfo] OFF
SET IDENTITY_INSERT [dbo].[ElevenRewardControl] ON 

INSERT [dbo].[ElevenRewardControl] ([Id], [rangeid], [controldata], [prizeid], [prizelevel], [ischosen], [createdate]) VALUES (1, 1, N'12,1,9,8', NULL, 3, 0, CAST(0x0000AC6901288DAE AS DateTime))
INSERT [dbo].[ElevenRewardControl] ([Id], [rangeid], [controldata], [prizeid], [prizelevel], [ischosen], [createdate]) VALUES (2, 2, N'11,2,8,5', NULL, 2, 0, CAST(0x0000AC690128DB64 AS DateTime))
INSERT [dbo].[ElevenRewardControl] ([Id], [rangeid], [controldata], [prizeid], [prizelevel], [ischosen], [createdate]) VALUES (3, 3, N'5,6,10,13', NULL, 3, 0, CAST(0x0000AC690128F641 AS DateTime))
INSERT [dbo].[ElevenRewardControl] ([Id], [rangeid], [controldata], [prizeid], [prizelevel], [ischosen], [createdate]) VALUES (4, 4, N'7,9,1,6', NULL, 3, 0, CAST(0x0000AC6901292421 AS DateTime))
INSERT [dbo].[ElevenRewardControl] ([Id], [rangeid], [controldata], [prizeid], [prizelevel], [ischosen], [createdate]) VALUES (5, 5, N'3,9,5,8', NULL, 2, 0, CAST(0x0000AC69012944E4 AS DateTime))
INSERT [dbo].[ElevenRewardControl] ([Id], [rangeid], [controldata], [prizeid], [prizelevel], [ischosen], [createdate]) VALUES (6, 6, N'2,10,6,7', NULL, 1, 1, CAST(0x0000AC6B00A1675E AS DateTime))
INSERT [dbo].[ElevenRewardControl] ([Id], [rangeid], [controldata], [prizeid], [prizelevel], [ischosen], [createdate]) VALUES (7, 11, N'12,2,11,3', NULL, 2, 0, CAST(0x0000AC6B01049774 AS DateTime))
INSERT [dbo].[ElevenRewardControl] ([Id], [rangeid], [controldata], [prizeid], [prizelevel], [ischosen], [createdate]) VALUES (8, 7, N'12,2,11,4', NULL, 2, 0, CAST(0x0000AC6B01049754 AS DateTime))
INSERT [dbo].[ElevenRewardControl] ([Id], [rangeid], [controldata], [prizeid], [prizelevel], [ischosen], [createdate]) VALUES (9, 8, N'12,2,11,5', NULL, 3, 0, CAST(0x0000AC6B00E3A1D4 AS DateTime))
INSERT [dbo].[ElevenRewardControl] ([Id], [rangeid], [controldata], [prizeid], [prizelevel], [ischosen], [createdate]) VALUES (10, 9, N'12,4,11,5', NULL, 2, 0, CAST(0x0000AC6F01360794 AS DateTime))
SET IDENTITY_INSERT [dbo].[ElevenRewardControl] OFF
SET IDENTITY_INSERT [dbo].[ElevenRewardInfo] ON 

INSERT [dbo].[ElevenRewardInfo] ([Id], [prizelevel], [prizevalue], [prizedesc], [prizenumber], [winproductid], [status], [createdate]) VALUES (1, 1, N'12,1,9,8', N'一等奖', 100, 1, 1, CAST(0x0000AC6E00AF2713 AS DateTime))
INSERT [dbo].[ElevenRewardInfo] ([Id], [prizelevel], [prizevalue], [prizedesc], [prizenumber], [winproductid], [status], [createdate]) VALUES (2, 2, N'5,6,10,13', N'二等奖', 500, 2, 1, CAST(0x0000AC6E00AF8DA1 AS DateTime))
INSERT [dbo].[ElevenRewardInfo] ([Id], [prizelevel], [prizevalue], [prizedesc], [prizenumber], [winproductid], [status], [createdate]) VALUES (3, 3, N'2,11,9,7', N'三等奖', 100, 11, 1, CAST(0x0000AC700103DB7E AS DateTime))
SET IDENTITY_INSERT [dbo].[ElevenRewardInfo] OFF
SET IDENTITY_INSERT [dbo].[ElevenRewardWin] ON 

INSERT [dbo].[ElevenRewardWin] ([Id], [pidsquence], [prizeid], [reel1], [reel2], [reel3], [reel4], [status], [openid], [operatorid], [createdate]) VALUES (26, N'2,10,6,7', N'1         ', NULL, NULL, NULL, NULL, 1, NULL, N'EFCCEFDA7C8C4DA8B5EB82DB51A8F2C9', CAST(0x0000AC6E00DFBF41 AS DateTime))
SET IDENTITY_INSERT [dbo].[ElevenRewardWin] OFF
SET IDENTITY_INSERT [dbo].[OrderItem] ON 

INSERT [dbo].[OrderItem] ([Id], [orderid], [Openid], [productvals], [product1], [product2], [product3], [product4], [createtime]) VALUES (1, N'', N'oif30jomPl978ugIvJRspwtmSGYw', N'7,8,9,3', 7, 8, 9, 3, CAST(0x0000AC6B00A5793A AS DateTime))
INSERT [dbo].[OrderItem] ([Id], [orderid], [Openid], [productvals], [product1], [product2], [product3], [product4], [createtime]) VALUES (2, N'', N'oif30jv7GwaNDZge77qXPur0d5jE', N'2,10,6,7', 7, 8, 9, 3, CAST(0x0000AC6B00A5923F AS DateTime))
SET IDENTITY_INSERT [dbo].[OrderItem] OFF
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [productid], [productname], [status], [prodesc], [imgurl], [imgurltwo], [gameimgurl], [createdate]) VALUES (1, 1, N'千禧枕', 1, N'', N'images/list11.png', N'images/list11-1.png', N'images/game1.png', CAST(0x0000AC6200BBFD45 AS DateTime))
INSERT [dbo].[Products] ([Id], [productid], [productname], [status], [prodesc], [imgurl], [imgurltwo], [gameimgurl], [createdate]) VALUES (2, 2, N'床垫保护套', 1, N'', N'images/list12.png', N'images/list12-1.png', N'images/game2.png', CAST(0x0000AC6200BBFD45 AS DateTime))
INSERT [dbo].[Products] ([Id], [productid], [productname], [status], [prodesc], [imgurl], [imgurltwo], [gameimgurl], [createdate]) VALUES (3, 3, N'感温床垫', 1, N'', N'images/list13.png', N'images/list13-1.png', N'images/game3.png', CAST(0x0000AC6200BBFD45 AS DateTime))
INSERT [dbo].[Products] ([Id], [productid], [productname], [status], [prodesc], [imgurl], [imgurltwo], [gameimgurl], [createdate]) VALUES (4, 4, N'感温枕', 1, N'', N'images/list14.png', N'images/list14-1.png', N'images/game4.png', CAST(0x0000AC6200BBFD45 AS DateTime))
INSERT [dbo].[Products] ([Id], [productid], [productname], [status], [prodesc], [imgurl], [imgurltwo], [gameimgurl], [createdate]) VALUES (5, 5, N'馨尚床垫', 1, N'', N'images/list15.png', N'images/list15-1.png', N'images/game5.png', CAST(0x0000AC6200BBFD45 AS DateTime))
INSERT [dbo].[Products] ([Id], [productid], [productname], [status], [prodesc], [imgurl], [imgurltwo], [gameimgurl], [createdate]) VALUES (6, 6, N'床用靠垫', 1, N'', N'images/list16.png', N'images/list16-1.png', N'images/game6.png', CAST(0x0000AC6200BBFD45 AS DateTime))
INSERT [dbo].[Products] ([Id], [productid], [productname], [status], [prodesc], [imgurl], [imgurltwo], [gameimgurl], [createdate]) VALUES (7, 7, N'40+电动床', 1, N'', N'images/list17.png', N'images/list17-1.png', N'images/game7.png', CAST(0x0000AC6200BBFD45 AS DateTime))
INSERT [dbo].[Products] ([Id], [productid], [productname], [status], [prodesc], [imgurl], [imgurltwo], [gameimgurl], [createdate]) VALUES (8, 8, N'臻享床垫', 1, N'', N'images/list18.png', N'images/list18-1.png', N'images/game8.png', CAST(0x0000AC6200BBFD45 AS DateTime))
INSERT [dbo].[Products] ([Id], [productid], [productname], [status], [prodesc], [imgurl], [imgurltwo], [gameimgurl], [createdate]) VALUES (9, 9, N'极光床垫', 1, N'', N'images/list19.png', N'images/list19-1.png', N'images/game9.png', CAST(0x0000AC6200BBFD45 AS DateTime))
INSERT [dbo].[Products] ([Id], [productid], [productname], [status], [prodesc], [imgurl], [imgurltwo], [gameimgurl], [createdate]) VALUES (10, 10, N'云雾床垫', 1, N'', N'images/list20.png', N'images/list20-1.png', N'images/game10.png', CAST(0x0000AC6200BBFD45 AS DateTime))
INSERT [dbo].[Products] ([Id], [productid], [productname], [status], [prodesc], [imgurl], [imgurltwo], [gameimgurl], [createdate]) VALUES (11, 11, N'圈枕', 1, N'', N'images/list21.png', N'images/list21-1.png', N'images/game11.png', CAST(0x0000AC6200BBFD45 AS DateTime))
INSERT [dbo].[Products] ([Id], [productid], [productname], [status], [prodesc], [imgurl], [imgurltwo], [gameimgurl], [createdate]) VALUES (12, 12, N'舒适床垫', 1, N'', N'images/list22.png', N'images/list22-1.png', N'images/game12.png', CAST(0x0000AC6200BBFD45 AS DateTime))
INSERT [dbo].[Products] ([Id], [productid], [productname], [status], [prodesc], [imgurl], [imgurltwo], [gameimgurl], [createdate]) VALUES (13, 13, N'云雾枕', 1, N'', N'images/list23.png', N'images/list23-1.png', N'images/game13.png', CAST(0x0000AC6200BBFD45 AS DateTime))
INSERT [dbo].[Products] ([Id], [productid], [productname], [status], [prodesc], [imgurl], [imgurltwo], [gameimgurl], [createdate]) VALUES (14, 14, N'微风枕', 1, N'', N'images/list24.png', N'images/list24-1.png', N'images/game14.png', CAST(0x0000AC6200BBFD45 AS DateTime))
SET IDENTITY_INSERT [dbo].[Products] OFF
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
