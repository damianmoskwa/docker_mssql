CREATE DATABASE [CHRXS1TEST_01]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CHRXS1TEST_01', FILENAME = N'/var/opt/mssql/data/CHRXS1TEST_01.mdf' , SIZE = 248MB , FILEGROWTH = 10MB )
 LOG ON 
( NAME = N'CHRXS1TEST_01_log', FILENAME = N'/var/opt/mssql/data/CHRXS1TEST_01_log.ldf' , SIZE = 256MB , FILEGROWTH = 10%)
 COLLATE SQL_Latin1_General_CP1_CI_AS
GO
ALTER DATABASE [CHRXS1TEST_01] SET COMPATIBILITY_LEVEL = 110
GO
ALTER DATABASE [CHRXS1TEST_01] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CHRXS1TEST_01] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CHRXS1TEST_01] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CHRXS1TEST_01] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CHRXS1TEST_01] SET ARITHABORT OFF 
GO
ALTER DATABASE [CHRXS1TEST_01] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CHRXS1TEST_01] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [CHRXS1TEST_01] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CHRXS1TEST_01] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CHRXS1TEST_01] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CHRXS1TEST_01] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CHRXS1TEST_01] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CHRXS1TEST_01] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CHRXS1TEST_01] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CHRXS1TEST_01] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CHRXS1TEST_01] SET DISABLE_BROKER 
GO
ALTER DATABASE [CHRXS1TEST_01] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CHRXS1TEST_01] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CHRXS1TEST_01] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CHRXS1TEST_01] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CHRXS1TEST_01] SET READ_WRITE 
GO
ALTER DATABASE [CHRXS1TEST_01] SET RECOVERY FULL 
GO
ALTER DATABASE [CHRXS1TEST_01] SET  MULTI_USER 
GO
ALTER DATABASE [CHRXS1TEST_01] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CHRXS1TEST_01] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [CHRXS1TEST_01]
GO
IF NOT EXISTS (SELECT name FROM sys.filegroups WHERE is_default=1 AND name = N'PRIMARY') ALTER DATABASE [CHRXS1TEST_01] MODIFY FILEGROUP [PRIMARY] DEFAULT
GO

USE [master]
GO
CREATE LOGIN [CHRXS1TEST_01] WITH PASSWORD=N'123test', DEFAULT_DATABASE=[master], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO

USE [CHRXS1TEST_01]
GO
CREATE USER [testUser] FOR LOGIN [CHRXS1TEST_01]
GO
USE [CHRXS1TEST_01]
GO
ALTER AUTHORIZATION ON SCHEMA::[db_owner] TO [testUser]
GO
USE [CHRXS1TEST_01]
GO
ALTER ROLE [db_owner] ADD MEMBER [testUser]
GO

use [CHRXS1TEST_01]
GO
GRANT VIEW DATABASE STATE TO [testUser]
GO

use [master]
GO
GRANT CREATE ANY DATABASE TO [CHRXS1TEST_01]
GO
use [master]
GO
GRANT VIEW SERVER STATE TO [CHRXS1TEST_01]
GO

ALTER DATABASE CHRXS1TEST_01
SET READ_COMMITTED_SNAPSHOT ON
WITH ROLLBACK IMMEDIATE
GO