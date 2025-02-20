USE [master]
GO
/****** Object:  Database [boostlingoDB]    Script Date: 21/09/2024 11:00:22 a. m. ******/
CREATE DATABASE [boostlingoDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'boostlingoDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\boostlingoDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'boostlingoDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\boostlingoDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [boostlingoDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [boostlingoDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [boostlingoDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [boostlingoDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [boostlingoDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [boostlingoDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [boostlingoDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [boostlingoDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [boostlingoDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [boostlingoDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [boostlingoDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [boostlingoDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [boostlingoDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [boostlingoDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [boostlingoDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [boostlingoDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [boostlingoDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [boostlingoDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [boostlingoDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [boostlingoDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [boostlingoDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [boostlingoDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [boostlingoDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [boostlingoDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [boostlingoDB] SET RECOVERY FULL 
GO
ALTER DATABASE [boostlingoDB] SET  MULTI_USER 
GO
ALTER DATABASE [boostlingoDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [boostlingoDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [boostlingoDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [boostlingoDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [boostlingoDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [boostlingoDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'boostlingoDB', N'ON'
GO
ALTER DATABASE [boostlingoDB] SET QUERY_STORE = OFF
GO
USE [boostlingoDB]
GO
/****** Object:  Table [dbo].[People]    Script Date: 21/09/2024 11:00:22 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[People](
	[id] [nvarchar](255) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[lastname] [nvarchar](255) NOT NULL,
	[language] [nvarchar](255) NOT NULL,
	[bio] [text] NOT NULL,
	[version] [decimal](3, 1) NOT NULL,
 CONSTRAINT [pk_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [boostlingoDB] SET  READ_WRITE 
GO
