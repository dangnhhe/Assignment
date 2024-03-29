USE [master]
GO
/****** Object:  Database [Cinema]    Script Date: 8/7/2022 10:55:38 AM ******/
CREATE DATABASE [Cinema]
USE [Cinema]
GO
/****** Object:  User [new]    Script Date: 8/7/2022 10:55:38 AM ******/
CREATE USER [new] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Bookings]    Script Date: 8/7/2022 10:55:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bookings](
	[BookingID] [int] IDENTITY(1,1) NOT NULL,
	[ShowID] [int] NOT NULL,
	[SeatStatus] [nchar](1000) NULL,
	[Amount] [money] NULL,
	[user_id] [int] NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_Bookings] PRIMARY KEY CLUSTERED 
(
	[BookingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Countries]    Script Date: 8/7/2022 10:55:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[CountryCode] [nchar](3) NOT NULL,
	[CountryName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[CountryCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Films]    Script Date: 8/7/2022 10:55:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Films](
	[FilmID] [int] IDENTITY(1,1) NOT NULL,
	[GenreID] [int] NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Year] [int] NOT NULL,
	[CountryCode] [nchar](3) NOT NULL,
	[img] [ntext] NULL,
	[trailer] [ntext] NULL,
 CONSTRAINT [PK_Films] PRIMARY KEY CLUSTERED 
(
	[FilmID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genres]    Script Date: 8/7/2022 10:55:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genres](
	[GenreID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Genres] PRIMARY KEY CLUSTERED 
(
	[GenreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rooms]    Script Date: 8/7/2022 10:55:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rooms](
	[RoomID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
 CONSTRAINT [PK_Rooms] PRIMARY KEY CLUSTERED 
(
	[RoomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Seat]    Script Date: 8/7/2022 10:55:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Seat](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shows]    Script Date: 8/7/2022 10:55:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shows](
	[ShowID] [int] IDENTITY(1,1) NOT NULL,
	[RoomID] [int] NOT NULL,
	[FilmID] [int] NOT NULL,
	[ShowDate] [date] NULL,
	[Price] [money] NULL,
	[Status] [bit] NULL,
	[SlotId] [int] NULL,
 CONSTRAINT [PK_Shows] PRIMARY KEY CLUSTERED 
(
	[ShowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[slide]    Script Date: 8/7/2022 10:55:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[slide](
	[slide_id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](50) NULL,
	[img] [ntext] NULL,
	[backlink] [ntext] NULL,
	[description] [ntext] NULL,
	[active] [bit] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slot]    Script Date: 8/7/2022 10:55:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slot](
	[id] [int] NULL,
	[Time] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user]    Script Date: 8/7/2022 10:55:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[fullname] [nvarchar](50) NULL,
	[email] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[gender] [bit] NULL,
	[phone] [nchar](11) NULL,
	[address] [nvarchar](100) NULL,
	[role] [int] NULL,
	[active] [bit] NULL,
	[key] [nvarchar](50) NULL,
	[avatar] [ntext] NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Bookings] ON 

INSERT [dbo].[Bookings] ([BookingID], [ShowID], [SeatStatus], [Amount], [user_id], [status]) VALUES (1, 55, N'A1                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', 7.0000, NULL, 1)
INSERT [dbo].[Bookings] ([BookingID], [ShowID], [SeatStatus], [Amount], [user_id], [status]) VALUES (2, 104, N'A2                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', 30.0000, NULL, 1)
INSERT [dbo].[Bookings] ([BookingID], [ShowID], [SeatStatus], [Amount], [user_id], [status]) VALUES (3, 104, N'A2                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', 55000.0000, NULL, 1)
INSERT [dbo].[Bookings] ([BookingID], [ShowID], [SeatStatus], [Amount], [user_id], [status]) VALUES (4, 59, N'A3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', 40.0000, 1, 0)
INSERT [dbo].[Bookings] ([BookingID], [ShowID], [SeatStatus], [Amount], [user_id], [status]) VALUES (5, 59, N'B4                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', 40.0000, 1, 0)
INSERT [dbo].[Bookings] ([BookingID], [ShowID], [SeatStatus], [Amount], [user_id], [status]) VALUES (6, 59, N'B5                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', 40.0000, NULL, 1)
INSERT [dbo].[Bookings] ([BookingID], [ShowID], [SeatStatus], [Amount], [user_id], [status]) VALUES (7, 59, N'A6                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', 40.0000, NULL, 1)
INSERT [dbo].[Bookings] ([BookingID], [ShowID], [SeatStatus], [Amount], [user_id], [status]) VALUES (8, 59, N'A1                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', 55000.0000, 1, 0)
INSERT [dbo].[Bookings] ([BookingID], [ShowID], [SeatStatus], [Amount], [user_id], [status]) VALUES (9, 105, N'A1                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', 55000.0000, 1, 1)
INSERT [dbo].[Bookings] ([BookingID], [ShowID], [SeatStatus], [Amount], [user_id], [status]) VALUES (10, 105, N'B5                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', 55000.0000, 1, 1)
INSERT [dbo].[Bookings] ([BookingID], [ShowID], [SeatStatus], [Amount], [user_id], [status]) VALUES (11, 105, N'C6                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', 55000.0000, 1, 1)
INSERT [dbo].[Bookings] ([BookingID], [ShowID], [SeatStatus], [Amount], [user_id], [status]) VALUES (1010, 56, N'B6                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', 6.0000, 1, 1)
INSERT [dbo].[Bookings] ([BookingID], [ShowID], [SeatStatus], [Amount], [user_id], [status]) VALUES (1024, 56, N'B5                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', 60000.0000, 2, 1)
INSERT [dbo].[Bookings] ([BookingID], [ShowID], [SeatStatus], [Amount], [user_id], [status]) VALUES (1025, 56, N'B6                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', 60000.0000, 2, 1)
INSERT [dbo].[Bookings] ([BookingID], [ShowID], [SeatStatus], [Amount], [user_id], [status]) VALUES (1026, 56, N'B7                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', 60000.0000, 2, 1)
INSERT [dbo].[Bookings] ([BookingID], [ShowID], [SeatStatus], [Amount], [user_id], [status]) VALUES (1027, 105, N'B5                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', 75000.0000, 2, 1)
INSERT [dbo].[Bookings] ([BookingID], [ShowID], [SeatStatus], [Amount], [user_id], [status]) VALUES (1028, 105, N'B6                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', 75000.0000, 2, 1)
INSERT [dbo].[Bookings] ([BookingID], [ShowID], [SeatStatus], [Amount], [user_id], [status]) VALUES (1029, 105, N'B7                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', 75000.0000, 2, 1)
INSERT [dbo].[Bookings] ([BookingID], [ShowID], [SeatStatus], [Amount], [user_id], [status]) VALUES (1030, 59, N'B5                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', 55000.0000, 2, 1)
INSERT [dbo].[Bookings] ([BookingID], [ShowID], [SeatStatus], [Amount], [user_id], [status]) VALUES (1031, 59, N'B6                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', 55000.0000, 2, 1)
INSERT [dbo].[Bookings] ([BookingID], [ShowID], [SeatStatus], [Amount], [user_id], [status]) VALUES (1032, 59, N'B7                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', 55000.0000, 2, 1)
INSERT [dbo].[Bookings] ([BookingID], [ShowID], [SeatStatus], [Amount], [user_id], [status]) VALUES (1043, 104, N'B5                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', 55000.0000, 1, 1)
INSERT [dbo].[Bookings] ([BookingID], [ShowID], [SeatStatus], [Amount], [user_id], [status]) VALUES (1044, 104, N'C6                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', 55000.0000, 1, 1)
INSERT [dbo].[Bookings] ([BookingID], [ShowID], [SeatStatus], [Amount], [user_id], [status]) VALUES (1045, 104, N'C7                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', 55000.0000, 1, 1)
INSERT [dbo].[Bookings] ([BookingID], [ShowID], [SeatStatus], [Amount], [user_id], [status]) VALUES (1046, 104, N'C8                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', 55000.0000, 1, 1)
INSERT [dbo].[Bookings] ([BookingID], [ShowID], [SeatStatus], [Amount], [user_id], [status]) VALUES (1047, 55, N'B5                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', 60000.0000, 1, 1)
INSERT [dbo].[Bookings] ([BookingID], [ShowID], [SeatStatus], [Amount], [user_id], [status]) VALUES (1048, 55, N'B6                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', 60000.0000, 1, 1)
INSERT [dbo].[Bookings] ([BookingID], [ShowID], [SeatStatus], [Amount], [user_id], [status]) VALUES (1049, 55, N'B7                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', 60000.0000, 1, 1)
SET IDENTITY_INSERT [dbo].[Bookings] OFF
GO
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'ABW', N'Aruba')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'AFG', N'Afghanistan')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'AGO', N'Angola')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'AIA', N'Anguilla')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'ALB', N'Albania')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'AND', N'Andorra')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'ANT', N'Netherlands Antilles')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'ARE', N'United Arab Emirates')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'ARG', N'Argentina')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'ARM', N'Armenia')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'ASM', N'American Samoa')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'ATA', N'Antarctica')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'ATG', N'Antigua and Barbuda')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'AUS', N'Australia')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'AUT', N'Austria')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'AZE', N'Azerbaijan')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'BDI', N'Burundi')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'BEL', N'Belgium')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'BEN', N'Benin')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'BFA', N'Burkina Faso')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'BGD', N'Bangladesh')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'BGR', N'Bulgaria')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'BHR', N'Bahrain')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'BHS', N'Bahamas')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'BIH', N'Bosnia and Herzegovina')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'BLM', N'Saint Barthelemy')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'BLR', N'Belarus')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'BLZ', N'Belize')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'BMU', N'Bermuda')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'BOL', N'Bolivia')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'BRA', N'Brazil')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'BRB', N'Barbados')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'BRN', N'Brunei')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'BTN', N'Bhutan')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'BWA', N'Botswana')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'CAF', N'Central African Republic')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'CAN', N'Canada')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'CCK', N'Cocos (Keeling) Islands')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'CHE', N'Switzerland')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'CHL', N'Chile')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'CHN', N'China')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'CIV', N'Ivory Coast')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'CMR', N'Cameroon')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'COD', N'Democratic Republic of the Congo')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'COG', N'Republic of the Congo')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'COK', N'Cook Islands')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'COL', N'Colombia')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'COM', N'Comoros')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'CPV', N'Cape Verde')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'CRC', N'Costa Rica')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'CUB', N'Cuba')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'CXR', N'Christmas Island')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'CYM', N'Cayman Islands')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'CYP', N'Cyprus')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'CZE', N'Czech Republic')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'DEU', N'Germany')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'DJI', N'Djibouti')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'DMA', N'Dominica')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'DNK', N'Denmark')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'DOM', N'Dominican Republic')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'DZA', N'Algeria')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'ECU', N'Ecuador')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'EGY', N'Egypt')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'ERI', N'Eritrea')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'ESH', N'Western Sahara')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'ESP', N'Spain')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'EST', N'Estonia')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'ETH', N'Ethiopia')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'FIN', N'Finland')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'FJI', N'Fiji')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'FLK', N'Falkland Islands')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'FRA', N'France')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'FRO', N'Faroe Islands')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'FSM', N'Micronesia')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'GAB', N'Gabon')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'GBR', N'United Kingdom')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'GEO', N'Georgia')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'GHA', N'Ghana')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'GIB', N'Gibraltar')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'GIN', N'Guinea')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'GMB', N'Gambia')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'GNB', N'Guinea-Bissau')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'GNQ', N'Equatorial Guinea')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'GRC', N'Greece')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'GRD', N'Grenada')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'GRL', N'Greenland')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'GTM', N'Guatemala')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'GUM', N'Guam')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'GUY', N'Guyana')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'HKG', N'Hong Kong')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'HND', N'Honduras')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'HRV', N'Croatia')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'HTI', N'Haiti')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'HUN', N'Hungary')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'IDN', N'Indonesia')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'IMN', N'Isle of Man')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'IND', N'India')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'IOT', N'British Indian Ocean Territory')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'IRL', N'Ireland')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'IRN', N'Iran')
GO
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'IRQ', N'Iraq')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'ISR', N'Israel')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'ITA', N'Italy')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'JAM', N'Jamaica')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'JEY', N'Jersey')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'JOR', N'Jordan')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'JPN', N'Japan')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'KAZ', N'Kazakhstan')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'KEN', N'Kenya')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'KGZ', N'Kyrgyzstan')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'KHM', N'Cambodia')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'KIR', N'Kiribati')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'KNA', N'Saint Kitts and Nevis')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'KOR', N'South Korea')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'KWT', N'Kuwait')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'LAO', N'Laos')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'LBN', N'Lebanon')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'LBR', N'Liberia')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'LBY', N'Libya')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'LCA', N'Saint Lucia')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'LIE', N'Liechtenstein')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'LKA', N'Sri Lanka')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'LSO', N'Lesotho')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'LTU', N'Lithuania')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'LUX', N'Luxembourg')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'LVA', N'Latvia')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'MAC', N'Macau')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'MAF', N'Saint Martin')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'MAR', N'Morocco')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'MCO', N'Monaco')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'MDA', N'Moldova')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'MDG', N'Madagascar')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'MDV', N'Maldives')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'MEX', N'Mexico')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'MHL', N'Marshall Islands')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'MKD', N'Macedonia')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'MLI', N'Mali')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'MLT', N'Malta')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'MMR', N'Burma (Myanmar)')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'MNE', N'Montenegro')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'MNG', N'Mongolia')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'MNP', N'Northern Mariana Islands')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'MOZ', N'Mozambique')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'MRT', N'Mauritania')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'MSR', N'Montserrat')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'MUS', N'Mauritius')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'MWI', N'Malawi')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'MYS', N'Malaysia')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'MYT', N'Mayotte')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'NAM', N'Namibia')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'NCL', N'New Caledonia')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'NER', N'Niger')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'NFK', N'Norfolk Island')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'NGA', N'Nigeria')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'NIC', N'Nicaragua')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'NIU', N'Niue')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'NLD', N'Netherlands')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'NOR', N'Norway')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'NPL', N'Nepal')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'NRU', N'Nauru')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'NZL', N'New Zealand')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'OMN', N'Oman')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'PAK', N'Pakistan')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'PAN', N'Panama')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'PCN', N'Pitcairn Islands')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'PER', N'Peru')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'PHL', N'Philippines')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'PLW', N'Palau')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'PNG', N'Papua New Guinea')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'POL', N'Poland')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'PRI', N'Puerto Rico')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'PRK', N'North Korea')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'PRT', N'Portugal')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'PRY', N'Paraguay')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'PYF', N'French Polynesia')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'QAT', N'Qatar')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'ROU', N'Romania')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'RUS', N'Russia')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'RWA', N'Rwanda')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'SAU', N'Saudi Arabia')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'SDN', N'Sudan')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'SEN', N'Senegal')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'SGP', N'Singapore')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'SHN', N'Saint Helena')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'SJM', N'Svalbard')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'SLB', N'Solomon Islands')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'SLE', N'Sierra Leone')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'SLV', N'El Salvador')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'SMR', N'San Marino')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'SOM', N'Somalia')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'SPM', N'Saint Pierre and Miquelon')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'SRB', N'Serbia')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'STP', N'Sao Tome and Principe')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'SUR', N'Suriname')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'SVK', N'Slovakia')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'SVN', N'Slovenia')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'SWE', N'Sweden')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'SWZ', N'Swaziland')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'SYC', N'Seychelles')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'SYR', N'Syria')
GO
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'TCA', N'Turks and Caicos Islands')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'TCD', N'Chad')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'TGO', N'Togo')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'THA', N'Thailand')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'TJK', N'Tajikistan')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'TKL', N'Tokelau')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'TKM', N'Turkmenistan')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'TLS', N'Timor-Leste')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'TON', N'Tonga')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'TTO', N'Trinidad and Tobago')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'TUN', N'Tunisia')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'TUR', N'Turkey')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'TUV', N'Tuvalu')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'TWN', N'Taiwan')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'TZA', N'Tanzania')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'UGA', N'Uganda')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'UKR', N'Ukraine')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'URY', N'Uruguay')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'USA', N'United States')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'UZB', N'Uzbekistan')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'VAT', N'Holy See (Vatican City)')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'VCT', N'Saint Vincent and the Grenadines')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'VEN', N'Venezuela')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'VGB', N'British Virgin Islands')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'VIR', N'US Virgin Islands')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'VNM', N'Vietnam')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'VUT', N'Vanuatu')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'WLF', N'Wallis and Futuna')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'WSM', N'Samoa')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'YEM', N'Yemen')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'ZAF', N'South Africa')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'ZMB', N'Zambia')
INSERT [dbo].[Countries] ([CountryCode], [CountryName]) VALUES (N'ZWE', N'Zimbabwe')
GO
SET IDENTITY_INSERT [dbo].[Films] ON 

INSERT [dbo].[Films] ([FilmID], [GenreID], [Title], [Year], [CountryCode], [img], [trailer]) VALUES (1, 4, N' Minions the rise of gru', 2022, N'USA', N'./img/minions_2_-_kc_01.7.22_1__1.jpg', N'<iframe width="800" height="450" src="https://www.youtube.com/embed/6DxjJzmYsXo" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>')
INSERT [dbo].[Films] ([FilmID], [GenreID], [Title], [Year], [CountryCode], [img], [trailer]) VALUES (2, 1, N'Thor: Love and Thunder', 2022, N'USA', N'./img/thor-main-poster_1_.jpg', N'<iframe width="800" height="450" src="https://www.youtube.com/embed/Go8nTmfrQd8" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>')
INSERT [dbo].[Films] ([FilmID], [GenreID], [Title], [Year], [CountryCode], [img], [trailer]) VALUES (3, 9, N'Paws of Fury: The Legend of Hank', 2022, N'USA', N'./img/poster_mpvm_4_1_.jpg', N'<iframe width="800" height="450" src="https://www.youtube.com/embed/hDu-BJQUiTE" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>')
INSERT [dbo].[Films] ([FilmID], [GenreID], [Title], [Year], [CountryCode], [img], [trailer]) VALUES (4, 1, N'God father II                                                                                       ', 2018, N'USA', N'./img/poster_700_x_1000_px_.jpg', N'<iframe width="800" height="450" src="https://www.youtube.com/embed/9O1Iy9od7-A" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>')
INSERT [dbo].[Films] ([FilmID], [GenreID], [Title], [Year], [CountryCode], [img], [trailer]) VALUES (7, 3, N'The Scraw', 2019, N'USA', N'./img/700-x-1000-px.jpg', N'<iframe width="800" height="450" src="https://www.youtube.com/embed/EGeJczJvWns" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
')
INSERT [dbo].[Films] ([FilmID], [GenreID], [Title], [Year], [CountryCode], [img], [trailer]) VALUES (9, 4, N'Dragon ball', 2018, N'USA', N'./img/2._dbssh_poster_2.jpg', N'<iframe width="800" height="450" src="https://www.youtube.com/embed/tcOxhTpu84w" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>')
INSERT [dbo].[Films] ([FilmID], [GenreID], [Title], [Year], [CountryCode], [img], [trailer]) VALUES (10, 1, N'Avatar', 2010, N'USA', N'./img/avatar_2__teaser_poster_1__2.jpg', N'<iframe width="800" height="450" src="https://www.youtube.com/embed/a8Gx8wiNbs8" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
')
INSERT [dbo].[Films] ([FilmID], [GenreID], [Title], [Year], [CountryCode], [img], [trailer]) VALUES (11, 4, N'Pororo and friend', 2022, N'USA', N'./img/pororo_dinosaur_island_adventure-_vietnamese_poster_1_.jpg', N'<iframe width="800" height="450" src="https://www.youtube.com/embed/tcOxhTpu84w" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>')
INSERT [dbo].[Films] ([FilmID], [GenreID], [Title], [Year], [CountryCode], [img], [trailer]) VALUES (12, 9, N'Top Gun Maverick', 2020, N'ESP', N'./img/top_gun_maverick_-_poster_28.03_1__2.jpg', N'<iframe width="800" height="450" src="https://www.youtube.com/embed/giXco2jaZ_4" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>')
INSERT [dbo].[Films] ([FilmID], [GenreID], [Title], [Year], [CountryCode], [img], [trailer]) VALUES (13, 1, N'Black Adam', 2022, N'ESP', N'./img/poster_black_adam_1__2.jpg', N'<iframe width="800" height="450" src="https://www.youtube.com/embed/Fva_W_AF0IM" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
')
INSERT [dbo].[Films] ([FilmID], [GenreID], [Title], [Year], [CountryCode], [img], [trailer]) VALUES (15, 4, N'Connan', 2020, N'ESP', N'./img/conan_movie_2022-_vnese_poster_1_.jpg', N'<iframe width="800" height="450" src="https://www.youtube.com/embed/kOh1OTokLCk" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>')
INSERT [dbo].[Films] ([FilmID], [GenreID], [Title], [Year], [CountryCode], [img], [trailer]) VALUES (17, 9, N'Mogadishu', 2021, N'ESP', N'./img/main_poster_tho_t_kh_i_mogadishu_1_.jpg', N'<iframe width="800" height="450" src="https://www.youtube.com/embed/EGeJczJvWns" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
')
INSERT [dbo].[Films] ([FilmID], [GenreID], [Title], [Year], [CountryCode], [img], [trailer]) VALUES (23, 4, N'Bullet train', 2022, N'USA', N'./img/bt_poster_lk3_1080x1350_1_.jpg', N'<iframe width="800" height="450" src="https://www.youtube.com/embed/EGeJczJvWns" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
')
SET IDENTITY_INSERT [dbo].[Films] OFF
GO
SET IDENTITY_INSERT [dbo].[Genres] ON 

INSERT [dbo].[Genres] ([GenreID], [Name]) VALUES (1, N'Action                                            ')
INSERT [dbo].[Genres] ([GenreID], [Name]) VALUES (2, N'Adventure                                         ')
INSERT [dbo].[Genres] ([GenreID], [Name]) VALUES (3, N'Business                                          ')
INSERT [dbo].[Genres] ([GenreID], [Name]) VALUES (4, N'Children''s/Family                                 ')
INSERT [dbo].[Genres] ([GenreID], [Name]) VALUES (5, N'Comedy                                            ')
INSERT [dbo].[Genres] ([GenreID], [Name]) VALUES (6, N'Comedy Drama                                      ')
INSERT [dbo].[Genres] ([GenreID], [Name]) VALUES (7, N'Crime                                             ')
INSERT [dbo].[Genres] ([GenreID], [Name]) VALUES (8, N'Culture & Socienty                                ')
INSERT [dbo].[Genres] ([GenreID], [Name]) VALUES (9, N'Drama                                             ')
INSERT [dbo].[Genres] ([GenreID], [Name]) VALUES (10, N'Education                                         ')
INSERT [dbo].[Genres] ([GenreID], [Name]) VALUES (11, N'Family & Personal Relationship                    ')
INSERT [dbo].[Genres] ([GenreID], [Name]) VALUES (12, N'Helth & Fitness                                   ')
INSERT [dbo].[Genres] ([GenreID], [Name]) VALUES (13, N'Historical Film                                   ')
SET IDENTITY_INSERT [dbo].[Genres] OFF
GO
SET IDENTITY_INSERT [dbo].[Rooms] ON 

INSERT [dbo].[Rooms] ([RoomID], [Name]) VALUES (1, N'Theatre A                                                                                           ')
INSERT [dbo].[Rooms] ([RoomID], [Name]) VALUES (2, N'Theatre B                                                                                           ')
INSERT [dbo].[Rooms] ([RoomID], [Name]) VALUES (3, N'Theatre C                                                                                           ')
SET IDENTITY_INSERT [dbo].[Rooms] OFF
GO
SET IDENTITY_INSERT [dbo].[Seat] ON 

INSERT [dbo].[Seat] ([id], [name]) VALUES (1, N'A1        ')
INSERT [dbo].[Seat] ([id], [name]) VALUES (2, N'A2        ')
INSERT [dbo].[Seat] ([id], [name]) VALUES (3, N'A3        ')
INSERT [dbo].[Seat] ([id], [name]) VALUES (4, N'A4        ')
INSERT [dbo].[Seat] ([id], [name]) VALUES (5, N'A5        ')
INSERT [dbo].[Seat] ([id], [name]) VALUES (6, N'A6        ')
INSERT [dbo].[Seat] ([id], [name]) VALUES (7, N'A7        ')
INSERT [dbo].[Seat] ([id], [name]) VALUES (8, N'A8        ')
INSERT [dbo].[Seat] ([id], [name]) VALUES (9, N'A9        ')
INSERT [dbo].[Seat] ([id], [name]) VALUES (10, N'A10       ')
INSERT [dbo].[Seat] ([id], [name]) VALUES (11, N'B1        ')
INSERT [dbo].[Seat] ([id], [name]) VALUES (12, N'B2        ')
INSERT [dbo].[Seat] ([id], [name]) VALUES (13, N'B3        ')
INSERT [dbo].[Seat] ([id], [name]) VALUES (14, N'B4        ')
INSERT [dbo].[Seat] ([id], [name]) VALUES (15, N'B5        ')
INSERT [dbo].[Seat] ([id], [name]) VALUES (16, N'B6        ')
INSERT [dbo].[Seat] ([id], [name]) VALUES (17, N'B7        ')
INSERT [dbo].[Seat] ([id], [name]) VALUES (18, N'B8        ')
INSERT [dbo].[Seat] ([id], [name]) VALUES (19, N'B9        ')
INSERT [dbo].[Seat] ([id], [name]) VALUES (20, N'B10       ')
INSERT [dbo].[Seat] ([id], [name]) VALUES (21, N'C1        ')
INSERT [dbo].[Seat] ([id], [name]) VALUES (22, N'C2        ')
INSERT [dbo].[Seat] ([id], [name]) VALUES (23, N'C3        ')
INSERT [dbo].[Seat] ([id], [name]) VALUES (24, N'C4        ')
INSERT [dbo].[Seat] ([id], [name]) VALUES (25, N'C5        ')
INSERT [dbo].[Seat] ([id], [name]) VALUES (26, N'C6        ')
INSERT [dbo].[Seat] ([id], [name]) VALUES (27, N'C7        ')
INSERT [dbo].[Seat] ([id], [name]) VALUES (28, N'C8        ')
INSERT [dbo].[Seat] ([id], [name]) VALUES (29, N'C9        ')
INSERT [dbo].[Seat] ([id], [name]) VALUES (30, N'C10       ')
SET IDENTITY_INSERT [dbo].[Seat] OFF
GO
SET IDENTITY_INSERT [dbo].[Shows] ON 

INSERT [dbo].[Shows] ([ShowID], [RoomID], [FilmID], [ShowDate], [Price], [Status], [SlotId]) VALUES (55, 1, 1, CAST(N'2022-08-24' AS Date), 60000.0000, 1, 2)
INSERT [dbo].[Shows] ([ShowID], [RoomID], [FilmID], [ShowDate], [Price], [Status], [SlotId]) VALUES (56, 2, 2, CAST(N'2022-08-25' AS Date), 60000.0000, 1, 2)
INSERT [dbo].[Shows] ([ShowID], [RoomID], [FilmID], [ShowDate], [Price], [Status], [SlotId]) VALUES (57, 3, 3, CAST(N'2022-08-23' AS Date), 60000.0000, 1, 3)
INSERT [dbo].[Shows] ([ShowID], [RoomID], [FilmID], [ShowDate], [Price], [Status], [SlotId]) VALUES (58, 1, 2, CAST(N'2022-08-22' AS Date), 60000.0000, 1, 1)
INSERT [dbo].[Shows] ([ShowID], [RoomID], [FilmID], [ShowDate], [Price], [Status], [SlotId]) VALUES (59, 2, 1, CAST(N'2022-08-20' AS Date), 55000.0000, 1, 2)
INSERT [dbo].[Shows] ([ShowID], [RoomID], [FilmID], [ShowDate], [Price], [Status], [SlotId]) VALUES (60, 3, 2, CAST(N'2022-08-20' AS Date), 55000.0000, 1, 4)
INSERT [dbo].[Shows] ([ShowID], [RoomID], [FilmID], [ShowDate], [Price], [Status], [SlotId]) VALUES (61, 2, 3, CAST(N'2022-08-23' AS Date), 55000.0000, 1, 2)
INSERT [dbo].[Shows] ([ShowID], [RoomID], [FilmID], [ShowDate], [Price], [Status], [SlotId]) VALUES (62, 3, 4, CAST(N'2022-08-17' AS Date), 55000.0000, 1, 7)
INSERT [dbo].[Shows] ([ShowID], [RoomID], [FilmID], [ShowDate], [Price], [Status], [SlotId]) VALUES (63, 1, 1, CAST(N'2022-08-25' AS Date), 70000.0000, 1, 9)
INSERT [dbo].[Shows] ([ShowID], [RoomID], [FilmID], [ShowDate], [Price], [Status], [SlotId]) VALUES (64, 1, 3, CAST(N'2022-08-23' AS Date), 70000.0000, 1, 1)
INSERT [dbo].[Shows] ([ShowID], [RoomID], [FilmID], [ShowDate], [Price], [Status], [SlotId]) VALUES (65, 1, 7, CAST(N'2022-08-19' AS Date), 70000.0000, 1, 3)
INSERT [dbo].[Shows] ([ShowID], [RoomID], [FilmID], [ShowDate], [Price], [Status], [SlotId]) VALUES (69, 2, 1, CAST(N'2022-08-15' AS Date), 70000.0000, 1, 1)
INSERT [dbo].[Shows] ([ShowID], [RoomID], [FilmID], [ShowDate], [Price], [Status], [SlotId]) VALUES (70, 1, 9, CAST(N'2022-08-16' AS Date), 65000.0000, 1, 1)
INSERT [dbo].[Shows] ([ShowID], [RoomID], [FilmID], [ShowDate], [Price], [Status], [SlotId]) VALUES (73, 1, 1, CAST(N'2022-08-16' AS Date), 65000.0000, 1, 8)
INSERT [dbo].[Shows] ([ShowID], [RoomID], [FilmID], [ShowDate], [Price], [Status], [SlotId]) VALUES (77, 2, 7, CAST(N'2022-08-16' AS Date), 65000.0000, 1, 3)
INSERT [dbo].[Shows] ([ShowID], [RoomID], [FilmID], [ShowDate], [Price], [Status], [SlotId]) VALUES (102, 1, 9, CAST(N'2022-08-14' AS Date), 65000.0000, 1, 1)
INSERT [dbo].[Shows] ([ShowID], [RoomID], [FilmID], [ShowDate], [Price], [Status], [SlotId]) VALUES (103, 2, 11, CAST(N'2022-08-16' AS Date), 65000.0000, 1, 5)
INSERT [dbo].[Shows] ([ShowID], [RoomID], [FilmID], [ShowDate], [Price], [Status], [SlotId]) VALUES (104, 3, 12, CAST(N'2022-08-16' AS Date), 55000.0000, 1, 6)
INSERT [dbo].[Shows] ([ShowID], [RoomID], [FilmID], [ShowDate], [Price], [Status], [SlotId]) VALUES (105, 1, 1, CAST(N'2022-08-25' AS Date), 75000.0000, 1, 1)
INSERT [dbo].[Shows] ([ShowID], [RoomID], [FilmID], [ShowDate], [Price], [Status], [SlotId]) VALUES (107, 3, 2, NULL, 65000.0000, 1, 4)
INSERT [dbo].[Shows] ([ShowID], [RoomID], [FilmID], [ShowDate], [Price], [Status], [SlotId]) VALUES (108, 3, 9, CAST(N'2022-07-21' AS Date), 555000.0000, 1, 5)
SET IDENTITY_INSERT [dbo].[Shows] OFF
GO
INSERT [dbo].[Slot] ([id], [Time]) VALUES (1, N'7:00 AM')
INSERT [dbo].[Slot] ([id], [Time]) VALUES (2, N'9:00 AM')
INSERT [dbo].[Slot] ([id], [Time]) VALUES (3, N'11:00 AM')
INSERT [dbo].[Slot] ([id], [Time]) VALUES (4, N'13:00 PM')
INSERT [dbo].[Slot] ([id], [Time]) VALUES (5, N'15:00 PM')
INSERT [dbo].[Slot] ([id], [Time]) VALUES (6, N'17:00 PM')
INSERT [dbo].[Slot] ([id], [Time]) VALUES (7, N'19: 00 PM')
INSERT [dbo].[Slot] ([id], [Time]) VALUES (8, N'21:00 PM')
INSERT [dbo].[Slot] ([id], [Time]) VALUES (9, N'23:00 PM')
GO
SET IDENTITY_INSERT [dbo].[user] ON 

INSERT [dbo].[user] ([user_id], [fullname], [email], [password], [gender], [phone], [address], [role], [active], [key], [avatar]) VALUES (1, N'dangnhhe161726', N'dangnhhe161726@fpt.edu.vn', N'4297f44b13955235245b2497399d7a93', 0, N'123456009', N'Ha noi', 1, 1, NULL, N'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAABIAAAAKICAIAAACHSRZaAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAAEnQAABJ0Ad5mH3gAAEOZSURBVHhe7d0/WBtZmuhhe5Mhu2zU6mghWohGihqigehCJmU4WoiMI6PI8EwAJIOJhCNwBBtBRyiDG0FH0BHcyGwwD2zUTLRs1Gzk+y1HU1cLNrZlKPTnfQNNVbmfnraQRP10Tp16/vHjx2cAAAA8vn9o/C8AAACPTIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIABAADkRIAB9Kiff/75L3/5S2MHAMiFAAPoUX/961///Oc/N3YAgFw8//jxY2MTAACAx2QEDAAAICcCDAAAICcCDAAAICcCDAAAICcCDAAAICcCDICe4L5nALQDAQZAT3DfMwDagfuAAQAA5MQIGAAAQE4EGAAAQE4EGAAAQE4EGAAAQE4EGAAAQE4EGAAAQE4EGAAAQE4EGAAAQE4EGAAAQE4EGAAAQE4EGAAAQE4EGAAAQE4EGAAAQE4EGAAAQE4EGAAAQE4EGAAAQE4EGAAAQE4EGAAAQE4EGAAAQE4EGAAAQE4EGAAAQE4EGAAAQE4EGAAAQE4EGAAAQE4EGAAAQE4EGAAAQE4EGAAAQE4EGAAAQE4EGAAAQE4EGAAAQE4EGAAAQE4EGAAAQE6ef/z4sbEJALSB4+Pj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')
INSERT [dbo].[user] ([user_id], [fullname], [email], [password], [gender], [phone], [address], [role], [active], [key], [avatar]) VALUES (2, N'dangdeptroai', N'dang@gmail.com', N'4297f44b13955235245b2497399d7a93', 1, N'0378387199 ', N'hong cho anh oi', 0, 1, NULL, N'https://iconape.com/wp-content/files/im/10836/svg/iconfinder_3_avatar_2754579.svg')
SET IDENTITY_INSERT [dbo].[user] OFF
GO
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD  CONSTRAINT [FK_Bookings_Shows] FOREIGN KEY([ShowID])
REFERENCES [dbo].[Shows] ([ShowID])
GO
ALTER TABLE [dbo].[Bookings] CHECK CONSTRAINT [FK_Bookings_Shows]
GO
ALTER TABLE [dbo].[Films]  WITH CHECK ADD  CONSTRAINT [FK_Films_Genres] FOREIGN KEY([GenreID])
REFERENCES [dbo].[Genres] ([GenreID])
GO
ALTER TABLE [dbo].[Films] CHECK CONSTRAINT [FK_Films_Genres]
GO
ALTER TABLE [dbo].[Shows]  WITH CHECK ADD  CONSTRAINT [FK_Shows_Films] FOREIGN KEY([FilmID])
REFERENCES [dbo].[Films] ([FilmID])
GO
ALTER TABLE [dbo].[Shows] CHECK CONSTRAINT [FK_Shows_Films]
GO
ALTER TABLE [dbo].[Shows]  WITH CHECK ADD  CONSTRAINT [FK_Shows_Rooms] FOREIGN KEY([RoomID])
REFERENCES [dbo].[Rooms] ([RoomID])
GO
ALTER TABLE [dbo].[Shows] CHECK CONSTRAINT [FK_Shows_Rooms]
GO
USE [master]
GO
ALTER DATABASE [Cinema] SET  READ_WRITE 
GO
