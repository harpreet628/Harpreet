USE [master]
GO
/****** Object:  Database [MvcMusicStore]    Script Date: 2019-05-22 4:06:42 PM ******/
CREATE DATABASE [MvcMusicStore]
GO
ALTER DATABASE [MvcMusicStore] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MvcMusicStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MvcMusicStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MvcMusicStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MvcMusicStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MvcMusicStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MvcMusicStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [MvcMusicStore] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [MvcMusicStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MvcMusicStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MvcMusicStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MvcMusicStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MvcMusicStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MvcMusicStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MvcMusicStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MvcMusicStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MvcMusicStore] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MvcMusicStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MvcMusicStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MvcMusicStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MvcMusicStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MvcMusicStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MvcMusicStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MvcMusicStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MvcMusicStore] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MvcMusicStore] SET  MULTI_USER 
GO
ALTER DATABASE [MvcMusicStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MvcMusicStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MvcMusicStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MvcMusicStore] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [MvcMusicStore] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MvcMusicStore] SET QUERY_STORE = OFF
GO
USE [MvcMusicStore]
GO
/****** Object:  Table [dbo].[album]    Script Date: 2019-05-22 4:06:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[album](
	[albumId] [int] IDENTITY(1,1) NOT NULL,
	[genreId] [int] NOT NULL,
	[artistId] [int] NOT NULL,
	[title] [nvarchar](50) NULL,
	[price] [float] NOT NULL,
	[albumArtUrl] [nvarchar](50) NULL,
 CONSTRAINT [PK__album__75BF3ECF7996BD0F] PRIMARY KEY CLUSTERED 
(
	[albumId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[artist]    Script Date: 2019-05-22 4:06:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[artist](
	[artistId] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_artist] PRIMARY KEY CLUSTERED 
(
	[artistId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cart]    Script Date: 2019-05-22 4:06:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cart](
	[cartId] [int] IDENTITY(1,1) NOT NULL,
	[cartCode] [varchar](max) NULL,
	[albumId] [int] NOT NULL,
	[count] [int] NOT NULL,
	[dateCreated] [datetime] NULL,
	[unitPrice] [float] NOT NULL,
	[lineTotal] [float] NOT NULL,
	[comments] [varchar](max) NULL,
 CONSTRAINT [PK_cart] PRIMARY KEY CLUSTERED 
(
	[cartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[country]    Script Date: 2019-05-22 4:06:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[country](
	[countryCode] [char](2) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[postalPattern] [nvarchar](120) NULL,
	[phonePattern] [nvarchar](50) NULL,
	[provinceStateLabel] [varchar](50) NOT NULL,
	[retailTaxRate] [float] NOT NULL,
 CONSTRAINT [PK_country] PRIMARY KEY CLUSTERED 
(
	[countryCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[genre]    Script Date: 2019-05-22 4:06:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[genre](
	[genreId] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
 CONSTRAINT [PK_genre] PRIMARY KEY CLUSTERED 
(
	[genreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order]    Script Date: 2019-05-22 4:06:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order](
	[orderId] [int] IDENTITY(1,1) NOT NULL,
	[orderDate] [datetime] NOT NULL,
	[userName] [nvarchar](max) NULL,
	[firstName] [nvarchar](50) NULL,
	[lastName] [nvarchar](50) NULL,
	[address] [nvarchar](50) NULL,
	[city] [nvarchar](50) NULL,
	[provinceCode] [char](2) NULL,
	[postalCode] [nvarchar](7) NULL,
	[countryCode] [char](2) NULL,
	[phone] [nvarchar](12) NULL,
	[email] [nvarchar](max) NULL,
	[total] [float] NOT NULL,
 CONSTRAINT [PK_order] PRIMARY KEY CLUSTERED 
(
	[orderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orderDetail]    Script Date: 2019-05-22 4:06:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orderDetail](
	[orderDetailId] [int] IDENTITY(1,1) NOT NULL,
	[orderId] [int] NOT NULL,
	[albumId] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[unitPrice] [float] NOT NULL,
 CONSTRAINT [PK_orderDetail] PRIMARY KEY CLUSTERED 
(
	[orderDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[province]    Script Date: 2019-05-22 4:06:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[province](
	[provinceCode] [char](2) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[countryCode] [char](2) NULL,
	[retailTaxCode] [varchar](50) NULL,
	[retailTaxRate] [float] NOT NULL,
	[includesFederalTax] [bit] NOT NULL,
 CONSTRAINT [PK_province] PRIMARY KEY CLUSTERED 
(
	[provinceCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[album] ON 

INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (1, 1, 1, N'The Best Of', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (2, 1, 4, N'For Those About To Rock We Salute You', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (3, 1, 4, N'Let There Be Rock', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (4, 1, 5, N'Balls to the Wall', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (5, 1, 5, N'Restless and Wild', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (6, 1, 7, N'Big Ones', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (7, 1, 9, N'Jagged Little Pill', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (8, 1, 10, N'Facelift', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (9, 1, 15, N'Audioslave', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (10, 1, 37, N'Chronicle, Vol. 1', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (11, 1, 37, N'Chronicle, Vol. 2', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (12, 1, 38, N'Into The Light', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (13, 1, 39, N'Come Taste The Band', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (14, 1, 39, N'Deep Purple In Rock', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (15, 1, 39, N'Fireball', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (16, 1, 39, N'Machine Head', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (17, 1, 39, N'MK III The Final Concerts [Disc 1]', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (18, 1, 39, N'Purpendicular', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (19, 1, 39, N'Slaves And Masters', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (20, 1, 39, N'Stormbringer', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (21, 1, 39, N'The Battle Rages On', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (22, 1, 39, N'The Final Concerts (Disc 2)', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (23, 1, 43, N'Un-Led-Ed', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (24, 1, 50, N'King For A Day Fool For A Lifetime', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (25, 1, 52, N'In Your Honor [Disc 1]', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (26, 1, 52, N'In Your Honor [Disc 2]', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (27, 1, 52, N'The Colour And The Shape', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (28, 1, 53, N'Bongo Fury', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (29, 1, 59, N'Appetite for Destruction', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (30, 1, 59, N'Use Your Illusion I', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (31, 1, 61, N'A Matter of Life and Death', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (32, 1, 61, N'Brave New World', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (33, 1, 61, N'Fear Of The Dark', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (34, 1, 61, N'Live At Donington 1992 (Disc 1)', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (35, 1, 61, N'Live At Donington 1992 (Disc 2)', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (36, 1, 61, N'Rock In Rio [CD2]', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (37, 1, 61, N'The Number of The Beast', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (38, 1, 61, N'The X Factor', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (39, 1, 61, N'Virtual XI', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (40, 1, 63, N'Emergency On Planet Earth', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (41, 1, 64, N'Are You Experienced?', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (42, 1, 65, N'Surfing with the Alien (Remastered)', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (43, 1, 70, N'Greatest Kiss', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (44, 1, 70, N'Unplugged [Live]', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (45, 1, 71, N'BBC Sessions [Disc 1] [Live]', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (46, 1, 71, N'BBC Sessions [Disc 2] [Live]', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (47, 1, 71, N'Coda', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (48, 1, 71, N'Houses Of The Holy', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (49, 1, 71, N'In Through The Out Door', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (50, 1, 71, N'IV', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (51, 1, 71, N'Led Zeppelin I', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (52, 1, 71, N'Led Zeppelin II', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (53, 1, 71, N'Led Zeppelin III', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (54, 1, 71, N'Physical Graffiti [Disc 1]', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (55, 1, 71, N'Physical Graffiti [Disc 2]', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (56, 1, 71, N'Presence', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (57, 1, 71, N'The Song Remains The Same (Disc 1)', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (58, 1, 71, N'The Song Remains The Same (Disc 2)', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (59, 1, 73, N'Greatest Hits', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (60, 1, 77, N'Misplaced Childhood', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (61, 1, 88, N'Nevermind', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (62, 1, 89, N'Compositores', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (63, 1, 93, N'Bark at the Moon (Remastered)', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (64, 1, 93, N'Blizzard of Ozz', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (65, 1, 93, N'Diary of a Madman (Remastered)', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (66, 1, 93, N'No More Tears (Remastered)', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (67, 1, 93, N'Speak of the Devil', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (68, 1, 94, N'Walking Into Clarksdale', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (69, 1, 95, N'The Beast Live', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (70, 1, 96, N'Live On Two Legs [Live]', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (71, 1, 96, N'Riot Act', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (72, 1, 96, N'Ten', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (73, 1, 96, N'Vs.', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (74, 1, 97, N'Dark Side Of The Moon', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (75, 1, 98, N'Greatest Hits I', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (76, 1, 98, N'Greatest Hits II', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (77, 1, 98, N'News Of The World', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (78, 1, 99, N'New Adventures In Hi-Fi', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (79, 1, 100, N'Raul Seixas', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (80, 1, 101, N'By The Way', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (81, 1, 101, N'Californication', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (82, 1, 104, N'Retrospective I (1974-1980)', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (83, 1, 105, N'Santana - As Years Go By', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (84, 1, 105, N'Santana Live', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (85, 1, 105, N'Supernatural', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (86, 1, 109, N'Maquinarama', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (87, 1, 109, N'O Samba Poconé', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (88, 1, 110, N'A-Sides', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (89, 1, 113, N'Core', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (90, 1, 116, N'[1997] Black Light Syndrome', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (91, 1, 119, N'Beyond Good And Evil', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (92, 1, 120, N'The Doors', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (93, 1, 122, N'The Police Greatest Hits', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (94, 1, 123, N'Every Kind of Light', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (95, 1, 124, N'Hot Rocks, 1964-1971 (Disc 1)', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (96, 1, 124, N'No Security', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (97, 1, 124, N'Voodoo Lounge', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (98, 1, 125, N'My Generation - The Very Best Of The Who', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (99, 1, 128, N'Achtung Baby', 8.9899997711181641, N'/Content/Images/placeholder.gif')
GO
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (100, 1, 128, N'B-Sides 1980-1990', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (101, 1, 128, N'How To Dismantle An Atomic Bomb', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (102, 1, 128, N'Pop', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (103, 1, 128, N'Rattle And Hum', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (104, 1, 128, N'The Best Of 1980-1990', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (105, 1, 128, N'War', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (106, 1, 128, N'Zooropa', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (107, 1, 130, N'Diver Down', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (108, 1, 130, N'The Best Of', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (109, 1, 130, N'Van Halen III', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (110, 1, 130, N'Van Halen', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (111, 1, 132, N'Contraband', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (112, 2, 2, N'A Copland Celebration, Vol. I', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (113, 2, 6, N'Górecki: Symphony No. 3', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (114, 2, 16, N'The Last Night of the Proms', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (115, 2, 17, N'Sibelius: Finlandia', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (116, 2, 18, N'Mozart: Symphonies Nos. 40 & 41', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (117, 2, 22, N'Carmina Burana', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (118, 2, 23, N'A Soprano Inspired', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (119, 2, 30, N'Scheherazade', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (120, 2, 34, N'SCRIABIN: Vers la flamme', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (121, 2, 45, N'Adams, John: The Chairman Dances', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (122, 2, 47, N'Pachelbel: Canon & Gigue', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (123, 2, 49, N'Respighi:Pines of Rome', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (124, 2, 49, N'Strauss: Waltzes', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (125, 2, 58, N'Nielsen: The Six Symphonies', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (126, 2, 62, N'Mascagni: Cavalleria Rusticana', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (127, 2, 69, N'Weill: The Seven Deadly Sins', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (128, 2, 74, N'Tchaikovsky: The Nutcracker', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (129, 2, 79, N'Szymanowski: Piano Works, Vol. 1', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (130, 2, 81, N'Berlioz: Symphonie Fantastique', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (131, 2, 81, N'Prokofiev: Romeo & Juliet', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (132, 2, 86, N'Mozart: Chamber Music', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (133, 2, 87, N'The Best of Beethoven', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (134, 2, 91, N'Bach: The Brandenburg Concertos', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (135, 2, 102, N'Purcell: The Fairy Queen', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (136, 2, 103, N'Haydn: Symphonies 99 - 104', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (137, 2, 106, N'Handel: The Messiah (Highlights)', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (138, 2, 107, N'Prokofiev: Symphony No.1', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (139, 2, 108, N'Wagner: Favourite Overtures', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (140, 2, 117, N'South American Getaway', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (141, 2, 121, N'English Renaissance', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (142, 2, 127, N'Bach: Toccata & Fugue in D Minor', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (143, 2, 134, N'Bach: Goldberg Variations', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (144, 2, 135, N'Bartok: Violin & Viola Concertos', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (145, 2, 136, N'Bach: The Cello Suites', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (146, 3, 3, N'Worlds', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (147, 3, 8, N'Quiet Songs', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (148, 3, 13, N'Warner 25 Anos', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (149, 3, 19, N'The Best Of', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (150, 3, 40, N'Outbreak', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (151, 3, 55, N'Quanta Gente Veio ver--Bônus De Carnaval', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (152, 3, 60, N'Blue Moods', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (153, 3, 82, N'Miles Ahead', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (154, 3, 82, N'The Essential Miles Davis [Disc 1]', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (155, 3, 82, N'The Essential Miles Davis [Disc 2]', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (156, 3, 111, N'Heart of the Night', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (157, 3, 111, N'Morning Dance', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (158, 4, 11, N'Frank', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (159, 4, 131, N'Axé Bahia 2001', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (160, 5, 12, N'Ring My Bell', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (161, 5, 29, N'Le Freak', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (162, 5, 42, N'MacArthur Park Suite', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (163, 6, 13, N'Chill: Brazil (Disc 2)', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (164, 6, 25, N'Prenda Minha', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (165, 6, 25, N'Sozinho Remix Ao Vivo', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (166, 6, 28, N'Cássia Eller - Sem Limite [Disc 1]', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (167, 6, 31, N'Minha Historia', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (168, 6, 32, N'Afrociberdelia', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (169, 6, 32, N'Da Lama Ao Caos', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (170, 6, 36, N'Na Pista', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (171, 6, 41, N'Djavan Ao Vivo - Vol. 02', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (172, 6, 41, N'Djavan Ao Vivo - Vol. 1', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (173, 6, 44, N'The Best Of', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (174, 6, 46, N'Elis Regina-Minha História', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (175, 6, 48, N'Unplugged', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (176, 6, 51, N'Deixa Entrar', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (177, 6, 54, N'Roda De Funk', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (178, 6, 55, N'Quanta Gente Veio Ver (Live)', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (179, 6, 57, N'Meus Momentos', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (180, 6, 66, N'Jorge Ben Jor 25 Anos', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (181, 6, 67, N'Jota Quest-1995', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (182, 6, 72, N'Mais Do Mesmo', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (183, 6, 75, N'Duos II', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (184, 6, 76, N'Chill: Brazil (Disc 1)', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (185, 6, 78, N'Barulhinho Bom', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (186, 6, 83, N'Milton Nascimento Ao Vivo', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (187, 6, 83, N'Minas', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (188, 6, 90, N'Olodum', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (189, 6, 92, N'Acústico MTV', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (190, 6, 92, N'Arquivo II', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (191, 6, 92, N'Arquivo Os Paralamas Do Sucesso', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (192, 6, 126, N'Serie Sem Limite (Disc 1)', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (193, 6, 126, N'Serie Sem Limite (Disc 2)', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (194, 6, 131, N'Sambas De Enredo 2001', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (195, 6, 131, N'Vozes do MPB', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (196, 6, 133, N'Vinicius De Moraes', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (197, 6, 137, N'Ao Vivo [IMPORT]', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (198, 7, 14, N'Plays Metallica By Four Cellos', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (199, 7, 20, N'Alcohol Fueled Brewtality Live! [Disc 1]', 8.9899997711181641, N'/Content/Images/placeholder.gif')
GO
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (200, 7, 20, N'Alcohol Fueled Brewtality Live! [Disc 2]', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (201, 7, 21, N'Black Sabbath Vol. 4 (Remaster)', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (202, 7, 21, N'Black Sabbath', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (203, 7, 24, N'Chemical Wedding', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (204, 7, 56, N'Faceless', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (205, 7, 59, N'Use Your Illusion II', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (206, 7, 61, N'A Real Dead One', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (207, 7, 61, N'A Real Live One', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (208, 7, 61, N'Live After Death', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (209, 7, 61, N'No Prayer For The Dying', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (210, 7, 61, N'Piece Of Mind', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (211, 7, 61, N'Powerslave', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (212, 7, 61, N'Rock In Rio [CD1]', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (213, 7, 61, N'Rock In Rio [CD2]', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (214, 7, 61, N'Seventh Son of a Seventh Son', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (215, 7, 61, N'Somewhere in Time', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (216, 7, 61, N'The Number of The Beast', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (217, 7, 68, N'Living After Midnight', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (218, 7, 73, N'Greatest Hits', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (219, 7, 80, N'...And Justice For All', -3, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (220, 7, 80, N'Black Album', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (221, 7, 80, N'Garage Inc. (Disc 1)', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (222, 7, 80, N'Garage Inc. (Disc 2)', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (223, 7, 80, N'Load', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (224, 7, 80, N'Master Of Puppets', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (225, 7, 80, N'ReLoad', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (226, 7, 80, N'Ride The Lightning', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (227, 7, 80, N'St. Anger', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (228, 7, 84, N'Motley Crue Greatest Hits', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (229, 7, 85, N'Ace Of Spades', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (230, 7, 93, N'Tribute', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (231, 7, 114, N'Mezmerize', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (232, 8, 15, N'Revelations', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (233, 8, 26, N'Cake: B-Sides and Rarities', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (234, 8, 27, N'Carried to Dust (Bonus Track Version)', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (235, 8, 33, N'Carry On', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (236, 8, 115, N'Temple of the Dog', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (237, 9, 35, N'Acústico MTV [Live]', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (238, 9, 35, N'Cidade Negra - Hits', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (239, 9, 73, N'Greatest Hits', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (240, 9, 129, N'UB40 The Best Of - Volume Two [UK]', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (241, 10, 48, N'The Cream Of Clapton', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (242, 10, 48, N'Unplugged', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (243, 10, 61, N'Iron Maiden', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (244, 10, 112, N'In Step', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (245, 10, 118, N'Live [Disc 1]', 8.9899997711181641, N'/Content/Images/placeholder.gif')
INSERT [dbo].[album] ([albumId], [genreId], [artistId], [title], [price], [albumArtUrl]) VALUES (246, 10, 118, N'Live [Disc 2]', 8.9899997711181641, N'/Content/Images/placeholder.gif')
SET IDENTITY_INSERT [dbo].[album] OFF
SET IDENTITY_INSERT [dbo].[artist] ON 

INSERT [dbo].[artist] ([artistId], [name]) VALUES (1, N'Men At Work')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (2, N'Aaron Copland & London Symphony Orchestra')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (3, N'Aaron Goldberg')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (4, N'AC/DC')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (5, N'Accept')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (6, N'Adrian Leaper & Doreen de Feis')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (7, N'Aerosmith')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (8, N'Aisha Duo')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (9, N'Alanis Morissette')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (10, N'Alice In Chains')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (11, N'Amy Winehouse')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (12, N'Anita Ward')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (13, N'Antônio Carlos Jobim')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (14, N'Apocalyptica')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (15, N'Audioslave')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (16, N'Barry Wordsworth & BBC Concert Orchestra')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (17, N'Berliner Philharmoniker & Hans Rosbaud')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (18, N'Berliner Philharmoniker & Herbert Von Karajan')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (19, N'Billy Cobham')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (20, N'Black Label Society')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (21, N'Black Sabbath')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (22, N'Boston Symphony Orchestra & Seiji Ozawa')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (23, N'Britten Sinfonia, Ivor Bolton & Lesley Garrett')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (24, N'Bruce Dickinson')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (25, N'Caetano Veloso')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (26, N'Cake')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (27, N'Calexico')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (28, N'Cássia Eller')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (29, N'Chic')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (30, N'Chicago Symphony Orchestra & Fritz Reiner')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (31, N'Chico Buarque')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (32, N'Chico Science & Nação Zumbi')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (33, N'Chris Cornell')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (34, N'Christopher O''Riley')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (35, N'Cidade Negra')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (36, N'Cláudio Zoli')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (37, N'Creedence Clearwater Revival')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (38, N'David Coverdale')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (39, N'Deep Purple')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (40, N'Dennis Chambers')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (41, N'Djavan')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (42, N'Donna Summer')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (43, N'Dread Zeppelin')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (44, N'Ed Motta')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (45, N'Edo de Waart & San Francisco Symphony')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (46, N'Elis Regina')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (47, N'English Concert & Trevor Pinnock')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (48, N'Eric Clapton')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (49, N'Eugene Ormandy')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (50, N'Faith No More')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (51, N'Falamansa')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (52, N'Foo Fighters')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (53, N'Frank Zappa & Captain Beefheart')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (54, N'Funk Como Le Gusta')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (55, N'Gilberto Gil')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (56, N'Godsmack')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (57, N'Gonzaguinha')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (58, N'Göteborgs Symfoniker & Neeme Järvi')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (59, N'Guns N'' Roses')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (60, N'Incognito')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (61, N'Iron Maiden')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (62, N'James Levine')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (63, N'Jamiroquai')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (64, N'Jimi Hendrix')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (65, N'Joe Satriani')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (66, N'Jorge Ben')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (67, N'Jota Quest')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (68, N'Judas Priest')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (69, N'Kent Nagano and Orchestre de l''Opéra de Lyon')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (70, N'Kiss')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (71, N'Led Zeppelin')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (72, N'Legião Urbana')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (73, N'Lenny Kravitz')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (74, N'London Symphony Orchestra & Sir Charles Mackerras')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (75, N'Luciana Souza/Romero Lubambo')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (76, N'Marcos Valle')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (77, N'Marillion')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (78, N'Marisa Monte')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (79, N'Martin Roscoe')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (80, N'Metallica')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (81, N'Michael Tilson Thomas & San Francisco Symphony')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (82, N'Miles Davis')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (83, N'Milton Nascimento')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (84, N'Mötley Crüe')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (85, N'Motörhead')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (86, N'Nash Ensemble')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (87, N'Nicolaus Esterhazy Sinfonia')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (88, N'Nirvana')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (89, N'O Terço')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (90, N'Olodum')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (91, N'Orchestra of The Age of Enlightenment')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (92, N'Os Paralamas Do Sucesso')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (93, N'Ozzy Osbourne')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (94, N'Page & Plant')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (95, N'Paul D''Ianno')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (96, N'Pearl Jam')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (97, N'Pink Floyd')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (98, N'Queen')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (99, N'R.E.M.')
GO
INSERT [dbo].[artist] ([artistId], [name]) VALUES (100, N'Raul Seixas')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (101, N'Red Hot Chili Peppers')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (102, N'Roger Norrington, London Classical Players')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (103, N'Royal Philharmonic Orchestra & Sir Thomas Beecham')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (104, N'Rush')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (105, N'Santana')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (106, N'Scholars Baroque Ensemble')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (107, N'Sergei Prokofiev & Yuri Temirkanov')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (108, N'Sir Georg Solti & Wiener Philharmoniker')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (109, N'Skank')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (110, N'Soundgarden')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (111, N'Spyro Gyra')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (112, N'Stevie Ray Vaughan & Double Trouble')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (113, N'Stone Temple Pilots')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (114, N'System Of A Down')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (115, N'Temple of the Dog')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (116, N'Terry Bozzio, Tony Levin & Steve Stevens')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (117, N'The 12 Cellists of The Berlin Philharmonic')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (118, N'The Black Crowes')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (119, N'The Cult')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (120, N'The Doors')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (121, N'The King''s Singers')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (122, N'The Police')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (123, N'The Posies')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (124, N'The Rolling Stones')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (125, N'The Who')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (126, N'Tim Maia')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (127, N'Ton Koopman')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (128, N'U2')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (129, N'UB40')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (130, N'Van Halen')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (131, N'Various Artists')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (132, N'Velvet Revolver')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (133, N'Vinícius De Moraes')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (134, N'Wilhelm Kempff')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (135, N'Yehudi Menuhin')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (136, N'Yo-Yo Ma')
INSERT [dbo].[artist] ([artistId], [name]) VALUES (137, N'Zeca Pagodinho')
SET IDENTITY_INSERT [dbo].[artist] OFF
INSERT [dbo].[country] ([countryCode], [name], [postalPattern], [phonePattern], [provinceStateLabel], [retailTaxRate]) VALUES (N'CA', N'Canada', NULL, NULL, N'Province', 0.05)
INSERT [dbo].[country] ([countryCode], [name], [postalPattern], [phonePattern], [provinceStateLabel], [retailTaxRate]) VALUES (N'US', N'United States of America', NULL, NULL, N'State', 0)
SET IDENTITY_INSERT [dbo].[genre] ON 

INSERT [dbo].[genre] ([genreId], [name], [description]) VALUES (1, N'Rock', NULL)
INSERT [dbo].[genre] ([genreId], [name], [description]) VALUES (2, N'Classical', NULL)
INSERT [dbo].[genre] ([genreId], [name], [description]) VALUES (3, N'Jazz', NULL)
INSERT [dbo].[genre] ([genreId], [name], [description]) VALUES (4, N'Pop', NULL)
INSERT [dbo].[genre] ([genreId], [name], [description]) VALUES (5, N'Disco', NULL)
INSERT [dbo].[genre] ([genreId], [name], [description]) VALUES (6, N'Latin', NULL)
INSERT [dbo].[genre] ([genreId], [name], [description]) VALUES (7, N'Metal', NULL)
INSERT [dbo].[genre] ([genreId], [name], [description]) VALUES (8, N'Alternative', NULL)
INSERT [dbo].[genre] ([genreId], [name], [description]) VALUES (9, N'Reggae', NULL)
INSERT [dbo].[genre] ([genreId], [name], [description]) VALUES (10, N'Blues', NULL)
SET IDENTITY_INSERT [dbo].[genre] OFF
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [retailTaxCode], [retailTaxRate], [includesFederalTax]) VALUES (N'AB', N'Alberta', N'CA', NULL, 0, 0)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [retailTaxCode], [retailTaxRate], [includesFederalTax]) VALUES (N'AZ', N'Arizona', N'US', NULL, 0, 0)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [retailTaxCode], [retailTaxRate], [includesFederalTax]) VALUES (N'BC', N'British Columbia', N'CA', NULL, 0, 0)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [retailTaxCode], [retailTaxRate], [includesFederalTax]) VALUES (N'CA', N'California', N'US', NULL, 0, 0)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [retailTaxCode], [retailTaxRate], [includesFederalTax]) VALUES (N'CT', N'Connecticut', N'US', NULL, 0, 0)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [retailTaxCode], [retailTaxRate], [includesFederalTax]) VALUES (N'DC', N'District of Columbia', N'US', NULL, 0, 0)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [retailTaxCode], [retailTaxRate], [includesFederalTax]) VALUES (N'FL', N'Forida', N'US', NULL, 0, 0)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [retailTaxCode], [retailTaxRate], [includesFederalTax]) VALUES (N'GA', N'Georgia', N'US', NULL, 0, 0)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [retailTaxCode], [retailTaxRate], [includesFederalTax]) VALUES (N'KY', N'Kentucky', N'US', NULL, 0, 0)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [retailTaxCode], [retailTaxRate], [includesFederalTax]) VALUES (N'MB', N'Manitoba', N'CA', NULL, 0, 0)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [retailTaxCode], [retailTaxRate], [includesFederalTax]) VALUES (N'ME', N'Maine', N'US', NULL, 0, 0)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [retailTaxCode], [retailTaxRate], [includesFederalTax]) VALUES (N'MI', N'Michigan', N'US', NULL, 0, 0)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [retailTaxCode], [retailTaxRate], [includesFederalTax]) VALUES (N'NB', N'New Brunswick                 ', N'CA', NULL, 0, 0)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [retailTaxCode], [retailTaxRate], [includesFederalTax]) VALUES (N'NJ', N'New Jersey', N'US', NULL, 0, 0)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [retailTaxCode], [retailTaxRate], [includesFederalTax]) VALUES (N'NL', N'Newfoundland and Labrador', N'CA', NULL, 0, 0)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [retailTaxCode], [retailTaxRate], [includesFederalTax]) VALUES (N'NS', N'Nova Scotia', N'CA', NULL, 0, 0)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [retailTaxCode], [retailTaxRate], [includesFederalTax]) VALUES (N'NT', N'Northwest Territories', N'CA', NULL, 0, 0)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [retailTaxCode], [retailTaxRate], [includesFederalTax]) VALUES (N'NU', N'Nunavut', N'CA', NULL, 0, 0)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [retailTaxCode], [retailTaxRate], [includesFederalTax]) VALUES (N'NY', N'New York', N'US', NULL, 0, 0)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [retailTaxCode], [retailTaxRate], [includesFederalTax]) VALUES (N'ON', N'Ontario', N'CA', NULL, 0, 0)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [retailTaxCode], [retailTaxRate], [includesFederalTax]) VALUES (N'PA', N'Pennsylvania', N'US', NULL, 0, 0)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [retailTaxCode], [retailTaxRate], [includesFederalTax]) VALUES (N'PI', N'Prince Edward Island          ', N'CA', NULL, 0, 0)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [retailTaxCode], [retailTaxRate], [includesFederalTax]) VALUES (N'QC', N'Quebec', N'CA', NULL, 0, 0)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [retailTaxCode], [retailTaxRate], [includesFederalTax]) VALUES (N'SK', N'Saskatchewan                  ', N'CA', NULL, 0, 0)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [retailTaxCode], [retailTaxRate], [includesFederalTax]) VALUES (N'WA', N'Washington', N'US', NULL, 0, 0)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [retailTaxCode], [retailTaxRate], [includesFederalTax]) VALUES (N'YT', N'Yukon', N'CA', NULL, 0, 0)
ALTER TABLE [dbo].[country] ADD  CONSTRAINT [DF_country_retailTaxRate]  DEFAULT ((0)) FOR [retailTaxRate]
GO
ALTER TABLE [dbo].[province] ADD  CONSTRAINT [DF_province_retailTaxRate]  DEFAULT ((0)) FOR [retailTaxRate]
GO
ALTER TABLE [dbo].[album]  WITH CHECK ADD  CONSTRAINT [FK_album_artist] FOREIGN KEY([artistId])
REFERENCES [dbo].[artist] ([artistId])
GO
ALTER TABLE [dbo].[album] CHECK CONSTRAINT [FK_album_artist]
GO
ALTER TABLE [dbo].[album]  WITH CHECK ADD  CONSTRAINT [FK_album_genre] FOREIGN KEY([genreId])
REFERENCES [dbo].[genre] ([genreId])
GO
ALTER TABLE [dbo].[album] CHECK CONSTRAINT [FK_album_genre]
GO
ALTER TABLE [dbo].[cart]  WITH CHECK ADD  CONSTRAINT [FK_cart_album] FOREIGN KEY([albumId])
REFERENCES [dbo].[album] ([albumId])
GO
ALTER TABLE [dbo].[cart] CHECK CONSTRAINT [FK_cart_album]
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD  CONSTRAINT [FK_order_country] FOREIGN KEY([countryCode])
REFERENCES [dbo].[country] ([countryCode])
GO
ALTER TABLE [dbo].[order] CHECK CONSTRAINT [FK_order_country]
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD  CONSTRAINT [FK_order_province] FOREIGN KEY([provinceCode])
REFERENCES [dbo].[province] ([provinceCode])
GO
ALTER TABLE [dbo].[order] CHECK CONSTRAINT [FK_order_province]
GO
ALTER TABLE [dbo].[orderDetail]  WITH CHECK ADD  CONSTRAINT [FK_orderDetail_album] FOREIGN KEY([albumId])
REFERENCES [dbo].[album] ([albumId])
GO
ALTER TABLE [dbo].[orderDetail] CHECK CONSTRAINT [FK_orderDetail_album]
GO
ALTER TABLE [dbo].[orderDetail]  WITH CHECK ADD  CONSTRAINT [FK_orderDetail_order] FOREIGN KEY([orderId])
REFERENCES [dbo].[order] ([orderId])
GO
ALTER TABLE [dbo].[orderDetail] CHECK CONSTRAINT [FK_orderDetail_order]
GO
ALTER TABLE [dbo].[province]  WITH CHECK ADD  CONSTRAINT [FK_province_country] FOREIGN KEY([countryCode])
REFERENCES [dbo].[country] ([countryCode])
GO
ALTER TABLE [dbo].[province] CHECK CONSTRAINT [FK_province_country]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'2-character short form for country' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'country', @level2type=N'COLUMN',@level2name=N'countryCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'formal name of country' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'country', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'regular expression used to validate the postal or zip code for this country, includes ^ and $' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'country', @level2type=N'COLUMN',@level2name=N'postalPattern'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'regular expression used to validate a phone number in this country, includes ^ and $' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'country', @level2type=N'COLUMN',@level2name=N'phonePattern'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'2-character province code ... ON, BC, etc' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'full province name ... Ontario, etc.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province', @level2type=N'COLUMN',@level2name=N'name'
GO
USE [master]
GO
ALTER DATABASE [MvcMusicStore] SET  READ_WRITE 
GO
