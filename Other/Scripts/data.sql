USE [master]
GO
/****** Object:  Database [PeakPerformance_2]    Script Date: 3/11/2026 12:19:46 PM ******/
CREATE DATABASE [PeakPerformance_2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PeakPerformance_2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\PeakPerformance_2.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PeakPerformance_2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\PeakPerformance_2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [PeakPerformance_2] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PeakPerformance_2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PeakPerformance_2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PeakPerformance_2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PeakPerformance_2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PeakPerformance_2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PeakPerformance_2] SET ARITHABORT OFF 
GO
ALTER DATABASE [PeakPerformance_2] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [PeakPerformance_2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PeakPerformance_2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PeakPerformance_2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PeakPerformance_2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PeakPerformance_2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PeakPerformance_2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PeakPerformance_2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PeakPerformance_2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PeakPerformance_2] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PeakPerformance_2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PeakPerformance_2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PeakPerformance_2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PeakPerformance_2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PeakPerformance_2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PeakPerformance_2] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [PeakPerformance_2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PeakPerformance_2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PeakPerformance_2] SET  MULTI_USER 
GO
ALTER DATABASE [PeakPerformance_2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PeakPerformance_2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PeakPerformance_2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PeakPerformance_2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PeakPerformance_2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PeakPerformance_2] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [PeakPerformance_2] SET QUERY_STORE = ON
GO
ALTER DATABASE [PeakPerformance_2] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [PeakPerformance_2]
GO
/****** Object:  View [dbo].[vw_eBodyPart]    Script Date: 3/11/2026 12:19:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   VIEW [dbo].[vw_eBodyPart] AS
SELECT 1 AS Id, 'Waist' AS Name
UNION ALL
SELECT 2 AS Id, 'Hips' AS Name
UNION ALL
SELECT 3 AS Id, 'Neck' AS Name
UNION ALL
SELECT 4 AS Id, 'Chest' AS Name
UNION ALL
SELECT 5 AS Id, 'Shoulders' AS Name
UNION ALL
SELECT 6 AS Id, 'Right bicep' AS Name
UNION ALL
SELECT 7 AS Id, 'Left bicep' AS Name
UNION ALL
SELECT 8 AS Id, 'Right forearm' AS Name
UNION ALL
SELECT 9 AS Id, 'Left forearm' AS Name
UNION ALL
SELECT 10 AS Id, 'Right thigh' AS Name
UNION ALL
SELECT 11 AS Id, 'Left thigh' AS Name
UNION ALL
SELECT 12 AS Id, 'Right calf' AS Name
UNION ALL
SELECT 13 AS Id, 'Left calf' AS Name
;
GO
/****** Object:  View [dbo].[vw_eMeasurementUnit]    Script Date: 3/11/2026 12:19:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   VIEW [dbo].[vw_eMeasurementUnit] AS
SELECT 0 AS Id, '' AS Name
UNION ALL
SELECT 1 AS Id, 'kg' AS Name
UNION ALL
SELECT 2 AS Id, 'lbs' AS Name
UNION ALL
SELECT 3 AS Id, 'cm' AS Name
UNION ALL
SELECT 4 AS Id, 'in' AS Name
;
GO
/****** Object:  View [dbo].[vw_eSetRpeType]    Script Date: 3/11/2026 12:19:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   VIEW [dbo].[vw_eSetRpeType] AS
SELECT 0 AS Id, '' AS Name
UNION ALL
SELECT 1 AS Id, 'Very light' AS Name
UNION ALL
SELECT 2 AS Id, 'Light' AS Name
UNION ALL
SELECT 3 AS Id, 'Moderate' AS Name
UNION ALL
SELECT 4 AS Id, 'Somewhat heavy' AS Name
UNION ALL
SELECT 5 AS Id, 'Heavy' AS Name
UNION ALL
SELECT 6 AS Id, '6' AS Name
UNION ALL
SELECT 7 AS Id, 'Very heavy' AS Name
UNION ALL
SELECT 8 AS Id, '8' AS Name
UNION ALL
SELECT 9 AS Id, '9' AS Name
UNION ALL
SELECT 10 AS Id, 'Very, very heavy (almost max)' AS Name
;
GO
/****** Object:  View [dbo].[vw_eSetType]    Script Date: 3/11/2026 12:19:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   VIEW [dbo].[vw_eSetType] AS
SELECT 0 AS Id, '' AS Name
UNION ALL
SELECT 1 AS Id, 'Warmup' AS Name
UNION ALL
SELECT 2 AS Id, 'Normal' AS Name
UNION ALL
SELECT 3 AS Id, 'Failure' AS Name
UNION ALL
SELECT 4 AS Id, 'Dropset' AS Name
;
GO
/****** Object:  View [dbo].[vw_eSystemRole]    Script Date: 3/11/2026 12:19:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   VIEW [dbo].[vw_eSystemRole] AS
SELECT 1 AS Id, 'Admin' AS Name
UNION ALL
SELECT 2 AS Id, 'User' AS Name
;
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 3/11/2026 12:19:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bodyweight]    Script Date: 3/11/2026 12:19:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bodyweight](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [bigint] NOT NULL,
	[Value] [decimal](4, 1) NOT NULL,
	[WeightUnitId] [int] NOT NULL,
	[BodyFatPercentage] [decimal](3, 1) NULL,
	[LogDate] [datetime2](7) NOT NULL,
	[CreatedOn] [datetime2](7) NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[ModifiedOn] [datetime2](7) NULL,
	[ModifiedBy] [bigint] NULL,
	[DeletedOn] [datetime2](7) NULL,
	[DeletedBy] [bigint] NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Bodyweight] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BodyweightGoal]    Script Date: 3/11/2026 12:19:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BodyweightGoal](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [bigint] NOT NULL,
	[Target] [decimal](4, 1) NOT NULL,
	[WeightUnitId] [int] NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[CreatedOn] [datetime2](7) NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[ModifiedOn] [datetime2](7) NULL,
	[ModifiedBy] [bigint] NULL,
	[DeletedOn] [datetime2](7) NULL,
	[DeletedBy] [bigint] NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_BodyweightGoal] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 3/11/2026 12:19:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ISO2] [nvarchar](max) NOT NULL,
	[ISO3] [nvarchar](max) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ErrorLog]    Script Date: 3/11/2026 12:19:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ErrorLog](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Message] [nvarchar](max) NOT NULL,
	[StackTrace] [nvarchar](max) NULL,
	[InnerException] [nvarchar](max) NULL,
	[RecordDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ErrorLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Exercise]    Script Date: 3/11/2026 12:19:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exercise](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ApiExerciseId] [nvarchar](max) NULL,
	[Name] [nvarchar](450) NOT NULL,
	[EquipmentName] [nvarchar](max) NULL,
	[IsBodyweight] [bit] NULL,
	[IsCardio] [bit] NULL,
	[IsStrength] [bit] NULL,
	[PrimaryMuscleGroupId] [int] NOT NULL,
	[SecondaryMuscleGroupId] [int] NULL,
	[BodyPart] [nvarchar](max) NULL,
	[Instructions] [nvarchar](max) NULL,
	[PictureUrl] [nvarchar](max) NULL,
	[PublicId] [nvarchar](max) NULL,
 CONSTRAINT [PK_Exercise] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExerciseGoal]    Script Date: 3/11/2026 12:19:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExerciseGoal](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ExerciseId] [bigint] NOT NULL,
	[UserId] [bigint] NOT NULL,
	[Weight] [decimal](18, 2) NULL,
	[WeightUnitId] [int] NULL,
	[Reps] [int] NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[CreatedOn] [datetime2](7) NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[ModifiedOn] [datetime2](7) NULL,
	[ModifiedBy] [bigint] NULL,
	[DeletedOn] [datetime2](7) NULL,
	[DeletedBy] [bigint] NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_ExerciseGoal] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Measurement]    Script Date: 3/11/2026 12:19:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Measurement](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [bigint] NOT NULL,
	[MeasurementUnitId] [int] NOT NULL,
	[CreatedOn] [datetime2](7) NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[ModifiedOn] [datetime2](7) NULL,
	[ModifiedBy] [bigint] NULL,
	[DeletedOn] [datetime2](7) NULL,
	[DeletedBy] [bigint] NULL,
	[IsActive] [bit] NOT NULL,
	[LogDate] [datetime2](7) NOT NULL,
	[BodyPartId] [int] NOT NULL,
	[Size] [decimal](4, 1) NOT NULL,
 CONSTRAINT [PK_Measurement] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MeasurementGoal]    Script Date: 3/11/2026 12:19:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MeasurementGoal](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [bigint] NOT NULL,
	[MeasurementUnitId] [int] NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[CreatedOn] [datetime2](7) NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[ModifiedOn] [datetime2](7) NULL,
	[ModifiedBy] [bigint] NULL,
	[DeletedOn] [datetime2](7) NULL,
	[DeletedBy] [bigint] NULL,
	[IsActive] [bit] NOT NULL,
	[BodyPartId] [int] NOT NULL,
	[Size] [decimal](4, 1) NOT NULL,
 CONSTRAINT [PK_MeasurementGoal] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 3/11/2026 12:19:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](30) NOT NULL,
	[Username] [nvarchar](30) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[Description] [nvarchar](500) NULL,
	[ProfilePictureUrl] [nvarchar](max) NULL,
	[PublicId] [nvarchar](max) NULL,
	[CreatedOn] [datetime2](7) NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[ModifiedOn] [datetime2](7) NULL,
	[ModifiedBy] [bigint] NULL,
	[DeletedOn] [datetime2](7) NULL,
	[DeletedBy] [bigint] NULL,
	[IsActive] [bit] NOT NULL,
	[CountryId] [bigint] NULL,
	[Height] [decimal](4, 1) NULL,
	[IsPrivate] [bit] NULL,
	[GenderId] [int] NULL,
	[HeightMeasurementUnitId] [int] NULL,
	[DeactivateReason] [nvarchar](max) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserMeasurementPreference]    Script Date: 3/11/2026 12:19:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserMeasurementPreference](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [bigint] NOT NULL,
	[WeightUnitId] [int] NOT NULL,
	[MeasurementUnitId] [int] NOT NULL,
	[CreatedOn] [datetime2](7) NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[ModifiedOn] [datetime2](7) NULL,
	[ModifiedBy] [bigint] NULL,
	[DeletedOn] [datetime2](7) NULL,
	[DeletedBy] [bigint] NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_UserMeasurementPreference] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 3/11/2026 12:19:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [bigint] NOT NULL,
	[RoleId] [int] NOT NULL,
	[CreatedOn] [datetime2](7) NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[ModifiedOn] [datetime2](7) NULL,
	[ModifiedBy] [bigint] NULL,
	[DeletedOn] [datetime2](7) NULL,
	[DeletedBy] [bigint] NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_UserRole] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserSelectedExercise]    Script Date: 3/11/2026 12:19:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserSelectedExercise](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [bigint] NOT NULL,
	[ExerciseId] [bigint] NOT NULL,
 CONSTRAINT [PK_UserSelectedExercise] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Workout]    Script Date: 3/11/2026 12:19:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Workout](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [bigint] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Notes] [nvarchar](max) NULL,
	[CopiedFromId] [bigint] NULL,
	[LogDate] [date] NOT NULL,
	[StartAt] [time](7) NULL,
	[FinishAt] [time](7) NULL,
	[Bodyweight] [decimal](18, 2) NULL,
	[BodyweightUnitId] [int] NULL,
	[CreatedOn] [datetime2](7) NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[ModifiedOn] [datetime2](7) NULL,
	[ModifiedBy] [bigint] NULL,
	[DeletedOn] [datetime2](7) NULL,
	[DeletedBy] [bigint] NULL,
	[IsActive] [bit] NOT NULL,
	[IsCompleted] [bit] NULL,
 CONSTRAINT [PK_Workout] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorkoutExercise]    Script Date: 3/11/2026 12:19:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkoutExercise](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[WorkoutId] [bigint] NOT NULL,
	[ExerciseId] [bigint] NOT NULL,
	[Notes] [nvarchar](max) NULL,
	[CreatedOn] [datetime2](7) NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[ModifiedOn] [datetime2](7) NULL,
	[ModifiedBy] [bigint] NULL,
	[DeletedOn] [datetime2](7) NULL,
	[DeletedBy] [bigint] NULL,
	[IsActive] [bit] NOT NULL,
	[Order] [int] NOT NULL,
 CONSTRAINT [PK_WorkoutExercise] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorkoutExerciseSet]    Script Date: 3/11/2026 12:19:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkoutExerciseSet](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[WorkoutExerciseId] [bigint] NOT NULL,
	[Weight] [decimal](18, 2) NULL,
	[WeightUnitId] [int] NULL,
	[Reps] [int] NULL,
	[RpeTypeId] [int] NULL,
	[TypeId] [int] NULL,
	[Rest] [int] NULL,
	[Notes] [nvarchar](max) NULL,
	[CreatedOn] [datetime2](7) NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[ModifiedOn] [datetime2](7) NULL,
	[ModifiedBy] [bigint] NULL,
	[DeletedOn] [datetime2](7) NULL,
	[DeletedBy] [bigint] NULL,
	[IsActive] [bit] NOT NULL,
	[Order] [int] NOT NULL,
	[DurationMinutes] [int] NULL,
 CONSTRAINT [PK_WorkoutExerciseSet] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250804165223_PK-4-User_UserRole', N'9.0.7')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250810124849_PK-4-User_Fullname', N'9.0.7')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250813110146_PK-13-Bodyweight_MeasurementUnit', N'9.0.7')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250813180421_PK-12-BodyweightGoal', N'9.0.7')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250817112953_PK-12-UserMeasurementPreference', N'9.0.7')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20251111103133_PK-20_Measurement_MeasurementGoal_Add', N'9.0.7')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20251111111404_PK-20_Measurement_LogDate_Add', N'9.0.7')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20251111214132_PK-20_Measurements_Change', N'9.0.7')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20251111214752_PK-20_MeasurementGoals_Change', N'9.0.7')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20251116193826_PK-18_Country_Add', N'9.0.7')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20251116200801_PK-16_User_Update', N'9.0.7')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20251116201226_PK-16_User_Update_Gender', N'9.0.7')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20251118184549_PK-16_User_HeightMeasurementUnitId', N'9.0.7')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20251119222824_PK-16_User_Height_Update', N'9.0.7')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20251122153619_PK-29_Exercise_Table_Add', N'9.0.7')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20251122161850_PK-29_Workout_WorkoutExercise_WESet_Tables_Add', N'9.0.7')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20251122182651_PK-29_WorkoutExerciseSet_Update_Rest', N'9.0.7')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20251126213533_PK-29_WorkoutExercise_WESets_Order', N'9.0.7')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20251127181157_PK-29_Set_Fields_Update', N'9.0.7')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20251127181352_PK-29_Views_Update_Rpe_SetType', N'9.0.7')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20251128170250_PK-29_Exercise_Equipment_Types_Update', N'9.0.7')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20251128172200_PK-29_WESets_DurationMinutes', N'9.0.7')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20251130182830_PK-29_Workout_IsCompleted_Update', N'9.0.7')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20251201193229_PK-29_Exercise_MuscleGroupsId_Update', N'9.0.7')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20251208124053_PK-30_ExerciseGoal_Add', N'9.0.7')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20260125141341_PK-38_Exercise_Rework', N'9.0.7')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20260131203431_PK-30_UserSelectedExercise_Add', N'9.0.7')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20260201195516_PK-25_User_DeactivateReason_Add', N'9.0.7')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20260224214548_PK-44_Exercise_Picture', N'9.0.7')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20260225212610_PK-44_Exercise_Picture_Update', N'9.0.7')
GO
SET IDENTITY_INSERT [dbo].[Bodyweight] ON 
GO
INSERT [dbo].[Bodyweight] ([Id], [UserId], [Value], [WeightUnitId], [BodyFatPercentage], [LogDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive]) VALUES (1, 1, CAST(85.4 AS Decimal(4, 1)), 1, CAST(15.1 AS Decimal(3, 1)), CAST(N'2025-08-17T00:00:00.0000000' AS DateTime2), CAST(N'2025-08-17T12:10:33.0965206' AS DateTime2), 1, CAST(N'2025-08-17T12:10:33.0965206' AS DateTime2), 1, NULL, NULL, 1)
GO
INSERT [dbo].[Bodyweight] ([Id], [UserId], [Value], [WeightUnitId], [BodyFatPercentage], [LogDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive]) VALUES (2, 1, CAST(85.6 AS Decimal(4, 1)), 1, NULL, CAST(N'2025-08-16T00:00:00.0000000' AS DateTime2), CAST(N'2025-08-17T12:11:22.6965290' AS DateTime2), 1, CAST(N'2025-08-17T12:11:22.6965290' AS DateTime2), 1, NULL, NULL, 1)
GO
INSERT [dbo].[Bodyweight] ([Id], [UserId], [Value], [WeightUnitId], [BodyFatPercentage], [LogDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive]) VALUES (3, 1, CAST(86.0 AS Decimal(4, 1)), 1, NULL, CAST(N'2025-09-14T00:00:00.0000000' AS DateTime2), CAST(N'2025-09-14T13:29:54.6601611' AS DateTime2), 1, CAST(N'2025-09-14T13:29:54.6601611' AS DateTime2), 1, CAST(N'2025-09-14T13:30:20.2937215' AS DateTime2), 1, 0)
GO
INSERT [dbo].[Bodyweight] ([Id], [UserId], [Value], [WeightUnitId], [BodyFatPercentage], [LogDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive]) VALUES (4, 1, CAST(85.0 AS Decimal(4, 1)), 1, NULL, CAST(N'2025-09-14T00:00:00.0000000' AS DateTime2), CAST(N'2025-09-14T13:30:13.0954512' AS DateTime2), 1, CAST(N'2025-09-14T13:30:13.0954512' AS DateTime2), 1, NULL, NULL, 1)
GO
INSERT [dbo].[Bodyweight] ([Id], [UserId], [Value], [WeightUnitId], [BodyFatPercentage], [LogDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive]) VALUES (5, 1, CAST(87.3 AS Decimal(4, 1)), 1, CAST(17.3 AS Decimal(3, 1)), CAST(N'2025-11-09T00:00:00.0000000' AS DateTime2), CAST(N'2025-11-08T20:22:21.0415458' AS DateTime2), 1, CAST(N'2025-11-09T15:36:38.7338779' AS DateTime2), 1, CAST(N'2025-11-09T15:36:54.4119558' AS DateTime2), 1, 0)
GO
INSERT [dbo].[Bodyweight] ([Id], [UserId], [Value], [WeightUnitId], [BodyFatPercentage], [LogDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive]) VALUES (6, 1, CAST(87.3 AS Decimal(4, 1)), 1, CAST(17.2 AS Decimal(3, 1)), CAST(N'2025-11-09T00:00:00.0000000' AS DateTime2), CAST(N'2025-11-09T15:37:04.8356975' AS DateTime2), 1, CAST(N'2025-11-09T15:37:04.8356975' AS DateTime2), 1, NULL, NULL, 1)
GO
INSERT [dbo].[Bodyweight] ([Id], [UserId], [Value], [WeightUnitId], [BodyFatPercentage], [LogDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive]) VALUES (7, 1, CAST(87.0 AS Decimal(4, 1)), 1, NULL, CAST(N'2025-11-10T00:00:00.0000000' AS DateTime2), CAST(N'2025-11-10T20:33:09.2692575' AS DateTime2), 1, CAST(N'2025-11-10T20:33:09.2692575' AS DateTime2), 1, NULL, NULL, 1)
GO
INSERT [dbo].[Bodyweight] ([Id], [UserId], [Value], [WeightUnitId], [BodyFatPercentage], [LogDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive]) VALUES (8, 1, CAST(88.0 AS Decimal(4, 1)), 1, CAST(17.0 AS Decimal(3, 1)), CAST(N'2025-11-14T00:00:00.0000000' AS DateTime2), CAST(N'2025-11-14T18:44:28.8515517' AS DateTime2), 1, CAST(N'2025-11-14T23:17:13.6463318' AS DateTime2), 1, NULL, NULL, 1)
GO
INSERT [dbo].[Bodyweight] ([Id], [UserId], [Value], [WeightUnitId], [BodyFatPercentage], [LogDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive]) VALUES (9, 1, CAST(87.3 AS Decimal(4, 1)), 1, NULL, CAST(N'2025-11-28T00:00:00.0000000' AS DateTime2), CAST(N'2025-12-03T21:31:15.1562346' AS DateTime2), 1, CAST(N'2025-12-03T21:31:15.1562346' AS DateTime2), 1, NULL, NULL, 1)
GO
INSERT [dbo].[Bodyweight] ([Id], [UserId], [Value], [WeightUnitId], [BodyFatPercentage], [LogDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive]) VALUES (10, 1, CAST(90.0 AS Decimal(4, 1)), 1, NULL, CAST(N'2025-12-03T00:00:00.0000000' AS DateTime2), CAST(N'2025-12-03T21:32:18.0366432' AS DateTime2), 1, CAST(N'2025-12-03T21:32:18.0366432' AS DateTime2), 1, NULL, NULL, 1)
GO
INSERT [dbo].[Bodyweight] ([Id], [UserId], [Value], [WeightUnitId], [BodyFatPercentage], [LogDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive]) VALUES (11, 1, CAST(90.7 AS Decimal(4, 1)), 1, NULL, CAST(N'2025-12-01T00:00:00.0000000' AS DateTime2), CAST(N'2025-12-03T21:33:38.4857034' AS DateTime2), 1, CAST(N'2025-12-03T21:33:38.4857034' AS DateTime2), 1, NULL, NULL, 1)
GO
INSERT [dbo].[Bodyweight] ([Id], [UserId], [Value], [WeightUnitId], [BodyFatPercentage], [LogDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive]) VALUES (12, 1, CAST(86.0 AS Decimal(4, 1)), 1, NULL, CAST(N'2025-11-25T00:00:00.0000000' AS DateTime2), CAST(N'2025-12-03T21:34:58.3694519' AS DateTime2), 1, CAST(N'2025-12-03T21:34:58.3694519' AS DateTime2), 1, NULL, NULL, 1)
GO
INSERT [dbo].[Bodyweight] ([Id], [UserId], [Value], [WeightUnitId], [BodyFatPercentage], [LogDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive]) VALUES (13, 13, CAST(86.6 AS Decimal(4, 1)), 1, CAST(17.0 AS Decimal(3, 1)), CAST(N'2026-02-17T00:00:00.0000000' AS DateTime2), CAST(N'2026-02-17T17:28:47.8838963' AS DateTime2), 13, CAST(N'2026-02-17T17:28:47.8838963' AS DateTime2), 13, NULL, NULL, 1)
GO
INSERT [dbo].[Bodyweight] ([Id], [UserId], [Value], [WeightUnitId], [BodyFatPercentage], [LogDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive]) VALUES (14, 13, CAST(87.9 AS Decimal(4, 1)), 1, CAST(17.0 AS Decimal(3, 1)), CAST(N'2026-02-11T00:00:00.0000000' AS DateTime2), CAST(N'2026-02-17T17:29:11.5354881' AS DateTime2), 13, CAST(N'2026-02-17T17:29:11.5354881' AS DateTime2), 13, NULL, NULL, 1)
GO
INSERT [dbo].[Bodyweight] ([Id], [UserId], [Value], [WeightUnitId], [BodyFatPercentage], [LogDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive]) VALUES (15, 13, CAST(87.6 AS Decimal(4, 1)), 1, CAST(17.0 AS Decimal(3, 1)), CAST(N'2026-02-12T00:00:00.0000000' AS DateTime2), CAST(N'2026-02-17T17:29:32.8573085' AS DateTime2), 13, CAST(N'2026-02-17T17:29:32.8573085' AS DateTime2), 13, NULL, NULL, 1)
GO
INSERT [dbo].[Bodyweight] ([Id], [UserId], [Value], [WeightUnitId], [BodyFatPercentage], [LogDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive]) VALUES (16, 13, CAST(87.3 AS Decimal(4, 1)), 1, CAST(17.0 AS Decimal(3, 1)), CAST(N'2026-02-14T00:00:00.0000000' AS DateTime2), CAST(N'2026-02-17T17:29:57.5322863' AS DateTime2), 13, CAST(N'2026-02-17T17:29:57.5322863' AS DateTime2), 13, NULL, NULL, 1)
GO
INSERT [dbo].[Bodyweight] ([Id], [UserId], [Value], [WeightUnitId], [BodyFatPercentage], [LogDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive]) VALUES (17, 13, CAST(87.7 AS Decimal(4, 1)), 1, CAST(17.3 AS Decimal(3, 1)), CAST(N'2026-02-01T00:00:00.0000000' AS DateTime2), CAST(N'2026-02-17T17:30:24.6895387' AS DateTime2), 13, CAST(N'2026-02-17T17:30:24.6895387' AS DateTime2), 13, NULL, NULL, 1)
GO
INSERT [dbo].[Bodyweight] ([Id], [UserId], [Value], [WeightUnitId], [BodyFatPercentage], [LogDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive]) VALUES (18, 13, CAST(87.5 AS Decimal(4, 1)), 1, CAST(17.3 AS Decimal(3, 1)), CAST(N'2026-02-02T00:00:00.0000000' AS DateTime2), CAST(N'2026-02-17T17:30:38.7713213' AS DateTime2), 13, CAST(N'2026-02-17T17:30:38.7713213' AS DateTime2), 13, NULL, NULL, 1)
GO
INSERT [dbo].[Bodyweight] ([Id], [UserId], [Value], [WeightUnitId], [BodyFatPercentage], [LogDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive]) VALUES (19, 13, CAST(87.5 AS Decimal(4, 1)), 1, CAST(17.3 AS Decimal(3, 1)), CAST(N'2026-02-03T00:00:00.0000000' AS DateTime2), CAST(N'2026-02-17T17:30:51.5461275' AS DateTime2), 13, CAST(N'2026-02-17T17:30:51.5461275' AS DateTime2), 13, NULL, NULL, 1)
GO
INSERT [dbo].[Bodyweight] ([Id], [UserId], [Value], [WeightUnitId], [BodyFatPercentage], [LogDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive]) VALUES (20, 13, CAST(87.5 AS Decimal(4, 1)), 1, CAST(17.3 AS Decimal(3, 1)), CAST(N'2026-02-04T00:00:00.0000000' AS DateTime2), CAST(N'2026-02-17T17:31:23.7974081' AS DateTime2), 13, CAST(N'2026-02-17T17:31:23.7974081' AS DateTime2), 13, NULL, NULL, 1)
GO
INSERT [dbo].[Bodyweight] ([Id], [UserId], [Value], [WeightUnitId], [BodyFatPercentage], [LogDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive]) VALUES (21, 13, CAST(87.4 AS Decimal(4, 1)), 1, CAST(17.3 AS Decimal(3, 1)), CAST(N'2026-02-05T00:00:00.0000000' AS DateTime2), CAST(N'2026-02-17T17:31:40.1968895' AS DateTime2), 13, CAST(N'2026-02-17T17:31:40.1968895' AS DateTime2), 13, NULL, NULL, 1)
GO
INSERT [dbo].[Bodyweight] ([Id], [UserId], [Value], [WeightUnitId], [BodyFatPercentage], [LogDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive]) VALUES (22, 13, CAST(87.4 AS Decimal(4, 1)), 1, CAST(17.3 AS Decimal(3, 1)), CAST(N'2026-02-06T00:00:00.0000000' AS DateTime2), CAST(N'2026-02-17T17:31:57.9316955' AS DateTime2), 13, CAST(N'2026-02-17T17:31:57.9316955' AS DateTime2), 13, NULL, NULL, 1)
GO
INSERT [dbo].[Bodyweight] ([Id], [UserId], [Value], [WeightUnitId], [BodyFatPercentage], [LogDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive]) VALUES (23, 13, CAST(86.5 AS Decimal(4, 1)), 1, CAST(17.3 AS Decimal(3, 1)), CAST(N'2026-02-07T00:00:00.0000000' AS DateTime2), CAST(N'2026-02-17T17:32:20.0830503' AS DateTime2), 13, CAST(N'2026-02-17T17:32:20.0830503' AS DateTime2), 13, NULL, NULL, 1)
GO
INSERT [dbo].[Bodyweight] ([Id], [UserId], [Value], [WeightUnitId], [BodyFatPercentage], [LogDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive]) VALUES (24, 13, CAST(87.2 AS Decimal(4, 1)), 1, CAST(17.3 AS Decimal(3, 1)), CAST(N'2026-02-09T00:00:00.0000000' AS DateTime2), CAST(N'2026-02-17T17:32:52.9224144' AS DateTime2), 13, CAST(N'2026-02-17T17:32:52.9224144' AS DateTime2), 13, NULL, NULL, 1)
GO
INSERT [dbo].[Bodyweight] ([Id], [UserId], [Value], [WeightUnitId], [BodyFatPercentage], [LogDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive]) VALUES (25, 13, CAST(87.9 AS Decimal(4, 1)), 1, CAST(17.3 AS Decimal(3, 1)), CAST(N'2026-02-10T00:00:00.0000000' AS DateTime2), CAST(N'2026-02-17T17:33:05.1015998' AS DateTime2), 13, CAST(N'2026-02-17T17:33:05.1015998' AS DateTime2), 13, NULL, NULL, 1)
GO
INSERT [dbo].[Bodyweight] ([Id], [UserId], [Value], [WeightUnitId], [BodyFatPercentage], [LogDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive]) VALUES (26, 13, CAST(86.0 AS Decimal(4, 1)), 1, CAST(17.9 AS Decimal(3, 1)), CAST(N'2026-01-22T00:00:00.0000000' AS DateTime2), CAST(N'2026-02-17T17:33:50.2276874' AS DateTime2), 13, CAST(N'2026-02-17T17:33:50.2276874' AS DateTime2), 13, NULL, NULL, 1)
GO
INSERT [dbo].[Bodyweight] ([Id], [UserId], [Value], [WeightUnitId], [BodyFatPercentage], [LogDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive]) VALUES (27, 13, CAST(86.0 AS Decimal(4, 1)), 1, CAST(17.9 AS Decimal(3, 1)), CAST(N'2026-01-23T00:00:00.0000000' AS DateTime2), CAST(N'2026-02-17T17:34:04.5737032' AS DateTime2), 13, CAST(N'2026-02-17T17:34:04.5737032' AS DateTime2), 13, NULL, NULL, 1)
GO
INSERT [dbo].[Bodyweight] ([Id], [UserId], [Value], [WeightUnitId], [BodyFatPercentage], [LogDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive]) VALUES (28, 13, CAST(85.6 AS Decimal(4, 1)), 1, CAST(17.9 AS Decimal(3, 1)), CAST(N'2026-01-24T00:00:00.0000000' AS DateTime2), CAST(N'2026-02-17T17:34:26.4872103' AS DateTime2), 13, CAST(N'2026-02-17T17:34:26.4872103' AS DateTime2), 13, NULL, NULL, 1)
GO
INSERT [dbo].[Bodyweight] ([Id], [UserId], [Value], [WeightUnitId], [BodyFatPercentage], [LogDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive]) VALUES (29, 13, CAST(85.6 AS Decimal(4, 1)), 1, CAST(17.9 AS Decimal(3, 1)), CAST(N'2026-01-25T00:00:00.0000000' AS DateTime2), CAST(N'2026-02-17T17:34:47.5511652' AS DateTime2), 13, CAST(N'2026-02-17T17:34:47.5511652' AS DateTime2), 13, NULL, NULL, 1)
GO
INSERT [dbo].[Bodyweight] ([Id], [UserId], [Value], [WeightUnitId], [BodyFatPercentage], [LogDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive]) VALUES (30, 13, CAST(87.4 AS Decimal(4, 1)), 1, CAST(17.9 AS Decimal(3, 1)), CAST(N'2026-01-26T00:00:00.0000000' AS DateTime2), CAST(N'2026-02-17T17:35:18.7864552' AS DateTime2), 13, CAST(N'2026-02-17T17:35:18.7864552' AS DateTime2), 13, NULL, NULL, 1)
GO
INSERT [dbo].[Bodyweight] ([Id], [UserId], [Value], [WeightUnitId], [BodyFatPercentage], [LogDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive]) VALUES (31, 13, CAST(87.0 AS Decimal(4, 1)), 1, CAST(17.9 AS Decimal(3, 1)), CAST(N'2026-01-27T00:00:00.0000000' AS DateTime2), CAST(N'2026-02-17T17:35:33.3043540' AS DateTime2), 13, CAST(N'2026-02-17T17:35:33.3043540' AS DateTime2), 13, NULL, NULL, 1)
GO
INSERT [dbo].[Bodyweight] ([Id], [UserId], [Value], [WeightUnitId], [BodyFatPercentage], [LogDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive]) VALUES (32, 13, CAST(87.5 AS Decimal(4, 1)), 1, CAST(17.9 AS Decimal(3, 1)), CAST(N'2026-01-28T00:00:00.0000000' AS DateTime2), CAST(N'2026-02-17T17:35:52.2964383' AS DateTime2), 13, CAST(N'2026-02-17T17:35:52.2964383' AS DateTime2), 13, NULL, NULL, 1)
GO
INSERT [dbo].[Bodyweight] ([Id], [UserId], [Value], [WeightUnitId], [BodyFatPercentage], [LogDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive]) VALUES (33, 13, CAST(87.5 AS Decimal(4, 1)), 1, CAST(17.9 AS Decimal(3, 1)), CAST(N'2026-01-29T00:00:00.0000000' AS DateTime2), CAST(N'2026-02-17T17:36:12.2671920' AS DateTime2), 13, CAST(N'2026-02-17T17:36:12.2671920' AS DateTime2), 13, NULL, NULL, 1)
GO
INSERT [dbo].[Bodyweight] ([Id], [UserId], [Value], [WeightUnitId], [BodyFatPercentage], [LogDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive]) VALUES (34, 13, CAST(88.1 AS Decimal(4, 1)), 1, CAST(17.9 AS Decimal(3, 1)), CAST(N'2026-01-30T00:00:00.0000000' AS DateTime2), CAST(N'2026-02-17T17:36:28.2897231' AS DateTime2), 13, CAST(N'2026-02-17T17:36:28.2897231' AS DateTime2), 13, NULL, NULL, 1)
GO
INSERT [dbo].[Bodyweight] ([Id], [UserId], [Value], [WeightUnitId], [BodyFatPercentage], [LogDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive]) VALUES (35, 13, CAST(87.5 AS Decimal(4, 1)), 1, CAST(17.9 AS Decimal(3, 1)), CAST(N'2026-01-31T00:00:00.0000000' AS DateTime2), CAST(N'2026-02-17T17:36:49.0082996' AS DateTime2), 13, CAST(N'2026-02-17T17:36:49.0082996' AS DateTime2), 13, NULL, NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[Bodyweight] OFF
GO
SET IDENTITY_INSERT [dbo].[BodyweightGoal] ON 
GO
INSERT [dbo].[BodyweightGoal] ([Id], [UserId], [Target], [WeightUnitId], [StartDate], [EndDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive]) VALUES (1, 1, CAST(102.5 AS Decimal(4, 1)), 1, CAST(N'2025-10-01' AS Date), CAST(N'2026-03-21' AS Date), CAST(N'2025-11-09T15:25:03.3145513' AS DateTime2), 1, CAST(N'2025-11-09T15:33:15.6754533' AS DateTime2), 1, CAST(N'2025-11-09T15:53:45.4886416' AS DateTime2), 1, 0)
GO
INSERT [dbo].[BodyweightGoal] ([Id], [UserId], [Target], [WeightUnitId], [StartDate], [EndDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive]) VALUES (2, 1, CAST(100.0 AS Decimal(4, 1)), 1, CAST(N'2025-11-09' AS Date), CAST(N'2026-02-19' AS Date), CAST(N'2025-11-09T15:26:00.3838627' AS DateTime2), 1, CAST(N'2025-11-09T15:26:00.3838627' AS DateTime2), 1, CAST(N'2025-11-09T15:27:59.1741564' AS DateTime2), 1, 0)
GO
INSERT [dbo].[BodyweightGoal] ([Id], [UserId], [Target], [WeightUnitId], [StartDate], [EndDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive]) VALUES (3, 1, CAST(100.0 AS Decimal(4, 1)), 1, CAST(N'2025-11-09' AS Date), CAST(N'2026-05-22' AS Date), CAST(N'2025-11-09T15:28:16.2947434' AS DateTime2), 1, CAST(N'2025-11-09T15:28:16.2947434' AS DateTime2), 1, CAST(N'2025-11-09T15:28:21.2923346' AS DateTime2), 1, 0)
GO
INSERT [dbo].[BodyweightGoal] ([Id], [UserId], [Target], [WeightUnitId], [StartDate], [EndDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive]) VALUES (5, 1, CAST(125.0 AS Decimal(4, 1)), 1, CAST(N'2024-01-01' AS Date), CAST(N'2027-01-01' AS Date), CAST(N'2025-11-09T15:44:16.0233333' AS DateTime2), 1, CAST(N'2025-11-09T15:45:54.3781572' AS DateTime2), 1, CAST(N'2025-11-09T15:53:43.6486967' AS DateTime2), 1, 0)
GO
INSERT [dbo].[BodyweightGoal] ([Id], [UserId], [Target], [WeightUnitId], [StartDate], [EndDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive]) VALUES (6, 1, CAST(100.0 AS Decimal(4, 1)), 1, CAST(N'2024-06-06' AS Date), CAST(N'2025-11-29' AS Date), CAST(N'2025-11-09T16:02:18.3129693' AS DateTime2), 1, CAST(N'2025-11-09T16:02:18.3129693' AS DateTime2), 1, CAST(N'2025-11-09T16:03:42.5197788' AS DateTime2), 1, 0)
GO
INSERT [dbo].[BodyweightGoal] ([Id], [UserId], [Target], [WeightUnitId], [StartDate], [EndDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive]) VALUES (7, 1, CAST(120.0 AS Decimal(4, 1)), 1, CAST(N'2025-08-14' AS Date), CAST(N'2026-01-16' AS Date), CAST(N'2025-11-10T19:34:33.1587059' AS DateTime2), 1, CAST(N'2025-11-10T19:34:33.1587059' AS DateTime2), 1, CAST(N'2025-11-10T20:16:59.7942967' AS DateTime2), 1, 0)
GO
INSERT [dbo].[BodyweightGoal] ([Id], [UserId], [Target], [WeightUnitId], [StartDate], [EndDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive]) VALUES (8, 1, CAST(100.0 AS Decimal(4, 1)), 1, CAST(N'2024-08-02' AS Date), CAST(N'2026-08-19' AS Date), CAST(N'2025-11-10T19:35:10.5296069' AS DateTime2), 1, CAST(N'2025-11-10T19:35:10.5296069' AS DateTime2), 1, CAST(N'2025-11-10T19:35:51.8151390' AS DateTime2), 1, 0)
GO
INSERT [dbo].[BodyweightGoal] ([Id], [UserId], [Target], [WeightUnitId], [StartDate], [EndDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive]) VALUES (9, 1, CAST(90.0 AS Decimal(4, 1)), 1, CAST(N'2025-11-10' AS Date), CAST(N'2026-03-26' AS Date), CAST(N'2025-11-10T20:33:54.6003516' AS DateTime2), 1, CAST(N'2025-11-10T20:33:54.6003516' AS DateTime2), 1, NULL, NULL, 1)
GO
INSERT [dbo].[BodyweightGoal] ([Id], [UserId], [Target], [WeightUnitId], [StartDate], [EndDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive]) VALUES (10, 13, CAST(92.0 AS Decimal(4, 1)), 1, CAST(N'2026-01-22' AS Date), CAST(N'2026-05-10' AS Date), CAST(N'2026-02-17T17:38:42.4651526' AS DateTime2), 13, CAST(N'2026-02-17T17:38:42.4651526' AS DateTime2), 13, NULL, NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[BodyweightGoal] OFF
GO
SET IDENTITY_INSERT [dbo].[Country] ON 
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (1, N'AF', N'AFG', N'Afghanistan')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (2, N'AX', N'ALA', N'Aland Islands')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (3, N'AL', N'ALB', N'Albania')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (4, N'DZ', N'DZA', N'Algeria')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (5, N'AS', N'ASM', N'American Samoa')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (6, N'AD', N'AND', N'Andorra')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (7, N'AO', N'AGO', N'Angola')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (8, N'AI', N'AIA', N'Anguilla')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (9, N'AQ', N'ATA', N'Antarctica')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (10, N'AG', N'ATG', N'Antigua and Barbuda')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (11, N'AR', N'ARG', N'Argentina')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (12, N'AM', N'ARM', N'Armenia')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (13, N'AW', N'ABW', N'Aruba')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (14, N'AU', N'AUS', N'Australia')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (15, N'AT', N'AUT', N'Austria')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (16, N'AZ', N'AZE', N'Azerbaijan')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (17, N'BS', N'BHS', N'Bahamas')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (18, N'BH', N'BHR', N'Bahrain')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (19, N'BD', N'BGD', N'Bangladesh')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (20, N'BB', N'BRB', N'Barbados')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (21, N'BY', N'BLR', N'Belarus')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (22, N'BE', N'BEL', N'Belgium')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (23, N'BZ', N'BLZ', N'Belize')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (24, N'BJ', N'BEN', N'Benin')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (25, N'BM', N'BMU', N'Bermuda')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (26, N'BT', N'BTN', N'Bhutan')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (27, N'BO', N'BOL', N'Bolivia')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (28, N'BQ', N'BES', N'Bonaire')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (29, N'BA', N'BIH', N'Bosnia and Herzegovina')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (30, N'BW', N'BWA', N'Botswana')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (31, N'BV', N'BVT', N'Bouvet Island')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (32, N'BR', N'BRA', N'Brazil')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (33, N'IO', N'IOT', N'British Indian Ocean Territory')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (34, N'BN', N'BRN', N'Brunei Darussalam')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (35, N'BG', N'BGR', N'Bulgaria')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (36, N'BF', N'BFA', N'Burkina Faso')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (37, N'BI', N'BDI', N'Burundi')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (38, N'CV', N'CPV', N'Cabo Verde')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (39, N'KH', N'KHM', N'Cambodia')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (40, N'CM', N'CMR', N'Cameroon')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (41, N'CA', N'CAN', N'Canada')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (42, N'KY', N'CYM', N'Cayman Islands')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (43, N'CF', N'CAF', N'Central African Republic')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (44, N'TD', N'TCD', N'Chad')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (45, N'CL', N'CHL', N'Chile')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (46, N'CN', N'CHN', N'China')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (47, N'CX', N'CXR', N'Christmas Island')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (48, N'CC', N'CCK', N'Cocos Islands')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (49, N'CO', N'COL', N'Colombia')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (50, N'KM', N'COM', N'Comoros')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (51, N'CD', N'COD', N'Democratic Republic of the Congo')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (52, N'CG', N'COG', N'Congo')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (53, N'CK', N'COK', N'Cook Islands')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (54, N'CR', N'CRI', N'Costa Rica')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (55, N'HR', N'HRV', N'Croatia')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (56, N'CU', N'CUB', N'Cuba')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (57, N'CW', N'CUW', N'Cura‡ao')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (58, N'CY', N'CYP', N'Cyprus')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (59, N'CZ', N'CZE', N'Czechia')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (60, N'CI', N'CIV', N'C“te d''Ivoire')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (61, N'DK', N'DNK', N'Denmark')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (62, N'DJ', N'DJI', N'Djibouti')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (63, N'DM', N'DMA', N'Dominica')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (64, N'DO', N'DOM', N'Dominican Republic')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (65, N'EC', N'ECU', N'Ecuador')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (66, N'EG', N'EGY', N'Egypt')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (67, N'SV', N'SLV', N'El Salvador')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (68, N'GQ', N'GNQ', N'Equatorial Guinea')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (69, N'ER', N'ERI', N'Eritrea')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (70, N'EE', N'EST', N'Estonia')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (71, N'SZ', N'SWZ', N'Eswatini')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (72, N'ET', N'ETH', N'Ethiopia')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (73, N'FK', N'FLK', N'Falkland Islands')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (74, N'FO', N'FRO', N'Faroe Islands')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (75, N'FJ', N'FJI', N'Fiji')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (76, N'FI', N'FIN', N'Finland')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (77, N'FR', N'FRA', N'France')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (78, N'GF', N'GUF', N'French Guiana')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (79, N'PF', N'PYF', N'French Polynesia')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (80, N'TF', N'ATF', N'French Southern Territories')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (81, N'GA', N'GAB', N'Gabon')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (82, N'GM', N'GMB', N'Gambia')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (83, N'GE', N'GEO', N'Georgia')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (84, N'DE', N'DEU', N'Germany')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (85, N'GH', N'GHA', N'Ghana')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (86, N'GI', N'GIB', N'Gibraltar')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (87, N'GR', N'GRC', N'Greece')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (88, N'GL', N'GRL', N'Greenland')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (89, N'GD', N'GRD', N'Grenada')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (90, N'GP', N'GLP', N'Guadeloupe')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (91, N'GU', N'GUM', N'Guam')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (92, N'GT', N'GTM', N'Guatemala')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (93, N'GG', N'GGY', N'Guernsey')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (94, N'GN', N'GIN', N'Guinea')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (95, N'GW', N'GNB', N'Guinea-Bissau')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (96, N'GY', N'GUY', N'Guyana')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (97, N'HT', N'HTI', N'Haiti')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (98, N'HM', N'HMD', N'Heard Island and McDonald Islands')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (99, N'VA', N'VAT', N'Vatican')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (100, N'HN', N'HND', N'Honduras')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (101, N'HK', N'HKG', N'Hong Kong')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (102, N'HU', N'HUN', N'Hungary')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (103, N'IS', N'ISL', N'Iceland')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (104, N'IN', N'IND', N'India')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (105, N'ID', N'IDN', N'Indonesia')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (106, N'IR', N'IRN', N'Iran')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (107, N'IQ', N'IRQ', N'Iraq')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (108, N'IE', N'IRL', N'Ireland')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (109, N'IM', N'IMN', N'Isle of Man')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (110, N'IL', N'ISR', N'Israel')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (111, N'IT', N'ITA', N'Italy')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (112, N'JM', N'JAM', N'Jamaica')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (113, N'JP', N'JPN', N'Japan')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (114, N'JE', N'JEY', N'Jersey')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (115, N'JO', N'JOR', N'Jordan')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (116, N'KZ', N'KAZ', N'Kazakhstan')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (117, N'KE', N'KEN', N'Kenya')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (118, N'KI', N'KIR', N'Kiribati')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (119, N'KP', N'PRK', N'North Korea')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (120, N'KR', N'KOR', N'South Korea')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (121, N'KW', N'KWT', N'Kuwait')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (122, N'KG', N'KGZ', N'Kyrgyzstan')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (123, N'LA', N'LAO', N'Laos')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (124, N'LV', N'LVA', N'Latvia')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (125, N'LB', N'LBN', N'Lebanon')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (126, N'LS', N'LSO', N'Lesotho')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (127, N'LR', N'LBR', N'Liberia')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (128, N'LY', N'LBY', N'Libya')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (129, N'LI', N'LIE', N'Liechtenstein')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (130, N'LT', N'LTU', N'Lithuania')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (131, N'LU', N'LUX', N'Luxembourg')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (132, N'MO', N'MAC', N'Macao')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (133, N'MG', N'MDG', N'Madagascar')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (134, N'MW', N'MWI', N'Malawi')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (135, N'MY', N'MYS', N'Malaysia')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (136, N'MV', N'MDV', N'Maldives')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (137, N'ML', N'MLI', N'Mali')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (138, N'MT', N'MLT', N'Malta')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (139, N'MH', N'MHL', N'Marshall Islands')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (140, N'MQ', N'MTQ', N'Martinique')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (141, N'MR', N'MRT', N'Mauritania')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (142, N'MU', N'MUS', N'Mauritius')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (143, N'YT', N'MYT', N'Mayotte')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (144, N'MX', N'MEX', N'Mexico')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (145, N'FM', N'FSM', N'Micronesia')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (146, N'MD', N'MDA', N'Moldova')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (147, N'MC', N'MCO', N'Monaco')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (148, N'MN', N'MNG', N'Mongolia')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (149, N'ME', N'MNE', N'Montenegro')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (150, N'MS', N'MSR', N'Montserrat')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (151, N'MA', N'MAR', N'Morocco')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (152, N'MZ', N'MOZ', N'Mozambique')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (153, N'MM', N'MMR', N'Myanmar')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (154, N'NA', N'NAM', N'Namibia')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (155, N'NR', N'NRU', N'Nauru')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (156, N'NP', N'NPL', N'Nepal')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (157, N'NL', N'NLD', N'Netherlands')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (158, N'NC', N'NCL', N'New Caledonia')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (159, N'NZ', N'NZL', N'New Zealand')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (160, N'NI', N'NIC', N'Nicaragua')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (161, N'NE', N'NER', N'Niger')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (162, N'NG', N'NGA', N'Nigeria')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (163, N'NU', N'NIU', N'Niue')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (164, N'NF', N'NFK', N'Norfolk Island')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (165, N'MP', N'MNP', N'Northern Mariana Islands')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (166, N'NO', N'NOR', N'Norway')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (167, N'OM', N'OMN', N'Oman')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (168, N'PK', N'PAK', N'Pakistan')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (169, N'PW', N'PLW', N'Palau')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (170, N'PS', N'PSE', N'Palestine')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (171, N'PA', N'PAN', N'Panama')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (172, N'PG', N'PNG', N'Papua New Guinea')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (173, N'PY', N'PRY', N'Paraguay')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (174, N'PE', N'PER', N'Peru')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (175, N'PH', N'PHL', N'Philippines')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (176, N'PN', N'PCN', N'Pitcairn')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (177, N'PL', N'POL', N'Poland')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (178, N'PT', N'PRT', N'Portugal')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (179, N'PR', N'PRI', N'Puerto Rico')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (180, N'QA', N'QAT', N'Qatar')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (181, N'MK', N'MKD', N'Republic of North Macedonia')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (182, N'RO', N'ROU', N'Romania')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (183, N'RU', N'RUS', N'Russian Federation')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (184, N'RW', N'RWA', N'Rwanda')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (185, N'RE', N'REU', N'Reunion')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (186, N'BL', N'BLM', N'Saint Barthelemy')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (187, N'SH', N'SHN', N'Saint Helena')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (188, N'KN', N'KNA', N'Saint Kitts and Nevis')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (189, N'LC', N'LCA', N'Saint Lucia')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (190, N'MF', N'MAF', N'Saint Martin')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (191, N'PM', N'SPM', N'Saint Pierre and Miquelon')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (192, N'VC', N'VCT', N'Saint Vincent and the Grenadines')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (193, N'WS', N'WSM', N'Samoa')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (194, N'SM', N'SMR', N'San Marino')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (195, N'ST', N'STP', N'Sao Tome and Principe')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (196, N'SA', N'SAU', N'Saudi Arabia')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (197, N'SN', N'SEN', N'Senegal')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (198, N'RS', N'SRB', N'Serbia')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (199, N'SC', N'SYC', N'Seychelles')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (200, N'SL', N'SLE', N'Sierra Leone')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (201, N'SG', N'SGP', N'Singapore')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (202, N'SX', N'SXM', N'Sint Maarten')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (203, N'SK', N'SVK', N'Slovakia')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (204, N'SI', N'SVN', N'Slovenia')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (205, N'SB', N'SLB', N'Solomon Islands')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (206, N'SO', N'SOM', N'Somalia')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (207, N'ZA', N'ZAF', N'South Africa')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (208, N'GS', N'SGS', N'South Georgia and the South Sandwich Islands')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (209, N'SS', N'SSD', N'South Sudan')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (210, N'ES', N'ESP', N'Spain')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (211, N'LK', N'LKA', N'Sri Lanka')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (212, N'SD', N'SDN', N'Sudan')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (213, N'SR', N'SUR', N'Suriname')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (214, N'SJ', N'SJM', N'Svalbard and Jan Mayen')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (215, N'SE', N'SWE', N'Sweden')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (216, N'CH', N'CHE', N'Switzerland')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (217, N'SY', N'SYR', N'Syrian Arab Republic')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (218, N'TW', N'TWN', N'Taiwan')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (219, N'TJ', N'TJK', N'Tajikistan')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (220, N'TZ', N'TZA', N'Tanzania')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (221, N'TH', N'THA', N'Thailand')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (222, N'TL', N'TLS', N'Timor-Leste')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (223, N'TG', N'TGO', N'Togo')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (224, N'TK', N'TKL', N'Tokelau')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (225, N'TO', N'TON', N'Tonga')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (226, N'TT', N'TTO', N'Trinidad and Tobago')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (227, N'TN', N'TUN', N'Tunisia')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (228, N'TR', N'TUR', N'Turkey')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (229, N'TM', N'TKM', N'Turkmenistan')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (230, N'TC', N'TCA', N'Turks and Caicos Islands')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (231, N'TV', N'TUV', N'Tuvalu')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (232, N'UG', N'UGA', N'Uganda')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (233, N'UA', N'UKR', N'Ukraine')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (234, N'AE', N'ARE', N'United Arab Emirates')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (235, N'GB', N'GBR', N'United Kingdom')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (236, N'UM', N'UMI', N'United States Minor Outlying Islands')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (237, N'US', N'USA', N'United States of America')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (238, N'UY', N'URY', N'Uruguay')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (239, N'UZ', N'UZB', N'Uzbekistan')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (240, N'VU', N'VUT', N'Vanuatu')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (241, N'VE', N'VEN', N'Venezuela')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (242, N'VN', N'VNM', N'Viet Nam')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (243, N'VG', N'VGB', N'British Virgin Islands')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (244, N'VI', N'VIR', N'U.S. Virgin Islands')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (245, N'WF', N'WLF', N'Wallis and Futuna')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (246, N'EH', N'ESH', N'Western Sahara')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (247, N'YE', N'YEM', N'Yemen')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (248, N'ZM', N'ZMB', N'Zambia')
GO
INSERT [dbo].[Country] ([Id], [ISO2], [ISO3], [Name]) VALUES (249, N'ZW', N'ZWE', N'Zimbabwe')
GO
SET IDENTITY_INSERT [dbo].[Country] OFF
GO
SET IDENTITY_INSERT [dbo].[ErrorLog] ON 
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (1, N'One or more validation failures have occurred', N'   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\ValidationBehavior.cs:line 26
   at PeakPerformance.Api.Controllers.BodyweightController.Save(BodyweightDto data) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\BodyweightController.cs:line 17
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2025-08-17T11:59:25.9191484' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (2, N'One or more validation failures have occurred', N'   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\ValidationBehavior.cs:line 26
   at PeakPerformance.Api.Controllers.BodyweightController.Save(BodyweightDto data) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\BodyweightController.cs:line 17
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2025-08-17T12:00:02.9900352' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (3, N'One or more validation failures have occurred', N'   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\ValidationBehavior.cs:line 26
   at PeakPerformance.Api.Controllers.BodyweightController.Save(BodyweightDto data) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\BodyweightController.cs:line 17
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2025-08-17T12:03:49.4204604' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (4, N'One or more validation failures have occurred', N'   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\ValidationBehavior.cs:line 26
   at PeakPerformance.Api.Controllers.BodyweightController.Save(BodyweightDto data) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\BodyweightController.cs:line 17
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2025-08-17T12:04:26.5095998' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (5, N'One or more validation failures have occurred', N'   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\ValidationBehavior.cs:line 26
   at PeakPerformance.Api.Controllers.BodyweightController.Save(BodyweightDto data) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\BodyweightController.cs:line 17
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2025-08-17T12:05:16.3320889' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (6, N'One or more validation failures have occurred', N'   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\ValidationBehavior.cs:line 26
   at PeakPerformance.Api.Controllers.BodyweightController.Save(BodyweightDto data) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\BodyweightController.cs:line 17
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2025-08-17T12:08:18.0692103' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (7, N'One or more validation failures have occurred', N'   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\ValidationBehavior.cs:line 26
   at PeakPerformance.Api.Controllers.BodyweightController.Save(BodyweightDto data) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\BodyweightController.cs:line 17
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2025-08-17T12:09:46.6913076' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (8, N'One or more validation failures have occurred', N'   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\ValidationBehavior.cs:line 26
   at PeakPerformance.Api.Controllers.BodyweightController.Save(BodyweightDto data) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\BodyweightController.cs:line 17
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2025-08-17T12:10:57.8473708' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (9, N'One or more validation failures have occurred', N'   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\ValidationBehavior.cs:line 26
   at PeakPerformance.Api.Controllers.AuthController.Login(LoginDto data) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\AuthController.cs:line 14
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2025-09-14T05:47:41.3795386' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (10, N'One or more validation failures have occurred', N'   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\ValidationBehavior.cs:line 26
   at PeakPerformance.Api.Controllers.AuthController.Login(LoginDto data) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\AuthController.cs:line 14
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2025-09-14T05:49:01.4811177' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (11, N'One or more validation failures have occurred', N'   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\ValidationBehavior.cs:line 26
   at PeakPerformance.Api.Controllers.BodyweightGoalController.Save(BodyweightGoalDto data) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\BodyweightGoalController.cs:line 17
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2025-11-09T15:16:27.8460946' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (12, N'One or more validation failures have occurred', N'   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\ValidationBehavior.cs:line 26
   at PeakPerformance.Api.Controllers.BodyweightGoalController.Save(BodyweightGoalDto data) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\BodyweightGoalController.cs:line 17
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2025-11-09T15:19:24.9578506' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (13, N'One or more validation failures have occurred', N'   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\ValidationBehavior.cs:line 26
   at PeakPerformance.Api.Controllers.BodyweightGoalController.Save(BodyweightGoalDto data) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\BodyweightGoalController.cs:line 17
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2025-11-09T15:20:07.9848802' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (14, N'One or more validation failures have occurred', N'   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken)
   at PeakPerformance.Api.Controllers.BodyweightGoalController.Save(BodyweightGoalDto data) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\BodyweightGoalController.cs:line 17
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2025-11-09T15:23:49.0542891' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (15, N'One or more validation failures have occurred', N'   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\ValidationBehavior.cs:line 26
   at PeakPerformance.Api.Controllers.BodyweightGoalController.Save(BodyweightGoalDto data) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\BodyweightGoalController.cs:line 17
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2025-11-09T15:45:16.5770528' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (16, N'One or more validation failures have occurred', N'   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\ValidationBehavior.cs:line 26
   at PeakPerformance.Api.Controllers.BodyweightGoalController.Save(BodyweightGoalDto data) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\BodyweightGoalController.cs:line 17
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2025-11-09T16:18:37.5832255' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (17, N'One or more validation failures have occurred', N'   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\ValidationBehavior.cs:line 26
   at PeakPerformance.Api.Controllers.BodyweightGoalController.Save(BodyweightGoalDto data) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\BodyweightGoalController.cs:line 17
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2025-11-09T16:20:04.6485218' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (18, N'One or more validation failures have occurred', N'   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\ValidationBehavior.cs:line 26
   at PeakPerformance.Api.Controllers.BodyweightController.Save(BodyweightDto data) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\BodyweightController.cs:line 17
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2025-11-09T16:23:27.0250263' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (19, N'One or more validation failures have occurred', N'   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\ValidationBehavior.cs:line 26
   at PeakPerformance.Api.Controllers.BodyweightController.Save(BodyweightDto data) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\BodyweightController.cs:line 17
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2025-11-09T16:24:59.7109132' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (20, N'One or more validation failures have occurred', N'   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\ValidationBehavior.cs:line 26
   at PeakPerformance.Api.Controllers.BodyweightController.Save(BodyweightDto data) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\BodyweightController.cs:line 17
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2025-11-09T16:25:04.1398370' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (21, N'One or more validation failures have occurred', N'   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\ValidationBehavior.cs:line 26
   at PeakPerformance.Api.Controllers.BodyweightController.Save(BodyweightDto data) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\BodyweightController.cs:line 17
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2025-11-09T16:27:18.0012781' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (22, N'One or more validation failures have occurred', N'   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\ValidationBehavior.cs:line 26
   at PeakPerformance.Api.Controllers.BodyweightController.Save(BodyweightDto data) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\BodyweightController.cs:line 17
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2025-11-09T16:27:51.6596449' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (23, N'One or more validation failures have occurred', N'   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\ValidationBehavior.cs:line 26
   at PeakPerformance.Api.Controllers.BodyweightGoalController.Save(BodyweightGoalDto data) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\BodyweightGoalController.cs:line 17
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2025-11-09T16:27:58.5274109' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (24, N'One or more validation failures have occurred', N'   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\ValidationBehavior.cs:line 26
   at PeakPerformance.Api.Controllers.BodyweightGoalController.Save(BodyweightGoalDto data) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\BodyweightGoalController.cs:line 17
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2025-11-09T16:28:39.9778413' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (25, N'One or more validation failures have occurred', N'   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\ValidationBehavior.cs:line 26
   at PeakPerformance.Api.Controllers.BodyweightGoalController.Save(BodyweightGoalDto data) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\BodyweightGoalController.cs:line 17
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2025-11-09T16:31:27.0159622' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (26, N'One or more validation failures have occurred', N'   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\ValidationBehavior.cs:line 26
   at PeakPerformance.Api.Controllers.BodyweightGoalController.Save(BodyweightGoalDto data) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\BodyweightGoalController.cs:line 17
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2025-11-09T16:31:57.2966333' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (27, N'One or more validation failures have occurred', N'   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\ValidationBehavior.cs:line 26
   at PeakPerformance.Api.Controllers.BodyweightGoalController.Save(BodyweightGoalDto data) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\BodyweightGoalController.cs:line 17
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2025-11-09T16:33:00.0205702' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (28, N'One or more validation failures have occurred', N'   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\ValidationBehavior.cs:line 26
   at PeakPerformance.Api.Controllers.BodyweightGoalController.Save(BodyweightGoalDto data) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\BodyweightGoalController.cs:line 17
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2025-11-09T16:33:54.4697247' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (29, N'One or more validation failures have occurred', N'   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\ValidationBehavior.cs:line 26
   at PeakPerformance.Api.Controllers.BodyweightGoalController.Save(BodyweightGoalDto data) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\BodyweightGoalController.cs:line 17
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2025-11-09T16:35:28.4819679' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (30, N'One or more validation failures have occurred', N'   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken)
   at PeakPerformance.Api.Controllers.BodyweightGoalController.Save(BodyweightGoalDto data) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\BodyweightGoalController.cs:line 17
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2025-11-09T16:36:53.3399846' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (31, N'One or more validation failures have occurred', N'   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken)
   at PeakPerformance.Api.Controllers.BodyweightGoalController.Save(BodyweightGoalDto data) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\BodyweightGoalController.cs:line 17
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2025-11-09T16:37:30.5021635' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (32, N'One or more validation failures have occurred', N'   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken)
   at PeakPerformance.Api.Controllers.BodyweightGoalController.Save(BodyweightGoalDto data) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\BodyweightGoalController.cs:line 17
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2025-11-09T16:38:41.4756768' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (33, N'One or more validation failures have occurred', N'   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken)
   at PeakPerformance.Api.Controllers.BodyweightGoalController.Save(BodyweightGoalDto data) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\BodyweightGoalController.cs:line 17
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2025-11-09T16:41:47.6622495' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (34, N'One or more validation failures have occurred', N'   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken)
   at PeakPerformance.Api.Controllers.BodyweightController.Save(BodyweightDto data) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\BodyweightController.cs:line 17
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2025-11-09T16:42:20.2147520' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (35, N'Object reference not set to an instance of an object.', N'   at PeakPerformance.Application.BusinessLogic.Measurements.Queries.SearchMeasurementQuery.SearchMeasurementQueryHandler.Handle(SearchMeasurementQuery request, CancellationToken cancellationToken)
   at PeakPerformance.Application.BusinessLogic._Behaviors.PerformanceMonitoringBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken)
   at PeakPerformance.Application.BusinessLogic._Behaviors.LoggingBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken)
   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken)
   at PeakPerformance.Api.Controllers.MeasurementController.Search(MeasurementSearchOptions options) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\MeasurementController.cs:line 18
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeInnerFilterAsync>g__Awaited|13_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2025-11-14T18:52:13.7041881' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (36, N'One or more validation failures have occurred', N'   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\ValidationBehavior.cs:line 26
   at PeakPerformance.Api.Controllers.MeasurementController.Update(MeasurementDto data) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\MeasurementController.cs:line 28
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2025-11-14T19:02:17.2462565' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (37, N'One or more validation failures have occurred', N'   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\ValidationBehavior.cs:line 26
   at PeakPerformance.Api.Controllers.MeasurementGoalController.Create(MeasurementGoalCreateDto data) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\MeasurementGoalController.cs:line 17
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2025-11-14T19:20:44.2032929' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (38, N'Sequence contains no elements.', N'   at lambda_method762(Closure, QueryContext, DbDataReader, ResultContext, SingleQueryResultCoordinator)
   at Microsoft.EntityFrameworkCore.Query.Internal.SingleQueryingEnumerable`1.AsyncEnumerator.MoveNextAsync()
   at Microsoft.EntityFrameworkCore.Query.ShapedQueryCompilingExpressionVisitor.SingleAsync[TSource](IAsyncEnumerable`1 asyncEnumerable, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.Query.ShapedQueryCompilingExpressionVisitor.SingleAsync[TSource](IAsyncEnumerable`1 asyncEnumerable, CancellationToken cancellationToken)
   at PeakPerformance.Application.BusinessLogic.Measurements.Queries.GetCurrentMeasurementInfoQuery.GetCurrentMeasurementInfoQueryHandler.Handle(GetCurrentMeasurementInfoQuery request, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\Measurements\Queries\GetCurrentMeasurementInfoQuery.cs:line 28
   at PeakPerformance.Application.BusinessLogic._Behaviors.PerformanceMonitoringBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\PerformanceMonitoringBehavior.cs:line 18
   at PeakPerformance.Application.BusinessLogic._Behaviors.LoggingBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\LoggingBehavior.cs:line 17
   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\ValidationBehavior.cs:line 28
   at PeakPerformance.Api.Controllers.MeasurementController.GetCurrentMeasurementInfo() in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\MeasurementController.cs:line 13
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeInnerFilterAsync>g__Awaited|13_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2025-11-16T17:22:45.4574351' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (39, N'Sequence contains no elements.', N'   at lambda_method762(Closure, QueryContext, DbDataReader, ResultContext, SingleQueryResultCoordinator)
   at Microsoft.EntityFrameworkCore.Query.Internal.SingleQueryingEnumerable`1.AsyncEnumerator.MoveNextAsync()
   at Microsoft.EntityFrameworkCore.Query.ShapedQueryCompilingExpressionVisitor.SingleAsync[TSource](IAsyncEnumerable`1 asyncEnumerable, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.Query.ShapedQueryCompilingExpressionVisitor.SingleAsync[TSource](IAsyncEnumerable`1 asyncEnumerable, CancellationToken cancellationToken)
   at PeakPerformance.Application.BusinessLogic.Measurements.Queries.GetCurrentMeasurementInfoQuery.GetCurrentMeasurementInfoQueryHandler.Handle(GetCurrentMeasurementInfoQuery request, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\Measurements\Queries\GetCurrentMeasurementInfoQuery.cs:line 28
   at PeakPerformance.Application.BusinessLogic._Behaviors.PerformanceMonitoringBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\PerformanceMonitoringBehavior.cs:line 18
   at PeakPerformance.Application.BusinessLogic._Behaviors.LoggingBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\LoggingBehavior.cs:line 17
   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\ValidationBehavior.cs:line 28
   at PeakPerformance.Api.Controllers.MeasurementController.GetCurrentMeasurementInfo() in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\MeasurementController.cs:line 13
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeInnerFilterAsync>g__Awaited|13_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2025-11-16T17:23:23.0945141' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (40, N'Sequence contains no elements.', N'   at lambda_method428(Closure, QueryContext, DbDataReader, ResultContext, SingleQueryResultCoordinator)
   at Microsoft.EntityFrameworkCore.Query.Internal.SingleQueryingEnumerable`1.AsyncEnumerator.MoveNextAsync()
   at Microsoft.EntityFrameworkCore.Query.ShapedQueryCompilingExpressionVisitor.SingleAsync[TSource](IAsyncEnumerable`1 asyncEnumerable, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.Query.ShapedQueryCompilingExpressionVisitor.SingleAsync[TSource](IAsyncEnumerable`1 asyncEnumerable, CancellationToken cancellationToken)
   at PeakPerformance.Application.BusinessLogic.Measurements.Queries.GetCurrentMeasurementInfoQuery.GetCurrentMeasurementInfoQueryHandler.Handle(GetCurrentMeasurementInfoQuery request, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\Measurements\Queries\GetCurrentMeasurementInfoQuery.cs:line 28
   at PeakPerformance.Application.BusinessLogic._Behaviors.PerformanceMonitoringBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\PerformanceMonitoringBehavior.cs:line 18
   at PeakPerformance.Application.BusinessLogic._Behaviors.LoggingBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\LoggingBehavior.cs:line 17
   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\ValidationBehavior.cs:line 28
   at PeakPerformance.Api.Controllers.MeasurementController.GetCurrentMeasurementInfo() in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\MeasurementController.cs:line 13
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeInnerFilterAsync>g__Awaited|13_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2025-11-16T17:24:09.0127552' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (41, N'One or more validation failures have occurred', N'   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken)
   at PeakPerformance.Api.Controllers.UserController.UpdatePersonalDetails(UserDto data) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\UserController.cs:line 18
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2025-11-17T19:11:32.1926216' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (42, N'One or more validation failures have occurred', N'   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\ValidationBehavior.cs:line 26
   at PeakPerformance.Api.Controllers.UserController.UpdatePersonalDetails(UserDto data) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\UserController.cs:line 18
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2025-11-17T19:28:36.6078966' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (43, N'One or more validation failures have occurred', N'   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken)
   at PeakPerformance.Api.Controllers.UserController.ChangePassword(ChangePasswordDto data) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\UserController.cs:line 54
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2025-11-17T19:41:05.2071231' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (44, N'Missing type map configuration or unsupported mapping.

Mapping types:
FileInformationDto -> FileInformation
PeakPerformance.Application.Dtos._Base.FileInformationDto -> PeakPerformance.Domain.ValueObjects.FileInformation', N'   at lambda_method190(Closure, Object, FileInformation, ResolutionContext)
   at PeakPerformance.Application.BusinessLogic.Users.Commands.UpdateProfilePictureCommand.UpdateProfilePictureCommandHandler.Handle(UpdateProfilePictureCommand request, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\Users\Commands\UpdateProfilePictureCommand.cs:line 22
   at PeakPerformance.Application.BusinessLogic._Behaviors.PerformanceMonitoringBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\PerformanceMonitoringBehavior.cs:line 18
   at PeakPerformance.Application.BusinessLogic._Behaviors.LoggingBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\LoggingBehavior.cs:line 17
   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\ValidationBehavior.cs:line 28
   at PeakPerformance.Api.Controllers.UserController.UpdateProfilePicture(Int64 userId) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\UserController.cs:line 43
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeInnerFilterAsync>g__Awaited|13_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2025-11-19T17:32:55.1632719' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (45, N'One or more validation failures have occurred', N'   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken)
   at PeakPerformance.Api.Controllers.UserController.UpdatePersonalDetails(UserDto data) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\UserController.cs:line 18
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2025-11-19T22:23:55.7108427' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (46, N'One or more validation failures have occurred', N'   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken)
   at PeakPerformance.Api.Controllers.UserController.UpdatePersonalDetails(UserDto data) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\UserController.cs:line 18
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2025-11-19T22:24:14.5765515' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (47, N'One or more validation failures have occurred', N'   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken)
   at PeakPerformance.Api.Controllers.UserController.UpdatePersonalDetails(UserDto data) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\UserController.cs:line 18
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2025-11-19T22:24:32.8654323' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (48, N'One or more validation failures have occurred', N'   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\ValidationBehavior.cs:line 26
   at PeakPerformance.Api.Controllers.WorkoutController.Save(WorkoutDto data) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\WorkoutController.cs:line 27
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2025-11-25T23:28:16.3219370' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (49, N'One or more validation failures have occurred', N'   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\ValidationBehavior.cs:line 26
   at PeakPerformance.Api.Controllers.BodyweightController.Save(BodyweightDto data) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\BodyweightController.cs:line 22
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2025-11-27T18:36:27.7537273' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (50, N'One or more validation failures have occurred', N'   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\ValidationBehavior.cs:line 26
   at PeakPerformance.Api.Controllers.BodyweightController.Save(BodyweightDto data) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\BodyweightController.cs:line 22
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2025-11-27T18:36:36.5193784' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (51, N'One or more validation failures have occurred', N'   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken)
   at PeakPerformance.Api.Controllers.SetController.Save(WorkoutExerciseSetDto data) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\SetController.cs:line 11
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2025-11-27T18:42:08.8838858' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (52, N'One or more validation failures have occurred', N'   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken)
   at PeakPerformance.Api.Controllers.SetController.Save(WorkoutExerciseSetDto data) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\SetController.cs:line 11
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2025-11-27T18:43:39.9889891' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (53, N'An exception was thrown while attempting to evaluate a LINQ query parameter expression. See the inner exception for more information. To show additional information call ''DbContextOptionsBuilder.EnableSensitiveDataLogging''.', N'   at Microsoft.EntityFrameworkCore.Query.Internal.ExpressionTreeFuncletizer.<Evaluate>g__EvaluateCore|75_0(Expression expression, String& parameterName, Boolean& isContextAccessor)
   at Microsoft.EntityFrameworkCore.Query.Internal.ExpressionTreeFuncletizer.Evaluate(Expression expression, String& parameterName, Boolean& isContextAccessor)
   at Microsoft.EntityFrameworkCore.Query.Internal.ExpressionTreeFuncletizer.ProcessEvaluatableRoot(Expression evaluatableRoot, State& state, Boolean forceEvaluation)
   at Microsoft.EntityFrameworkCore.Query.Internal.ExpressionTreeFuncletizer.VisitBinary(BinaryExpression binary)
   at Microsoft.EntityFrameworkCore.Query.Internal.ExpressionTreeFuncletizer.VisitLambda[T](Expression`1 lambda)
   at Microsoft.EntityFrameworkCore.Query.Internal.ExpressionTreeFuncletizer.VisitUnary(UnaryExpression unary)
   at Microsoft.EntityFrameworkCore.Query.Internal.ExpressionTreeFuncletizer.Visit[T](ReadOnlyCollection`1 expressions, Func`2 elementVisitor, StateType& aggregateStateType, State[]& expressionStates, Boolean poolExpressionStates)
   at Microsoft.EntityFrameworkCore.Query.Internal.ExpressionTreeFuncletizer.VisitMethodCall(MethodCallExpression methodCall)
   at Microsoft.EntityFrameworkCore.Query.Internal.ExpressionTreeFuncletizer.Visit(Expression expression, State& state)
   at Microsoft.EntityFrameworkCore.Query.Internal.ExpressionTreeFuncletizer.ExtractParameters(Expression expression, IParameterValues parameterValues, Boolean parameterize, Boolean clearParameterizedValues, Boolean precompiledQuery, IReadOnlySet`1& nonNullableReferenceTypeParameters)
   at Microsoft.EntityFrameworkCore.Query.Internal.ExpressionTreeFuncletizer.ExtractParameters(Expression expression, IParameterValues parameterValues, Boolean parameterize, Boolean clearParameterizedValues)
   at Microsoft.EntityFrameworkCore.Query.Internal.QueryCompiler.ExtractParameters(Expression query, IParameterValues parameterValues, IDiagnosticsLogger`1 logger, Boolean compiledQuery, Boolean generateContextAccessors)
   at Microsoft.EntityFrameworkCore.Query.Internal.QueryCompiler.ExecuteCore[TResult](Expression query, Boolean async, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.Query.Internal.QueryCompiler.ExecuteAsync[TResult](Expression query, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.Query.Internal.EntityQueryProvider.ExecuteAsync[TResult](Expression expression, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.EntityFrameworkQueryableExtensions.ExecuteAsync[TSource,TResult](MethodInfo operatorMethodInfo, IQueryable`1 source, Expression expression, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.EntityFrameworkQueryableExtensions.ExecuteAsync[TSource,TResult](MethodInfo operatorMethodInfo, IQueryable`1 source, LambdaExpression expression, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.EntityFrameworkQueryableExtensions.FirstOrDefaultAsync[TSource](IQueryable`1 source, Expression`1 predicate, CancellationToken cancellationToken)
   at PeakPerformance.Application.BusinessLogic.Workouts.Queries.GetSingleWorkoutQuery.GetSingleWorkoutQueryHandler.Handle(GetSingleWorkoutQuery request, CancellationToken cancellationToken)
   at PeakPerformance.Application.BusinessLogic._Behaviors.PerformanceMonitoringBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken)
   at PeakPerformance.Application.BusinessLogic._Behaviors.LoggingBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken)
   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken)
   at PeakPerformance.Api.Controllers.WorkoutController.GetSingle(Int64 id) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\WorkoutController.cs:line 12
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeInnerFilterAsync>g__Awaited|13_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', N'Object reference not set to an instance of an object.', CAST(N'2025-11-28T12:08:28.1377929' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (54, N'An exception was thrown while attempting to evaluate a LINQ query parameter expression. See the inner exception for more information. To show additional information call ''DbContextOptionsBuilder.EnableSensitiveDataLogging''.', N'   at Microsoft.EntityFrameworkCore.Query.Internal.ExpressionTreeFuncletizer.<Evaluate>g__EvaluateCore|75_0(Expression expression, String& parameterName, Boolean& isContextAccessor)
   at Microsoft.EntityFrameworkCore.Query.Internal.ExpressionTreeFuncletizer.Evaluate(Expression expression, String& parameterName, Boolean& isContextAccessor)
   at Microsoft.EntityFrameworkCore.Query.Internal.ExpressionTreeFuncletizer.ProcessEvaluatableRoot(Expression evaluatableRoot, State& state, Boolean forceEvaluation)
   at Microsoft.EntityFrameworkCore.Query.Internal.ExpressionTreeFuncletizer.VisitBinary(BinaryExpression binary)
   at Microsoft.EntityFrameworkCore.Query.Internal.ExpressionTreeFuncletizer.VisitLambda[T](Expression`1 lambda)
   at Microsoft.EntityFrameworkCore.Query.Internal.ExpressionTreeFuncletizer.VisitUnary(UnaryExpression unary)
   at Microsoft.EntityFrameworkCore.Query.Internal.ExpressionTreeFuncletizer.Visit[T](ReadOnlyCollection`1 expressions, Func`2 elementVisitor, StateType& aggregateStateType, State[]& expressionStates, Boolean poolExpressionStates)
   at Microsoft.EntityFrameworkCore.Query.Internal.ExpressionTreeFuncletizer.VisitMethodCall(MethodCallExpression methodCall)
   at Microsoft.EntityFrameworkCore.Query.Internal.ExpressionTreeFuncletizer.Visit(Expression expression, State& state)
   at Microsoft.EntityFrameworkCore.Query.Internal.ExpressionTreeFuncletizer.ExtractParameters(Expression expression, IParameterValues parameterValues, Boolean parameterize, Boolean clearParameterizedValues, Boolean precompiledQuery, IReadOnlySet`1& nonNullableReferenceTypeParameters)
   at Microsoft.EntityFrameworkCore.Query.Internal.ExpressionTreeFuncletizer.ExtractParameters(Expression expression, IParameterValues parameterValues, Boolean parameterize, Boolean clearParameterizedValues)
   at Microsoft.EntityFrameworkCore.Query.Internal.QueryCompiler.ExtractParameters(Expression query, IParameterValues parameterValues, IDiagnosticsLogger`1 logger, Boolean compiledQuery, Boolean generateContextAccessors)
   at Microsoft.EntityFrameworkCore.Query.Internal.QueryCompiler.ExecuteCore[TResult](Expression query, Boolean async, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.Query.Internal.QueryCompiler.ExecuteAsync[TResult](Expression query, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.Query.Internal.EntityQueryProvider.ExecuteAsync[TResult](Expression expression, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.EntityFrameworkQueryableExtensions.ExecuteAsync[TSource,TResult](MethodInfo operatorMethodInfo, IQueryable`1 source, Expression expression, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.EntityFrameworkQueryableExtensions.ExecuteAsync[TSource,TResult](MethodInfo operatorMethodInfo, IQueryable`1 source, LambdaExpression expression, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.EntityFrameworkQueryableExtensions.FirstOrDefaultAsync[TSource](IQueryable`1 source, Expression`1 predicate, CancellationToken cancellationToken)
   at PeakPerformance.Application.BusinessLogic.Workouts.Queries.GetSingleWorkoutQuery.GetSingleWorkoutQueryHandler.Handle(GetSingleWorkoutQuery request, CancellationToken cancellationToken)
   at PeakPerformance.Application.BusinessLogic._Behaviors.PerformanceMonitoringBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken)
   at PeakPerformance.Application.BusinessLogic._Behaviors.LoggingBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken)
   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken)
   at PeakPerformance.Api.Controllers.WorkoutController.GetSingle(Int64 id) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\WorkoutController.cs:line 12
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeInnerFilterAsync>g__Awaited|13_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', N'Object reference not set to an instance of an object.', CAST(N'2025-11-28T12:08:56.6799726' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (55, N'One or more validation failures have occurred', N'   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\ValidationBehavior.cs:line 26
   at PeakPerformance.Api.Controllers.SetController.Save(WorkoutExerciseSetDto data) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\SetController.cs:line 11
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2025-11-28T12:17:30.8065786' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (56, N'Object reference not set to an instance of an object.', N'   at PeakPerformance.Application.BusinessLogic.Workouts.Queries.GetSingleWorkoutQuery.GetSingleWorkoutQueryHandler.Handle(GetSingleWorkoutQuery request, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\Workouts\Queries\GetSingleWorkoutQuery.cs:line 26
   at PeakPerformance.Application.BusinessLogic._Behaviors.PerformanceMonitoringBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\PerformanceMonitoringBehavior.cs:line 18
   at PeakPerformance.Application.BusinessLogic._Behaviors.LoggingBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\LoggingBehavior.cs:line 17
   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\ValidationBehavior.cs:line 28
   at PeakPerformance.Api.Controllers.WorkoutController.GetSingle(Int64 id) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\WorkoutController.cs:line 12
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeInnerFilterAsync>g__Awaited|13_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2025-11-28T12:51:45.3669982' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (57, N'Object reference not set to an instance of an object.', N'   at PeakPerformance.Application.BusinessLogic.Workouts.Queries.GetSingleWorkoutQuery.GetSingleWorkoutQueryHandler.Handle(GetSingleWorkoutQuery request, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\Workouts\Queries\GetSingleWorkoutQuery.cs:line 26
   at PeakPerformance.Application.BusinessLogic._Behaviors.PerformanceMonitoringBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\PerformanceMonitoringBehavior.cs:line 18
   at PeakPerformance.Application.BusinessLogic._Behaviors.LoggingBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\LoggingBehavior.cs:line 17
   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\ValidationBehavior.cs:line 28
   at PeakPerformance.Api.Controllers.WorkoutController.GetSingle(Int64 id) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\WorkoutController.cs:line 12
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeInnerFilterAsync>g__Awaited|13_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2025-11-28T13:10:22.6353173' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (58, N'Invalid column name ''DurationMinutes''.', N'   at Microsoft.Data.SqlClient.SqlCommand.<>c.<ExecuteDbDataReaderAsync>b__211_0(Task`1 result)
   at System.Threading.Tasks.ContinuationResultTaskFromResultTask`2.InnerInvoke()
   at System.Threading.ExecutionContext.RunInternal(ExecutionContext executionContext, ContextCallback callback, Object state)
--- End of stack trace from previous location ---
   at System.Threading.ExecutionContext.RunInternal(ExecutionContext executionContext, ContextCallback callback, Object state)
   at System.Threading.Tasks.Task.ExecuteWithThreadLocal(Task& currentTaskSlot, Thread threadPoolThread)
--- End of stack trace from previous location ---
   at Microsoft.EntityFrameworkCore.Storage.RelationalCommand.ExecuteReaderAsync(RelationalCommandParameterObject parameterObject, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.Storage.RelationalCommand.ExecuteReaderAsync(RelationalCommandParameterObject parameterObject, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.Query.Internal.SingleQueryingEnumerable`1.AsyncEnumerator.InitializeReaderAsync(AsyncEnumerator enumerator, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.SqlServer.Storage.Internal.SqlServerExecutionStrategy.ExecuteAsync[TState,TResult](TState state, Func`4 operation, Func`4 verifySucceeded, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.Query.Internal.SingleQueryingEnumerable`1.AsyncEnumerator.MoveNextAsync()
   at Microsoft.EntityFrameworkCore.Query.ShapedQueryCompilingExpressionVisitor.SingleOrDefaultAsync[TSource](IAsyncEnumerable`1 asyncEnumerable, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.Query.ShapedQueryCompilingExpressionVisitor.SingleOrDefaultAsync[TSource](IAsyncEnumerable`1 asyncEnumerable, CancellationToken cancellationToken)
   at PeakPerformance.Application.BusinessLogic.Workouts.Queries.GetSingleWorkoutQuery.GetSingleWorkoutQueryHandler.Handle(GetSingleWorkoutQuery request, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\Workouts\Queries\GetSingleWorkoutQuery.cs:line 15
   at PeakPerformance.Application.BusinessLogic._Behaviors.PerformanceMonitoringBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\PerformanceMonitoringBehavior.cs:line 18
   at PeakPerformance.Application.BusinessLogic._Behaviors.LoggingBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\LoggingBehavior.cs:line 17
   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\ValidationBehavior.cs:line 28
   at PeakPerformance.Api.Controllers.WorkoutController.GetSingle(Int64 id) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\WorkoutController.cs:line 12
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeInnerFilterAsync>g__Awaited|13_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2025-11-28T17:52:08.7936332' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (59, N'The given key ''barbell'' was not present in the dictionary.', N'   at System.Collections.Generic.Dictionary`2.get_Item(TKey key)
   at PeakPerformance.Application.BusinessLogic.Exercises.Commands.SaveExerciseCommand.SaveExerciseCommandHandler.Handle(SaveExerciseCommand request, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\Exercises\Commands\SaveExerciseCommand.cs:line 57
   at PeakPerformance.Application.BusinessLogic._Behaviors.PerformanceMonitoringBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\PerformanceMonitoringBehavior.cs:line 18
   at PeakPerformance.Application.BusinessLogic._Behaviors.LoggingBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\LoggingBehavior.cs:line 17
   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\ValidationBehavior.cs:line 28
   at PeakPerformance.Api.Controllers.ExerciseController.Save(WorkoutExerciseDto data) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\ExerciseController.cs:line 11
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeInnerFilterAsync>g__Awaited|13_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2025-11-28T17:58:16.0808454' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (60, N'Nullable object must have a value.', N'   at System.Nullable`1.get_Value()
   at PeakPerformance.Application.BusinessLogic.Workouts.Queries.GetSingleWorkoutQuery.GetSingleWorkoutQueryHandler.<>c__DisplayClass4_0.<Handle>b__9(WorkoutExerciseSetDto _) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\Workouts\Queries\GetSingleWorkoutQuery.cs:line 36
   at System.Linq.Enumerable.Sum[TSource,TResult,TAccumulator](IEnumerable`1 source, Func`2 selector)
   at PeakPerformance.Application.BusinessLogic.Workouts.Queries.GetSingleWorkoutQuery.GetSingleWorkoutQueryHandler.Handle(GetSingleWorkoutQuery request, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\Workouts\Queries\GetSingleWorkoutQuery.cs:line 32
   at PeakPerformance.Application.BusinessLogic._Behaviors.PerformanceMonitoringBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\PerformanceMonitoringBehavior.cs:line 18
   at PeakPerformance.Application.BusinessLogic._Behaviors.LoggingBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\LoggingBehavior.cs:line 17
   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\ValidationBehavior.cs:line 28
   at PeakPerformance.Api.Controllers.WorkoutController.GetSingle(Int64 id) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\WorkoutController.cs:line 12
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeInnerFilterAsync>g__Awaited|13_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2025-11-28T18:29:05.2107247' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (61, N'Nullable object must have a value.', N'   at System.Nullable`1.get_Value()
   at PeakPerformance.Application.BusinessLogic.Workouts.Queries.SearchWorkoutQuery.SearchWorkoutQueryHandler.<>c__DisplayClass4_0.<Handle>b__8(WorkoutExerciseSetDto _) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\Workouts\Queries\SearchWorkoutQuery.cs:line 43
   at System.Linq.Enumerable.Sum[TSource,TResult,TAccumulator](IEnumerable`1 source, Func`2 selector)
   at PeakPerformance.Application.BusinessLogic.Workouts.Queries.SearchWorkoutQuery.SearchWorkoutQueryHandler.Handle(SearchWorkoutQuery request, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\Workouts\Queries\SearchWorkoutQuery.cs:line 39
   at PeakPerformance.Application.BusinessLogic._Behaviors.PerformanceMonitoringBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\PerformanceMonitoringBehavior.cs:line 18
   at PeakPerformance.Application.BusinessLogic._Behaviors.LoggingBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\LoggingBehavior.cs:line 17
   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\ValidationBehavior.cs:line 28
   at PeakPerformance.Api.Controllers.WorkoutController.Search(WorkoutSearchOptions options) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\WorkoutController.cs:line 22
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeInnerFilterAsync>g__Awaited|13_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2025-11-28T21:21:50.3826951' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (62, N'The requested resource was not found.', N'   at PeakPerformance.Application.BusinessLogic.Workouts.Queries.GetSingleWorkoutQuery.GetSingleWorkoutQueryHandler.Handle(GetSingleWorkoutQuery request, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\Workouts\Queries\GetSingleWorkoutQuery.cs:line 16
   at PeakPerformance.Application.BusinessLogic._Behaviors.PerformanceMonitoringBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\PerformanceMonitoringBehavior.cs:line 18
   at PeakPerformance.Application.BusinessLogic._Behaviors.LoggingBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\LoggingBehavior.cs:line 17
   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\ValidationBehavior.cs:line 28
   at PeakPerformance.Api.Controllers.WorkoutController.GetSingle(Int64 id) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\WorkoutController.cs:line 12
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeInnerFilterAsync>g__Awaited|13_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2025-11-28T23:03:35.6228419' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (63, N'The requested resource was not found.', N'   at PeakPerformance.Application.BusinessLogic.Workouts.Queries.GetSingleWorkoutQuery.GetSingleWorkoutQueryHandler.Handle(GetSingleWorkoutQuery request, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\Workouts\Queries\GetSingleWorkoutQuery.cs:line 16
   at PeakPerformance.Application.BusinessLogic._Behaviors.PerformanceMonitoringBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\PerformanceMonitoringBehavior.cs:line 18
   at PeakPerformance.Application.BusinessLogic._Behaviors.LoggingBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\LoggingBehavior.cs:line 17
   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\ValidationBehavior.cs:line 28
   at PeakPerformance.Api.Controllers.WorkoutController.GetSingle(Int64 id) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\WorkoutController.cs:line 12
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeInnerFilterAsync>g__Awaited|13_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2025-11-28T23:03:54.3179554' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (64, N'The requested resource was not found.', N'   at PeakPerformance.Application.BusinessLogic.Workouts.Queries.GetSingleWorkoutQuery.GetSingleWorkoutQueryHandler.Handle(GetSingleWorkoutQuery request, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\Workouts\Queries\GetSingleWorkoutQuery.cs:line 16
   at PeakPerformance.Application.BusinessLogic._Behaviors.PerformanceMonitoringBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\PerformanceMonitoringBehavior.cs:line 18
   at PeakPerformance.Application.BusinessLogic._Behaviors.LoggingBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\LoggingBehavior.cs:line 17
   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\ValidationBehavior.cs:line 28
   at PeakPerformance.Api.Controllers.WorkoutController.GetSingle(Int64 id) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\WorkoutController.cs:line 12
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeInnerFilterAsync>g__Awaited|13_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2025-11-28T23:10:07.2701912' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (65, N'The requested resource was not found.', N'   at PeakPerformance.Application.BusinessLogic.Workouts.Queries.GetSingleWorkoutQuery.GetSingleWorkoutQueryHandler.Handle(GetSingleWorkoutQuery request, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\Workouts\Queries\GetSingleWorkoutQuery.cs:line 16
   at PeakPerformance.Application.BusinessLogic._Behaviors.PerformanceMonitoringBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\PerformanceMonitoringBehavior.cs:line 18
   at PeakPerformance.Application.BusinessLogic._Behaviors.LoggingBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\LoggingBehavior.cs:line 17
   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\ValidationBehavior.cs:line 28
   at PeakPerformance.Api.Controllers.WorkoutController.GetSingle(Int64 id) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\WorkoutController.cs:line 12
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeInnerFilterAsync>g__Awaited|13_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2025-11-29T22:18:12.7792778' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (66, N'The requested resource was not found.', N'   at PeakPerformance.Application.BusinessLogic.Workouts.Queries.GetSingleWorkoutQuery.GetSingleWorkoutQueryHandler.Handle(GetSingleWorkoutQuery request, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\Workouts\Queries\GetSingleWorkoutQuery.cs:line 16
   at PeakPerformance.Application.BusinessLogic._Behaviors.PerformanceMonitoringBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\PerformanceMonitoringBehavior.cs:line 18
   at PeakPerformance.Application.BusinessLogic._Behaviors.LoggingBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\LoggingBehavior.cs:line 17
   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\ValidationBehavior.cs:line 28
   at PeakPerformance.Api.Controllers.WorkoutController.GetSingle(Int64 id) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\WorkoutController.cs:line 12
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeInnerFilterAsync>g__Awaited|13_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2025-11-29T22:18:51.4277217' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (67, N'One or more validation failures have occurred', N'   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\ValidationBehavior.cs:line 26
   at PeakPerformance.Api.Controllers.ExerciseController.Save(WorkoutExerciseDto data) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\ExerciseController.cs:line 11
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2025-12-06T13:41:18.5328216' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (68, N'One or more validation failures have occurred', N'   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\ValidationBehavior.cs:line 26
   at PeakPerformance.Api.Controllers.ExerciseGoalController.Save(ExerciseGoalDto data) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\ExerciseGoalController.cs:line 17
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2025-12-10T21:13:29.4539703' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (69, N'Error mapping types.

Mapping types:
List`1 -> IEnumerable`1
System.Collections.Generic.List`1[[PeakPerformance.Domain.Entities.Application.ExerciseGoal, PeakPerformance.Domain, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null]] -> System.Collections.Generic.IEnumerable`1[[PeakPerformance.Application.Dtos.ExerciseGoals.ExerciseGoalDto, PeakPerformance.Application, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null]]', N'   at lambda_method159(Closure, Object, IEnumerable`1, ResolutionContext)
   at PeakPerformance.Application.BusinessLogic.ExerciseGoals.Queries.SearchExerciseGoalQuery.SearchExerciseGoalQueryHandler.Handle(SearchExerciseGoalQuery request, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\ExerciseGoals\Queries\SearchExerciseGoalQuery.cs:line 42
   at PeakPerformance.Application.BusinessLogic._Behaviors.PerformanceMonitoringBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\PerformanceMonitoringBehavior.cs:line 18
   at PeakPerformance.Application.BusinessLogic._Behaviors.LoggingBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\LoggingBehavior.cs:line 17
   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\ValidationBehavior.cs:line 28
   at PeakPerformance.Api.Controllers.ExerciseGoalController.Search(ExerciseGoalSearchOptions options) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\ExerciseGoalController.cs:line 12
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeInnerFilterAsync>g__Awaited|13_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', N'Missing type map configuration or unsupported mapping.

Mapping types:
ExerciseGoal -> ExerciseGoalDto
PeakPerformance.Domain.Entities.Application.ExerciseGoal -> PeakPerformance.Application.Dtos.ExerciseGoals.ExerciseGoalDto', CAST(N'2025-12-10T21:16:35.8277601' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (72, N'One or more validation failures have occurred', N'   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\ValidationBehavior.cs:line 26
   at PeakPerformance.Api.Controllers.UserController.UpdatePersonalDetails(UserDto data) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\UserController.cs:line 18
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2026-01-14T18:26:48.3927946' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (73, N'Error mapping types.

Mapping types:
List`1 -> IEnumerable`1
System.Collections.Generic.List`1[[PeakPerformance.Domain.Entities.Application.Exercise, PeakPerformance.Domain, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null]] -> System.Collections.Generic.IEnumerable`1[[PeakPerformance.Application.Dtos.Exercises.ExerciseDto, PeakPerformance.Application, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null]]', N'   at lambda_method944(Closure, Object, IEnumerable`1, ResolutionContext)
   at PeakPerformance.Application.BusinessLogic.Exercises.Queries.GetExercisesQuery.GetExercisesQueryHandler.Handle(GetExercisesQuery request, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\Exercises\Queries\GetExercisesQuery.cs:line 26
   at PeakPerformance.Application.BusinessLogic._Behaviors.PerformanceMonitoringBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\PerformanceMonitoringBehavior.cs:line 18
   at PeakPerformance.Application.BusinessLogic._Behaviors.LoggingBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\LoggingBehavior.cs:line 17
   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\ValidationBehavior.cs:line 28
   at PeakPerformance.Api.Controllers.ExerciseController.GetList(ExerciseSearchOptions options) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\ExerciseController.cs:line 17
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeInnerFilterAsync>g__Awaited|13_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', N'Missing type map configuration or unsupported mapping.

Mapping types:
Exercise -> ExerciseDto
PeakPerformance.Domain.Entities.Application.Exercise -> PeakPerformance.Application.Dtos.Exercises.ExerciseDto', CAST(N'2026-01-25T15:18:23.5351594' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (74, N'One or more validation failures have occurred', N'   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\ValidationBehavior.cs:line 26
   at PeakPerformance.Api.Controllers.ExerciseController.Save(WorkoutExerciseDto data) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\ExerciseController.cs:line 27
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2026-01-25T15:37:28.9604900' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (75, N'One or more validation failures have occurred', N'   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\ValidationBehavior.cs:line 26
   at PeakPerformance.Api.Controllers.ExerciseController.Save(WorkoutExerciseDto data) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\ExerciseController.cs:line 27
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2026-01-25T15:38:40.4700400' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (76, N'One or more validation failures have occurred', N'   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\ValidationBehavior.cs:line 26
   at PeakPerformance.Api.Controllers.ExerciseController.Save(WorkoutExerciseDto data) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\ExerciseController.cs:line 27
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2026-01-25T15:39:28.5686607' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (77, N'One or more validation failures have occurred', N'   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\ValidationBehavior.cs:line 26
   at PeakPerformance.Api.Controllers.ExerciseController.Save(WorkoutExerciseDto data) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\ExerciseController.cs:line 27
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2026-01-25T15:40:45.1697572' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (78, N'One or more validation failures have occurred', N'   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\ValidationBehavior.cs:line 26
   at PeakPerformance.Api.Controllers.ExerciseController.Save(WorkoutExerciseDto data) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\ExerciseController.cs:line 27
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2026-01-25T15:41:14.3334119' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (79, N'The requested resource was not found.', N'   at PeakPerformance.Application.BusinessLogic.Workouts.Queries.GetSingleWorkoutQuery.GetSingleWorkoutQueryHandler.Handle(GetSingleWorkoutQuery request, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\Workouts\Queries\GetSingleWorkoutQuery.cs:line 20
   at PeakPerformance.Application.BusinessLogic._Behaviors.PerformanceMonitoringBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\PerformanceMonitoringBehavior.cs:line 18
   at PeakPerformance.Application.BusinessLogic._Behaviors.LoggingBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\LoggingBehavior.cs:line 17
   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\ValidationBehavior.cs:line 28
   at PeakPerformance.Api.Controllers.WorkoutController.GetSingle(WorkoutSearchOptions options) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\WorkoutController.cs:line 12
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeInnerFilterAsync>g__Awaited|13_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2026-01-31T14:00:48.7408764' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (80, N'The requested resource was not found.', N'   at PeakPerformance.Application.BusinessLogic.Workouts.Queries.GetSingleWorkoutQuery.GetSingleWorkoutQueryHandler.Handle(GetSingleWorkoutQuery request, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\Workouts\Queries\GetSingleWorkoutQuery.cs:line 20
   at PeakPerformance.Application.BusinessLogic._Behaviors.PerformanceMonitoringBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\PerformanceMonitoringBehavior.cs:line 18
   at PeakPerformance.Application.BusinessLogic._Behaviors.LoggingBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\LoggingBehavior.cs:line 17
   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\ValidationBehavior.cs:line 28
   at PeakPerformance.Api.Controllers.WorkoutController.GetSingle(WorkoutSearchOptions options) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\WorkoutController.cs:line 12
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeInnerFilterAsync>g__Awaited|13_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2026-01-31T14:04:17.4948633' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (81, N'The requested resource was not found.', N'   at PeakPerformance.Application.BusinessLogic.Workouts.Queries.GetSingleWorkoutQuery.GetSingleWorkoutQueryHandler.Handle(GetSingleWorkoutQuery request, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\Workouts\Queries\GetSingleWorkoutQuery.cs:line 20
   at PeakPerformance.Application.BusinessLogic._Behaviors.PerformanceMonitoringBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\PerformanceMonitoringBehavior.cs:line 18
   at PeakPerformance.Application.BusinessLogic._Behaviors.LoggingBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\LoggingBehavior.cs:line 17
   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\ValidationBehavior.cs:line 28
   at PeakPerformance.Api.Controllers.WorkoutController.GetSingle(WorkoutSearchOptions options) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\WorkoutController.cs:line 12
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeInnerFilterAsync>g__Awaited|13_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2026-01-31T17:28:25.0457253' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (82, N'The requested resource was not found.', N'   at PeakPerformance.Application.BusinessLogic.Workouts.Queries.GetSingleWorkoutQuery.GetSingleWorkoutQueryHandler.Handle(GetSingleWorkoutQuery request, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\Workouts\Queries\GetSingleWorkoutQuery.cs:line 20
   at PeakPerformance.Application.BusinessLogic._Behaviors.PerformanceMonitoringBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\PerformanceMonitoringBehavior.cs:line 18
   at PeakPerformance.Application.BusinessLogic._Behaviors.LoggingBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\LoggingBehavior.cs:line 17
   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\ValidationBehavior.cs:line 28
   at PeakPerformance.Api.Controllers.WorkoutController.GetSingle(WorkoutSearchOptions options) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\WorkoutController.cs:line 12
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeInnerFilterAsync>g__Awaited|13_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2026-01-31T17:28:47.5600348' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (83, N'The requested resource was not found.', N'   at PeakPerformance.Application.BusinessLogic.Workouts.Queries.GetSingleWorkoutQuery.GetSingleWorkoutQueryHandler.Handle(GetSingleWorkoutQuery request, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\Workouts\Queries\GetSingleWorkoutQuery.cs:line 20
   at PeakPerformance.Application.BusinessLogic._Behaviors.PerformanceMonitoringBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\PerformanceMonitoringBehavior.cs:line 18
   at PeakPerformance.Application.BusinessLogic._Behaviors.LoggingBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\LoggingBehavior.cs:line 17
   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\ValidationBehavior.cs:line 28
   at PeakPerformance.Api.Controllers.WorkoutController.GetSingle(WorkoutSearchOptions options) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\WorkoutController.cs:line 12
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeInnerFilterAsync>g__Awaited|13_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2026-01-31T17:34:07.1555967' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (85, N'Attempted to invoke a deleted method implementation. This can happen when a method is deleted or its name or signature is changed while the application is running.', N'   at PeakPerformance.Application.BusinessLogic.Exercises.Queries.GetSelectedExercisesQuery.GetSelectedExercisesQueryHandler..ctor(IDatabaseContext db, GetSingleWorkoutQuery mapper)
   at ResolveService(ILEmitResolverBuilderRuntimeContext, ServiceProviderEngineScope)
   at MediatR.Wrappers.RequestHandlerWrapperImpl`2.<>c__DisplayClass1_0.<Handle>g__Handler|0(CancellationToken t)
   at PeakPerformance.Application.BusinessLogic._Behaviors.PerformanceMonitoringBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken)
   at PeakPerformance.Application.BusinessLogic._Behaviors.LoggingBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken)
   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken)
   at PeakPerformance.Api.Controllers.ExerciseController.GetSelectedExercises(Int64 userId) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\ExerciseController.cs:line 39
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2026-02-01T10:17:59.3072389' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (86, N'The requested resource was not found.', N'   at PeakPerformance.Application.BusinessLogic.Exercises.Queries.GetSelectedExercisesQuery.GetSelectedExercisesQueryHandler.Handle(GetSelectedExercisesQuery request, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\Exercises\Queries\GetSelectedExercisesQuery.cs:line 19
   at PeakPerformance.Application.BusinessLogic._Behaviors.PerformanceMonitoringBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\PerformanceMonitoringBehavior.cs:line 18
   at PeakPerformance.Application.BusinessLogic._Behaviors.LoggingBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\LoggingBehavior.cs:line 17
   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\ValidationBehavior.cs:line 28
   at PeakPerformance.Api.Controllers.ExerciseController.GetSelectedExercises(Int64 userId) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\ExerciseController.cs:line 39
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeInnerFilterAsync>g__Awaited|13_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2026-02-01T10:22:38.0027429' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (87, N'The requested resource was not found.', N'   at PeakPerformance.Application.BusinessLogic.Workouts.Queries.SearchWorkoutQuery.SearchWorkoutQueryHandler.Handle(SearchWorkoutQuery request, CancellationToken cancellationToken)
   at PeakPerformance.Application.BusinessLogic._Behaviors.PerformanceMonitoringBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken)
   at PeakPerformance.Application.BusinessLogic._Behaviors.LoggingBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken)
   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken)
   at PeakPerformance.Api.Controllers.WorkoutController.Search(WorkoutSearchOptions options) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\WorkoutController.cs:line 27
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeInnerFilterAsync>g__Awaited|13_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2026-02-01T10:24:33.8730612' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (88, N'The requested resource was not found.', N'   at PeakPerformance.Application.BusinessLogic.Workouts.Queries.SearchWorkoutQuery.SearchWorkoutQueryHandler.Handle(SearchWorkoutQuery request, CancellationToken cancellationToken)
   at PeakPerformance.Application.BusinessLogic._Behaviors.PerformanceMonitoringBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken)
   at PeakPerformance.Application.BusinessLogic._Behaviors.LoggingBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken)
   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken)
   at PeakPerformance.Api.Controllers.WorkoutController.Search(WorkoutSearchOptions options) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\WorkoutController.cs:line 27
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeInnerFilterAsync>g__Awaited|13_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2026-02-01T10:25:41.0821917' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (89, N'The requested resource was not found.', N'   at PeakPerformance.Application.BusinessLogic.Workouts.Queries.SearchWorkoutQuery.SearchWorkoutQueryHandler.Handle(SearchWorkoutQuery request, CancellationToken cancellationToken)
   at PeakPerformance.Application.BusinessLogic._Behaviors.PerformanceMonitoringBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken)
   at PeakPerformance.Application.BusinessLogic._Behaviors.LoggingBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken)
   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken)
   at PeakPerformance.Api.Controllers.WorkoutController.Search(WorkoutSearchOptions options) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\WorkoutController.cs:line 27
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeInnerFilterAsync>g__Awaited|13_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2026-02-01T10:25:45.2130244' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (90, N'An exception was thrown while attempting to evaluate a LINQ query parameter expression. See the inner exception for more information. To show additional information call ''DbContextOptionsBuilder.EnableSensitiveDataLogging''.', N'   at Microsoft.EntityFrameworkCore.Query.Internal.ExpressionTreeFuncletizer.<Evaluate>g__EvaluateCore|75_0(Expression expression, String& parameterName, Boolean& isContextAccessor)
   at Microsoft.EntityFrameworkCore.Query.Internal.ExpressionTreeFuncletizer.Evaluate(Expression expression, String& parameterName, Boolean& isContextAccessor)
   at Microsoft.EntityFrameworkCore.Query.Internal.ExpressionTreeFuncletizer.VisitBinary(BinaryExpression binary)
   at Microsoft.EntityFrameworkCore.Query.Internal.ExpressionTreeFuncletizer.VisitBinary(BinaryExpression binary)
   at Microsoft.EntityFrameworkCore.Query.Internal.ExpressionTreeFuncletizer.VisitLambda[T](Expression`1 lambda)
   at Microsoft.EntityFrameworkCore.Query.Internal.ExpressionTreeFuncletizer.VisitUnary(UnaryExpression unary)
   at Microsoft.EntityFrameworkCore.Query.Internal.ExpressionTreeFuncletizer.Visit[T](ReadOnlyCollection`1 expressions, Func`2 elementVisitor, StateType& aggregateStateType, State[]& expressionStates, Boolean poolExpressionStates)
   at Microsoft.EntityFrameworkCore.Query.Internal.ExpressionTreeFuncletizer.VisitMethodCall(MethodCallExpression methodCall)
   at Microsoft.EntityFrameworkCore.Query.Internal.ExpressionTreeFuncletizer.ExtractParameters(Expression expression, IParameterValues parameterValues, Boolean parameterize, Boolean clearParameterizedValues, Boolean precompiledQuery, IReadOnlySet`1& nonNullableReferenceTypeParameters)
   at Microsoft.EntityFrameworkCore.Query.Internal.ExpressionTreeFuncletizer.ExtractParameters(Expression expression, IParameterValues parameterValues, Boolean parameterize, Boolean clearParameterizedValues)
   at Microsoft.EntityFrameworkCore.Query.Internal.QueryCompiler.ExtractParameters(Expression query, IParameterValues parameterValues, IDiagnosticsLogger`1 logger, Boolean compiledQuery, Boolean generateContextAccessors)
   at Microsoft.EntityFrameworkCore.Query.Internal.QueryCompiler.ExecuteCore[TResult](Expression query, Boolean async, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.Query.Internal.QueryCompiler.ExecuteAsync[TResult](Expression query, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.Query.Internal.EntityQueryProvider.ExecuteAsync[TResult](Expression expression, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.EntityFrameworkQueryableExtensions.ExecuteAsync[TSource,TResult](MethodInfo operatorMethodInfo, IQueryable`1 source, Expression expression, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.EntityFrameworkQueryableExtensions.ExecuteAsync[TSource,TResult](MethodInfo operatorMethodInfo, IQueryable`1 source, LambdaExpression expression, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.EntityFrameworkQueryableExtensions.AnyAsync[TSource](IQueryable`1 source, Expression`1 predicate, CancellationToken cancellationToken)
   at PeakPerformance.Application.BusinessLogic.Workouts.Queries.GetAllWorkoutLogsQuery.GetAllWorkoutLogsQueryHandler.Handle(GetAllWorkoutLogsQuery request, CancellationToken cancellationToken)
   at PeakPerformance.Application.BusinessLogic._Behaviors.PerformanceMonitoringBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken)
   at PeakPerformance.Application.BusinessLogic._Behaviors.LoggingBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken)
   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken)
   at PeakPerformance.Api.Controllers.WorkoutController.GetAllWorkoutLogs(Int64 userId) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\WorkoutController.cs:line 22
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', N'Object reference not set to an instance of an object.', CAST(N'2026-02-01T10:25:45.2132049' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (91, N'An exception was thrown while attempting to evaluate a LINQ query parameter expression. See the inner exception for more information. To show additional information call ''DbContextOptionsBuilder.EnableSensitiveDataLogging''.', N'   at Microsoft.EntityFrameworkCore.Query.Internal.ExpressionTreeFuncletizer.<Evaluate>g__EvaluateCore|75_0(Expression expression, String& parameterName, Boolean& isContextAccessor)
   at Microsoft.EntityFrameworkCore.Query.Internal.ExpressionTreeFuncletizer.Evaluate(Expression expression, String& parameterName, Boolean& isContextAccessor)
   at Microsoft.EntityFrameworkCore.Query.Internal.ExpressionTreeFuncletizer.VisitBinary(BinaryExpression binary)
   at Microsoft.EntityFrameworkCore.Query.Internal.ExpressionTreeFuncletizer.VisitBinary(BinaryExpression binary)
   at Microsoft.EntityFrameworkCore.Query.Internal.ExpressionTreeFuncletizer.VisitLambda[T](Expression`1 lambda)
   at Microsoft.EntityFrameworkCore.Query.Internal.ExpressionTreeFuncletizer.VisitUnary(UnaryExpression unary)
   at Microsoft.EntityFrameworkCore.Query.Internal.ExpressionTreeFuncletizer.Visit[T](ReadOnlyCollection`1 expressions, Func`2 elementVisitor, StateType& aggregateStateType, State[]& expressionStates, Boolean poolExpressionStates)
   at Microsoft.EntityFrameworkCore.Query.Internal.ExpressionTreeFuncletizer.VisitMethodCall(MethodCallExpression methodCall)
   at Microsoft.EntityFrameworkCore.Query.Internal.ExpressionTreeFuncletizer.ExtractParameters(Expression expression, IParameterValues parameterValues, Boolean parameterize, Boolean clearParameterizedValues, Boolean precompiledQuery, IReadOnlySet`1& nonNullableReferenceTypeParameters)
   at Microsoft.EntityFrameworkCore.Query.Internal.ExpressionTreeFuncletizer.ExtractParameters(Expression expression, IParameterValues parameterValues, Boolean parameterize, Boolean clearParameterizedValues)
   at Microsoft.EntityFrameworkCore.Query.Internal.QueryCompiler.ExtractParameters(Expression query, IParameterValues parameterValues, IDiagnosticsLogger`1 logger, Boolean compiledQuery, Boolean generateContextAccessors)
   at Microsoft.EntityFrameworkCore.Query.Internal.QueryCompiler.ExecuteCore[TResult](Expression query, Boolean async, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.Query.Internal.QueryCompiler.ExecuteAsync[TResult](Expression query, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.Query.Internal.EntityQueryProvider.ExecuteAsync[TResult](Expression expression, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.EntityFrameworkQueryableExtensions.ExecuteAsync[TSource,TResult](MethodInfo operatorMethodInfo, IQueryable`1 source, Expression expression, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.EntityFrameworkQueryableExtensions.ExecuteAsync[TSource,TResult](MethodInfo operatorMethodInfo, IQueryable`1 source, LambdaExpression expression, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.EntityFrameworkQueryableExtensions.AnyAsync[TSource](IQueryable`1 source, Expression`1 predicate, CancellationToken cancellationToken)
   at PeakPerformance.Application.BusinessLogic.Workouts.Queries.GetAllWorkoutLogsQuery.GetAllWorkoutLogsQueryHandler.Handle(GetAllWorkoutLogsQuery request, CancellationToken cancellationToken)
   at PeakPerformance.Application.BusinessLogic._Behaviors.PerformanceMonitoringBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken)
   at PeakPerformance.Application.BusinessLogic._Behaviors.LoggingBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken)
   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken)
   at PeakPerformance.Api.Controllers.WorkoutController.GetAllWorkoutLogs(Int64 userId) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\WorkoutController.cs:line 22
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', N'Object reference not set to an instance of an object.', CAST(N'2026-02-01T10:25:45.2133217' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (92, N'The requested resource was not found.', N'   at PeakPerformance.Application.BusinessLogic.Exercises.Queries.SearchExerciseQuery.SearchExerciseQueryHandler.Handle(SearchExerciseQuery request, CancellationToken cancellationToken)
   at PeakPerformance.Application.BusinessLogic._Behaviors.PerformanceMonitoringBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken)
   at PeakPerformance.Application.BusinessLogic._Behaviors.LoggingBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken)
   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken)
   at PeakPerformance.Api.Controllers.ExerciseController.Search(ExerciseSearchOptions options) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\ExerciseController.cs:line 12
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeInnerFilterAsync>g__Awaited|13_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2026-02-01T10:30:11.8065169' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (93, N'The requested resource was not found.', N'   at PeakPerformance.Application.BusinessLogic.Exercises.Queries.SearchExerciseQuery.SearchExerciseQueryHandler.Handle(SearchExerciseQuery request, CancellationToken cancellationToken)
   at PeakPerformance.Application.BusinessLogic._Behaviors.PerformanceMonitoringBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken)
   at PeakPerformance.Application.BusinessLogic._Behaviors.LoggingBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken)
   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken)
   at PeakPerformance.Api.Controllers.ExerciseController.Search(ExerciseSearchOptions options) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\ExerciseController.cs:line 12
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeInnerFilterAsync>g__Awaited|13_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2026-02-01T10:30:33.5157784' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (94, N'The requested resource was not found.', N'   at PeakPerformance.Application.BusinessLogic.Exercises.Queries.SearchExerciseQuery.SearchExerciseQueryHandler.Handle(SearchExerciseQuery request, CancellationToken cancellationToken)
   at PeakPerformance.Application.BusinessLogic._Behaviors.PerformanceMonitoringBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken)
   at PeakPerformance.Application.BusinessLogic._Behaviors.LoggingBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken)
   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken)
   at PeakPerformance.Api.Controllers.ExerciseController.Search(ExerciseSearchOptions options) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\ExerciseController.cs:line 12
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeInnerFilterAsync>g__Awaited|13_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2026-02-01T10:31:52.7646847' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (95, N'The requested resource was not found.', N'   at PeakPerformance.Application.BusinessLogic.ExerciseGoals.Queries.SearchExerciseGoalQuery.SearchExerciseGoalQueryHandler.Handle(SearchExerciseGoalQuery request, CancellationToken cancellationToken)
   at PeakPerformance.Application.BusinessLogic._Behaviors.PerformanceMonitoringBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken)
   at PeakPerformance.Application.BusinessLogic._Behaviors.LoggingBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken)
   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken)
   at PeakPerformance.Api.Controllers.ExerciseGoalController.Search(ExerciseGoalSearchOptions options) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\ExerciseGoalController.cs:line 12
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeInnerFilterAsync>g__Awaited|13_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2026-02-01T10:31:52.7649343' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (96, N'The requested resource was not found.', N'   at PeakPerformance.Application.BusinessLogic.Exercises.Queries.SearchExerciseQuery.SearchExerciseQueryHandler.Handle(SearchExerciseQuery request, CancellationToken cancellationToken)
   at PeakPerformance.Application.BusinessLogic._Behaviors.PerformanceMonitoringBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken)
   at PeakPerformance.Application.BusinessLogic._Behaviors.LoggingBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken)
   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken)
   at PeakPerformance.Api.Controllers.ExerciseController.Search(ExerciseSearchOptions options) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\ExerciseController.cs:line 12
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeInnerFilterAsync>g__Awaited|13_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2026-02-01T10:32:21.8496075' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (97, N'Access forbidden.', N'   at PeakPerformance.Application.BusinessLogic.ExerciseGoals.Queries.SearchExerciseGoalQuery.SearchExerciseGoalQueryHandler.Handle(SearchExerciseGoalQuery request, CancellationToken cancellationToken)
   at PeakPerformance.Application.BusinessLogic._Behaviors.PerformanceMonitoringBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken)
   at PeakPerformance.Application.BusinessLogic._Behaviors.LoggingBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken)
   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken)
   at PeakPerformance.Api.Controllers.ExerciseGoalController.Search(ExerciseGoalSearchOptions options) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\ExerciseGoalController.cs:line 12
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeInnerFilterAsync>g__Awaited|13_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2026-02-01T10:32:22.7439636' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (98, N'Access forbidden.', N'   at PeakPerformance.Application.BusinessLogic.Workouts.Queries.SearchWorkoutQuery.SearchWorkoutQueryHandler.Handle(SearchWorkoutQuery request, CancellationToken cancellationToken)
   at PeakPerformance.Application.BusinessLogic._Behaviors.PerformanceMonitoringBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken)
   at PeakPerformance.Application.BusinessLogic._Behaviors.LoggingBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken)
   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken)
   at PeakPerformance.Api.Controllers.WorkoutController.Search(WorkoutSearchOptions options) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\WorkoutController.cs:line 27
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeInnerFilterAsync>g__Awaited|13_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2026-02-01T10:37:32.8690845' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (99, N'Access forbidden.', N'   at PeakPerformance.Application.BusinessLogic.Workouts.Queries.GetAllWorkoutLogsQuery.GetAllWorkoutLogsQueryHandler.Handle(GetAllWorkoutLogsQuery request, CancellationToken cancellationToken)
   at PeakPerformance.Application.BusinessLogic._Behaviors.PerformanceMonitoringBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken)
   at PeakPerformance.Application.BusinessLogic._Behaviors.LoggingBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken)
   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken)
   at PeakPerformance.Api.Controllers.WorkoutController.GetAllWorkoutLogs(Int64 userId) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\WorkoutController.cs:line 22
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeInnerFilterAsync>g__Awaited|13_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2026-02-01T10:37:33.7406444' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (100, N'Access forbidden.', N'   at PeakPerformance.Application.BusinessLogic.Workouts.Queries.GetSingleWorkoutQuery.GetSingleWorkoutQueryHandler.Handle(GetSingleWorkoutQuery request, CancellationToken cancellationToken)
   at PeakPerformance.Application.BusinessLogic._Behaviors.PerformanceMonitoringBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken)
   at PeakPerformance.Application.BusinessLogic._Behaviors.LoggingBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken)
   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken)
   at PeakPerformance.Api.Controllers.WorkoutController.GetSingle(WorkoutSearchOptions options) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\WorkoutController.cs:line 12
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeInnerFilterAsync>g__Awaited|13_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2026-02-01T10:37:52.6021919' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (101, N'Access forbidden.', N'   at PeakPerformance.Application.BusinessLogic.Exercises.Queries.GetSelectedExercisesQuery.GetSelectedExercisesQueryHandler.Handle(GetSelectedExercisesQuery request, CancellationToken cancellationToken)
   at PeakPerformance.Application.BusinessLogic._Behaviors.PerformanceMonitoringBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken)
   at PeakPerformance.Application.BusinessLogic._Behaviors.LoggingBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken)
   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken)
   at PeakPerformance.Api.Controllers.ExerciseController.GetSelectedExercises(Int64 userId) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\ExerciseController.cs:line 39
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeInnerFilterAsync>g__Awaited|13_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2026-02-01T10:38:08.6937285' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (102, N'Access forbidden.', N'   at PeakPerformance.Application.BusinessLogic.Exercises.Queries.SearchExerciseQuery.SearchExerciseQueryHandler.Handle(SearchExerciseQuery request, CancellationToken cancellationToken)
   at PeakPerformance.Application.BusinessLogic._Behaviors.PerformanceMonitoringBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken)
   at PeakPerformance.Application.BusinessLogic._Behaviors.LoggingBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken)
   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken)
   at PeakPerformance.Api.Controllers.ExerciseController.Search(ExerciseSearchOptions options) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\ExerciseController.cs:line 12
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeInnerFilterAsync>g__Awaited|13_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2026-02-01T10:38:08.6938256' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (103, N'Access forbidden.', N'   at PeakPerformance.Application.BusinessLogic.Exercises.Queries.SearchExerciseQuery.SearchExerciseQueryHandler.Handle(SearchExerciseQuery request, CancellationToken cancellationToken)
   at PeakPerformance.Application.BusinessLogic._Behaviors.PerformanceMonitoringBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken)
   at PeakPerformance.Application.BusinessLogic._Behaviors.LoggingBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken)
   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken)
   at PeakPerformance.Api.Controllers.ExerciseController.Search(ExerciseSearchOptions options) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\ExerciseController.cs:line 12
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeInnerFilterAsync>g__Awaited|13_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2026-02-01T10:38:19.9648338' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (104, N'Access forbidden.', N'   at PeakPerformance.Application.BusinessLogic.ExerciseGoals.Queries.SearchExerciseGoalQuery.SearchExerciseGoalQueryHandler.Handle(SearchExerciseGoalQuery request, CancellationToken cancellationToken)
   at PeakPerformance.Application.BusinessLogic._Behaviors.PerformanceMonitoringBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken)
   at PeakPerformance.Application.BusinessLogic._Behaviors.LoggingBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken)
   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken)
   at PeakPerformance.Api.Controllers.ExerciseGoalController.Search(ExerciseGoalSearchOptions options) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\ExerciseGoalController.cs:line 12
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeInnerFilterAsync>g__Awaited|13_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2026-02-01T10:38:20.0566781' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (105, N'Access forbidden.', N'   at PeakPerformance.Application.BusinessLogic.Workouts.Queries.GetSingleWorkoutQuery.GetSingleWorkoutQueryHandler.Handle(GetSingleWorkoutQuery request, CancellationToken cancellationToken)
   at PeakPerformance.Application.BusinessLogic._Behaviors.PerformanceMonitoringBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken)
   at PeakPerformance.Application.BusinessLogic._Behaviors.LoggingBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken)
   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken)
   at PeakPerformance.Api.Controllers.WorkoutController.GetSingle(WorkoutSearchOptions options) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\WorkoutController.cs:line 12
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeInnerFilterAsync>g__Awaited|13_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2026-02-01T14:57:11.5803195' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (106, N'Access forbidden.', N'   at PeakPerformance.Application.BusinessLogic.Exercises.Queries.SearchExerciseQuery.SearchExerciseQueryHandler.Handle(SearchExerciseQuery request, CancellationToken cancellationToken)
   at PeakPerformance.Application.BusinessLogic._Behaviors.PerformanceMonitoringBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken)
   at PeakPerformance.Application.BusinessLogic._Behaviors.LoggingBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken)
   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken)
   at PeakPerformance.Api.Controllers.ExerciseController.Search(ExerciseSearchOptions options) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\ExerciseController.cs:line 12
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeInnerFilterAsync>g__Awaited|13_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2026-02-01T15:02:03.6584371' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (107, N'Access forbidden.', N'   at PeakPerformance.Application.BusinessLogic.Exercises.Queries.GetSelectedExercisesQuery.GetSelectedExercisesQueryHandler.Handle(GetSelectedExercisesQuery request, CancellationToken cancellationToken)
   at PeakPerformance.Application.BusinessLogic._Behaviors.PerformanceMonitoringBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken)
   at PeakPerformance.Application.BusinessLogic._Behaviors.LoggingBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken)
   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken)
   at PeakPerformance.Api.Controllers.ExerciseController.GetSelectedExercises(Int64 userId) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\ExerciseController.cs:line 39
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeInnerFilterAsync>g__Awaited|13_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2026-02-01T15:02:06.5599425' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (108, N'Access forbidden.', N'   at PeakPerformance.Application.BusinessLogic.Exercises.Queries.GetSelectedExercisesQuery.GetSelectedExercisesQueryHandler.Handle(GetSelectedExercisesQuery request, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\Exercises\Queries\GetSelectedExercisesQuery.cs:line 19
   at PeakPerformance.Application.BusinessLogic._Behaviors.PerformanceMonitoringBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\PerformanceMonitoringBehavior.cs:line 18
   at PeakPerformance.Application.BusinessLogic._Behaviors.LoggingBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\LoggingBehavior.cs:line 17
   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\ValidationBehavior.cs:line 28
   at PeakPerformance.Api.Controllers.ExerciseController.GetSelectedExercises(Int64 userId) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\ExerciseController.cs:line 39
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeInnerFilterAsync>g__Awaited|13_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2026-02-01T15:02:33.1384412' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (109, N'Access forbidden.', N'   at PeakPerformance.Application.BusinessLogic.Exercises.Queries.SearchExerciseQuery.SearchExerciseQueryHandler.Handle(SearchExerciseQuery request, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\Exercises\Queries\SearchExerciseQuery.cs:line 23
   at PeakPerformance.Application.BusinessLogic._Behaviors.PerformanceMonitoringBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\PerformanceMonitoringBehavior.cs:line 18
   at PeakPerformance.Application.BusinessLogic._Behaviors.LoggingBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\LoggingBehavior.cs:line 17
   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\ValidationBehavior.cs:line 28
   at PeakPerformance.Api.Controllers.ExerciseController.Search(ExerciseSearchOptions options) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\ExerciseController.cs:line 12
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeInnerFilterAsync>g__Awaited|13_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2026-02-01T15:02:33.1384376' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (110, N'Access forbidden.', N'   at PeakPerformance.Application.BusinessLogic.Exercises.Queries.GetSelectedExercisesQuery.GetSelectedExercisesQueryHandler.Handle(GetSelectedExercisesQuery request, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\Exercises\Queries\GetSelectedExercisesQuery.cs:line 19
   at PeakPerformance.Application.BusinessLogic._Behaviors.PerformanceMonitoringBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\PerformanceMonitoringBehavior.cs:line 18
   at PeakPerformance.Application.BusinessLogic._Behaviors.LoggingBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\LoggingBehavior.cs:line 17
   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\ValidationBehavior.cs:line 28
   at PeakPerformance.Api.Controllers.ExerciseController.GetSelectedExercises(Int64 userId) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\ExerciseController.cs:line 39
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeInnerFilterAsync>g__Awaited|13_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2026-02-01T15:02:41.9465756' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (111, N'Access forbidden.', N'   at PeakPerformance.Application.BusinessLogic.Exercises.Queries.SearchExerciseQuery.SearchExerciseQueryHandler.Handle(SearchExerciseQuery request, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\Exercises\Queries\SearchExerciseQuery.cs:line 23
   at PeakPerformance.Application.BusinessLogic._Behaviors.PerformanceMonitoringBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\PerformanceMonitoringBehavior.cs:line 18
   at PeakPerformance.Application.BusinessLogic._Behaviors.LoggingBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\LoggingBehavior.cs:line 17
   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\ValidationBehavior.cs:line 28
   at PeakPerformance.Api.Controllers.ExerciseController.Search(ExerciseSearchOptions options) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\ExerciseController.cs:line 12
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeInnerFilterAsync>g__Awaited|13_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2026-02-01T15:02:41.9726755' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (112, N'Access forbidden.', N'   at PeakPerformance.Application.BusinessLogic.Workouts.Queries.GetAllWorkoutLogsQuery.GetAllWorkoutLogsQueryHandler.Handle(GetAllWorkoutLogsQuery request, CancellationToken cancellationToken)
   at PeakPerformance.Application.BusinessLogic._Behaviors.PerformanceMonitoringBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken)
   at PeakPerformance.Application.BusinessLogic._Behaviors.LoggingBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken)
   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken)
   at PeakPerformance.Api.Controllers.WorkoutController.GetAllWorkoutLogs(Int64 userId) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\WorkoutController.cs:line 22
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeInnerFilterAsync>g__Awaited|13_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2026-02-01T20:54:57.0515004' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (113, N'One or more validation failures have occurred', N'   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken)
   at PeakPerformance.Api.Controllers.UserController.ChangePassword(ChangePasswordDto data) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\UserController.cs:line 64
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2026-02-03T20:02:48.1187222' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (114, N'Access forbidden.', N'   at PeakPerformance.Application.BusinessLogic.Workouts.Queries.GetAllWorkoutLogsQuery.GetAllWorkoutLogsQueryHandler.Handle(GetAllWorkoutLogsQuery request, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\Workouts\Queries\GetAllWorkoutLogsQuery.cs:line 16
   at PeakPerformance.Application.BusinessLogic._Behaviors.PerformanceMonitoringBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\PerformanceMonitoringBehavior.cs:line 18
   at PeakPerformance.Application.BusinessLogic._Behaviors.LoggingBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\LoggingBehavior.cs:line 17
   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\ValidationBehavior.cs:line 28
   at PeakPerformance.Api.Controllers.WorkoutController.GetAllWorkoutLogs(Int64 userId) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\WorkoutController.cs:line 22
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeInnerFilterAsync>g__Awaited|13_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2026-02-07T15:07:12.6703025' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (115, N'Access forbidden.', N'   at PeakPerformance.Application.BusinessLogic.Workouts.Queries.SearchWorkoutQuery.SearchWorkoutQueryHandler.Handle(SearchWorkoutQuery request, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\Workouts\Queries\SearchWorkoutQuery.cs:line 24
   at PeakPerformance.Application.BusinessLogic._Behaviors.PerformanceMonitoringBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\PerformanceMonitoringBehavior.cs:line 18
   at PeakPerformance.Application.BusinessLogic._Behaviors.LoggingBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\LoggingBehavior.cs:line 17
   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\ValidationBehavior.cs:line 28
   at PeakPerformance.Api.Controllers.WorkoutController.Search(WorkoutSearchOptions options) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\WorkoutController.cs:line 27
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeInnerFilterAsync>g__Awaited|13_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2026-02-07T15:07:12.6703110' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (116, N'One or more validation failures have occurred', N'   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\ValidationBehavior.cs:line 26
   at PeakPerformance.Api.Controllers.AuthController.Login(LoginDto data) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\AuthController.cs:line 14
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2026-02-07T15:07:38.2379497' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (117, N'One or more validation failures have occurred', N'   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\ValidationBehavior.cs:line 26
   at PeakPerformance.Api.Controllers.AuthController.Login(LoginDto data) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\AuthController.cs:line 14
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2026-02-07T15:07:47.5384544' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (118, N'One or more validation failures have occurred', N'   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\ValidationBehavior.cs:line 26
   at PeakPerformance.Api.Controllers.AuthController.Registration(RegistrationDto data) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\AuthController.cs:line 10
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2026-02-07T15:08:07.9772803' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (119, N'One or more validation failures have occurred', N'   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\ValidationBehavior.cs:line 26
   at PeakPerformance.Api.Controllers.AuthController.Registration(RegistrationDto data) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\AuthController.cs:line 10
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2026-02-07T15:09:47.6548383' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (120, N'One or more validation failures have occurred', N'   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\ValidationBehavior.cs:line 26
   at PeakPerformance.Api.Controllers.AuthController.Registration(RegistrationDto data) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\AuthController.cs:line 10
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2026-02-07T15:43:38.9410148' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (121, N'One or more validation failures have occurred', N'   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\ValidationBehavior.cs:line 26
   at PeakPerformance.Api.Controllers.WorkoutController.Save(WorkoutDto data) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\WorkoutController.cs:line 32
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2026-02-17T11:47:37.7915600' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (122, N'Access forbidden.', N'   at PeakPerformance.Application.BusinessLogic.Workouts.Queries.GetSingleWorkoutQuery.GetSingleWorkoutQueryHandler.Handle(GetSingleWorkoutQuery request, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\Workouts\Queries\GetSingleWorkoutQuery.cs:line 22
   at PeakPerformance.Application.BusinessLogic._Behaviors.PerformanceMonitoringBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\PerformanceMonitoringBehavior.cs:line 18
   at PeakPerformance.Application.BusinessLogic._Behaviors.LoggingBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\LoggingBehavior.cs:line 17
   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\ValidationBehavior.cs:line 28
   at PeakPerformance.Api.Controllers.WorkoutController.GetSingle(WorkoutSearchOptions options) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\WorkoutController.cs:line 12
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeInnerFilterAsync>g__Awaited|13_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2026-02-17T13:43:48.8773840' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (123, N'Nullable object must have a value.', N'   at System.Nullable`1.get_Value()
   at PeakPerformance.Application.BusinessLogic.Workouts.Queries.GetSingleWorkoutQuery.GetSingleWorkoutQueryHandler.<>c__DisplayClass4_1.<Handle>b__34(WorkoutExerciseSetDto _) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\Workouts\Queries\GetSingleWorkoutQuery.cs:line 105
   at System.Linq.Enumerable.Sum[TSource,TResult,TAccumulator](IEnumerable`1 source, Func`2 selector)
   at PeakPerformance.Application.BusinessLogic.Workouts.Queries.GetSingleWorkoutQuery.GetSingleWorkoutQueryHandler.Handle(GetSingleWorkoutQuery request, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\Workouts\Queries\GetSingleWorkoutQuery.cs:line 105
   at PeakPerformance.Application.BusinessLogic._Behaviors.PerformanceMonitoringBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\PerformanceMonitoringBehavior.cs:line 18
   at PeakPerformance.Application.BusinessLogic._Behaviors.LoggingBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\LoggingBehavior.cs:line 17
   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\ValidationBehavior.cs:line 28
   at PeakPerformance.Api.Controllers.WorkoutController.GetSingle(WorkoutSearchOptions options) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\WorkoutController.cs:line 12
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeInnerFilterAsync>g__Awaited|13_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2026-02-17T13:47:34.0427705' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (124, N'Access forbidden.', N'   at PeakPerformance.Application.BusinessLogic.Workouts.Queries.GetSingleWorkoutQuery.GetSingleWorkoutQueryHandler.Handle(GetSingleWorkoutQuery request, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\Workouts\Queries\GetSingleWorkoutQuery.cs:line 22
   at PeakPerformance.Application.BusinessLogic._Behaviors.PerformanceMonitoringBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\PerformanceMonitoringBehavior.cs:line 18
   at PeakPerformance.Application.BusinessLogic._Behaviors.LoggingBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\LoggingBehavior.cs:line 17
   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\ValidationBehavior.cs:line 28
   at PeakPerformance.Api.Controllers.WorkoutController.GetSingle(WorkoutSearchOptions options) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\WorkoutController.cs:line 12
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeInnerFilterAsync>g__Awaited|13_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2026-02-17T13:48:36.9852540' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (125, N'Access forbidden.', N'   at PeakPerformance.Application.BusinessLogic.Workouts.Queries.GetSingleWorkoutQuery.GetSingleWorkoutQueryHandler.Handle(GetSingleWorkoutQuery request, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\Workouts\Queries\GetSingleWorkoutQuery.cs:line 22
   at PeakPerformance.Application.BusinessLogic._Behaviors.PerformanceMonitoringBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\PerformanceMonitoringBehavior.cs:line 18
   at PeakPerformance.Application.BusinessLogic._Behaviors.LoggingBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\LoggingBehavior.cs:line 17
   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\ValidationBehavior.cs:line 28
   at PeakPerformance.Api.Controllers.WorkoutController.GetSingle(WorkoutSearchOptions options) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\WorkoutController.cs:line 12
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeInnerFilterAsync>g__Awaited|13_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2026-02-21T10:30:30.0471278' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (126, N'Access forbidden.', N'   at PeakPerformance.Application.BusinessLogic.Workouts.Queries.GetSingleWorkoutQuery.GetSingleWorkoutQueryHandler.Handle(GetSingleWorkoutQuery request, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\Workouts\Queries\GetSingleWorkoutQuery.cs:line 22
   at PeakPerformance.Application.BusinessLogic._Behaviors.PerformanceMonitoringBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\PerformanceMonitoringBehavior.cs:line 18
   at PeakPerformance.Application.BusinessLogic._Behaviors.LoggingBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\LoggingBehavior.cs:line 17
   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\ValidationBehavior.cs:line 28
   at PeakPerformance.Api.Controllers.WorkoutController.GetSingle(WorkoutSearchOptions options) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\WorkoutController.cs:line 12
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeInnerFilterAsync>g__Awaited|13_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2026-02-21T10:30:30.0471278' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (127, N'Object reference not set to an instance of an object.', N'   at PeakPerformance.Application.BusinessLogic.Exercises.Validators.AdminSaveExerciseValidator.<>c.<.ctor>b__0_4(List`1 ids) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\Exercises\Validators\AdminSaveExerciseValidator.cs:line 19
   at FluentValidation.DefaultValidatorExtensions.<>c__DisplayClass27_0`2.<Must>b__0(T _, TProperty val) in /_/src/FluentValidation/DefaultValidatorExtensions.cs:line 420
   at FluentValidation.DefaultValidatorExtensions.<>c__DisplayClass28_0`2.<Must>b__0(T x, TProperty val, ValidationContext`1 _) in /_/src/FluentValidation/DefaultValidatorExtensions.cs:line 436
   at FluentValidation.Validators.PredicateValidator`2.IsValid(ValidationContext`1 context, TProperty value) in /_/src/FluentValidation/Validators/PredicateValidator.cs:line 35
   at FluentValidation.Internal.RuleComponent`2.InvokePropertyValidator(ValidationContext`1 context, TProperty value) in /_/src/FluentValidation/Internal/RuleComponent.cs:line 92
   at FluentValidation.Internal.RuleComponent`2.Validate(ValidationContext`1 context, TProperty value) in /_/src/FluentValidation/Internal/RuleComponent.cs:line 83
   at FluentValidation.Internal.PropertyRule`2.Validate(ValidationContext`1 context) in /_/src/FluentValidation/obj/Release/net8.0/Zomp.SyncMethodGenerator/Zomp.SyncMethodGenerator.SyncMethodSourceGenerator/FluentValidation.Internal.PropertyRule.ValidateAsync.g.cs:line 68
   at FluentValidation.AbstractValidator`1.ValidateInternal(ValidationContext`1 context) in /_/src/FluentValidation/obj/Release/net8.0/Zomp.SyncMethodGenerator/Zomp.SyncMethodGenerator.SyncMethodSourceGenerator/FluentValidation.AbstractValidator.ValidateInternalAsync.g.cs:line 27
   at FluentValidation.AbstractValidator`1.Validate(ValidationContext`1 context) in /_/src/FluentValidation/AbstractValidator.cs:line 119
   at FluentValidation.AbstractValidator`1.FluentValidation.IValidator.Validate(IValidationContext context) in /_/src/FluentValidation/AbstractValidator.cs:line 85
   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.<>c__DisplayClass2_0.<Handle>b__0(IValidator`1 v) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\ValidationBehavior.cs:line 20
   at System.Linq.Enumerable.ArraySelectIterator`2.MoveNext()
   at System.Linq.Enumerable.SelectManySingleSelectorIterator`2.MoveNext()
   at System.Linq.Enumerable.IEnumerableWhereIterator`1.ToList()
   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\ValidationBehavior.cs:line 19
   at PeakPerformance.Api.Controllers.ExerciseController.AdminSave(ExerciseDto data) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\ExerciseController.cs:line 84
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2026-02-26T18:00:58.2334336' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (128, N'Object reference not set to an instance of an object.', N'   at PeakPerformance.Application.BusinessLogic.Exercises.Validators.AdminSaveExerciseValidator.<>c.<.ctor>b__0_4(List`1 ids) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\Exercises\Validators\AdminSaveExerciseValidator.cs:line 19
   at FluentValidation.DefaultValidatorExtensions.<>c__DisplayClass27_0`2.<Must>b__0(T _, TProperty val) in /_/src/FluentValidation/DefaultValidatorExtensions.cs:line 420
   at FluentValidation.DefaultValidatorExtensions.<>c__DisplayClass28_0`2.<Must>b__0(T x, TProperty val, ValidationContext`1 _) in /_/src/FluentValidation/DefaultValidatorExtensions.cs:line 436
   at FluentValidation.Validators.PredicateValidator`2.IsValid(ValidationContext`1 context, TProperty value) in /_/src/FluentValidation/Validators/PredicateValidator.cs:line 35
   at FluentValidation.Internal.RuleComponent`2.InvokePropertyValidator(ValidationContext`1 context, TProperty value) in /_/src/FluentValidation/Internal/RuleComponent.cs:line 92
   at FluentValidation.Internal.RuleComponent`2.Validate(ValidationContext`1 context, TProperty value) in /_/src/FluentValidation/Internal/RuleComponent.cs:line 83
   at FluentValidation.Internal.PropertyRule`2.Validate(ValidationContext`1 context) in /_/src/FluentValidation/obj/Release/net8.0/Zomp.SyncMethodGenerator/Zomp.SyncMethodGenerator.SyncMethodSourceGenerator/FluentValidation.Internal.PropertyRule.ValidateAsync.g.cs:line 68
   at FluentValidation.AbstractValidator`1.ValidateInternal(ValidationContext`1 context) in /_/src/FluentValidation/obj/Release/net8.0/Zomp.SyncMethodGenerator/Zomp.SyncMethodGenerator.SyncMethodSourceGenerator/FluentValidation.AbstractValidator.ValidateInternalAsync.g.cs:line 27
   at FluentValidation.AbstractValidator`1.Validate(ValidationContext`1 context) in /_/src/FluentValidation/AbstractValidator.cs:line 119
   at FluentValidation.AbstractValidator`1.FluentValidation.IValidator.Validate(IValidationContext context) in /_/src/FluentValidation/AbstractValidator.cs:line 85
   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.<>c__DisplayClass2_0.<Handle>b__0(IValidator`1 v) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\ValidationBehavior.cs:line 20
   at System.Linq.Enumerable.ArraySelectIterator`2.MoveNext()
   at System.Linq.Enumerable.SelectManySingleSelectorIterator`2.MoveNext()
   at System.Linq.Enumerable.IEnumerableWhereIterator`1.ToList()
   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\ValidationBehavior.cs:line 19
   at PeakPerformance.Api.Controllers.ExerciseController.AdminSave(ExerciseDto data) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\ExerciseController.cs:line 84
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2026-02-26T18:01:52.1449502' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (129, N'One or more validation failures have occurred', N'   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken)
   at PeakPerformance.Api.Controllers.ExerciseController.AdminSave(ExerciseDto data) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\ExerciseController.cs:line 84
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2026-02-26T18:02:41.4935879' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (130, N'One or more validation failures have occurred', N'   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken)
   at PeakPerformance.Api.Controllers.ExerciseController.AdminSave(ExerciseDto data) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\ExerciseController.cs:line 84
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2026-02-26T18:03:25.4662317' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (131, N'One or more validation failures have occurred', N'   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\ValidationBehavior.cs:line 26
   at PeakPerformance.Api.Controllers.ExerciseController.AdminSave(ExerciseDto data) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\ExerciseController.cs:line 84
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2026-02-26T18:05:24.6883800' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (132, N'One or more validation failures have occurred', N'   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken)
   at PeakPerformance.Api.Controllers.ExerciseController.AdminSave(ExerciseDto data) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\ExerciseController.cs:line 84
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2026-02-26T18:10:21.9289933' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (133, N'One or more validation failures have occurred', N'   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\ValidationBehavior.cs:line 26
   at PeakPerformance.Api.Controllers.ExerciseController.AdminSave(ExerciseDto data) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\ExerciseController.cs:line 84
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2026-02-26T18:11:01.3969222' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (134, N'Error converting value "test. create.test.create" to type ''System.String[]''. Path ''instructions'', line 1, position 162.', N'   at Newtonsoft.Json.Serialization.JsonSerializerInternalReader.EnsureType(JsonReader reader, Object value, CultureInfo culture, JsonContract contract, Type targetType)
   at Newtonsoft.Json.Serialization.JsonSerializerInternalReader.CreateValueInternal(JsonReader reader, Type objectType, JsonContract contract, JsonProperty member, JsonContainerContract containerContract, JsonProperty containerMember, Object existingValue)
   at Newtonsoft.Json.Serialization.JsonSerializerInternalReader.SetPropertyValue(JsonProperty property, JsonConverter propertyConverter, JsonContainerContract containerContract, JsonProperty containerProperty, JsonReader reader, Object target)
   at Newtonsoft.Json.Serialization.JsonSerializerInternalReader.PopulateObject(Object newObject, JsonReader reader, JsonObjectContract contract, JsonProperty member, String id)
   at Newtonsoft.Json.Serialization.JsonSerializerInternalReader.CreateObject(JsonReader reader, Type objectType, JsonContract contract, JsonProperty member, JsonContainerContract containerContract, JsonProperty containerMember, Object existingValue)
   at Newtonsoft.Json.Serialization.JsonSerializerInternalReader.CreateValueInternal(JsonReader reader, Type objectType, JsonContract contract, JsonProperty member, JsonContainerContract containerContract, JsonProperty containerMember, Object existingValue)
   at Newtonsoft.Json.Serialization.JsonSerializerInternalReader.Deserialize(JsonReader reader, Type objectType, Boolean checkAdditionalContent)
   at Newtonsoft.Json.JsonSerializer.DeserializeInternal(JsonReader reader, Type objectType)
   at Newtonsoft.Json.JsonSerializer.Deserialize(JsonReader reader, Type objectType)
   at Newtonsoft.Json.JsonConvert.DeserializeObject(String value, Type type, JsonSerializerSettings settings)
   at Newtonsoft.Json.JsonConvert.DeserializeObject[T](String value, JsonSerializerSettings settings)
   at PeakPerformance.Common.Extensions.Extensions.DeserializeJsonObject[T](String data, IContractResolver contractResolver, Nullable`1 defaultValueHandling, Nullable`1 nullValueHandling) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Common\Extensions\Extensions.Json.cs:line 37
   at PeakPerformance.Api.Controllers.ExerciseController.AdminSave(String dataJson) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\ExerciseController.cs:line 65
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', N'Could not cast or convert from System.String to System.String[].', CAST(N'2026-02-26T18:23:56.1390993' AS DateTime2))
GO
INSERT [dbo].[ErrorLog] ([Id], [Message], [StackTrace], [InnerException], [RecordDate]) VALUES (135, N'One or more validation failures have occurred', N'   at PeakPerformance.Application.BusinessLogic._Behaviors.ValidationBehavior`2.Handle(TRequest request, RequestHandlerDelegate`1 next, CancellationToken cancellationToken) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Application\BusinessLogic\_Behaviors\ValidationBehavior.cs:line 26
   at PeakPerformance.Api.Controllers.ExerciseController.AdminSave(String dataJson) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Controllers\ExerciseController.cs:line 87
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at PeakPerformance.Api.Middlewares.ExceptionMiddleware.InvokeAsync(HttpContext context, IExceptionLogger logger) in D:\MyProjects\PeakPerformance_2\Application\Source\PeakPerformance.Api\Middlewares\ExceptionMiddleware.cs:line 16', NULL, CAST(N'2026-02-26T18:24:26.6072218' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[ErrorLog] OFF
GO
SET IDENTITY_INSERT [dbo].[Exercise] ON 
GO
INSERT [dbo].[Exercise] ([Id], [ApiExerciseId], [Name], [EquipmentName], [IsBodyweight], [IsCardio], [IsStrength], [PrimaryMuscleGroupId], [SecondaryMuscleGroupId], [BodyPart], [Instructions], [PictureUrl], [PublicId]) VALUES (72, N'J6Dx1Mu', N'Barbell Close-Grip Bench Press', N'Barbell', 0, 0, 1, 2, 12, N'Upper Arms', N'["Step:1 Lie flat on a bench with your feet flat on the ground and your back pressed against the bench.","Step:2 Grasp the barbell with a close grip, slightly narrower than shoulder-width apart.","Step:3 Unrack the barbell and lower it slowly towards your chest, keeping your elbows close to your body.","Step:4 Pause for a moment when the barbell touches your chest.","Step:5 Push the barbell back up to the starting position, fully extending your arms.","Step:6 Repeat for the desired number of repetitions."]', NULL, NULL)
GO
INSERT [dbo].[Exercise] ([Id], [ApiExerciseId], [Name], [EquipmentName], [IsBodyweight], [IsCardio], [IsStrength], [PrimaryMuscleGroupId], [SecondaryMuscleGroupId], [BodyPart], [Instructions], [PictureUrl], [PublicId]) VALUES (73, N'EIeI8Vf', N'Barbell Bench Press', N'Barbell', 0, 0, 1, 4, 10, N'Chest', N'["Step:1 Lie flat on a bench with your feet flat on the ground and your back pressed against the bench.","Step:2 Grasp the barbell with an overhand grip slightly wider than shoulder-width apart.","Step:3 Lift the barbell off the rack and hold it directly above your chest with your arms fully extended.","Step:4 Lower the barbell slowly towards your chest, keeping your elbows tucked in.","Step:5 Pause for a moment when the barbell touches your chest.","Step:6 Push the barbell back up to the starting position by extending your arms.","Step:7 Repeat for the desired number of repetitions."]', NULL, NULL)
GO
INSERT [dbo].[Exercise] ([Id], [ApiExerciseId], [Name], [EquipmentName], [IsBodyweight], [IsCardio], [IsStrength], [PrimaryMuscleGroupId], [SecondaryMuscleGroupId], [BodyPart], [Instructions], [PictureUrl], [PublicId]) VALUES (74, N'SpYC0Kp', N'Dumbbell Bench Press', N'Dumbbell', 0, 0, 1, 4, 10, N'Chest', N'["Step:1 Lie flat on a bench with your feet flat on the ground and your back pressed against the bench.","Step:2 Hold a dumbbell in each hand, with your palms facing forward and your arms extended above your chest.","Step:3 Lower the dumbbells slowly to the sides of your chest, keeping your elbows at a 90-degree angle.","Step:4 Pause for a moment, then push the dumbbells back up to the starting position, fully extending your arms.","Step:5 Repeat for the desired number of repetitions."]', NULL, NULL)
GO
INSERT [dbo].[Exercise] ([Id], [ApiExerciseId], [Name], [EquipmentName], [IsBodyweight], [IsCardio], [IsStrength], [PrimaryMuscleGroupId], [SecondaryMuscleGroupId], [BodyPart], [Instructions], [PictureUrl], [PublicId]) VALUES (75, N'3TZduzM', N'Barbell Incline Bench Press', N'Barbell', 0, 0, 1, 4, 10, N'Chest', N'["Step:1 Set up an incline bench at a 45-degree angle.","Step:2 Lie down on the bench with your feet flat on the ground.","Step:3 Grasp the barbell with an overhand grip, slightly wider than shoulder-width apart.","Step:4 Unrack the barbell and lower it slowly towards your chest, keeping your elbows at a 45-degree angle.","Step:5 Pause for a moment at the bottom, then push the barbell back up to the starting position.","Step:6 Repeat for the desired number of repetitions."]', NULL, NULL)
GO
INSERT [dbo].[Exercise] ([Id], [ApiExerciseId], [Name], [EquipmentName], [IsBodyweight], [IsCardio], [IsStrength], [PrimaryMuscleGroupId], [SecondaryMuscleGroupId], [BodyPart], [Instructions], [PictureUrl], [PublicId]) VALUES (76, N'lBDjFxJ', N'Pull-Up', N'Body Weight', 1, 0, 0, 1, 2, N'Back', N'["Step:1 Hang from a pull-up bar with your palms facing away from you and your arms fully extended.","Step:2 Engage your core and squeeze your shoulder blades together.","Step:3 Pull your body up towards the bar by bending your elbows and bringing your chest towards the bar.","Step:4 Pause at the top of the movement, then slowly lower your body back down to the starting position.","Step:5 Repeat for the desired number of repetitions."]', NULL, NULL)
GO
INSERT [dbo].[Exercise] ([Id], [ApiExerciseId], [Name], [EquipmentName], [IsBodyweight], [IsCardio], [IsStrength], [PrimaryMuscleGroupId], [SecondaryMuscleGroupId], [BodyPart], [Instructions], [PictureUrl], [PublicId]) VALUES (77, N'kiJ4Z2K', N'Assisted Pull-Up', N'Leverage Machine', 0, 0, 1, 1, 2, N'Back', N'["Step:1 Adjust the machine to your desired weight and height settings.","Step:2 Grasp the handles with an overhand grip, slightly wider than shoulder-width apart.","Step:3 Hang with your arms fully extended and your feet off the ground.","Step:4 Engage your back muscles and pull your body up towards the handles, keeping your elbows close to your body.","Step:5 Continue pulling until your chin is above the handles.","Step:6 Pause for a moment at the top, then slowly lower your body back down to the starting position.","Step:7 Repeat for the desired number of repetitions."]', NULL, NULL)
GO
INSERT [dbo].[Exercise] ([Id], [ApiExerciseId], [Name], [EquipmentName], [IsBodyweight], [IsCardio], [IsStrength], [PrimaryMuscleGroupId], [SecondaryMuscleGroupId], [BodyPart], [Instructions], [PictureUrl], [PublicId]) VALUES (78, N'HMzLjXx', N'Weighted Pull-Up', N'Weighted', 0, 0, 1, 1, 2, N'Back', N'["Step:1 Grab the pull-up bar with an overhand grip, slightly wider than shoulder-width apart.","Step:2 Hang from the bar with your arms fully extended and your body straight.","Step:3 Engage your back muscles and pull your body up towards the bar, keeping your elbows close to your body.","Step:4 Continue pulling until your chin is above the bar.","Step:5 Pause for a moment at the top, then slowly lower your body back down to the starting position.","Step:6 Repeat for the desired number of repetitions."]', NULL, NULL)
GO
INSERT [dbo].[Exercise] ([Id], [ApiExerciseId], [Name], [EquipmentName], [IsBodyweight], [IsCardio], [IsStrength], [PrimaryMuscleGroupId], [SecondaryMuscleGroupId], [BodyPart], [Instructions], [PictureUrl], [PublicId]) VALUES (79, N'CbFSYC1', N'Rear Pull-Up', N'Body Weight', 1, 0, 0, 1, 2, N'Back', N'["Step:1 Grab the pull-up bar with an overhand grip, slightly wider than shoulder-width apart.","Step:2 Hang from the bar with your arms fully extended and your body straight.","Step:3 Engage your back muscles and pull your body up towards the bar, keeping your elbows close to your body.","Step:4 Continue pulling until your chin is above the bar.","Step:5 Pause for a moment at the top, then slowly lower your body back down to the starting position.","Step:6 Repeat for the desired number of repetitions."]', NULL, NULL)
GO
INSERT [dbo].[Exercise] ([Id], [ApiExerciseId], [Name], [EquipmentName], [IsBodyweight], [IsCardio], [IsStrength], [PrimaryMuscleGroupId], [SecondaryMuscleGroupId], [BodyPart], [Instructions], [PictureUrl], [PublicId]) VALUES (80, N'Gpn4ADc', N'Smith Behind Neck Press', N'Smith Machine', 0, 0, 1, 8, 3, N'Shoulders', N'["Step:1 Adjust the seat height of the smith machine so that the bar is at shoulder level.","Step:2 Stand with your feet shoulder-width apart and your knees slightly bent.","Step:3 Grasp the bar with an overhand grip, slightly wider than shoulder-width apart.","Step:4 Lift the bar off the rack and step back, maintaining a stable stance.","Step:5 Lower the bar down to the back of your neck, keeping your elbows pointing forward.","Step:6 Press the bar up overhead until your arms are fully extended.","Step:7 Pause for a moment at the top, then slowly lower the bar back down to the starting position.","Step:8 Repeat for the desired number of repetitions."]', NULL, NULL)
GO
INSERT [dbo].[Exercise] ([Id], [ApiExerciseId], [Name], [EquipmentName], [IsBodyweight], [IsCardio], [IsStrength], [PrimaryMuscleGroupId], [SecondaryMuscleGroupId], [BodyPart], [Instructions], [PictureUrl], [PublicId]) VALUES (81, N'xDh0lJr', N'Standing Behind Neck Press', N'Barbell', 0, 0, 1, 8, 3, N'Shoulders', N'["Step:1 Stand with your feet shoulder-width apart and hold the barbell behind your neck with an overhand grip.","Step:2 Keep your back straight and core engaged.","Step:3 Press the barbell overhead by extending your arms, fully extending your elbows.","Step:4 Pause for a moment at the top, then slowly lower the barbell back down to the starting position.","Step:5 Repeat for the desired number of repetitions."]', NULL, NULL)
GO
INSERT [dbo].[Exercise] ([Id], [ApiExerciseId], [Name], [EquipmentName], [IsBodyweight], [IsCardio], [IsStrength], [PrimaryMuscleGroupId], [SecondaryMuscleGroupId], [BodyPart], [Instructions], [PictureUrl], [PublicId]) VALUES (82, N'hvV79Si', N'Cable Low Seated Row', N'Cable', 0, 0, 1, 1, 2, N'Back', N'["Step:1 Sit on the machine with your feet flat on the footrests and your knees slightly bent.","Step:2 Grasp the handles with an overhand grip, palms facing down.","Step:3 Keep your back straight and lean slightly forward, maintaining a slight bend in your elbows.","Step:4 Pull the handles towards your body, squeezing your shoulder blades together.","Step:5 Pause for a moment at the peak of the movement, then slowly release the handles back to the starting position.","Step:6 Repeat for the desired number of repetitions."]', NULL, NULL)
GO
INSERT [dbo].[Exercise] ([Id], [ApiExerciseId], [Name], [EquipmentName], [IsBodyweight], [IsCardio], [IsStrength], [PrimaryMuscleGroupId], [SecondaryMuscleGroupId], [BodyPart], [Instructions], [PictureUrl], [PublicId]) VALUES (83, N'SJqRxOt', N'Cable Rope Seated Row', N'Cable', 0, 0, 1, 1, 2, N'Back', N'["Step:1 Sit on the rowing machine with your feet flat on the footrests and knees slightly bent.","Step:2 Grasp the cable ropes with an overhand grip, palms facing each other.","Step:3 Keep your back straight and lean slightly forward, maintaining a slight bend in your elbows.","Step:4 Pull the cable ropes towards your body, squeezing your shoulder blades together.","Step:5 Pause for a moment at the peak of the movement, then slowly release the tension and return to the starting position.","Step:6 Repeat for the desired number of repetitions."]', NULL, NULL)
GO
INSERT [dbo].[Exercise] ([Id], [ApiExerciseId], [Name], [EquipmentName], [IsBodyweight], [IsCardio], [IsStrength], [PrimaryMuscleGroupId], [SecondaryMuscleGroupId], [BodyPart], [Instructions], [PictureUrl], [PublicId]) VALUES (84, N'h8LFzo9', N'Barbell Lying Triceps Extension Skull Crusher', N'Barbell', 0, 0, 1, 2, 8, N'Upper Arms', N'["Step:1 Lie flat on a bench with your feet flat on the ground and your head at the end of the bench.","Step:2 Hold the barbell with an overhand grip, hands shoulder-width apart, and extend your arms straight up over your chest.","Step:3 Keeping your upper arms stationary, slowly lower the barbell towards your forehead by bending your elbows.","Step:4 Pause for a moment when the barbell is just above your forehead, then extend your arms back up to the starting position.","Step:5 Repeat for the desired number of repetitions."]', NULL, NULL)
GO
INSERT [dbo].[Exercise] ([Id], [ApiExerciseId], [Name], [EquipmentName], [IsBodyweight], [IsCardio], [IsStrength], [PrimaryMuscleGroupId], [SecondaryMuscleGroupId], [BodyPart], [Instructions], [PictureUrl], [PublicId]) VALUES (85, N'SGY8Zui', N'Barbell Clean And Press', N'Barbell', 0, 0, 1, 16, 26, N'Upper Legs', N'["Step:1 Stand with your feet shoulder-width apart and the barbell on the floor in front of you.","Step:2 Bend your knees and hinge at the hips to lower down and grip the barbell with an overhand grip, hands slightly wider than shoulder-width apart.","Step:3 Drive through your heels and extend your hips and knees to lift the barbell off the floor, keeping it close to your body.","Step:4 As the barbell reaches your thighs, explosively extend your hips, shrug your shoulders, and pull the barbell up towards your chest.","Step:5 As the barbell reaches chest height, quickly drop under it and catch it at shoulder level, with your elbows pointing forward and your palms facing up.","Step:6 From the catch position, press the barbell overhead by extending your arms and pushing the barbell straight up.","Step:7 Lower the barbell back down to the starting position and repeat for the desired number of repetitions."]', NULL, NULL)
GO
INSERT [dbo].[Exercise] ([Id], [ApiExerciseId], [Name], [EquipmentName], [IsBodyweight], [IsCardio], [IsStrength], [PrimaryMuscleGroupId], [SecondaryMuscleGroupId], [BodyPart], [Instructions], [PictureUrl], [PublicId]) VALUES (86, N'25GPyDY', N'Barbell Curl', N'Barbell', 0, 0, 1, 2, 2, N'Upper Arms', N'["Step:1 Stand up straight with your feet shoulder-width apart and hold a barbell with an underhand grip, palms facing forward.","Step:2 Keep your elbows close to your torso and exhale as you curl the weights while contracting your biceps.","Step:3 Continue to raise the bar until your biceps are fully contracted and the bar is at shoulder level.","Step:4 Hold the contracted position for a brief pause as you squeeze your biceps.","Step:5 Inhale as you slowly begin to lower the bar back to the starting position.","Step:6 Repeat for the desired number of repetitions."]', NULL, NULL)
GO
INSERT [dbo].[Exercise] ([Id], [ApiExerciseId], [Name], [EquipmentName], [IsBodyweight], [IsCardio], [IsStrength], [PrimaryMuscleGroupId], [SecondaryMuscleGroupId], [BodyPart], [Instructions], [PictureUrl], [PublicId]) VALUES (87, N'6TG6x2w', N'Ez Barbell Curl', N'Ez Barbell', 0, 0, 1, 2, 2, N'Upper Arms', N'["Step:1 Stand up straight with your feet shoulder-width apart and hold the ez barbell with an underhand grip, palms facing up.","Step:2 Keep your elbows close to your torso and your upper arms stationary throughout the movement.","Step:3 Exhale as you curl the barbell up towards your shoulders, contracting your biceps.","Step:4 Pause for a moment at the top, then inhale as you slowly lower the barbell back down to the starting position.","Step:5 Repeat for the desired number of repetitions."]', NULL, NULL)
GO
INSERT [dbo].[Exercise] ([Id], [ApiExerciseId], [Name], [EquipmentName], [IsBodyweight], [IsCardio], [IsStrength], [PrimaryMuscleGroupId], [SecondaryMuscleGroupId], [BodyPart], [Instructions], [PictureUrl], [PublicId]) VALUES (88, N'V4ryaZa', N'Ez Barbell Close-Grip Curl', N'Ez Barbell', 0, 0, 1, 2, 2, N'Upper Arms', N'["Step:1 Stand up straight with your feet shoulder-width apart and hold the ez barbell with an underhand grip, hands shoulder-width apart.","Step:2 Keep your elbows close to your torso and your upper arms stationary throughout the movement.","Step:3 Curl the barbell up towards your shoulders, contracting your biceps.","Step:4 Pause for a moment at the top, then slowly lower the barbell back down to the starting position.","Step:5 Repeat for the desired number of repetitions."]', NULL, NULL)
GO
INSERT [dbo].[Exercise] ([Id], [ApiExerciseId], [Name], [EquipmentName], [IsBodyweight], [IsCardio], [IsStrength], [PrimaryMuscleGroupId], [SecondaryMuscleGroupId], [BodyPart], [Instructions], [PictureUrl], [PublicId]) VALUES (89, N'hacCyUv', N'Ez Barbell Close Grip Preacher Curl', N'Ez Barbell', 0, 0, 1, 2, 2, N'Upper Arms', N'["Step:1 Sit on a preacher curl bench and place your upper arms on the pad, gripping the ez barbell with an underhand grip.","Step:2 Rest your triceps on the pad and fully extend your arms, keeping your back straight.","Step:3 Slowly curl the barbell towards your shoulders, contracting your biceps.","Step:4 Pause for a moment at the top, squeezing your biceps.","Step:5 Lower the barbell back to the starting position, fully extending your arms.","Step:6 Repeat for the desired number of repetitions."]', NULL, NULL)
GO
INSERT [dbo].[Exercise] ([Id], [ApiExerciseId], [Name], [EquipmentName], [IsBodyweight], [IsCardio], [IsStrength], [PrimaryMuscleGroupId], [SecondaryMuscleGroupId], [BodyPart], [Instructions], [PictureUrl], [PublicId]) VALUES (90, N'slDvUAU', N'Dumbbell Hammer Curl', N'Dumbbell', 0, 0, 1, 2, 2, N'Upper Arms', N'["Step:1 Stand up straight with a dumbbell in each hand, palms facing your torso.","Step:2 Keep your elbows close to your torso and rotate the palms of your hands until they are facing forward.","Step:3 This will be your starting position.","Step:4 Now, keeping the upper arms stationary, exhale and curl the weights while contracting your biceps.","Step:5 Continue to raise the weights until your biceps are fully contracted and the dumbbells are at shoulder level.","Step:6 Hold the contracted position for a brief pause as you squeeze your biceps.","Step:7 Then, inhale and slowly begin to lower the dumbbells back to the starting position.","Step:8 Repeat for the recommended amount of repetitions."]', NULL, NULL)
GO
INSERT [dbo].[Exercise] ([Id], [ApiExerciseId], [Name], [EquipmentName], [IsBodyweight], [IsCardio], [IsStrength], [PrimaryMuscleGroupId], [SecondaryMuscleGroupId], [BodyPart], [Instructions], [PictureUrl], [PublicId]) VALUES (91, N'DsgkuIt', N'Dumbbell Lateral Raise', N'Dumbbell', 0, 0, 1, 8, 1, N'Shoulders', N'["Step:1 Stand with your feet shoulder-width apart and hold a dumbbell in each hand, palms facing your body.","Step:2 Keep your back straight and engage your core.","Step:3 Raise your arms out to the sides until they are parallel to the floor, keeping a slight bend in your elbows.","Step:4 Pause for a moment at the top, then slowly lower your arms back down to the starting position.","Step:5 Repeat for the desired number of repetitions."]', NULL, NULL)
GO
INSERT [dbo].[Exercise] ([Id], [ApiExerciseId], [Name], [EquipmentName], [IsBodyweight], [IsCardio], [IsStrength], [PrimaryMuscleGroupId], [SecondaryMuscleGroupId], [BodyPart], [Instructions], [PictureUrl], [PublicId]) VALUES (92, N'ila4NZS', N'Barbell Deadlift', N'Barbell', 0, 0, 1, 16, 17, N'Upper Legs', N'["Step:1 Stand with your feet shoulder-width apart and the barbell on the ground in front of you.","Step:2 Bend your knees and hinge at the hips to lower your torso and grip the barbell with an overhand grip, hands slightly wider than shoulder-width apart.","Step:3 Keep your back straight and chest lifted as you drive through your heels to lift the barbell off the ground, extending your hips and knees.","Step:4 As you stand up straight, squeeze your glutes and keep your core engaged.","Step:5 Lower the barbell back down to the ground by bending at the hips and knees, keeping your back straight.","Step:6 Repeat for the desired number of repetitions."]', NULL, NULL)
GO
INSERT [dbo].[Exercise] ([Id], [ApiExerciseId], [Name], [EquipmentName], [IsBodyweight], [IsCardio], [IsStrength], [PrimaryMuscleGroupId], [SecondaryMuscleGroupId], [BodyPart], [Instructions], [PictureUrl], [PublicId]) VALUES (93, N'wQ2c4XD', N'Barbell Romanian Deadlift', N'Barbell', 0, 0, 1, 16, 17, N'Upper Legs', N'["Step:1 Stand with your feet shoulder-width apart and your toes pointing forward.","Step:2 Hold the barbell with an overhand grip, hands slightly wider than shoulder-width apart.","Step:3 Bend at the hips, keeping your back straight and your knees slightly bent.","Step:4 Lower the barbell towards the ground, keeping it close to your body.","Step:5 Feel the stretch in your hamstrings as you lower the barbell.","Step:6 Once you feel a stretch in your hamstrings, push your hips forward and stand up straight.","Step:7 Squeeze your glutes at the top of the movement.","Step:8 Lower the barbell back down to the starting position and repeat for the desired number of repetitions."]', NULL, NULL)
GO
INSERT [dbo].[Exercise] ([Id], [ApiExerciseId], [Name], [EquipmentName], [IsBodyweight], [IsCardio], [IsStrength], [PrimaryMuscleGroupId], [SecondaryMuscleGroupId], [BodyPart], [Instructions], [PictureUrl], [PublicId]) VALUES (94, N'KgI0tqW', N'Barbell Sumo Deadlift', N'Barbell', 0, 0, 1, 16, 17, N'Upper Legs', N'["Step:1 Stand with your feet wider than shoulder-width apart, toes pointing outwards.","Step:2 Place a barbell on the ground in front of you, centered between your feet.","Step:3 Bend your knees and lower your hips, keeping your back straight and chest up, to grip the barbell with an overhand grip.","Step:4 Engage your core and drive through your heels to lift the barbell off the ground, extending your hips and knees simultaneously.","Step:5 As you lift, keep your chest up and back straight, and push your hips forward to fully engage your glutes.","Step:6 Pause for a moment at the top, then slowly lower the barbell back down to the starting position, maintaining control throughout the movement.","Step:7 Repeat for the desired number of repetitions."]', NULL, NULL)
GO
INSERT [dbo].[Exercise] ([Id], [ApiExerciseId], [Name], [EquipmentName], [IsBodyweight], [IsCardio], [IsStrength], [PrimaryMuscleGroupId], [SecondaryMuscleGroupId], [BodyPart], [Instructions], [PictureUrl], [PublicId]) VALUES (95, N'rR0LJzx', N'Dumbbell Romanian Deadlift', N'Dumbbell', 0, 0, 1, 16, 17, N'Upper Legs', N'["Step:1 Stand with your feet shoulder-width apart, holding a dumbbell in each hand with an overhand grip.","Step:2 Keeping your back straight and your core engaged, hinge at the hips and lower the dumbbells towards the ground, allowing your knees to bend slightly.","Step:3 Lower the dumbbells until you feel a stretch in your hamstrings, then push through your heels and engage your glutes to return to the starting position.","Step:4 Repeat for the desired number of repetitions."]', NULL, NULL)
GO
INSERT [dbo].[Exercise] ([Id], [ApiExerciseId], [Name], [EquipmentName], [IsBodyweight], [IsCardio], [IsStrength], [PrimaryMuscleGroupId], [SecondaryMuscleGroupId], [BodyPart], [Instructions], [PictureUrl], [PublicId]) VALUES (96, N'10Z2DXU', N'Sled 45В° Leg Press', N'Sled Machine', 0, 0, 1, 16, 16, N'Upper Legs', N'["Step:1 Adjust the seat and footplate of the sled machine to a comfortable position.","Step:2 Sit on the sled machine with your back against the backrest and your feet shoulder-width apart on the footplate.","Step:3 Grip the handles on the sides of the seat for stability.","Step:4 Push the footplate away from your body by extending your legs, keeping your heels on the footplate.","Step:5 Continue pushing until your legs are almost fully extended, but without locking your knees.","Step:6 Pause for a moment at the top of the movement, then slowly lower the footplate back towards your body by bending your knees.","Step:7 Repeat for the desired number of repetitions."]', NULL, NULL)
GO
INSERT [dbo].[Exercise] ([Id], [ApiExerciseId], [Name], [EquipmentName], [IsBodyweight], [IsCardio], [IsStrength], [PrimaryMuscleGroupId], [SecondaryMuscleGroupId], [BodyPart], [Instructions], [PictureUrl], [PublicId]) VALUES (97, N'17lJ1kr', N'Lever Lying Leg Curl', N'Leverage Machine', 0, 0, 1, 16, 16, N'Upper Legs', N'["Step:1 Adjust the machine to fit your body and select the desired weight.","Step:2 Lie face down on the machine with your legs straight and your heels against the padded lever.","Step:3 Grasp the handles or the sides of the machine for stability.","Step:4 Keeping your upper body stationary, exhale and curl your legs up as far as possible without lifting your hips off the pad.","Step:5 Hold the contracted position for a brief pause as you squeeze your hamstrings.","Step:6 Inhale and slowly lower the lever back to the starting position.","Step:7 Repeat for the desired number of repetitions."]', NULL, NULL)
GO
INSERT [dbo].[Exercise] ([Id], [ApiExerciseId], [Name], [EquipmentName], [IsBodyweight], [IsCardio], [IsStrength], [PrimaryMuscleGroupId], [SecondaryMuscleGroupId], [BodyPart], [Instructions], [PictureUrl], [PublicId]) VALUES (98, N'ywaNfuh', N'Smith Reverse Calf Raises', N'Smith Machine', 0, 0, 1, 16, 16, N'Lower Legs', N'["Step:1 Adjust the smith machine bar to a height just below your shoulders.","Step:2 Stand facing the bar with your feet hip-width apart and toes pointing forward.","Step:3 Place the balls of your feet on the edge of a step or platform, with your heels hanging off.","Step:4 Hold onto the bar for support, keeping your back straight and core engaged.","Step:5 Raise your heels as high as possible, lifting your body weight onto the balls of your feet.","Step:6 Pause for a moment at the top, then slowly lower your heels back down to the starting position.","Step:7 Repeat for the desired number of repetitions."]', NULL, NULL)
GO
INSERT [dbo].[Exercise] ([Id], [ApiExerciseId], [Name], [EquipmentName], [IsBodyweight], [IsCardio], [IsStrength], [PrimaryMuscleGroupId], [SecondaryMuscleGroupId], [BodyPart], [Instructions], [PictureUrl], [PublicId]) VALUES (99, N'2ORFMoR', N'Hack Calf Raise', N'Sled Machine', 0, 0, 1, 16, 16, N'Lower Legs', N'["Step:1 Adjust the sled machine to a comfortable weight.","Step:2 Stand on the sled machine with your toes on the platform and your heels hanging off.","Step:3 Hold onto the handles for stability.","Step:4 Raise your heels as high as possible by pushing through the balls of your feet.","Step:5 Pause for a moment at the top, then slowly lower your heels back down to the starting position.","Step:6 Repeat for the desired number of repetitions."]', NULL, NULL)
GO
INSERT [dbo].[Exercise] ([Id], [ApiExerciseId], [Name], [EquipmentName], [IsBodyweight], [IsCardio], [IsStrength], [PrimaryMuscleGroupId], [SecondaryMuscleGroupId], [BodyPart], [Instructions], [PictureUrl], [PublicId]) VALUES (100, N'u5ESqzH', N'Donkey Calf Raise', N'Body Weight', 1, 0, 0, 16, 16, N'Lower Legs', N'["Step:1 Stand with your toes on an elevated surface, such as a step or block.","Step:2 Place your hands on a stable support, such as a wall or railing, for balance.","Step:3 Raise your heels as high as possible, lifting your body weight onto the balls of your feet.","Step:4 Pause for a moment at the top, then slowly lower your heels back down to the starting position.","Step:5 Repeat for the desired number of repetitions."]', NULL, NULL)
GO
INSERT [dbo].[Exercise] ([Id], [ApiExerciseId], [Name], [EquipmentName], [IsBodyweight], [IsCardio], [IsStrength], [PrimaryMuscleGroupId], [SecondaryMuscleGroupId], [BodyPart], [Instructions], [PictureUrl], [PublicId]) VALUES (101, N'I3tsCnC', N'Hanging Leg Raise', N'Body Weight', 1, 0, 0, 32, 32, N'Waist', N'["Step:1 Hang from a pull-up bar with your arms fully extended and your palms facing away from you.","Step:2 Engage your core and lift your legs up in front of you, keeping them straight.","Step:3 Continue lifting until your legs are parallel to the ground or as high as you can comfortably go.","Step:4 Pause for a moment at the top, then slowly lower your legs back down to the starting position.","Step:5 Repeat for the desired number of repetitions."]', NULL, NULL)
GO
INSERT [dbo].[Exercise] ([Id], [ApiExerciseId], [Name], [EquipmentName], [IsBodyweight], [IsCardio], [IsStrength], [PrimaryMuscleGroupId], [SecondaryMuscleGroupId], [BodyPart], [Instructions], [PictureUrl], [PublicId]) VALUES (102, N'rjiM4L3', N'Walking On Incline Treadmill', N'Leverage Machine', 0, 1, 0, 0, 16, N'Cardio', N'["Step:1 Adjust the incline level on the treadmill to your desired intensity.","Step:2 Stand on the treadmill with your feet shoulder-width apart.","Step:3 Start walking at a comfortable pace, ensuring that you maintain proper form.","Step:4 Engage your core muscles and keep your back straight throughout the exercise.","Step:5 Continue walking on the incline treadmill for the desired duration of your cardio workout.","Step:6 Gradually decrease the incline and speed of the treadmill to cool down before stopping."]', NULL, NULL)
GO
INSERT [dbo].[Exercise] ([Id], [ApiExerciseId], [Name], [EquipmentName], [IsBodyweight], [IsCardio], [IsStrength], [PrimaryMuscleGroupId], [SecondaryMuscleGroupId], [BodyPart], [Instructions], [PictureUrl], [PublicId]) VALUES (103, N'r0z6xzQ', N'Barbell Pendlay Row', N'Barbell', 0, 0, 1, 1, 2, N'Back', N'["Step:1 Stand with your feet shoulder-width apart and your knees slightly bent.","Step:2 Bend forward at the hips, keeping your back straight and your chest up.","Step:3 Grasp the barbell with an overhand grip, slightly wider than shoulder-width apart.","Step:4 Pull the barbell towards your upper abdomen, squeezing your shoulder blades together.","Step:5 Lower the barbell back down to the starting position.","Step:6 Repeat for the desired number of repetitions."]', NULL, NULL)
GO
INSERT [dbo].[Exercise] ([Id], [ApiExerciseId], [Name], [EquipmentName], [IsBodyweight], [IsCardio], [IsStrength], [PrimaryMuscleGroupId], [SecondaryMuscleGroupId], [BodyPart], [Instructions], [PictureUrl], [PublicId]) VALUES (104, N'kTbSH9h', N'Barbell Seated Overhead Press', N'Barbell', 0, 0, 1, 8, 3, N'Shoulders', N'["Step:1 Sit on a bench with your back straight and feet flat on the ground.","Step:2 Hold the barbell with an overhand grip, slightly wider than shoulder-width apart.","Step:3 Lift the barbell off the rack and bring it to shoulder level, with your elbows bent and palms facing forward.","Step:4 Press the barbell overhead by extending your arms fully.","Step:5 Pause for a moment at the top, then slowly lower the barbell back to shoulder level.","Step:6 Repeat for the desired number of repetitions."]', NULL, NULL)
GO
INSERT [dbo].[Exercise] ([Id], [ApiExerciseId], [Name], [EquipmentName], [IsBodyweight], [IsCardio], [IsStrength], [PrimaryMuscleGroupId], [SecondaryMuscleGroupId], [BodyPart], [Instructions], [PictureUrl], [PublicId]) VALUES (105, N'bBi35y3', N'Dumbbell Standing Alternate Overhead Press', N'Dumbbell', 0, 0, 1, 8, 34, N'Shoulders', N'["Step:1 Stand with your feet shoulder-width apart, holding a dumbbell in each hand at shoulder level with your palms facing forward.","Step:2 Press one dumbbell overhead, fully extending your arm.","Step:3 Lower the dumbbell back to shoulder level.","Step:4 Repeat with the other arm.","Step:5 Continue alternating arms for the desired number of repetitions."]', NULL, NULL)
GO
INSERT [dbo].[Exercise] ([Id], [ApiExerciseId], [Name], [EquipmentName], [IsBodyweight], [IsCardio], [IsStrength], [PrimaryMuscleGroupId], [SecondaryMuscleGroupId], [BodyPart], [Instructions], [PictureUrl], [PublicId]) VALUES (106, N'1gFNTZV', N'Barbell Jump Squat', N'Barbell', 0, 0, 1, 16, 16, N'Upper Legs', N'["Step:1 Start by standing with your feet shoulder-width apart, holding a barbell across your upper back.","Step:2 Lower your body into a squat position by bending your knees and pushing your hips back.","Step:3 Once you reach the bottom of the squat, explode upwards by jumping off the ground.","Step:4 As you jump, extend your hips, knees, and ankles, pushing through your toes.","Step:5 Land softly back into the squat position and immediately repeat the movement for the desired number of repetitions."]', NULL, NULL)
GO
INSERT [dbo].[Exercise] ([Id], [ApiExerciseId], [Name], [EquipmentName], [IsBodyweight], [IsCardio], [IsStrength], [PrimaryMuscleGroupId], [SecondaryMuscleGroupId], [BodyPart], [Instructions], [PictureUrl], [PublicId]) VALUES (107, N'euI1BwR', N'Barbell Speed Squat', N'Barbell', 0, 0, 1, 16, 16, N'Upper Legs', N'["Step:1 Stand with your feet shoulder-width apart, toes slightly turned out.","Step:2 Hold the barbell across your upper back, resting it on your traps or rear delts.","Step:3 Engage your core and keep your chest up as you lower your hips back and down, as if sitting into a chair.","Step:4 Lower until your thighs are parallel to the ground, or as low as you can comfortably go.","Step:5 Drive through your heels to stand back up, squeezing your glutes at the top.","Step:6 Repeat for the desired number of repetitions."]', NULL, NULL)
GO
INSERT [dbo].[Exercise] ([Id], [ApiExerciseId], [Name], [EquipmentName], [IsBodyweight], [IsCardio], [IsStrength], [PrimaryMuscleGroupId], [SecondaryMuscleGroupId], [BodyPart], [Instructions], [PictureUrl], [PublicId]) VALUES (108, N'dzz6BiV', N'Smith Sumo Squat', N'Smith Machine', 0, 0, 1, 16, 16, N'Upper Legs', N'["Step:1 Set up the smith machine with the barbell at hip height.","Step:2 Stand with your feet wider than shoulder-width apart, toes pointing outwards.","Step:3 Position yourself under the barbell, resting it on your upper back and shoulders.","Step:4 Engage your core and keep your chest up as you lower your body down into a squat position, pushing your hips back and bending your knees.","Step:5 Lower yourself until your thighs are parallel to the ground, or as low as you can comfortably go.","Step:6 Pause for a moment at the bottom, then push through your heels to return to the starting position.","Step:7 Repeat for the desired number of repetitions."]', NULL, NULL)
GO
INSERT [dbo].[Exercise] ([Id], [ApiExerciseId], [Name], [EquipmentName], [IsBodyweight], [IsCardio], [IsStrength], [PrimaryMuscleGroupId], [SecondaryMuscleGroupId], [BodyPart], [Instructions], [PictureUrl], [PublicId]) VALUES (109, N'qXTaZnJ', N'Barbell Full Squat', N'Barbell', 0, 0, 1, 16, 48, N'Upper Legs', N'["Step:1 Stand with your feet shoulder-width apart, toes slightly turned out.","Step:2 Hold the barbell across your upper back, resting it on your traps or rear delts.","Step:3 Engage your core and keep your chest up as you begin to lower your body down.","Step:4 Bend at the knees and hips, pushing your hips back and down as if sitting into a chair.","Step:5 Lower yourself until your thighs are parallel to the ground or slightly below.","Step:6 Keep your knees in line with your toes and your weight in your heels.","Step:7 Drive through your heels to stand back up, extending your hips and knees.","Step:8 Repeat for the desired number of repetitions."]', NULL, NULL)
GO
INSERT [dbo].[Exercise] ([Id], [ApiExerciseId], [Name], [EquipmentName], [IsBodyweight], [IsCardio], [IsStrength], [PrimaryMuscleGroupId], [SecondaryMuscleGroupId], [BodyPart], [Instructions], [PictureUrl], [PublicId]) VALUES (110, N'Gnfo4FM', N'Barbell High Bar Squat', N'Barbell', 0, 0, 1, 16, 48, N'Upper Legs', N'["Step:1 Stand with your feet shoulder-width apart, toes slightly turned out.","Step:2 Place the barbell on your upper back, resting it on your traps.","Step:3 Engage your core and keep your chest up as you begin to squat down, pushing your hips back and bending your knees.","Step:4 Lower yourself until your thighs are parallel to the ground, or as low as you can comfortably go.","Step:5 Drive through your heels to stand back up, extending your hips and knees.","Step:6 Repeat for the desired number of repetitions."]', NULL, NULL)
GO
INSERT [dbo].[Exercise] ([Id], [ApiExerciseId], [Name], [EquipmentName], [IsBodyweight], [IsCardio], [IsStrength], [PrimaryMuscleGroupId], [SecondaryMuscleGroupId], [BodyPart], [Instructions], [PictureUrl], [PublicId]) VALUES (111, N'bTpEUcm', N'Barbell Low Bar Squat', N'Barbell', 0, 0, 1, 16, 16, N'Upper Legs', N'["Step:1 Stand with your feet shoulder-width apart and the barbell resting on your upper back.","Step:2 Keeping your chest up and core engaged, slowly lower your body by bending your knees and pushing your hips back.","Step:3 Continue lowering until your thighs are parallel to the ground or slightly below.","Step:4 Pause for a moment, then push through your heels to return to the starting position.","Step:5 Repeat for the desired number of repetitions."]', NULL, NULL)
GO
INSERT [dbo].[Exercise] ([Id], [ApiExerciseId], [Name], [EquipmentName], [IsBodyweight], [IsCardio], [IsStrength], [PrimaryMuscleGroupId], [SecondaryMuscleGroupId], [BodyPart], [Instructions], [PictureUrl], [PublicId]) VALUES (114, NULL, N'Hip Thrust', N'Barbell', NULL, NULL, 1, 16, 32, N'Legs', N'["Position the bench just below your shoulder blades.","Place feet shoulder-width apart, ensuring shins are vertical at the top of the movement.","Keep your chin tucked toward your chest and maintain a neutral spine, avoiding arching your lower back.","Drive through your heels to activate the glutes.","Control the descent, do not let the weight fall.","You can perform these with dumbbells, on a machine, or using a single leg."]', N'https://res.cloudinary.com/dpqnruuyn/image/upload/v1772215117/peak-performance-app/x2b58nry4bysjhbrlnn8.png', N'peak-performance-app/x2b58nry4bysjhbrlnn8')
GO
INSERT [dbo].[Exercise] ([Id], [ApiExerciseId], [Name], [EquipmentName], [IsBodyweight], [IsCardio], [IsStrength], [PrimaryMuscleGroupId], [SecondaryMuscleGroupId], [BodyPart], [Instructions], [PictureUrl], [PublicId]) VALUES (115, NULL, N'Cheat Curls', N'Barbell', NULL, NULL, 1, 2, NULL, N'Arms', N'["Stand with feet shoulder-width apart, using a barbell or dumbbells with a weight 10-20% heavier than your max strict curl.","Hinge forward slightly at the hips, then drive your hips forward to create momentum to help swing the weight up to your shoulders.","Once the weight is at the top, slowly lower it over 3-5 seconds, fighting gravity to maximize tension on the biceps.","Maintain a braced core and avoid overextending the lower back."]', NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Exercise] OFF
GO
SET IDENTITY_INSERT [dbo].[ExerciseGoal] ON 
GO
INSERT [dbo].[ExerciseGoal] ([Id], [ExerciseId], [UserId], [Weight], [WeightUnitId], [Reps], [StartDate], [EndDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive]) VALUES (3, 111, 1, CAST(150.00 AS Decimal(18, 2)), 1, 1, CAST(N'2025-12-04' AS Date), CAST(N'2026-03-31' AS Date), CAST(N'2026-01-25T15:57:46.1770363' AS DateTime2), 1, CAST(N'2026-01-25T15:57:46.1770363' AS DateTime2), 1, NULL, NULL, 1)
GO
INSERT [dbo].[ExerciseGoal] ([Id], [ExerciseId], [UserId], [Weight], [WeightUnitId], [Reps], [StartDate], [EndDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive]) VALUES (4, 72, 1, CAST(70.00 AS Decimal(18, 2)), 1, 1, CAST(N'2025-05-01' AS Date), CAST(N'2025-06-01' AS Date), CAST(N'2026-02-01T12:55:40.7219494' AS DateTime2), 1, CAST(N'2026-02-01T12:55:40.7219494' AS DateTime2), 1, NULL, NULL, 1)
GO
INSERT [dbo].[ExerciseGoal] ([Id], [ExerciseId], [UserId], [Weight], [WeightUnitId], [Reps], [StartDate], [EndDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive]) VALUES (5, 72, 1, CAST(100.00 AS Decimal(18, 2)), 1, 1, CAST(N'2025-07-07' AS Date), CAST(N'2025-08-08' AS Date), CAST(N'2026-02-01T12:56:15.4486029' AS DateTime2), 1, CAST(N'2026-02-01T12:56:15.4486029' AS DateTime2), 1, NULL, NULL, 1)
GO
INSERT [dbo].[ExerciseGoal] ([Id], [ExerciseId], [UserId], [Weight], [WeightUnitId], [Reps], [StartDate], [EndDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive]) VALUES (6, 72, 1, CAST(90.00 AS Decimal(18, 2)), 1, 1, CAST(N'2024-11-01' AS Date), CAST(N'2025-01-01' AS Date), CAST(N'2026-02-01T12:56:35.3605913' AS DateTime2), 1, CAST(N'2026-02-01T12:56:35.3605913' AS DateTime2), 1, NULL, NULL, 1)
GO
INSERT [dbo].[ExerciseGoal] ([Id], [ExerciseId], [UserId], [Weight], [WeightUnitId], [Reps], [StartDate], [EndDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive]) VALUES (7, 72, 1, CAST(97.50 AS Decimal(18, 2)), 1, 1, CAST(N'2025-10-10' AS Date), CAST(N'2025-10-30' AS Date), CAST(N'2026-02-01T12:57:05.8006034' AS DateTime2), 1, CAST(N'2026-02-01T12:57:05.8006034' AS DateTime2), 1, NULL, NULL, 1)
GO
INSERT [dbo].[ExerciseGoal] ([Id], [ExerciseId], [UserId], [Weight], [WeightUnitId], [Reps], [StartDate], [EndDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive]) VALUES (8, 72, 1, CAST(100.00 AS Decimal(18, 2)), 1, 5, CAST(N'2025-10-10' AS Date), CAST(N'2026-01-01' AS Date), CAST(N'2026-02-01T12:57:37.9541387' AS DateTime2), 1, CAST(N'2026-02-01T12:57:37.9541387' AS DateTime2), 1, NULL, NULL, 1)
GO
INSERT [dbo].[ExerciseGoal] ([Id], [ExerciseId], [UserId], [Weight], [WeightUnitId], [Reps], [StartDate], [EndDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive]) VALUES (9, 72, 1, CAST(120.00 AS Decimal(18, 2)), 1, 1, CAST(N'2026-01-01' AS Date), CAST(N'2026-06-06' AS Date), CAST(N'2026-02-01T12:58:05.1786306' AS DateTime2), 1, CAST(N'2026-02-01T12:58:05.1786306' AS DateTime2), 1, NULL, NULL, 1)
GO
INSERT [dbo].[ExerciseGoal] ([Id], [ExerciseId], [UserId], [Weight], [WeightUnitId], [Reps], [StartDate], [EndDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive]) VALUES (10, 73, 2, CAST(100.00 AS Decimal(18, 2)), 1, 1, CAST(N'2026-02-01' AS Date), CAST(N'2026-02-28' AS Date), CAST(N'2026-02-01T15:07:14.7600190' AS DateTime2), 2, CAST(N'2026-02-01T15:07:14.7600190' AS DateTime2), 2, NULL, NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[ExerciseGoal] OFF
GO
SET IDENTITY_INSERT [dbo].[Measurement] ON 
GO
INSERT [dbo].[Measurement] ([Id], [UserId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [LogDate], [BodyPartId], [Size]) VALUES (69, 1, 3, CAST(N'2025-11-16T17:26:29.5440592' AS DateTime2), 1, CAST(N'2025-11-16T17:26:29.5440592' AS DateTime2), 1, CAST(N'2025-11-21T17:07:18.1152202' AS DateTime2), 1, 0, CAST(N'2025-11-16T00:00:00.0000000' AS DateTime2), 1, CAST(85.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[Measurement] ([Id], [UserId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [LogDate], [BodyPartId], [Size]) VALUES (70, 1, 3, CAST(N'2025-11-16T17:26:45.0851151' AS DateTime2), 1, CAST(N'2025-11-16T17:26:45.0851151' AS DateTime2), 1, CAST(N'2025-11-21T17:07:20.4843469' AS DateTime2), 1, 0, CAST(N'2025-11-16T00:00:00.0000000' AS DateTime2), 5, CAST(120.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[Measurement] ([Id], [UserId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [LogDate], [BodyPartId], [Size]) VALUES (71, 1, 3, CAST(N'2025-11-21T17:22:22.6100000' AS DateTime2), 1, NULL, NULL, NULL, NULL, 1, CAST(N'2025-11-21T17:22:22.6100000' AS DateTime2), 1, CAST(90.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[Measurement] ([Id], [UserId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [LogDate], [BodyPartId], [Size]) VALUES (72, 1, 3, CAST(N'2025-11-21T17:22:22.6100000' AS DateTime2), 1, NULL, NULL, NULL, NULL, 1, CAST(N'2025-11-14T17:22:22.6100000' AS DateTime2), 1, CAST(89.4 AS Decimal(4, 1)))
GO
INSERT [dbo].[Measurement] ([Id], [UserId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [LogDate], [BodyPartId], [Size]) VALUES (73, 1, 3, CAST(N'2025-11-21T17:22:22.6100000' AS DateTime2), 1, NULL, NULL, NULL, NULL, 1, CAST(N'2025-11-07T17:22:22.6100000' AS DateTime2), 1, CAST(88.5 AS Decimal(4, 1)))
GO
INSERT [dbo].[Measurement] ([Id], [UserId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [LogDate], [BodyPartId], [Size]) VALUES (74, 1, 3, CAST(N'2025-11-21T17:22:22.6100000' AS DateTime2), 1, NULL, NULL, NULL, NULL, 1, CAST(N'2025-10-31T17:22:22.6100000' AS DateTime2), 1, CAST(88.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[Measurement] ([Id], [UserId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [LogDate], [BodyPartId], [Size]) VALUES (75, 1, 3, CAST(N'2025-11-21T17:22:22.6100000' AS DateTime2), 1, NULL, NULL, NULL, NULL, 1, CAST(N'2025-10-24T17:22:22.6100000' AS DateTime2), 1, CAST(87.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[Measurement] ([Id], [UserId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [LogDate], [BodyPartId], [Size]) VALUES (76, 1, 3, CAST(N'2025-11-21T17:22:22.6100000' AS DateTime2), 1, NULL, NULL, NULL, NULL, 1, CAST(N'2025-11-21T17:22:22.6100000' AS DateTime2), 2, CAST(95.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[Measurement] ([Id], [UserId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [LogDate], [BodyPartId], [Size]) VALUES (77, 1, 3, CAST(N'2025-11-21T17:22:22.6100000' AS DateTime2), 1, NULL, NULL, NULL, NULL, 1, CAST(N'2025-11-14T17:22:22.6100000' AS DateTime2), 2, CAST(96.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[Measurement] ([Id], [UserId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [LogDate], [BodyPartId], [Size]) VALUES (78, 1, 3, CAST(N'2025-11-21T17:22:22.6100000' AS DateTime2), 1, NULL, NULL, NULL, NULL, 1, CAST(N'2025-11-07T17:22:22.6100000' AS DateTime2), 2, CAST(94.6 AS Decimal(4, 1)))
GO
INSERT [dbo].[Measurement] ([Id], [UserId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [LogDate], [BodyPartId], [Size]) VALUES (79, 1, 3, CAST(N'2025-11-21T17:22:22.6100000' AS DateTime2), 1, NULL, NULL, NULL, NULL, 1, CAST(N'2025-10-31T17:22:22.6100000' AS DateTime2), 2, CAST(94.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[Measurement] ([Id], [UserId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [LogDate], [BodyPartId], [Size]) VALUES (80, 1, 3, CAST(N'2025-11-21T17:22:22.6100000' AS DateTime2), 1, NULL, NULL, NULL, NULL, 1, CAST(N'2025-10-24T17:22:22.6100000' AS DateTime2), 2, CAST(95.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[Measurement] ([Id], [UserId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [LogDate], [BodyPartId], [Size]) VALUES (81, 1, 3, CAST(N'2025-11-21T17:22:22.6100000' AS DateTime2), 1, NULL, NULL, NULL, NULL, 1, CAST(N'2025-11-21T17:22:22.6100000' AS DateTime2), 3, CAST(39.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[Measurement] ([Id], [UserId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [LogDate], [BodyPartId], [Size]) VALUES (82, 1, 3, CAST(N'2025-11-21T17:22:22.6100000' AS DateTime2), 1, NULL, NULL, NULL, NULL, 1, CAST(N'2025-11-14T17:22:22.6100000' AS DateTime2), 3, CAST(38.8 AS Decimal(4, 1)))
GO
INSERT [dbo].[Measurement] ([Id], [UserId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [LogDate], [BodyPartId], [Size]) VALUES (83, 1, 3, CAST(N'2025-11-21T17:22:22.6100000' AS DateTime2), 1, NULL, NULL, NULL, NULL, 1, CAST(N'2025-11-07T17:22:22.6100000' AS DateTime2), 3, CAST(39.2 AS Decimal(4, 1)))
GO
INSERT [dbo].[Measurement] ([Id], [UserId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [LogDate], [BodyPartId], [Size]) VALUES (84, 1, 3, CAST(N'2025-11-21T17:22:22.6100000' AS DateTime2), 1, NULL, NULL, NULL, NULL, 1, CAST(N'2025-10-31T17:22:22.6100000' AS DateTime2), 3, CAST(39.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[Measurement] ([Id], [UserId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [LogDate], [BodyPartId], [Size]) VALUES (85, 1, 3, CAST(N'2025-11-21T17:22:22.6100000' AS DateTime2), 1, NULL, NULL, NULL, NULL, 1, CAST(N'2025-10-24T17:22:22.6100000' AS DateTime2), 3, CAST(38.3 AS Decimal(4, 1)))
GO
INSERT [dbo].[Measurement] ([Id], [UserId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [LogDate], [BodyPartId], [Size]) VALUES (86, 1, 3, CAST(N'2025-11-21T17:22:22.6100000' AS DateTime2), 1, NULL, NULL, NULL, NULL, 1, CAST(N'2025-11-21T17:22:22.6100000' AS DateTime2), 4, CAST(125.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[Measurement] ([Id], [UserId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [LogDate], [BodyPartId], [Size]) VALUES (87, 1, 3, CAST(N'2025-11-21T17:22:22.6100000' AS DateTime2), 1, NULL, NULL, NULL, NULL, 1, CAST(N'2025-11-14T17:22:22.6100000' AS DateTime2), 4, CAST(122.2 AS Decimal(4, 1)))
GO
INSERT [dbo].[Measurement] ([Id], [UserId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [LogDate], [BodyPartId], [Size]) VALUES (88, 1, 3, CAST(N'2025-11-21T17:22:22.6100000' AS DateTime2), 1, NULL, NULL, NULL, NULL, 1, CAST(N'2025-11-07T17:22:22.6100000' AS DateTime2), 4, CAST(120.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[Measurement] ([Id], [UserId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [LogDate], [BodyPartId], [Size]) VALUES (89, 1, 3, CAST(N'2025-11-21T17:22:22.6100000' AS DateTime2), 1, NULL, NULL, NULL, NULL, 1, CAST(N'2025-10-31T17:22:22.6100000' AS DateTime2), 4, CAST(121.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[Measurement] ([Id], [UserId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [LogDate], [BodyPartId], [Size]) VALUES (90, 1, 3, CAST(N'2025-11-21T17:22:22.6100000' AS DateTime2), 1, NULL, NULL, NULL, NULL, 1, CAST(N'2025-10-24T17:22:22.6100000' AS DateTime2), 4, CAST(117.8 AS Decimal(4, 1)))
GO
INSERT [dbo].[Measurement] ([Id], [UserId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [LogDate], [BodyPartId], [Size]) VALUES (91, 1, 3, CAST(N'2025-11-21T17:22:22.6100000' AS DateTime2), 1, NULL, NULL, NULL, NULL, 1, CAST(N'2025-11-21T17:22:22.6100000' AS DateTime2), 5, CAST(130.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[Measurement] ([Id], [UserId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [LogDate], [BodyPartId], [Size]) VALUES (92, 1, 3, CAST(N'2025-11-21T17:22:22.6100000' AS DateTime2), 1, NULL, NULL, NULL, NULL, 1, CAST(N'2025-11-14T17:22:22.6100000' AS DateTime2), 5, CAST(128.8 AS Decimal(4, 1)))
GO
INSERT [dbo].[Measurement] ([Id], [UserId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [LogDate], [BodyPartId], [Size]) VALUES (93, 1, 3, CAST(N'2025-11-21T17:22:22.6100000' AS DateTime2), 1, NULL, NULL, NULL, NULL, 1, CAST(N'2025-11-07T17:22:22.6100000' AS DateTime2), 5, CAST(125.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[Measurement] ([Id], [UserId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [LogDate], [BodyPartId], [Size]) VALUES (94, 1, 3, CAST(N'2025-11-21T17:22:22.6100000' AS DateTime2), 1, NULL, NULL, NULL, NULL, 1, CAST(N'2025-10-31T17:22:22.6100000' AS DateTime2), 5, CAST(126.1 AS Decimal(4, 1)))
GO
INSERT [dbo].[Measurement] ([Id], [UserId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [LogDate], [BodyPartId], [Size]) VALUES (95, 1, 3, CAST(N'2025-11-21T17:22:22.6100000' AS DateTime2), 1, NULL, NULL, NULL, NULL, 1, CAST(N'2025-10-24T17:22:22.6100000' AS DateTime2), 5, CAST(122.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[Measurement] ([Id], [UserId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [LogDate], [BodyPartId], [Size]) VALUES (96, 1, 3, CAST(N'2025-11-21T17:22:22.6100000' AS DateTime2), 1, NULL, NULL, NULL, NULL, 1, CAST(N'2025-11-21T17:22:22.6100000' AS DateTime2), 6, CAST(39.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[Measurement] ([Id], [UserId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [LogDate], [BodyPartId], [Size]) VALUES (97, 1, 3, CAST(N'2025-11-21T17:22:22.6100000' AS DateTime2), 1, NULL, NULL, NULL, NULL, 1, CAST(N'2025-11-14T17:22:22.6100000' AS DateTime2), 6, CAST(38.7 AS Decimal(4, 1)))
GO
INSERT [dbo].[Measurement] ([Id], [UserId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [LogDate], [BodyPartId], [Size]) VALUES (98, 1, 3, CAST(N'2025-11-21T17:22:22.6100000' AS DateTime2), 1, NULL, NULL, NULL, NULL, 1, CAST(N'2025-11-07T17:22:22.6100000' AS DateTime2), 6, CAST(38.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[Measurement] ([Id], [UserId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [LogDate], [BodyPartId], [Size]) VALUES (99, 1, 3, CAST(N'2025-11-21T17:22:22.6100000' AS DateTime2), 1, NULL, NULL, NULL, NULL, 1, CAST(N'2025-10-31T17:22:22.6100000' AS DateTime2), 6, CAST(38.3 AS Decimal(4, 1)))
GO
INSERT [dbo].[Measurement] ([Id], [UserId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [LogDate], [BodyPartId], [Size]) VALUES (100, 1, 3, CAST(N'2025-11-21T17:22:22.6100000' AS DateTime2), 1, NULL, NULL, NULL, NULL, 1, CAST(N'2025-10-24T17:22:22.6100000' AS DateTime2), 6, CAST(37.5 AS Decimal(4, 1)))
GO
INSERT [dbo].[Measurement] ([Id], [UserId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [LogDate], [BodyPartId], [Size]) VALUES (101, 1, 3, CAST(N'2025-11-21T17:22:22.6100000' AS DateTime2), 1, NULL, NULL, NULL, NULL, 1, CAST(N'2025-11-21T17:22:22.6100000' AS DateTime2), 7, CAST(39.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[Measurement] ([Id], [UserId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [LogDate], [BodyPartId], [Size]) VALUES (102, 1, 3, CAST(N'2025-11-21T17:22:22.6100000' AS DateTime2), 1, NULL, NULL, NULL, NULL, 1, CAST(N'2025-11-14T17:22:22.6100000' AS DateTime2), 7, CAST(38.7 AS Decimal(4, 1)))
GO
INSERT [dbo].[Measurement] ([Id], [UserId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [LogDate], [BodyPartId], [Size]) VALUES (103, 1, 3, CAST(N'2025-11-21T17:22:22.6100000' AS DateTime2), 1, NULL, NULL, NULL, NULL, 1, CAST(N'2025-11-07T17:22:22.6100000' AS DateTime2), 7, CAST(38.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[Measurement] ([Id], [UserId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [LogDate], [BodyPartId], [Size]) VALUES (104, 1, 3, CAST(N'2025-11-21T17:22:22.6100000' AS DateTime2), 1, NULL, NULL, NULL, NULL, 1, CAST(N'2025-10-31T17:22:22.6100000' AS DateTime2), 7, CAST(38.3 AS Decimal(4, 1)))
GO
INSERT [dbo].[Measurement] ([Id], [UserId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [LogDate], [BodyPartId], [Size]) VALUES (105, 1, 3, CAST(N'2025-11-21T17:22:22.6100000' AS DateTime2), 1, NULL, NULL, NULL, NULL, 1, CAST(N'2025-10-24T17:22:22.6100000' AS DateTime2), 7, CAST(37.5 AS Decimal(4, 1)))
GO
INSERT [dbo].[Measurement] ([Id], [UserId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [LogDate], [BodyPartId], [Size]) VALUES (106, 1, 3, CAST(N'2025-11-21T17:22:22.6100000' AS DateTime2), 1, NULL, NULL, NULL, NULL, 1, CAST(N'2025-11-21T17:22:22.6100000' AS DateTime2), 8, CAST(33.6 AS Decimal(4, 1)))
GO
INSERT [dbo].[Measurement] ([Id], [UserId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [LogDate], [BodyPartId], [Size]) VALUES (107, 1, 3, CAST(N'2025-11-21T17:22:22.6100000' AS DateTime2), 1, NULL, NULL, NULL, NULL, 1, CAST(N'2025-11-14T17:22:22.6100000' AS DateTime2), 8, CAST(33.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[Measurement] ([Id], [UserId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [LogDate], [BodyPartId], [Size]) VALUES (108, 1, 3, CAST(N'2025-11-21T17:22:22.6100000' AS DateTime2), 1, NULL, NULL, NULL, NULL, 1, CAST(N'2025-11-07T17:22:22.6100000' AS DateTime2), 8, CAST(33.2 AS Decimal(4, 1)))
GO
INSERT [dbo].[Measurement] ([Id], [UserId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [LogDate], [BodyPartId], [Size]) VALUES (109, 1, 3, CAST(N'2025-11-21T17:22:22.6100000' AS DateTime2), 1, NULL, NULL, NULL, NULL, 1, CAST(N'2025-10-31T17:22:22.6100000' AS DateTime2), 8, CAST(32.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[Measurement] ([Id], [UserId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [LogDate], [BodyPartId], [Size]) VALUES (110, 1, 3, CAST(N'2025-11-21T17:22:22.6100000' AS DateTime2), 1, NULL, NULL, NULL, NULL, 1, CAST(N'2025-10-24T17:22:22.6100000' AS DateTime2), 8, CAST(31.8 AS Decimal(4, 1)))
GO
INSERT [dbo].[Measurement] ([Id], [UserId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [LogDate], [BodyPartId], [Size]) VALUES (111, 1, 3, CAST(N'2025-11-21T17:22:22.6100000' AS DateTime2), 1, NULL, NULL, NULL, NULL, 1, CAST(N'2025-11-21T17:22:22.6100000' AS DateTime2), 9, CAST(33.6 AS Decimal(4, 1)))
GO
INSERT [dbo].[Measurement] ([Id], [UserId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [LogDate], [BodyPartId], [Size]) VALUES (112, 1, 3, CAST(N'2025-11-21T17:22:22.6100000' AS DateTime2), 1, NULL, NULL, NULL, NULL, 1, CAST(N'2025-11-14T17:22:22.6100000' AS DateTime2), 9, CAST(33.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[Measurement] ([Id], [UserId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [LogDate], [BodyPartId], [Size]) VALUES (113, 1, 3, CAST(N'2025-11-21T17:22:22.6100000' AS DateTime2), 1, NULL, NULL, NULL, NULL, 1, CAST(N'2025-11-07T17:22:22.6100000' AS DateTime2), 9, CAST(33.2 AS Decimal(4, 1)))
GO
INSERT [dbo].[Measurement] ([Id], [UserId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [LogDate], [BodyPartId], [Size]) VALUES (114, 1, 3, CAST(N'2025-11-21T17:22:22.6100000' AS DateTime2), 1, NULL, NULL, NULL, NULL, 1, CAST(N'2025-10-31T17:22:22.6100000' AS DateTime2), 9, CAST(32.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[Measurement] ([Id], [UserId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [LogDate], [BodyPartId], [Size]) VALUES (115, 1, 3, CAST(N'2025-11-21T17:22:22.6100000' AS DateTime2), 1, NULL, NULL, NULL, NULL, 1, CAST(N'2025-10-24T17:22:22.6100000' AS DateTime2), 9, CAST(31.8 AS Decimal(4, 1)))
GO
INSERT [dbo].[Measurement] ([Id], [UserId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [LogDate], [BodyPartId], [Size]) VALUES (116, 1, 3, CAST(N'2025-11-21T17:22:22.6100000' AS DateTime2), 1, NULL, NULL, NULL, NULL, 1, CAST(N'2025-11-21T17:22:22.6100000' AS DateTime2), 10, CAST(59.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[Measurement] ([Id], [UserId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [LogDate], [BodyPartId], [Size]) VALUES (117, 1, 3, CAST(N'2025-11-21T17:22:22.6100000' AS DateTime2), 1, NULL, NULL, NULL, NULL, 1, CAST(N'2025-11-14T17:22:22.6100000' AS DateTime2), 10, CAST(58.6 AS Decimal(4, 1)))
GO
INSERT [dbo].[Measurement] ([Id], [UserId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [LogDate], [BodyPartId], [Size]) VALUES (118, 1, 3, CAST(N'2025-11-21T17:22:22.6100000' AS DateTime2), 1, NULL, NULL, NULL, NULL, 1, CAST(N'2025-11-07T17:22:22.6100000' AS DateTime2), 10, CAST(58.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[Measurement] ([Id], [UserId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [LogDate], [BodyPartId], [Size]) VALUES (119, 1, 3, CAST(N'2025-11-21T17:22:22.6100000' AS DateTime2), 1, NULL, NULL, NULL, NULL, 1, CAST(N'2025-10-31T17:22:22.6100000' AS DateTime2), 10, CAST(57.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[Measurement] ([Id], [UserId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [LogDate], [BodyPartId], [Size]) VALUES (120, 1, 3, CAST(N'2025-11-21T17:22:22.6100000' AS DateTime2), 1, NULL, NULL, NULL, NULL, 1, CAST(N'2025-10-24T17:22:22.6100000' AS DateTime2), 10, CAST(57.2 AS Decimal(4, 1)))
GO
INSERT [dbo].[Measurement] ([Id], [UserId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [LogDate], [BodyPartId], [Size]) VALUES (121, 1, 3, CAST(N'2025-11-21T17:22:22.6100000' AS DateTime2), 1, NULL, NULL, NULL, NULL, 1, CAST(N'2025-11-21T17:22:22.6100000' AS DateTime2), 11, CAST(59.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[Measurement] ([Id], [UserId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [LogDate], [BodyPartId], [Size]) VALUES (122, 1, 3, CAST(N'2025-11-21T17:22:22.6100000' AS DateTime2), 1, NULL, NULL, NULL, NULL, 1, CAST(N'2025-11-14T17:22:22.6100000' AS DateTime2), 11, CAST(58.6 AS Decimal(4, 1)))
GO
INSERT [dbo].[Measurement] ([Id], [UserId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [LogDate], [BodyPartId], [Size]) VALUES (123, 1, 3, CAST(N'2025-11-21T17:22:22.6100000' AS DateTime2), 1, NULL, NULL, NULL, NULL, 1, CAST(N'2025-11-07T17:22:22.6100000' AS DateTime2), 11, CAST(58.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[Measurement] ([Id], [UserId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [LogDate], [BodyPartId], [Size]) VALUES (124, 1, 3, CAST(N'2025-11-21T17:22:22.6100000' AS DateTime2), 1, NULL, NULL, NULL, NULL, 1, CAST(N'2025-10-31T17:22:22.6100000' AS DateTime2), 11, CAST(57.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[Measurement] ([Id], [UserId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [LogDate], [BodyPartId], [Size]) VALUES (125, 1, 3, CAST(N'2025-11-21T17:22:22.6100000' AS DateTime2), 1, NULL, NULL, NULL, NULL, 1, CAST(N'2025-10-24T17:22:22.6100000' AS DateTime2), 11, CAST(57.2 AS Decimal(4, 1)))
GO
INSERT [dbo].[Measurement] ([Id], [UserId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [LogDate], [BodyPartId], [Size]) VALUES (126, 1, 3, CAST(N'2025-11-21T17:22:22.6100000' AS DateTime2), 1, NULL, NULL, NULL, NULL, 1, CAST(N'2025-11-21T17:22:22.6100000' AS DateTime2), 12, CAST(40.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[Measurement] ([Id], [UserId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [LogDate], [BodyPartId], [Size]) VALUES (127, 1, 3, CAST(N'2025-11-21T17:22:22.6100000' AS DateTime2), 1, NULL, NULL, NULL, NULL, 1, CAST(N'2025-11-14T17:22:22.6100000' AS DateTime2), 12, CAST(39.3 AS Decimal(4, 1)))
GO
INSERT [dbo].[Measurement] ([Id], [UserId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [LogDate], [BodyPartId], [Size]) VALUES (128, 1, 3, CAST(N'2025-11-21T17:22:22.6100000' AS DateTime2), 1, NULL, NULL, NULL, NULL, 1, CAST(N'2025-11-07T17:22:22.6100000' AS DateTime2), 12, CAST(39.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[Measurement] ([Id], [UserId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [LogDate], [BodyPartId], [Size]) VALUES (129, 1, 3, CAST(N'2025-11-21T17:22:22.6100000' AS DateTime2), 1, NULL, NULL, NULL, NULL, 1, CAST(N'2025-10-31T17:22:22.6100000' AS DateTime2), 12, CAST(37.5 AS Decimal(4, 1)))
GO
INSERT [dbo].[Measurement] ([Id], [UserId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [LogDate], [BodyPartId], [Size]) VALUES (130, 1, 3, CAST(N'2025-11-21T17:22:22.6100000' AS DateTime2), 1, NULL, NULL, NULL, NULL, 1, CAST(N'2025-10-24T17:22:22.6100000' AS DateTime2), 12, CAST(38.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[Measurement] ([Id], [UserId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [LogDate], [BodyPartId], [Size]) VALUES (131, 1, 3, CAST(N'2025-11-21T17:22:22.6100000' AS DateTime2), 1, NULL, NULL, NULL, NULL, 1, CAST(N'2025-11-21T17:22:22.6100000' AS DateTime2), 13, CAST(40.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[Measurement] ([Id], [UserId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [LogDate], [BodyPartId], [Size]) VALUES (132, 1, 3, CAST(N'2025-11-21T17:22:22.6100000' AS DateTime2), 1, NULL, NULL, NULL, NULL, 1, CAST(N'2025-11-14T17:22:22.6100000' AS DateTime2), 13, CAST(39.3 AS Decimal(4, 1)))
GO
INSERT [dbo].[Measurement] ([Id], [UserId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [LogDate], [BodyPartId], [Size]) VALUES (133, 1, 3, CAST(N'2025-11-21T17:22:22.6100000' AS DateTime2), 1, NULL, NULL, NULL, NULL, 1, CAST(N'2025-11-07T17:22:22.6100000' AS DateTime2), 13, CAST(39.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[Measurement] ([Id], [UserId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [LogDate], [BodyPartId], [Size]) VALUES (134, 1, 3, CAST(N'2025-11-21T17:22:22.6100000' AS DateTime2), 1, NULL, NULL, NULL, NULL, 1, CAST(N'2025-10-31T17:22:22.6100000' AS DateTime2), 13, CAST(37.5 AS Decimal(4, 1)))
GO
INSERT [dbo].[Measurement] ([Id], [UserId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [LogDate], [BodyPartId], [Size]) VALUES (135, 1, 3, CAST(N'2025-11-21T17:22:22.6100000' AS DateTime2), 1, NULL, NULL, NULL, NULL, 1, CAST(N'2025-10-24T17:22:22.6100000' AS DateTime2), 13, CAST(38.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[Measurement] ([Id], [UserId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [LogDate], [BodyPartId], [Size]) VALUES (136, 13, 3, CAST(N'2026-02-17T17:41:06.8093137' AS DateTime2), 13, CAST(N'2026-02-17T17:41:06.8093137' AS DateTime2), 13, NULL, NULL, 1, CAST(N'2026-01-22T00:00:00.0000000' AS DateTime2), 1, CAST(90.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[Measurement] ([Id], [UserId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [LogDate], [BodyPartId], [Size]) VALUES (137, 13, 3, CAST(N'2026-02-17T17:41:06.8093137' AS DateTime2), 13, CAST(N'2026-02-17T17:41:06.8093137' AS DateTime2), 13, NULL, NULL, 1, CAST(N'2026-01-22T00:00:00.0000000' AS DateTime2), 3, CAST(39.5 AS Decimal(4, 1)))
GO
INSERT [dbo].[Measurement] ([Id], [UserId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [LogDate], [BodyPartId], [Size]) VALUES (138, 13, 3, CAST(N'2026-02-17T17:41:06.8093137' AS DateTime2), 13, CAST(N'2026-02-17T17:41:06.8093137' AS DateTime2), 13, NULL, NULL, 1, CAST(N'2026-01-22T00:00:00.0000000' AS DateTime2), 4, CAST(116.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[Measurement] ([Id], [UserId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [LogDate], [BodyPartId], [Size]) VALUES (139, 13, 3, CAST(N'2026-02-17T17:41:06.8093137' AS DateTime2), 13, CAST(N'2026-02-17T17:41:06.8093137' AS DateTime2), 13, NULL, NULL, 1, CAST(N'2026-01-22T00:00:00.0000000' AS DateTime2), 5, CAST(126.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[Measurement] ([Id], [UserId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [LogDate], [BodyPartId], [Size]) VALUES (140, 13, 3, CAST(N'2026-02-17T17:41:06.8093137' AS DateTime2), 13, CAST(N'2026-02-17T17:41:06.8093137' AS DateTime2), 13, NULL, NULL, 1, CAST(N'2026-01-22T00:00:00.0000000' AS DateTime2), 6, CAST(37.5 AS Decimal(4, 1)))
GO
INSERT [dbo].[Measurement] ([Id], [UserId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [LogDate], [BodyPartId], [Size]) VALUES (141, 13, 3, CAST(N'2026-02-17T17:41:06.8093137' AS DateTime2), 13, CAST(N'2026-02-17T17:41:06.8093137' AS DateTime2), 13, NULL, NULL, 1, CAST(N'2026-01-22T00:00:00.0000000' AS DateTime2), 7, CAST(37.6 AS Decimal(4, 1)))
GO
INSERT [dbo].[Measurement] ([Id], [UserId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [LogDate], [BodyPartId], [Size]) VALUES (142, 13, 3, CAST(N'2026-02-17T17:41:06.8093137' AS DateTime2), 13, CAST(N'2026-02-17T17:41:06.8093137' AS DateTime2), 13, NULL, NULL, 1, CAST(N'2026-01-22T00:00:00.0000000' AS DateTime2), 8, CAST(32.2 AS Decimal(4, 1)))
GO
INSERT [dbo].[Measurement] ([Id], [UserId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [LogDate], [BodyPartId], [Size]) VALUES (143, 13, 3, CAST(N'2026-02-17T17:41:06.8093137' AS DateTime2), 13, CAST(N'2026-02-17T17:41:06.8093137' AS DateTime2), 13, NULL, NULL, 1, CAST(N'2026-01-22T00:00:00.0000000' AS DateTime2), 9, CAST(32.2 AS Decimal(4, 1)))
GO
INSERT [dbo].[Measurement] ([Id], [UserId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [LogDate], [BodyPartId], [Size]) VALUES (144, 13, 3, CAST(N'2026-02-17T17:41:06.8093137' AS DateTime2), 13, CAST(N'2026-02-17T17:41:06.8093137' AS DateTime2), 13, NULL, NULL, 1, CAST(N'2026-01-22T00:00:00.0000000' AS DateTime2), 10, CAST(54.3 AS Decimal(4, 1)))
GO
INSERT [dbo].[Measurement] ([Id], [UserId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [LogDate], [BodyPartId], [Size]) VALUES (145, 13, 3, CAST(N'2026-02-17T17:41:06.8093137' AS DateTime2), 13, CAST(N'2026-02-17T17:41:06.8093137' AS DateTime2), 13, NULL, NULL, 1, CAST(N'2026-01-22T00:00:00.0000000' AS DateTime2), 11, CAST(54.3 AS Decimal(4, 1)))
GO
INSERT [dbo].[Measurement] ([Id], [UserId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [LogDate], [BodyPartId], [Size]) VALUES (146, 13, 3, CAST(N'2026-02-17T17:41:06.8093137' AS DateTime2), 13, CAST(N'2026-02-17T17:41:06.8093137' AS DateTime2), 13, NULL, NULL, 1, CAST(N'2026-01-22T00:00:00.0000000' AS DateTime2), 12, CAST(37.5 AS Decimal(4, 1)))
GO
INSERT [dbo].[Measurement] ([Id], [UserId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [LogDate], [BodyPartId], [Size]) VALUES (147, 13, 3, CAST(N'2026-02-17T17:41:06.8093137' AS DateTime2), 13, CAST(N'2026-02-17T17:41:06.8093137' AS DateTime2), 13, NULL, NULL, 1, CAST(N'2026-01-22T00:00:00.0000000' AS DateTime2), 13, CAST(37.5 AS Decimal(4, 1)))
GO
INSERT [dbo].[Measurement] ([Id], [UserId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [LogDate], [BodyPartId], [Size]) VALUES (148, 13, 3, CAST(N'2026-02-17T17:42:00.8797907' AS DateTime2), 13, CAST(N'2026-02-17T17:42:00.8797907' AS DateTime2), 13, NULL, NULL, 1, CAST(N'2026-02-01T00:00:00.0000000' AS DateTime2), 1, CAST(89.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[Measurement] ([Id], [UserId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [LogDate], [BodyPartId], [Size]) VALUES (149, 13, 3, CAST(N'2026-02-17T17:42:00.8797907' AS DateTime2), 13, CAST(N'2026-02-17T17:42:00.8797907' AS DateTime2), 13, NULL, NULL, 1, CAST(N'2026-02-01T00:00:00.0000000' AS DateTime2), 3, CAST(39.3 AS Decimal(4, 1)))
GO
INSERT [dbo].[Measurement] ([Id], [UserId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [LogDate], [BodyPartId], [Size]) VALUES (150, 13, 3, CAST(N'2026-02-17T17:42:00.8797907' AS DateTime2), 13, CAST(N'2026-02-17T17:42:00.8797907' AS DateTime2), 13, NULL, NULL, 1, CAST(N'2026-02-01T00:00:00.0000000' AS DateTime2), 4, CAST(117.3 AS Decimal(4, 1)))
GO
INSERT [dbo].[Measurement] ([Id], [UserId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [LogDate], [BodyPartId], [Size]) VALUES (151, 13, 3, CAST(N'2026-02-17T17:42:00.8797907' AS DateTime2), 13, CAST(N'2026-02-17T17:42:00.8797907' AS DateTime2), 13, NULL, NULL, 1, CAST(N'2026-02-01T00:00:00.0000000' AS DateTime2), 5, CAST(127.2 AS Decimal(4, 1)))
GO
INSERT [dbo].[Measurement] ([Id], [UserId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [LogDate], [BodyPartId], [Size]) VALUES (152, 13, 3, CAST(N'2026-02-17T17:42:00.8797907' AS DateTime2), 13, CAST(N'2026-02-17T17:42:00.8797907' AS DateTime2), 13, NULL, NULL, 1, CAST(N'2026-02-01T00:00:00.0000000' AS DateTime2), 6, CAST(37.8 AS Decimal(4, 1)))
GO
INSERT [dbo].[Measurement] ([Id], [UserId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [LogDate], [BodyPartId], [Size]) VALUES (153, 13, 3, CAST(N'2026-02-17T17:42:00.8797907' AS DateTime2), 13, CAST(N'2026-02-17T17:42:00.8797907' AS DateTime2), 13, NULL, NULL, 1, CAST(N'2026-02-01T00:00:00.0000000' AS DateTime2), 7, CAST(37.8 AS Decimal(4, 1)))
GO
INSERT [dbo].[Measurement] ([Id], [UserId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [LogDate], [BodyPartId], [Size]) VALUES (154, 13, 3, CAST(N'2026-02-17T17:42:00.8797907' AS DateTime2), 13, CAST(N'2026-02-17T17:42:00.8797907' AS DateTime2), 13, NULL, NULL, 1, CAST(N'2026-02-01T00:00:00.0000000' AS DateTime2), 8, CAST(32.7 AS Decimal(4, 1)))
GO
INSERT [dbo].[Measurement] ([Id], [UserId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [LogDate], [BodyPartId], [Size]) VALUES (155, 13, 3, CAST(N'2026-02-17T17:42:00.8797907' AS DateTime2), 13, CAST(N'2026-02-17T17:42:00.8797907' AS DateTime2), 13, NULL, NULL, 1, CAST(N'2026-02-01T00:00:00.0000000' AS DateTime2), 9, CAST(32.7 AS Decimal(4, 1)))
GO
INSERT [dbo].[Measurement] ([Id], [UserId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [LogDate], [BodyPartId], [Size]) VALUES (156, 13, 3, CAST(N'2026-02-17T17:42:00.8797907' AS DateTime2), 13, CAST(N'2026-02-17T17:42:00.8797907' AS DateTime2), 13, NULL, NULL, 1, CAST(N'2026-02-01T00:00:00.0000000' AS DateTime2), 10, CAST(55.2 AS Decimal(4, 1)))
GO
INSERT [dbo].[Measurement] ([Id], [UserId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [LogDate], [BodyPartId], [Size]) VALUES (157, 13, 3, CAST(N'2026-02-17T17:42:00.8797907' AS DateTime2), 13, CAST(N'2026-02-17T17:42:00.8797907' AS DateTime2), 13, NULL, NULL, 1, CAST(N'2026-02-01T00:00:00.0000000' AS DateTime2), 11, CAST(55.3 AS Decimal(4, 1)))
GO
INSERT [dbo].[Measurement] ([Id], [UserId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [LogDate], [BodyPartId], [Size]) VALUES (158, 13, 3, CAST(N'2026-02-17T17:42:00.8797907' AS DateTime2), 13, CAST(N'2026-02-17T17:42:00.8797907' AS DateTime2), 13, NULL, NULL, 1, CAST(N'2026-02-01T00:00:00.0000000' AS DateTime2), 12, CAST(37.6 AS Decimal(4, 1)))
GO
INSERT [dbo].[Measurement] ([Id], [UserId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [LogDate], [BodyPartId], [Size]) VALUES (159, 13, 3, CAST(N'2026-02-17T17:42:00.8797907' AS DateTime2), 13, CAST(N'2026-02-17T17:42:00.8797907' AS DateTime2), 13, NULL, NULL, 1, CAST(N'2026-02-01T00:00:00.0000000' AS DateTime2), 13, CAST(37.6 AS Decimal(4, 1)))
GO
INSERT [dbo].[Measurement] ([Id], [UserId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [LogDate], [BodyPartId], [Size]) VALUES (160, 13, 3, CAST(N'2026-02-17T17:42:59.1154146' AS DateTime2), 13, CAST(N'2026-02-17T17:42:59.1154146' AS DateTime2), 13, NULL, NULL, 1, CAST(N'2026-02-11T00:00:00.0000000' AS DateTime2), 1, CAST(88.6 AS Decimal(4, 1)))
GO
INSERT [dbo].[Measurement] ([Id], [UserId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [LogDate], [BodyPartId], [Size]) VALUES (161, 13, 3, CAST(N'2026-02-17T17:42:59.1154146' AS DateTime2), 13, CAST(N'2026-02-17T17:42:59.1154146' AS DateTime2), 13, NULL, NULL, 1, CAST(N'2026-02-11T00:00:00.0000000' AS DateTime2), 3, CAST(39.4 AS Decimal(4, 1)))
GO
INSERT [dbo].[Measurement] ([Id], [UserId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [LogDate], [BodyPartId], [Size]) VALUES (162, 13, 3, CAST(N'2026-02-17T17:42:59.1154146' AS DateTime2), 13, CAST(N'2026-02-17T17:42:59.1154146' AS DateTime2), 13, NULL, NULL, 1, CAST(N'2026-02-11T00:00:00.0000000' AS DateTime2), 4, CAST(115.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[Measurement] ([Id], [UserId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [LogDate], [BodyPartId], [Size]) VALUES (163, 13, 3, CAST(N'2026-02-17T17:42:59.1154146' AS DateTime2), 13, CAST(N'2026-02-17T17:42:59.1154146' AS DateTime2), 13, NULL, NULL, 1, CAST(N'2026-02-11T00:00:00.0000000' AS DateTime2), 5, CAST(127.1 AS Decimal(4, 1)))
GO
INSERT [dbo].[Measurement] ([Id], [UserId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [LogDate], [BodyPartId], [Size]) VALUES (164, 13, 3, CAST(N'2026-02-17T17:42:59.1154146' AS DateTime2), 13, CAST(N'2026-02-17T17:42:59.1154146' AS DateTime2), 13, NULL, NULL, 1, CAST(N'2026-02-11T00:00:00.0000000' AS DateTime2), 6, CAST(37.2 AS Decimal(4, 1)))
GO
INSERT [dbo].[Measurement] ([Id], [UserId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [LogDate], [BodyPartId], [Size]) VALUES (165, 13, 3, CAST(N'2026-02-17T17:42:59.1154146' AS DateTime2), 13, CAST(N'2026-02-17T17:42:59.1154146' AS DateTime2), 13, NULL, NULL, 1, CAST(N'2026-02-11T00:00:00.0000000' AS DateTime2), 7, CAST(37.2 AS Decimal(4, 1)))
GO
INSERT [dbo].[Measurement] ([Id], [UserId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [LogDate], [BodyPartId], [Size]) VALUES (166, 13, 3, CAST(N'2026-02-17T17:42:59.1154146' AS DateTime2), 13, CAST(N'2026-02-17T17:42:59.1154146' AS DateTime2), 13, NULL, NULL, 1, CAST(N'2026-02-11T00:00:00.0000000' AS DateTime2), 8, CAST(33.1 AS Decimal(4, 1)))
GO
INSERT [dbo].[Measurement] ([Id], [UserId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [LogDate], [BodyPartId], [Size]) VALUES (167, 13, 3, CAST(N'2026-02-17T17:42:59.1154146' AS DateTime2), 13, CAST(N'2026-02-17T17:42:59.1154146' AS DateTime2), 13, NULL, NULL, 1, CAST(N'2026-02-11T00:00:00.0000000' AS DateTime2), 9, CAST(33.1 AS Decimal(4, 1)))
GO
INSERT [dbo].[Measurement] ([Id], [UserId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [LogDate], [BodyPartId], [Size]) VALUES (168, 13, 3, CAST(N'2026-02-17T17:42:59.1154146' AS DateTime2), 13, CAST(N'2026-02-17T17:42:59.1154146' AS DateTime2), 13, NULL, NULL, 1, CAST(N'2026-02-11T00:00:00.0000000' AS DateTime2), 10, CAST(56.5 AS Decimal(4, 1)))
GO
INSERT [dbo].[Measurement] ([Id], [UserId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [LogDate], [BodyPartId], [Size]) VALUES (169, 13, 3, CAST(N'2026-02-17T17:42:59.1154146' AS DateTime2), 13, CAST(N'2026-02-17T17:42:59.1154146' AS DateTime2), 13, NULL, NULL, 1, CAST(N'2026-02-11T00:00:00.0000000' AS DateTime2), 11, CAST(56.5 AS Decimal(4, 1)))
GO
INSERT [dbo].[Measurement] ([Id], [UserId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [LogDate], [BodyPartId], [Size]) VALUES (170, 13, 3, CAST(N'2026-02-17T17:42:59.1154146' AS DateTime2), 13, CAST(N'2026-02-17T17:42:59.1154146' AS DateTime2), 13, NULL, NULL, 1, CAST(N'2026-02-11T00:00:00.0000000' AS DateTime2), 12, CAST(37.3 AS Decimal(4, 1)))
GO
INSERT [dbo].[Measurement] ([Id], [UserId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [LogDate], [BodyPartId], [Size]) VALUES (171, 13, 3, CAST(N'2026-02-17T17:42:59.1154146' AS DateTime2), 13, CAST(N'2026-02-17T17:42:59.1154146' AS DateTime2), 13, NULL, NULL, 1, CAST(N'2026-02-11T00:00:00.0000000' AS DateTime2), 13, CAST(37.3 AS Decimal(4, 1)))
GO
SET IDENTITY_INSERT [dbo].[Measurement] OFF
GO
SET IDENTITY_INSERT [dbo].[MeasurementGoal] ON 
GO
INSERT [dbo].[MeasurementGoal] ([Id], [UserId], [MeasurementUnitId], [StartDate], [EndDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [BodyPartId], [Size]) VALUES (1, 1, 3, CAST(N'2025-11-14' AS Date), CAST(N'2026-07-03' AS Date), CAST(N'2025-11-14T19:25:47.0459957' AS DateTime2), 1, CAST(N'2025-11-14T19:26:34.6166671' AS DateTime2), 1, CAST(N'2025-11-14T19:26:38.0777149' AS DateTime2), 1, 0, 1, CAST(80.2 AS Decimal(4, 1)))
GO
INSERT [dbo].[MeasurementGoal] ([Id], [UserId], [MeasurementUnitId], [StartDate], [EndDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [BodyPartId], [Size]) VALUES (2, 1, 3, CAST(N'2025-11-14' AS Date), CAST(N'2026-06-25' AS Date), CAST(N'2025-11-14T19:27:15.4615510' AS DateTime2), 1, CAST(N'2025-11-14T19:27:15.4615510' AS DateTime2), 1, CAST(N'2025-11-16T16:58:19.1393368' AS DateTime2), 1, 0, 1, CAST(80.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[MeasurementGoal] ([Id], [UserId], [MeasurementUnitId], [StartDate], [EndDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [BodyPartId], [Size]) VALUES (3, 1, 3, CAST(N'2025-11-14' AS Date), CAST(N'2026-06-25' AS Date), CAST(N'2025-11-14T19:27:15.4615510' AS DateTime2), 1, CAST(N'2025-11-14T19:27:15.4615510' AS DateTime2), 1, CAST(N'2025-11-16T16:58:21.8669295' AS DateTime2), 1, 0, 3, CAST(40.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[MeasurementGoal] ([Id], [UserId], [MeasurementUnitId], [StartDate], [EndDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [BodyPartId], [Size]) VALUES (4, 1, 3, CAST(N'2025-11-14' AS Date), CAST(N'2026-06-25' AS Date), CAST(N'2025-11-14T19:27:15.4615510' AS DateTime2), 1, CAST(N'2025-11-14T19:27:15.4615510' AS DateTime2), 1, CAST(N'2025-11-16T16:58:23.3797161' AS DateTime2), 1, 0, 4, CAST(120.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[MeasurementGoal] ([Id], [UserId], [MeasurementUnitId], [StartDate], [EndDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [BodyPartId], [Size]) VALUES (5, 1, 3, CAST(N'2025-11-14' AS Date), CAST(N'2026-06-25' AS Date), CAST(N'2025-11-14T19:27:15.4615510' AS DateTime2), 1, CAST(N'2025-11-14T19:27:15.4615510' AS DateTime2), 1, CAST(N'2025-11-16T16:58:24.8821777' AS DateTime2), 1, 0, 5, CAST(130.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[MeasurementGoal] ([Id], [UserId], [MeasurementUnitId], [StartDate], [EndDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [BodyPartId], [Size]) VALUES (6, 1, 3, CAST(N'2025-11-14' AS Date), CAST(N'2026-06-25' AS Date), CAST(N'2025-11-14T19:27:15.4615510' AS DateTime2), 1, CAST(N'2025-11-14T19:27:15.4615510' AS DateTime2), 1, CAST(N'2025-11-16T16:58:26.6267954' AS DateTime2), 1, 0, 6, CAST(40.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[MeasurementGoal] ([Id], [UserId], [MeasurementUnitId], [StartDate], [EndDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [BodyPartId], [Size]) VALUES (7, 1, 3, CAST(N'2025-11-14' AS Date), CAST(N'2026-06-25' AS Date), CAST(N'2025-11-14T19:27:15.4615510' AS DateTime2), 1, CAST(N'2025-11-14T19:27:15.4615510' AS DateTime2), 1, CAST(N'2025-11-16T16:58:28.8907105' AS DateTime2), 1, 0, 7, CAST(40.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[MeasurementGoal] ([Id], [UserId], [MeasurementUnitId], [StartDate], [EndDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [BodyPartId], [Size]) VALUES (8, 1, 3, CAST(N'2025-11-14' AS Date), CAST(N'2026-06-25' AS Date), CAST(N'2025-11-14T19:27:15.4615510' AS DateTime2), 1, CAST(N'2025-11-14T19:27:15.4615510' AS DateTime2), 1, CAST(N'2025-11-16T16:58:30.4342737' AS DateTime2), 1, 0, 8, CAST(35.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[MeasurementGoal] ([Id], [UserId], [MeasurementUnitId], [StartDate], [EndDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [BodyPartId], [Size]) VALUES (9, 1, 3, CAST(N'2025-11-14' AS Date), CAST(N'2026-06-25' AS Date), CAST(N'2025-11-14T19:27:15.4615510' AS DateTime2), 1, CAST(N'2025-11-14T19:27:15.4615510' AS DateTime2), 1, CAST(N'2025-11-16T16:58:31.9620320' AS DateTime2), 1, 0, 9, CAST(35.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[MeasurementGoal] ([Id], [UserId], [MeasurementUnitId], [StartDate], [EndDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [BodyPartId], [Size]) VALUES (10, 1, 3, CAST(N'2025-11-14' AS Date), CAST(N'2026-06-25' AS Date), CAST(N'2025-11-14T19:27:15.4615510' AS DateTime2), 1, CAST(N'2025-11-14T19:27:15.4615510' AS DateTime2), 1, CAST(N'2025-11-16T16:58:33.4023073' AS DateTime2), 1, 0, 10, CAST(60.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[MeasurementGoal] ([Id], [UserId], [MeasurementUnitId], [StartDate], [EndDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [BodyPartId], [Size]) VALUES (11, 1, 3, CAST(N'2025-11-14' AS Date), CAST(N'2026-06-25' AS Date), CAST(N'2025-11-14T19:27:15.4615510' AS DateTime2), 1, CAST(N'2025-11-14T19:27:15.4615510' AS DateTime2), 1, CAST(N'2025-11-16T16:58:34.7947979' AS DateTime2), 1, 0, 11, CAST(60.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[MeasurementGoal] ([Id], [UserId], [MeasurementUnitId], [StartDate], [EndDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [BodyPartId], [Size]) VALUES (12, 1, 3, CAST(N'2025-11-14' AS Date), CAST(N'2026-06-25' AS Date), CAST(N'2025-11-14T19:27:15.4615510' AS DateTime2), 1, CAST(N'2025-11-14T19:27:15.4615510' AS DateTime2), 1, CAST(N'2025-11-16T16:58:36.2905529' AS DateTime2), 1, 0, 12, CAST(40.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[MeasurementGoal] ([Id], [UserId], [MeasurementUnitId], [StartDate], [EndDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [BodyPartId], [Size]) VALUES (13, 1, 3, CAST(N'2025-11-14' AS Date), CAST(N'2026-06-25' AS Date), CAST(N'2025-11-14T19:27:15.4615510' AS DateTime2), 1, CAST(N'2025-11-14T19:27:15.4615510' AS DateTime2), 1, CAST(N'2025-11-16T16:58:38.9391171' AS DateTime2), 1, 0, 13, CAST(40.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[MeasurementGoal] ([Id], [UserId], [MeasurementUnitId], [StartDate], [EndDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [BodyPartId], [Size]) VALUES (14, 1, 3, CAST(N'2025-08-22' AS Date), CAST(N'2025-10-03' AS Date), CAST(N'2025-11-16T16:56:33.3668189' AS DateTime2), 1, CAST(N'2025-11-16T16:56:33.3668189' AS DateTime2), 1, CAST(N'2025-11-16T17:27:11.7472259' AS DateTime2), 1, 0, 5, CAST(120.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[MeasurementGoal] ([Id], [UserId], [MeasurementUnitId], [StartDate], [EndDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [BodyPartId], [Size]) VALUES (15, 1, 3, CAST(N'2025-11-21' AS Date), CAST(N'2026-01-16' AS Date), CAST(N'2025-11-21T17:34:01.0033333' AS DateTime2), 1, NULL, NULL, NULL, NULL, 1, 1, CAST(86.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[MeasurementGoal] ([Id], [UserId], [MeasurementUnitId], [StartDate], [EndDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [BodyPartId], [Size]) VALUES (16, 1, 3, CAST(N'2025-10-03' AS Date), CAST(N'2025-11-14' AS Date), CAST(N'2025-11-21T17:34:01.0033333' AS DateTime2), 1, NULL, NULL, NULL, NULL, 1, 1, CAST(88.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[MeasurementGoal] ([Id], [UserId], [MeasurementUnitId], [StartDate], [EndDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [BodyPartId], [Size]) VALUES (17, 1, 3, CAST(N'2025-11-21' AS Date), CAST(N'2026-01-16' AS Date), CAST(N'2025-11-21T17:34:01.0033333' AS DateTime2), 1, NULL, NULL, NULL, NULL, 1, 2, CAST(95.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[MeasurementGoal] ([Id], [UserId], [MeasurementUnitId], [StartDate], [EndDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [BodyPartId], [Size]) VALUES (18, 1, 3, CAST(N'2025-10-03' AS Date), CAST(N'2025-11-14' AS Date), CAST(N'2025-11-21T17:34:01.0033333' AS DateTime2), 1, NULL, NULL, NULL, NULL, 1, 2, CAST(90.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[MeasurementGoal] ([Id], [UserId], [MeasurementUnitId], [StartDate], [EndDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [BodyPartId], [Size]) VALUES (19, 1, 3, CAST(N'2025-11-21' AS Date), CAST(N'2026-01-16' AS Date), CAST(N'2025-11-21T17:34:01.0033333' AS DateTime2), 1, NULL, NULL, NULL, NULL, 1, 3, CAST(39.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[MeasurementGoal] ([Id], [UserId], [MeasurementUnitId], [StartDate], [EndDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [BodyPartId], [Size]) VALUES (20, 1, 3, CAST(N'2025-10-03' AS Date), CAST(N'2025-11-14' AS Date), CAST(N'2025-11-21T17:34:01.0033333' AS DateTime2), 1, NULL, NULL, NULL, NULL, 1, 3, CAST(41.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[MeasurementGoal] ([Id], [UserId], [MeasurementUnitId], [StartDate], [EndDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [BodyPartId], [Size]) VALUES (21, 1, 3, CAST(N'2025-11-21' AS Date), CAST(N'2026-01-16' AS Date), CAST(N'2025-11-21T17:34:01.0033333' AS DateTime2), 1, NULL, NULL, NULL, NULL, 1, 4, CAST(130.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[MeasurementGoal] ([Id], [UserId], [MeasurementUnitId], [StartDate], [EndDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [BodyPartId], [Size]) VALUES (22, 1, 3, CAST(N'2025-10-03' AS Date), CAST(N'2025-11-14' AS Date), CAST(N'2025-11-21T17:34:01.0033333' AS DateTime2), 1, NULL, NULL, NULL, NULL, 1, 4, CAST(132.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[MeasurementGoal] ([Id], [UserId], [MeasurementUnitId], [StartDate], [EndDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [BodyPartId], [Size]) VALUES (23, 1, 3, CAST(N'2025-11-21' AS Date), CAST(N'2026-01-16' AS Date), CAST(N'2025-11-21T17:34:01.0033333' AS DateTime2), 1, NULL, NULL, NULL, NULL, 1, 5, CAST(135.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[MeasurementGoal] ([Id], [UserId], [MeasurementUnitId], [StartDate], [EndDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [BodyPartId], [Size]) VALUES (24, 1, 3, CAST(N'2025-10-03' AS Date), CAST(N'2025-11-14' AS Date), CAST(N'2025-11-21T17:34:01.0033333' AS DateTime2), 1, NULL, NULL, NULL, NULL, 1, 5, CAST(136.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[MeasurementGoal] ([Id], [UserId], [MeasurementUnitId], [StartDate], [EndDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [BodyPartId], [Size]) VALUES (25, 1, 3, CAST(N'2025-11-21' AS Date), CAST(N'2026-01-16' AS Date), CAST(N'2025-11-21T17:34:01.0033333' AS DateTime2), 1, NULL, NULL, NULL, NULL, 1, 6, CAST(39.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[MeasurementGoal] ([Id], [UserId], [MeasurementUnitId], [StartDate], [EndDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [BodyPartId], [Size]) VALUES (26, 1, 3, CAST(N'2025-10-03' AS Date), CAST(N'2025-11-14' AS Date), CAST(N'2025-11-21T17:34:01.0033333' AS DateTime2), 1, NULL, NULL, NULL, NULL, 1, 6, CAST(42.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[MeasurementGoal] ([Id], [UserId], [MeasurementUnitId], [StartDate], [EndDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [BodyPartId], [Size]) VALUES (27, 1, 3, CAST(N'2025-11-21' AS Date), CAST(N'2026-01-16' AS Date), CAST(N'2025-11-21T17:34:01.0033333' AS DateTime2), 1, NULL, NULL, NULL, NULL, 1, 7, CAST(39.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[MeasurementGoal] ([Id], [UserId], [MeasurementUnitId], [StartDate], [EndDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [BodyPartId], [Size]) VALUES (28, 1, 3, CAST(N'2025-10-03' AS Date), CAST(N'2025-11-14' AS Date), CAST(N'2025-11-21T17:34:01.0033333' AS DateTime2), 1, NULL, NULL, NULL, NULL, 1, 7, CAST(42.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[MeasurementGoal] ([Id], [UserId], [MeasurementUnitId], [StartDate], [EndDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [BodyPartId], [Size]) VALUES (29, 1, 3, CAST(N'2025-11-21' AS Date), CAST(N'2026-01-16' AS Date), CAST(N'2025-11-21T17:34:01.0033333' AS DateTime2), 1, NULL, NULL, NULL, NULL, 1, 8, CAST(34.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[MeasurementGoal] ([Id], [UserId], [MeasurementUnitId], [StartDate], [EndDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [BodyPartId], [Size]) VALUES (30, 1, 3, CAST(N'2025-10-03' AS Date), CAST(N'2025-11-14' AS Date), CAST(N'2025-11-21T17:34:01.0033333' AS DateTime2), 1, NULL, NULL, NULL, NULL, 1, 8, CAST(35.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[MeasurementGoal] ([Id], [UserId], [MeasurementUnitId], [StartDate], [EndDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [BodyPartId], [Size]) VALUES (31, 1, 3, CAST(N'2025-11-21' AS Date), CAST(N'2026-01-16' AS Date), CAST(N'2025-11-21T17:34:01.0033333' AS DateTime2), 1, NULL, NULL, NULL, NULL, 1, 9, CAST(34.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[MeasurementGoal] ([Id], [UserId], [MeasurementUnitId], [StartDate], [EndDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [BodyPartId], [Size]) VALUES (32, 1, 3, CAST(N'2025-10-03' AS Date), CAST(N'2025-11-14' AS Date), CAST(N'2025-11-21T17:34:01.0033333' AS DateTime2), 1, NULL, NULL, NULL, NULL, 1, 9, CAST(35.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[MeasurementGoal] ([Id], [UserId], [MeasurementUnitId], [StartDate], [EndDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [BodyPartId], [Size]) VALUES (33, 1, 3, CAST(N'2025-11-21' AS Date), CAST(N'2026-01-16' AS Date), CAST(N'2025-11-21T17:34:01.0033333' AS DateTime2), 1, NULL, NULL, NULL, NULL, 1, 10, CAST(60.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[MeasurementGoal] ([Id], [UserId], [MeasurementUnitId], [StartDate], [EndDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [BodyPartId], [Size]) VALUES (34, 1, 3, CAST(N'2025-10-03' AS Date), CAST(N'2025-11-14' AS Date), CAST(N'2025-11-21T17:34:01.0033333' AS DateTime2), 1, NULL, NULL, NULL, NULL, 1, 10, CAST(65.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[MeasurementGoal] ([Id], [UserId], [MeasurementUnitId], [StartDate], [EndDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [BodyPartId], [Size]) VALUES (35, 1, 3, CAST(N'2025-11-21' AS Date), CAST(N'2026-01-16' AS Date), CAST(N'2025-11-21T17:34:01.0033333' AS DateTime2), 1, NULL, NULL, NULL, NULL, 1, 11, CAST(60.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[MeasurementGoal] ([Id], [UserId], [MeasurementUnitId], [StartDate], [EndDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [BodyPartId], [Size]) VALUES (36, 1, 3, CAST(N'2025-10-03' AS Date), CAST(N'2025-11-14' AS Date), CAST(N'2025-11-21T17:34:01.0033333' AS DateTime2), 1, NULL, NULL, NULL, NULL, 1, 11, CAST(65.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[MeasurementGoal] ([Id], [UserId], [MeasurementUnitId], [StartDate], [EndDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [BodyPartId], [Size]) VALUES (37, 1, 3, CAST(N'2025-11-21' AS Date), CAST(N'2026-01-16' AS Date), CAST(N'2025-11-21T17:34:01.0033333' AS DateTime2), 1, NULL, NULL, NULL, NULL, 1, 12, CAST(39.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[MeasurementGoal] ([Id], [UserId], [MeasurementUnitId], [StartDate], [EndDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [BodyPartId], [Size]) VALUES (38, 1, 3, CAST(N'2025-10-03' AS Date), CAST(N'2025-11-14' AS Date), CAST(N'2025-11-21T17:34:01.0033333' AS DateTime2), 1, NULL, NULL, NULL, NULL, 1, 12, CAST(42.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[MeasurementGoal] ([Id], [UserId], [MeasurementUnitId], [StartDate], [EndDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [BodyPartId], [Size]) VALUES (39, 1, 3, CAST(N'2025-11-21' AS Date), CAST(N'2026-01-16' AS Date), CAST(N'2025-11-21T17:34:01.0033333' AS DateTime2), 1, NULL, NULL, NULL, NULL, 1, 13, CAST(39.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[MeasurementGoal] ([Id], [UserId], [MeasurementUnitId], [StartDate], [EndDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [BodyPartId], [Size]) VALUES (40, 1, 3, CAST(N'2025-10-03' AS Date), CAST(N'2025-11-14' AS Date), CAST(N'2025-11-21T17:34:01.0033333' AS DateTime2), 1, NULL, NULL, NULL, NULL, 1, 13, CAST(42.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[MeasurementGoal] ([Id], [UserId], [MeasurementUnitId], [StartDate], [EndDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [BodyPartId], [Size]) VALUES (41, 13, 3, CAST(N'2026-01-22' AS Date), CAST(N'2026-05-10' AS Date), CAST(N'2026-02-17T17:40:01.7439109' AS DateTime2), 13, CAST(N'2026-02-17T17:40:01.7439109' AS DateTime2), 13, NULL, NULL, 1, 1, CAST(86.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[MeasurementGoal] ([Id], [UserId], [MeasurementUnitId], [StartDate], [EndDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [BodyPartId], [Size]) VALUES (42, 13, 3, CAST(N'2026-01-22' AS Date), CAST(N'2026-05-10' AS Date), CAST(N'2026-02-17T17:40:01.7439109' AS DateTime2), 13, CAST(N'2026-02-17T17:40:01.7439109' AS DateTime2), 13, NULL, NULL, 1, 3, CAST(43.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[MeasurementGoal] ([Id], [UserId], [MeasurementUnitId], [StartDate], [EndDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [BodyPartId], [Size]) VALUES (43, 13, 3, CAST(N'2026-01-22' AS Date), CAST(N'2026-05-10' AS Date), CAST(N'2026-02-17T17:40:01.7439109' AS DateTime2), 13, CAST(N'2026-02-17T17:40:01.7439109' AS DateTime2), 13, NULL, NULL, 1, 4, CAST(125.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[MeasurementGoal] ([Id], [UserId], [MeasurementUnitId], [StartDate], [EndDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [BodyPartId], [Size]) VALUES (44, 13, 3, CAST(N'2026-01-22' AS Date), CAST(N'2026-05-10' AS Date), CAST(N'2026-02-17T17:40:01.7439109' AS DateTime2), 13, CAST(N'2026-02-17T17:40:01.7439109' AS DateTime2), 13, NULL, NULL, 1, 5, CAST(138.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[MeasurementGoal] ([Id], [UserId], [MeasurementUnitId], [StartDate], [EndDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [BodyPartId], [Size]) VALUES (45, 13, 3, CAST(N'2026-01-22' AS Date), CAST(N'2026-05-10' AS Date), CAST(N'2026-02-17T17:40:01.7439109' AS DateTime2), 13, CAST(N'2026-02-17T17:40:01.7439109' AS DateTime2), 13, NULL, NULL, 1, 6, CAST(43.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[MeasurementGoal] ([Id], [UserId], [MeasurementUnitId], [StartDate], [EndDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [BodyPartId], [Size]) VALUES (46, 13, 3, CAST(N'2026-01-22' AS Date), CAST(N'2026-05-10' AS Date), CAST(N'2026-02-17T17:40:01.7439109' AS DateTime2), 13, CAST(N'2026-02-17T17:40:01.7439109' AS DateTime2), 13, NULL, NULL, 1, 7, CAST(43.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[MeasurementGoal] ([Id], [UserId], [MeasurementUnitId], [StartDate], [EndDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [BodyPartId], [Size]) VALUES (47, 13, 3, CAST(N'2026-01-22' AS Date), CAST(N'2026-05-10' AS Date), CAST(N'2026-02-17T17:40:01.7439109' AS DateTime2), 13, CAST(N'2026-02-17T17:40:01.7439109' AS DateTime2), 13, NULL, NULL, 1, 8, CAST(36.5 AS Decimal(4, 1)))
GO
INSERT [dbo].[MeasurementGoal] ([Id], [UserId], [MeasurementUnitId], [StartDate], [EndDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [BodyPartId], [Size]) VALUES (48, 13, 3, CAST(N'2026-01-22' AS Date), CAST(N'2026-05-10' AS Date), CAST(N'2026-02-17T17:40:01.7439109' AS DateTime2), 13, CAST(N'2026-02-17T17:40:01.7439109' AS DateTime2), 13, NULL, NULL, 1, 9, CAST(36.5 AS Decimal(4, 1)))
GO
INSERT [dbo].[MeasurementGoal] ([Id], [UserId], [MeasurementUnitId], [StartDate], [EndDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [BodyPartId], [Size]) VALUES (49, 13, 3, CAST(N'2026-01-22' AS Date), CAST(N'2026-05-10' AS Date), CAST(N'2026-02-17T17:40:01.7439109' AS DateTime2), 13, CAST(N'2026-02-17T17:40:01.7439109' AS DateTime2), 13, NULL, NULL, 1, 10, CAST(64.5 AS Decimal(4, 1)))
GO
INSERT [dbo].[MeasurementGoal] ([Id], [UserId], [MeasurementUnitId], [StartDate], [EndDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [BodyPartId], [Size]) VALUES (50, 13, 3, CAST(N'2026-01-22' AS Date), CAST(N'2026-05-10' AS Date), CAST(N'2026-02-17T17:40:01.7439109' AS DateTime2), 13, CAST(N'2026-02-17T17:40:01.7439109' AS DateTime2), 13, NULL, NULL, 1, 11, CAST(64.5 AS Decimal(4, 1)))
GO
INSERT [dbo].[MeasurementGoal] ([Id], [UserId], [MeasurementUnitId], [StartDate], [EndDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [BodyPartId], [Size]) VALUES (51, 13, 3, CAST(N'2026-01-22' AS Date), CAST(N'2026-05-10' AS Date), CAST(N'2026-02-17T17:40:01.7439109' AS DateTime2), 13, CAST(N'2026-02-17T17:40:01.7439109' AS DateTime2), 13, NULL, NULL, 1, 12, CAST(43.0 AS Decimal(4, 1)))
GO
INSERT [dbo].[MeasurementGoal] ([Id], [UserId], [MeasurementUnitId], [StartDate], [EndDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [BodyPartId], [Size]) VALUES (52, 13, 3, CAST(N'2026-01-22' AS Date), CAST(N'2026-05-10' AS Date), CAST(N'2026-02-17T17:40:01.7439109' AS DateTime2), 13, CAST(N'2026-02-17T17:40:01.7439109' AS DateTime2), 13, NULL, NULL, 1, 13, CAST(43.0 AS Decimal(4, 1)))
GO
SET IDENTITY_INSERT [dbo].[MeasurementGoal] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 
GO
INSERT [dbo].[User] ([Id], [FullName], [Username], [Email], [Password], [DateOfBirth], [Description], [ProfilePictureUrl], [PublicId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [CountryId], [Height], [IsPrivate], [GenderId], [HeightMeasurementUnitId], [DeactivateReason]) VALUES (1, N'Nate Jordan', N'_NateJ_', N'test@test', N'$2a$11$fqnmLUFVwdCBha5dDUr8reThHmarvcqcSk1RLT4vXvpKgFiohnEoW', CAST(N'1998-06-11' AS Date), N'Professional weightlifter 🔥', N'https://res.cloudinary.com/dpqnruuyn/image/upload/v1763589182/peak-performance-app/u4ifwhh2yd2tjpwvxbse.png', N'peak-performance-app/u4ifwhh2yd2tjpwvxbse', CAST(N'2025-08-17T11:46:00.4528443' AS DateTime2), -1, CAST(N'2026-02-21T20:06:48.6551835' AS DateTime2), 13, CAST(N'2026-02-21T19:54:04.9341996' AS DateTime2), 13, 1, 237, CAST(80.4 AS Decimal(4, 1)), 0, 1, 4, NULL)
GO
INSERT [dbo].[User] ([Id], [FullName], [Username], [Email], [Password], [DateOfBirth], [Description], [ProfilePictureUrl], [PublicId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [CountryId], [Height], [IsPrivate], [GenderId], [HeightMeasurementUnitId], [DeactivateReason]) VALUES (2, N'Nemanja Radojević', N'Nemanja1989', N'nr@test.test', N'$2a$11$6YrP7IomS8Mhsl7TFF1HQOjSHiPQTvOTOe7SCkeSAcUjQgFJpLaty', CAST(N'1989-06-07' AS Date), NULL, NULL, NULL, CAST(N'2026-01-27T19:22:49.6438892' AS DateTime2), -1, CAST(N'2026-02-21T20:07:02.8713715' AS DateTime2), 13, CAST(N'2026-02-21T19:28:05.7463373' AS DateTime2), 2, 1, NULL, NULL, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[User] ([Id], [FullName], [Username], [Email], [Password], [DateOfBirth], [Description], [ProfilePictureUrl], [PublicId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [CountryId], [Height], [IsPrivate], [GenderId], [HeightMeasurementUnitId], [DeactivateReason]) VALUES (3, N'Michael Johnson', N'mjohnson', N'michael.johnson@test.com', N'$2a$11$7dqh8E4.TbBbc69ATXdHueRehWcvNnuU2/Rj5olI/lC.gV2xYyX5q', CAST(N'1995-06-12' AS Date), N'Competitive powerlifter focused on strength and heavy compounds.', NULL, NULL, CAST(N'2026-02-17T12:26:01.1124149' AS DateTime2), -1, CAST(N'2026-02-17T12:26:01.1124149' AS DateTime2), -1, NULL, NULL, 1, 237, NULL, NULL, 1, NULL, NULL)
GO
INSERT [dbo].[User] ([Id], [FullName], [Username], [Email], [Password], [DateOfBirth], [Description], [ProfilePictureUrl], [PublicId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [CountryId], [Height], [IsPrivate], [GenderId], [HeightMeasurementUnitId], [DeactivateReason]) VALUES (4, N'Daniel Smith', N'dsmith', N'daniel.smith@test.com', N'$2a$11$LF5imjlNaD0ZVNI42DU24.49ao1C8xOlA2eQ7Ugea6mhGTpX/g6dq', CAST(N'1998-03-25' AS Date), N'Recreational lifter training for overall fitness and health.', NULL, NULL, CAST(N'2026-02-17T12:26:01.1124149' AS DateTime2), -1, CAST(N'2026-02-17T12:26:01.1124149' AS DateTime2), -1, NULL, NULL, 1, 237, NULL, NULL, 1, NULL, NULL)
GO
INSERT [dbo].[User] ([Id], [FullName], [Username], [Email], [Password], [DateOfBirth], [Description], [ProfilePictureUrl], [PublicId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [CountryId], [Height], [IsPrivate], [GenderId], [HeightMeasurementUnitId], [DeactivateReason]) VALUES (5, N'Luca Bianchi', N'lbianchi', N'luca.bianchi@test.com', N'$2a$11$W2fjJJ8BsndggV.EHZE4u.bDbJF6ZW5h9pgspA9Q8te063T2T8pe2', CAST(N'1993-11-05' AS Date), N'Olympic weightlifting enthusiast with strong technical focus.', N'https://res.cloudinary.com/dpqnruuyn/image/upload/v1771335296/peak-performance-app/stdp26hgpioq5vs6dsjr.png', N'peak-performance-app/stdp26hgpioq5vs6dsjr', CAST(N'2026-02-17T12:26:01.1124149' AS DateTime2), -1, CAST(N'2026-02-17T13:34:58.8276570' AS DateTime2), 5, CAST(N'2026-02-21T19:53:06.2254767' AS DateTime2), 13, 0, 111, NULL, NULL, 1, NULL, N'Lying alot')
GO
INSERT [dbo].[User] ([Id], [FullName], [Username], [Email], [Password], [DateOfBirth], [Description], [ProfilePictureUrl], [PublicId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [CountryId], [Height], [IsPrivate], [GenderId], [HeightMeasurementUnitId], [DeactivateReason]) VALUES (6, N'Pierre Dubois', N'pdubois', N'pierre.dubois@test.com', N'$2a$11$uWTuVpbddS5sFv7Efup2HuicpHRUp3RWpeCAABOY5RbI7A3zdFfsi', CAST(N'1996-09-18' AS Date), N'Bodybuilder aiming for stage-ready physique next season.', N'https://res.cloudinary.com/dpqnruuyn/image/upload/v1771335648/peak-performance-app/ww9spcv3yoaz0bvxmhjo.png', N'peak-performance-app/ww9spcv3yoaz0bvxmhjo', CAST(N'2026-02-17T12:26:01.1124149' AS DateTime2), -1, CAST(N'2026-02-17T13:41:03.4639145' AS DateTime2), 6, NULL, NULL, 1, 77, CAST(178.0 AS Decimal(4, 1)), 1, 1, 3, NULL)
GO
INSERT [dbo].[User] ([Id], [FullName], [Username], [Email], [Password], [DateOfBirth], [Description], [ProfilePictureUrl], [PublicId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [CountryId], [Height], [IsPrivate], [GenderId], [HeightMeasurementUnitId], [DeactivateReason]) VALUES (7, N'Antoine Laurent', N'alaurent', N'antoine.laurent@test.com', N'$2a$11$em5zjUV.0u/Wgpt68ajiS.YnfEcSKLs83wTrIVUufYMzKmrI.Xtuq', CAST(N'1994-01-30' AS Date), N'Hybrid athlete mixing powerlifting and hypertrophy training.', NULL, NULL, CAST(N'2026-02-17T12:26:01.1124149' AS DateTime2), -1, CAST(N'2026-02-17T12:26:01.1124149' AS DateTime2), -1, NULL, NULL, 1, 77, NULL, NULL, 1, NULL, NULL)
GO
INSERT [dbo].[User] ([Id], [FullName], [Username], [Email], [Password], [DateOfBirth], [Description], [ProfilePictureUrl], [PublicId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [CountryId], [Height], [IsPrivate], [GenderId], [HeightMeasurementUnitId], [DeactivateReason]) VALUES (8, N'Jonas Müller', N'jmueller', N'jonas.mueller@test.com', N'$2a$11$LDcwrRdmyOKWCS6mRJ894OUJNKPE7JrtzortzGWQ45p7Tz6swcISi', CAST(N'1997-07-14' AS Date), N'German strength athlete focused on squat and deadlift PRs.', N'https://res.cloudinary.com/dpqnruuyn/image/upload/v1771336254/peak-performance-app/niw1dub4prylog0qcenv.jpg', N'peak-performance-app/niw1dub4prylog0qcenv', CAST(N'2026-02-17T12:26:01.1124149' AS DateTime2), -1, CAST(N'2026-02-17T13:51:07.5359786' AS DateTime2), 8, NULL, NULL, 1, 84, CAST(200.0 AS Decimal(4, 1)), 0, 1, 3, NULL)
GO
INSERT [dbo].[User] ([Id], [FullName], [Username], [Email], [Password], [DateOfBirth], [Description], [ProfilePictureUrl], [PublicId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [CountryId], [Height], [IsPrivate], [GenderId], [HeightMeasurementUnitId], [DeactivateReason]) VALUES (9, N'Adnan Hadzic', N'ahadzic', N'adnan.hadzic@test.com', N'$2a$11$BJjjP3kRtbn8xmSWuQSBHOAKqptmXWr6zbIWmlXf8PXSDBQPXVPGO', CAST(N'1999-12-02' AS Date), N'Recreational gym goer building muscle and improving endurance.', NULL, NULL, CAST(N'2026-02-17T12:26:01.1124149' AS DateTime2), -1, CAST(N'2026-02-17T12:26:01.1124149' AS DateTime2), -1, NULL, NULL, 1, 29, NULL, NULL, 1, NULL, NULL)
GO
INSERT [dbo].[User] ([Id], [FullName], [Username], [Email], [Password], [DateOfBirth], [Description], [ProfilePictureUrl], [PublicId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [CountryId], [Height], [IsPrivate], [GenderId], [HeightMeasurementUnitId], [DeactivateReason]) VALUES (10, N'Emily Carter', N'ecarter', N'emily.carter@test.com', N'$2a$11$lbRwp9e2KJdsLU/lz1Wese5tcEFTgb.b/AtBK0UcxdgMom19fB44C', CAST(N'1996-04-10' AS Date), N'Competitive bodybuilder focused on aesthetics and conditioning.', N'https://res.cloudinary.com/dpqnruuyn/image/upload/v1771336892/peak-performance-app/yt7rvjp2rhueastpf17i.jpg', N'peak-performance-app/yt7rvjp2rhueastpf17i', CAST(N'2026-02-17T12:26:01.1124149' AS DateTime2), -1, CAST(N'2026-02-17T14:01:34.5751554' AS DateTime2), 10, NULL, NULL, 1, 237, CAST(69.6 AS Decimal(4, 1)), 0, 2, 4, NULL)
GO
INSERT [dbo].[User] ([Id], [FullName], [Username], [Email], [Password], [DateOfBirth], [Description], [ProfilePictureUrl], [PublicId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [CountryId], [Height], [IsPrivate], [GenderId], [HeightMeasurementUnitId], [DeactivateReason]) VALUES (11, N'Samantha Lee', N'slee', N'samantha.lee@test.com', N'$2a$11$FPs0JeJyT48mtH.WLUXL0.8r375YuGPfPU/0Gih5dRirfST0OBMJy', CAST(N'2000-08-22' AS Date), N'Powerlifting athlete training for national competitions.', NULL, NULL, CAST(N'2026-02-17T12:26:01.1124149' AS DateTime2), -1, CAST(N'2026-02-17T14:10:38.2008451' AS DateTime2), 11, NULL, NULL, 1, 237, CAST(69.6 AS Decimal(4, 1)), 0, 2, 4, NULL)
GO
INSERT [dbo].[User] ([Id], [FullName], [Username], [Email], [Password], [DateOfBirth], [Description], [ProfilePictureUrl], [PublicId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [CountryId], [Height], [IsPrivate], [GenderId], [HeightMeasurementUnitId], [DeactivateReason]) VALUES (12, N'Hannah Schneider', N'hschneider', N'hannah.schneider@test.com', N'$2a$11$TFjPxDSIGyxIXYJljQ4bX.M6VDB3CsHDQTguK72N.2pGqnOttMlMO', CAST(N'1995-02-17' AS Date), N'Weightlifting athlete with strong technique and discipline.', NULL, NULL, CAST(N'2026-02-17T12:26:01.1124149' AS DateTime2), -1, CAST(N'2026-02-17T12:26:01.1124149' AS DateTime2), -1, CAST(N'2026-02-21T19:49:27.2466573' AS DateTime2), 13, 0, 84, NULL, NULL, 2, NULL, N'Being rude to others')
GO
INSERT [dbo].[User] ([Id], [FullName], [Username], [Email], [Password], [DateOfBirth], [Description], [ProfilePictureUrl], [PublicId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [CountryId], [Height], [IsPrivate], [GenderId], [HeightMeasurementUnitId], [DeactivateReason]) VALUES (13, N'Obrad Pualić-Radujko', N'ObradPR', N'obradpualic@gmail.com', N'$2a$11$sGSmli1vfa167gVJFv8.AOAJGIDh7tPL33IVK4bcRDOSZ4hfvoPAy', CAST(N'2002-10-10' AS Date), N'Personal trainer of personal trainers.', N'https://res.cloudinary.com/dpqnruuyn/image/upload/v1772128303/peak-performance-app/vchobq1irfs0gcbngpno.jpg', N'peak-performance-app/vchobq1irfs0gcbngpno', CAST(N'2026-02-17T12:26:01.1124149' AS DateTime2), -1, CAST(N'2026-02-26T17:51:44.8718547' AS DateTime2), 13, NULL, NULL, 1, 198, CAST(185.0 AS Decimal(4, 1)), 0, 1, 3, NULL)
GO
SET IDENTITY_INSERT [dbo].[User] OFF
GO
SET IDENTITY_INSERT [dbo].[UserMeasurementPreference] ON 
GO
INSERT [dbo].[UserMeasurementPreference] ([Id], [UserId], [WeightUnitId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive]) VALUES (1, 1, 1, 3, CAST(N'2025-08-17T11:46:00.4528443' AS DateTime2), -1, CAST(N'2026-01-31T16:50:53.9987898' AS DateTime2), 1, CAST(N'2026-02-08T18:09:47.1887019' AS DateTime2), 1, 0)
GO
INSERT [dbo].[UserMeasurementPreference] ([Id], [UserId], [WeightUnitId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive]) VALUES (2, 1, 1, 4, CAST(N'2025-11-18T18:34:34.2599777' AS DateTime2), 1, CAST(N'2026-01-31T16:48:04.7692040' AS DateTime2), 1, CAST(N'2026-01-31T16:50:53.9987898' AS DateTime2), 1, 0)
GO
INSERT [dbo].[UserMeasurementPreference] ([Id], [UserId], [WeightUnitId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive]) VALUES (3, 1, 2, 3, CAST(N'2025-11-20T18:44:16.8521286' AS DateTime2), 1, CAST(N'2025-11-20T18:44:16.8521286' AS DateTime2), 1, CAST(N'2025-11-20T18:44:35.6599732' AS DateTime2), 1, 0)
GO
INSERT [dbo].[UserMeasurementPreference] ([Id], [UserId], [WeightUnitId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive]) VALUES (4, 1, 2, 4, CAST(N'2025-11-20T18:44:35.6599732' AS DateTime2), 1, CAST(N'2026-02-08T18:09:47.1887019' AS DateTime2), 1, CAST(N'2025-11-20T18:44:52.4719582' AS DateTime2), 1, 1)
GO
INSERT [dbo].[UserMeasurementPreference] ([Id], [UserId], [WeightUnitId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive]) VALUES (5, 2, 1, 3, CAST(N'2026-01-27T19:22:49.6438892' AS DateTime2), -1, CAST(N'2026-01-27T20:28:44.5898785' AS DateTime2), 2, CAST(N'2026-01-27T20:28:18.8506506' AS DateTime2), 2, 1)
GO
INSERT [dbo].[UserMeasurementPreference] ([Id], [UserId], [WeightUnitId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive]) VALUES (6, 2, 2, 3, CAST(N'2026-01-27T20:28:10.9003687' AS DateTime2), 2, CAST(N'2026-01-27T20:28:10.9003687' AS DateTime2), 2, CAST(N'2026-01-27T20:28:21.2657659' AS DateTime2), 2, 0)
GO
INSERT [dbo].[UserMeasurementPreference] ([Id], [UserId], [WeightUnitId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive]) VALUES (7, 2, 1, 4, CAST(N'2026-01-27T20:28:18.8506506' AS DateTime2), 2, CAST(N'2026-01-27T20:28:18.8506506' AS DateTime2), 2, CAST(N'2026-01-27T20:28:44.5898785' AS DateTime2), 2, 0)
GO
INSERT [dbo].[UserMeasurementPreference] ([Id], [UserId], [WeightUnitId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive]) VALUES (8, 2, 2, 4, CAST(N'2026-01-27T20:28:21.2657659' AS DateTime2), 2, CAST(N'2026-01-27T20:28:21.2657659' AS DateTime2), 2, NULL, NULL, 1)
GO
INSERT [dbo].[UserMeasurementPreference] ([Id], [UserId], [WeightUnitId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive]) VALUES (9, 3, 2, 4, CAST(N'2026-02-17T12:26:01.1124149' AS DateTime2), -1, CAST(N'2026-02-17T12:26:01.1124149' AS DateTime2), -1, NULL, NULL, 1)
GO
INSERT [dbo].[UserMeasurementPreference] ([Id], [UserId], [WeightUnitId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive]) VALUES (10, 4, 2, 4, CAST(N'2026-02-17T12:26:01.1124149' AS DateTime2), -1, CAST(N'2026-02-17T12:26:01.1124149' AS DateTime2), -1, NULL, NULL, 1)
GO
INSERT [dbo].[UserMeasurementPreference] ([Id], [UserId], [WeightUnitId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive]) VALUES (11, 5, 1, 3, CAST(N'2026-02-17T12:26:01.1124149' AS DateTime2), -1, CAST(N'2026-02-17T12:26:01.1124149' AS DateTime2), -1, NULL, NULL, 1)
GO
INSERT [dbo].[UserMeasurementPreference] ([Id], [UserId], [WeightUnitId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive]) VALUES (12, 6, 1, 3, CAST(N'2026-02-17T12:26:01.1124149' AS DateTime2), -1, CAST(N'2026-02-17T12:26:01.1124149' AS DateTime2), -1, NULL, NULL, 1)
GO
INSERT [dbo].[UserMeasurementPreference] ([Id], [UserId], [WeightUnitId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive]) VALUES (13, 7, 1, 3, CAST(N'2026-02-17T12:26:01.1124149' AS DateTime2), -1, CAST(N'2026-02-17T12:26:01.1124149' AS DateTime2), -1, NULL, NULL, 1)
GO
INSERT [dbo].[UserMeasurementPreference] ([Id], [UserId], [WeightUnitId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive]) VALUES (14, 8, 1, 3, CAST(N'2026-02-17T12:26:01.1124149' AS DateTime2), -1, CAST(N'2026-02-17T12:26:01.1124149' AS DateTime2), -1, NULL, NULL, 1)
GO
INSERT [dbo].[UserMeasurementPreference] ([Id], [UserId], [WeightUnitId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive]) VALUES (15, 9, 1, 3, CAST(N'2026-02-17T12:26:01.1124149' AS DateTime2), -1, CAST(N'2026-02-17T12:26:01.1124149' AS DateTime2), -1, NULL, NULL, 1)
GO
INSERT [dbo].[UserMeasurementPreference] ([Id], [UserId], [WeightUnitId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive]) VALUES (16, 10, 2, 4, CAST(N'2026-02-17T12:26:01.1124149' AS DateTime2), -1, CAST(N'2026-02-17T12:26:01.1124149' AS DateTime2), -1, NULL, NULL, 1)
GO
INSERT [dbo].[UserMeasurementPreference] ([Id], [UserId], [WeightUnitId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive]) VALUES (17, 11, 2, 4, CAST(N'2026-02-17T12:26:01.1124149' AS DateTime2), -1, CAST(N'2026-02-17T12:26:01.1124149' AS DateTime2), -1, NULL, NULL, 1)
GO
INSERT [dbo].[UserMeasurementPreference] ([Id], [UserId], [WeightUnitId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive]) VALUES (18, 12, 1, 3, CAST(N'2026-02-17T12:26:01.1124149' AS DateTime2), -1, CAST(N'2026-02-17T12:26:01.1124149' AS DateTime2), -1, NULL, NULL, 1)
GO
INSERT [dbo].[UserMeasurementPreference] ([Id], [UserId], [WeightUnitId], [MeasurementUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive]) VALUES (19, 13, 1, 3, CAST(N'2026-02-17T12:26:01.1124149' AS DateTime2), -1, CAST(N'2026-02-17T12:26:01.1124149' AS DateTime2), -1, NULL, NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[UserMeasurementPreference] OFF
GO
SET IDENTITY_INSERT [dbo].[UserRole] ON 
GO
INSERT [dbo].[UserRole] ([Id], [UserId], [RoleId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive]) VALUES (1, 1, 2, CAST(N'2025-08-17T11:46:00.4528443' AS DateTime2), -1, CAST(N'2025-08-17T11:46:00.4528443' AS DateTime2), -1, NULL, NULL, 1)
GO
INSERT [dbo].[UserRole] ([Id], [UserId], [RoleId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive]) VALUES (2, 2, 2, CAST(N'2026-01-27T19:22:49.6438892' AS DateTime2), -1, CAST(N'2026-01-27T19:22:49.6438892' AS DateTime2), -1, NULL, NULL, 1)
GO
INSERT [dbo].[UserRole] ([Id], [UserId], [RoleId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive]) VALUES (3, 3, 2, CAST(N'2026-02-17T12:26:01.1124149' AS DateTime2), -1, CAST(N'2026-02-17T12:26:01.1124149' AS DateTime2), -1, NULL, NULL, 1)
GO
INSERT [dbo].[UserRole] ([Id], [UserId], [RoleId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive]) VALUES (4, 4, 2, CAST(N'2026-02-17T12:26:01.1124149' AS DateTime2), -1, CAST(N'2026-02-17T12:26:01.1124149' AS DateTime2), -1, NULL, NULL, 1)
GO
INSERT [dbo].[UserRole] ([Id], [UserId], [RoleId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive]) VALUES (5, 5, 2, CAST(N'2026-02-17T12:26:01.1124149' AS DateTime2), -1, CAST(N'2026-02-17T12:26:01.1124149' AS DateTime2), -1, NULL, NULL, 1)
GO
INSERT [dbo].[UserRole] ([Id], [UserId], [RoleId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive]) VALUES (6, 6, 2, CAST(N'2026-02-17T12:26:01.1124149' AS DateTime2), -1, CAST(N'2026-02-17T12:26:01.1124149' AS DateTime2), -1, NULL, NULL, 1)
GO
INSERT [dbo].[UserRole] ([Id], [UserId], [RoleId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive]) VALUES (7, 7, 2, CAST(N'2026-02-17T12:26:01.1124149' AS DateTime2), -1, CAST(N'2026-02-17T12:26:01.1124149' AS DateTime2), -1, NULL, NULL, 1)
GO
INSERT [dbo].[UserRole] ([Id], [UserId], [RoleId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive]) VALUES (8, 8, 2, CAST(N'2026-02-17T12:26:01.1124149' AS DateTime2), -1, CAST(N'2026-02-17T12:26:01.1124149' AS DateTime2), -1, NULL, NULL, 1)
GO
INSERT [dbo].[UserRole] ([Id], [UserId], [RoleId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive]) VALUES (9, 9, 2, CAST(N'2026-02-17T12:26:01.1124149' AS DateTime2), -1, CAST(N'2026-02-17T12:26:01.1124149' AS DateTime2), -1, NULL, NULL, 1)
GO
INSERT [dbo].[UserRole] ([Id], [UserId], [RoleId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive]) VALUES (10, 10, 2, CAST(N'2026-02-17T12:26:01.1124149' AS DateTime2), -1, CAST(N'2026-02-17T12:26:01.1124149' AS DateTime2), -1, NULL, NULL, 1)
GO
INSERT [dbo].[UserRole] ([Id], [UserId], [RoleId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive]) VALUES (11, 11, 2, CAST(N'2026-02-17T12:26:01.1124149' AS DateTime2), -1, CAST(N'2026-02-17T12:26:01.1124149' AS DateTime2), -1, NULL, NULL, 1)
GO
INSERT [dbo].[UserRole] ([Id], [UserId], [RoleId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive]) VALUES (12, 12, 2, CAST(N'2026-02-17T12:26:01.1124149' AS DateTime2), -1, CAST(N'2026-02-17T12:26:01.1124149' AS DateTime2), -1, NULL, NULL, 1)
GO
INSERT [dbo].[UserRole] ([Id], [UserId], [RoleId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive]) VALUES (13, 13, 1, CAST(N'2026-02-17T12:26:01.1124149' AS DateTime2), -1, CAST(N'2026-02-17T12:26:01.1124149' AS DateTime2), -1, NULL, NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[UserRole] OFF
GO
SET IDENTITY_INSERT [dbo].[UserSelectedExercise] ON 
GO
INSERT [dbo].[UserSelectedExercise] ([Id], [UserId], [ExerciseId]) VALUES (18, 1, 111)
GO
INSERT [dbo].[UserSelectedExercise] ([Id], [UserId], [ExerciseId]) VALUES (19, 1, 102)
GO
INSERT [dbo].[UserSelectedExercise] ([Id], [UserId], [ExerciseId]) VALUES (20, 1, 72)
GO
INSERT [dbo].[UserSelectedExercise] ([Id], [UserId], [ExerciseId]) VALUES (21, 2, 73)
GO
INSERT [dbo].[UserSelectedExercise] ([Id], [UserId], [ExerciseId]) VALUES (25, 8, 94)
GO
INSERT [dbo].[UserSelectedExercise] ([Id], [UserId], [ExerciseId]) VALUES (26, 8, 111)
GO
INSERT [dbo].[UserSelectedExercise] ([Id], [UserId], [ExerciseId]) VALUES (28, 13, 111)
GO
INSERT [dbo].[UserSelectedExercise] ([Id], [UserId], [ExerciseId]) VALUES (29, 13, 73)
GO
INSERT [dbo].[UserSelectedExercise] ([Id], [UserId], [ExerciseId]) VALUES (30, 13, 92)
GO
SET IDENTITY_INSERT [dbo].[UserSelectedExercise] OFF
GO
SET IDENTITY_INSERT [dbo].[Workout] ON 
GO
INSERT [dbo].[Workout] ([Id], [UserId], [Name], [Notes], [CopiedFromId], [LogDate], [StartAt], [FinishAt], [Bodyweight], [BodyweightUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [IsCompleted]) VALUES (1, 1, N'Power clean focus', NULL, NULL, CAST(N'2025-11-24' AS Date), NULL, NULL, CAST(88.00 AS Decimal(18, 2)), 1, CAST(N'2025-11-24T18:59:12.1642652' AS DateTime2), 1, CAST(N'2026-02-08T18:12:34.8419437' AS DateTime2), 1, NULL, NULL, 1, 1)
GO
INSERT [dbo].[Workout] ([Id], [UserId], [Name], [Notes], [CopiedFromId], [LogDate], [StartAt], [FinishAt], [Bodyweight], [BodyweightUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [IsCompleted]) VALUES (2, 1, N'Close grip bench focus', NULL, NULL, CAST(N'2025-11-26' AS Date), CAST(N'20:10:00' AS Time), NULL, CAST(86.00 AS Decimal(18, 2)), 1, CAST(N'2025-11-24T19:10:51.5864152' AS DateTime2), 1, CAST(N'2026-02-08T18:14:17.6626578' AS DateTime2), 1, NULL, NULL, 1, 1)
GO
INSERT [dbo].[Workout] ([Id], [UserId], [Name], [Notes], [CopiedFromId], [LogDate], [StartAt], [FinishAt], [Bodyweight], [BodyweightUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [IsCompleted]) VALUES (3, 1, N'Third test', N'test', NULL, CAST(N'2025-11-12' AS Date), CAST(N'10:10:00' AS Time), CAST(N'11:20:00' AS Time), CAST(88.00 AS Decimal(18, 2)), 1, CAST(N'2025-11-24T19:15:46.5637469' AS DateTime2), 1, CAST(N'2025-11-25T23:33:09.6533215' AS DateTime2), 1, CAST(N'2025-11-28T13:09:50.1660665' AS DateTime2), 1, 0, NULL)
GO
INSERT [dbo].[Workout] ([Id], [UserId], [Name], [Notes], [CopiedFromId], [LogDate], [StartAt], [FinishAt], [Bodyweight], [BodyweightUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [IsCompleted]) VALUES (4, 1, N'Delete workout test', NULL, NULL, CAST(N'2025-11-25' AS Date), NULL, CAST(N'20:10:00' AS Time), CAST(88.00 AS Decimal(18, 2)), 1, CAST(N'2025-11-25T07:07:06.6500587' AS DateTime2), 1, CAST(N'2025-11-25T07:07:06.6500587' AS DateTime2), 1, CAST(N'2025-11-25T07:07:18.9317675' AS DateTime2), 1, 0, NULL)
GO
INSERT [dbo].[Workout] ([Id], [UserId], [Name], [Notes], [CopiedFromId], [LogDate], [StartAt], [FinishAt], [Bodyweight], [BodyweightUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [IsCompleted]) VALUES (5, 1, N'Testing edit 2', NULL, NULL, CAST(N'2025-11-25' AS Date), NULL, NULL, CAST(86.00 AS Decimal(18, 2)), 1, CAST(N'2025-11-25T07:25:52.3356147' AS DateTime2), 1, CAST(N'2025-12-03T21:34:58.3694519' AS DateTime2), 1, CAST(N'2026-02-08T18:12:45.2067890' AS DateTime2), 1, 0, 0)
GO
INSERT [dbo].[Workout] ([Id], [UserId], [Name], [Notes], [CopiedFromId], [LogDate], [StartAt], [FinishAt], [Bodyweight], [BodyweightUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [IsCompleted]) VALUES (6, 1, N'REST - Cardio day', N'Rest day', NULL, CAST(N'2025-11-28' AS Date), CAST(N'14:10:00' AS Time), CAST(N'16:10:00' AS Time), CAST(87.30 AS Decimal(18, 2)), 1, CAST(N'2025-11-28T13:11:19.6499821' AS DateTime2), 1, CAST(N'2026-02-08T18:15:00.6267510' AS DateTime2), 1, NULL, NULL, 1, 1)
GO
INSERT [dbo].[Workout] ([Id], [UserId], [Name], [Notes], [CopiedFromId], [LogDate], [StartAt], [FinishAt], [Bodyweight], [BodyweightUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [IsCompleted]) VALUES (7, 1, N'new workout refresh', NULL, NULL, CAST(N'2025-11-30' AS Date), NULL, NULL, CAST(87.30 AS Decimal(18, 2)), 1, CAST(N'2025-11-29T22:26:40.9587847' AS DateTime2), 1, CAST(N'2026-02-01T12:51:37.7015121' AS DateTime2), 1, CAST(N'2026-02-08T18:15:12.9007931' AS DateTime2), 1, 0, 0)
GO
INSERT [dbo].[Workout] ([Id], [UserId], [Name], [Notes], [CopiedFromId], [LogDate], [StartAt], [FinishAt], [Bodyweight], [BodyweightUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [IsCompleted]) VALUES (8, 1, N'novi test', NULL, NULL, CAST(N'2025-11-30' AS Date), NULL, NULL, CAST(87.30 AS Decimal(18, 2)), 1, CAST(N'2025-11-29T22:28:45.8786009' AS DateTime2), 1, CAST(N'2025-12-03T21:31:15.1562346' AS DateTime2), 1, CAST(N'2026-02-08T18:15:26.1686636' AS DateTime2), 1, 0, NULL)
GO
INSERT [dbo].[Workout] ([Id], [UserId], [Name], [Notes], [CopiedFromId], [LogDate], [StartAt], [FinishAt], [Bodyweight], [BodyweightUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [IsCompleted]) VALUES (9, 1, N'Complete Workout Volume stats', NULL, NULL, CAST(N'2025-12-01' AS Date), NULL, NULL, CAST(88.00 AS Decimal(18, 2)), 1, CAST(N'2025-12-01T21:32:38.8884875' AS DateTime2), 1, CAST(N'2025-12-01T21:32:38.8884875' AS DateTime2), 1, CAST(N'2025-12-01T21:52:39.4799355' AS DateTime2), 1, 0, NULL)
GO
INSERT [dbo].[Workout] ([Id], [UserId], [Name], [Notes], [CopiedFromId], [LogDate], [StartAt], [FinishAt], [Bodyweight], [BodyweightUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [IsCompleted]) VALUES (10, 1, N'Push', NULL, NULL, CAST(N'2025-12-01' AS Date), NULL, NULL, CAST(90.70 AS Decimal(18, 2)), 1, CAST(N'2025-12-01T21:52:52.9957105' AS DateTime2), 1, CAST(N'2026-02-17T11:46:14.2983725' AS DateTime2), 1, NULL, NULL, 1, 0)
GO
INSERT [dbo].[Workout] ([Id], [UserId], [Name], [Notes], [CopiedFromId], [LogDate], [StartAt], [FinishAt], [Bodyweight], [BodyweightUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [IsCompleted]) VALUES (11, 1, N'Legs', NULL, NULL, CAST(N'2025-12-03' AS Date), NULL, NULL, CAST(90.00 AS Decimal(18, 2)), 1, CAST(N'2025-12-03T19:56:50.9129476' AS DateTime2), 1, CAST(N'2026-02-17T11:45:40.7056983' AS DateTime2), 1, NULL, NULL, 1, 1)
GO
INSERT [dbo].[Workout] ([Id], [UserId], [Name], [Notes], [CopiedFromId], [LogDate], [StartAt], [FinishAt], [Bodyweight], [BodyweightUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [IsCompleted]) VALUES (12, 1, N'Copy of a Legs 3.dec 2025', N'It''s a copy', 11, CAST(N'2025-12-03' AS Date), CAST(N'23:50:00' AS Time), CAST(N'12:50:00' AS Time), CAST(90.00 AS Decimal(18, 2)), 1, CAST(N'2025-12-03T20:51:47.4944418' AS DateTime2), 1, CAST(N'2026-02-08T18:16:03.2026346' AS DateTime2), 1, CAST(N'2026-02-08T18:16:04.9051527' AS DateTime2), 1, 0, 0)
GO
INSERT [dbo].[Workout] ([Id], [UserId], [Name], [Notes], [CopiedFromId], [LogDate], [StartAt], [FinishAt], [Bodyweight], [BodyweightUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [IsCompleted]) VALUES (13, 1, N'Light weight day', N'', NULL, CAST(N'2025-12-01' AS Date), NULL, NULL, CAST(90.70 AS Decimal(18, 2)), 1, CAST(N'2025-12-03T21:01:50.9826851' AS DateTime2), 1, CAST(N'2026-02-17T11:46:07.0305371' AS DateTime2), 1, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[Workout] ([Id], [UserId], [Name], [Notes], [CopiedFromId], [LogDate], [StartAt], [FinishAt], [Bodyweight], [BodyweightUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [IsCompleted]) VALUES (14, 1, N'Future workout', NULL, NULL, CAST(N'2025-12-05' AS Date), NULL, NULL, CAST(90.00 AS Decimal(18, 2)), 1, CAST(N'2025-12-03T21:03:05.7847004' AS DateTime2), 1, CAST(N'2025-12-03T21:32:18.0366432' AS DateTime2), 1, CAST(N'2026-02-08T18:15:53.8310386' AS DateTime2), 1, 0, NULL)
GO
INSERT [dbo].[Workout] ([Id], [UserId], [Name], [Notes], [CopiedFromId], [LogDate], [StartAt], [FinishAt], [Bodyweight], [BodyweightUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [IsCompleted]) VALUES (15, 1, N'Close grip focus', NULL, NULL, CAST(N'2025-12-05' AS Date), NULL, NULL, CAST(90.00 AS Decimal(18, 2)), 1, CAST(N'2025-12-03T21:03:44.7137147' AS DateTime2), 1, CAST(N'2026-02-17T11:47:25.7957496' AS DateTime2), 1, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[Workout] ([Id], [UserId], [Name], [Notes], [CopiedFromId], [LogDate], [StartAt], [FinishAt], [Bodyweight], [BodyweightUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [IsCompleted]) VALUES (16, 1, N'Workout Pull', NULL, NULL, CAST(N'2025-12-20' AS Date), NULL, NULL, CAST(90.00 AS Decimal(18, 2)), 1, CAST(N'2025-12-03T21:37:41.0557499' AS DateTime2), 1, CAST(N'2026-02-17T11:47:56.2296988' AS DateTime2), 1, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[Workout] ([Id], [UserId], [Name], [Notes], [CopiedFromId], [LogDate], [StartAt], [FinishAt], [Bodyweight], [BodyweightUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [IsCompleted]) VALUES (17, 1, N'Testing 2 bodyweight update', NULL, NULL, CAST(N'2025-12-19' AS Date), NULL, NULL, CAST(90.00 AS Decimal(18, 2)), 1, CAST(N'2025-12-03T21:38:59.6772932' AS DateTime2), 1, CAST(N'2025-12-03T21:38:59.6772932' AS DateTime2), 1, CAST(N'2026-02-08T18:15:49.8945276' AS DateTime2), 1, 0, NULL)
GO
INSERT [dbo].[Workout] ([Id], [UserId], [Name], [Notes], [CopiedFromId], [LogDate], [StartAt], [FinishAt], [Bodyweight], [BodyweightUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [IsCompleted]) VALUES (18, 1, N'Navigation test with new route', NULL, NULL, CAST(N'2026-01-31' AS Date), NULL, NULL, CAST(90.00 AS Decimal(18, 2)), 1, CAST(N'2026-01-31T13:13:25.8584851' AS DateTime2), 1, CAST(N'2026-01-31T13:13:25.8584851' AS DateTime2), 1, CAST(N'2026-02-08T18:15:42.1520077' AS DateTime2), 1, 0, NULL)
GO
INSERT [dbo].[Workout] ([Id], [UserId], [Name], [Notes], [CopiedFromId], [LogDate], [StartAt], [FinishAt], [Bodyweight], [BodyweightUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [IsCompleted]) VALUES (19, 1, N'2nd test', NULL, NULL, CAST(N'2026-01-31' AS Date), NULL, NULL, CAST(90.00 AS Decimal(18, 2)), 1, CAST(N'2026-01-31T13:14:07.8547927' AS DateTime2), 1, CAST(N'2026-01-31T13:14:07.8547927' AS DateTime2), 1, CAST(N'2026-02-08T18:15:38.9273758' AS DateTime2), 1, 0, NULL)
GO
INSERT [dbo].[Workout] ([Id], [UserId], [Name], [Notes], [CopiedFromId], [LogDate], [StartAt], [FinishAt], [Bodyweight], [BodyweightUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [IsCompleted]) VALUES (20, 1, N'Close grip testing', NULL, NULL, CAST(N'2026-01-31' AS Date), NULL, NULL, CAST(90.00 AS Decimal(18, 2)), 1, CAST(N'2026-01-31T13:14:39.9599618' AS DateTime2), 1, CAST(N'2026-02-17T11:49:39.5785334' AS DateTime2), 1, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[Workout] ([Id], [UserId], [Name], [Notes], [CopiedFromId], [LogDate], [StartAt], [FinishAt], [Bodyweight], [BodyweightUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [IsCompleted]) VALUES (21, 1, N'4th test', NULL, NULL, CAST(N'2026-01-31' AS Date), NULL, NULL, CAST(90.00 AS Decimal(18, 2)), 1, CAST(N'2026-01-31T13:19:53.4945963' AS DateTime2), 1, CAST(N'2026-01-31T13:19:53.4945963' AS DateTime2), 1, CAST(N'2026-02-08T18:15:35.3508118' AS DateTime2), 1, 0, NULL)
GO
INSERT [dbo].[Workout] ([Id], [UserId], [Name], [Notes], [CopiedFromId], [LogDate], [StartAt], [FinishAt], [Bodyweight], [BodyweightUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [IsCompleted]) VALUES (22, 1, N'5th test', NULL, NULL, CAST(N'2026-01-31' AS Date), NULL, NULL, CAST(90.00 AS Decimal(18, 2)), 1, CAST(N'2026-01-31T13:20:48.8873365' AS DateTime2), 1, CAST(N'2026-01-31T13:20:48.8873365' AS DateTime2), 1, CAST(N'2026-02-08T18:15:31.9453520' AS DateTime2), 1, 0, NULL)
GO
INSERT [dbo].[Workout] ([Id], [UserId], [Name], [Notes], [CopiedFromId], [LogDate], [StartAt], [FinishAt], [Bodyweight], [BodyweightUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [IsCompleted]) VALUES (23, 2, N'Nemanjas first workout', N'trying new workout app', NULL, CAST(N'2026-01-31' AS Date), CAST(N'21:30:00' AS Time), CAST(N'21:50:00' AS Time), NULL, NULL, CAST(N'2026-01-31T17:28:01.2766201' AS DateTime2), 2, CAST(N'2026-02-17T11:56:17.5293281' AS DateTime2), 2, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[Workout] ([Id], [UserId], [Name], [Notes], [CopiedFromId], [LogDate], [StartAt], [FinishAt], [Bodyweight], [BodyweightUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [IsCompleted]) VALUES (24, 3, N'Heavy Bench Day', N'Focus on paused strength work', NULL, CAST(N'2025-12-14' AS Date), CAST(N'18:05:00' AS Time), CAST(N'19:25:00' AS Time), NULL, NULL, CAST(N'2026-02-17T13:21:13.9029660' AS DateTime2), 3, CAST(N'2026-02-17T13:23:20.5471068' AS DateTime2), 3, NULL, NULL, 1, 1)
GO
INSERT [dbo].[Workout] ([Id], [UserId], [Name], [Notes], [CopiedFromId], [LogDate], [StartAt], [FinishAt], [Bodyweight], [BodyweightUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [IsCompleted]) VALUES (25, 3, N'Deadlift Intensity', NULL, NULL, CAST(N'2026-01-10' AS Date), NULL, NULL, NULL, NULL, CAST(N'2026-02-17T13:25:19.2841046' AS DateTime2), 3, CAST(N'2026-02-17T13:26:50.7431741' AS DateTime2), 3, NULL, NULL, 1, 1)
GO
INSERT [dbo].[Workout] ([Id], [UserId], [Name], [Notes], [CopiedFromId], [LogDate], [StartAt], [FinishAt], [Bodyweight], [BodyweightUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [IsCompleted]) VALUES (26, 3, N'Squat Volume', NULL, NULL, CAST(N'2026-02-17' AS Date), NULL, NULL, NULL, NULL, CAST(N'2026-02-17T13:28:10.8754323' AS DateTime2), 3, CAST(N'2026-02-17T13:29:43.7677025' AS DateTime2), 3, NULL, NULL, 1, 1)
GO
INSERT [dbo].[Workout] ([Id], [UserId], [Name], [Notes], [CopiedFromId], [LogDate], [StartAt], [FinishAt], [Bodyweight], [BodyweightUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [IsCompleted]) VALUES (27, 4, N'🏋️Workout 1', NULL, NULL, CAST(N'2025-12-18' AS Date), NULL, NULL, NULL, NULL, CAST(N'2026-02-17T13:30:55.0455016' AS DateTime2), 4, CAST(N'2026-02-17T13:31:46.6279215' AS DateTime2), 4, NULL, NULL, 1, 1)
GO
INSERT [dbo].[Workout] ([Id], [UserId], [Name], [Notes], [CopiedFromId], [LogDate], [StartAt], [FinishAt], [Bodyweight], [BodyweightUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [IsCompleted]) VALUES (28, 4, N'🏋️Workout 2', NULL, NULL, CAST(N'2026-01-20' AS Date), NULL, NULL, NULL, NULL, CAST(N'2026-02-17T13:32:16.8253116' AS DateTime2), 4, CAST(N'2026-02-17T13:33:06.1194371' AS DateTime2), 4, NULL, NULL, 1, 1)
GO
INSERT [dbo].[Workout] ([Id], [UserId], [Name], [Notes], [CopiedFromId], [LogDate], [StartAt], [FinishAt], [Bodyweight], [BodyweightUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [IsCompleted]) VALUES (29, 5, N'Clean and Press - Focus', NULL, NULL, CAST(N'2025-12-12' AS Date), NULL, NULL, NULL, NULL, CAST(N'2026-02-17T13:36:01.8691971' AS DateTime2), 5, CAST(N'2026-02-17T13:36:58.6056957' AS DateTime2), 5, NULL, NULL, 1, 1)
GO
INSERT [dbo].[Workout] ([Id], [UserId], [Name], [Notes], [CopiedFromId], [LogDate], [StartAt], [FinishAt], [Bodyweight], [BodyweightUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [IsCompleted]) VALUES (30, 5, N'Lower - Focus', NULL, NULL, CAST(N'2026-02-05' AS Date), NULL, NULL, NULL, NULL, CAST(N'2026-02-17T13:37:22.0545408' AS DateTime2), 5, CAST(N'2026-02-17T13:37:22.0545408' AS DateTime2), 5, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[Workout] ([Id], [UserId], [Name], [Notes], [CopiedFromId], [LogDate], [StartAt], [FinishAt], [Bodyweight], [BodyweightUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [IsCompleted]) VALUES (31, 6, N'Push', NULL, NULL, CAST(N'2025-12-17' AS Date), NULL, NULL, NULL, NULL, CAST(N'2026-02-17T13:41:44.9733013' AS DateTime2), 6, CAST(N'2026-02-17T13:44:06.3202748' AS DateTime2), 6, NULL, NULL, 1, 1)
GO
INSERT [dbo].[Workout] ([Id], [UserId], [Name], [Notes], [CopiedFromId], [LogDate], [StartAt], [FinishAt], [Bodyweight], [BodyweightUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [IsCompleted]) VALUES (32, 6, N'Pull', NULL, NULL, CAST(N'2026-02-17' AS Date), NULL, NULL, NULL, NULL, CAST(N'2026-02-17T13:44:33.4778062' AS DateTime2), 6, CAST(N'2026-02-17T13:45:19.2182089' AS DateTime2), 6, NULL, NULL, 1, 1)
GO
INSERT [dbo].[Workout] ([Id], [UserId], [Name], [Notes], [CopiedFromId], [LogDate], [StartAt], [FinishAt], [Bodyweight], [BodyweightUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [IsCompleted]) VALUES (33, 7, N'First workout', NULL, NULL, CAST(N'2025-12-28' AS Date), NULL, NULL, NULL, NULL, CAST(N'2026-02-17T13:46:15.5218862' AS DateTime2), 7, CAST(N'2026-02-17T13:48:33.6206103' AS DateTime2), 7, NULL, NULL, 1, 1)
GO
INSERT [dbo].[Workout] ([Id], [UserId], [Name], [Notes], [CopiedFromId], [LogDate], [StartAt], [FinishAt], [Bodyweight], [BodyweightUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [IsCompleted]) VALUES (34, 8, N'Lower body', N'Strength focused', NULL, CAST(N'2025-12-20' AS Date), NULL, NULL, NULL, NULL, CAST(N'2026-02-17T13:51:36.2512351' AS DateTime2), 8, CAST(N'2026-02-17T13:52:28.5587679' AS DateTime2), 8, NULL, NULL, 1, 1)
GO
INSERT [dbo].[Workout] ([Id], [UserId], [Name], [Notes], [CopiedFromId], [LogDate], [StartAt], [FinishAt], [Bodyweight], [BodyweightUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [IsCompleted]) VALUES (35, 10, N'Workout 1', NULL, NULL, CAST(N'2026-01-17' AS Date), NULL, NULL, NULL, NULL, CAST(N'2026-02-17T14:02:02.7720700' AS DateTime2), 10, CAST(N'2026-02-17T14:02:02.7720700' AS DateTime2), 10, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[Workout] ([Id], [UserId], [Name], [Notes], [CopiedFromId], [LogDate], [StartAt], [FinishAt], [Bodyweight], [BodyweightUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [IsCompleted]) VALUES (36, 13, N'w1 - Upper A', NULL, NULL, CAST(N'2026-01-22' AS Date), CAST(N'19:58:00' AS Time), CAST(N'21:14:00' AS Time), CAST(86.00 AS Decimal(18, 2)), 1, CAST(N'2026-02-17T17:49:26.3289327' AS DateTime2), 13, CAST(N'2026-02-17T17:55:58.9787940' AS DateTime2), 13, NULL, NULL, 1, 1)
GO
INSERT [dbo].[Workout] ([Id], [UserId], [Name], [Notes], [CopiedFromId], [LogDate], [StartAt], [FinishAt], [Bodyweight], [BodyweightUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [IsCompleted]) VALUES (37, 13, N'w1 - Lower A', NULL, NULL, CAST(N'2026-01-23' AS Date), CAST(N'21:09:00' AS Time), CAST(N'22:21:00' AS Time), CAST(86.00 AS Decimal(18, 2)), 1, CAST(N'2026-02-17T17:56:45.6858498' AS DateTime2), 13, CAST(N'2026-02-17T18:01:06.1955452' AS DateTime2), 13, NULL, NULL, 1, 1)
GO
INSERT [dbo].[Workout] ([Id], [UserId], [Name], [Notes], [CopiedFromId], [LogDate], [StartAt], [FinishAt], [Bodyweight], [BodyweightUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [IsCompleted]) VALUES (38, 13, N'w1 - Upper B', NULL, NULL, CAST(N'2026-01-25' AS Date), NULL, NULL, CAST(85.60 AS Decimal(18, 2)), 1, CAST(N'2026-02-21T09:12:46.8465996' AS DateTime2), 13, CAST(N'2026-02-21T10:31:18.2146598' AS DateTime2), 13, NULL, NULL, 1, 1)
GO
INSERT [dbo].[Workout] ([Id], [UserId], [Name], [Notes], [CopiedFromId], [LogDate], [StartAt], [FinishAt], [Bodyweight], [BodyweightUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [IsCompleted]) VALUES (39, 13, N'w1 - Lower B', NULL, NULL, CAST(N'2026-01-28' AS Date), NULL, NULL, CAST(87.50 AS Decimal(18, 2)), 1, CAST(N'2026-02-21T10:45:10.7281298' AS DateTime2), 13, CAST(N'2026-02-21T10:47:20.8862629' AS DateTime2), 13, NULL, NULL, 1, 1)
GO
INSERT [dbo].[Workout] ([Id], [UserId], [Name], [Notes], [CopiedFromId], [LogDate], [StartAt], [FinishAt], [Bodyweight], [BodyweightUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [IsCompleted]) VALUES (40, 13, N'w2 - Upper A', NULL, 36, CAST(N'2026-01-30' AS Date), NULL, NULL, CAST(88.10 AS Decimal(18, 2)), 1, CAST(N'2026-02-21T10:51:04.6663454' AS DateTime2), 13, CAST(N'2026-02-21T10:51:57.7810933' AS DateTime2), 13, NULL, NULL, 1, 1)
GO
INSERT [dbo].[Workout] ([Id], [UserId], [Name], [Notes], [CopiedFromId], [LogDate], [StartAt], [FinishAt], [Bodyweight], [BodyweightUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [IsCompleted]) VALUES (41, 13, N'w2 - Lower A', NULL, 37, CAST(N'2026-01-31' AS Date), NULL, NULL, CAST(87.50 AS Decimal(18, 2)), 1, CAST(N'2026-02-21T10:52:19.0965891' AS DateTime2), 13, CAST(N'2026-02-21T10:53:00.9986435' AS DateTime2), 13, NULL, NULL, 1, 1)
GO
INSERT [dbo].[Workout] ([Id], [UserId], [Name], [Notes], [CopiedFromId], [LogDate], [StartAt], [FinishAt], [Bodyweight], [BodyweightUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [IsCompleted]) VALUES (42, 13, N'w2 - Upper B', NULL, 38, CAST(N'2026-02-02' AS Date), NULL, NULL, CAST(87.50 AS Decimal(18, 2)), 1, CAST(N'2026-02-21T10:55:21.6619210' AS DateTime2), 13, CAST(N'2026-02-21T10:55:52.4911292' AS DateTime2), 13, NULL, NULL, 1, 1)
GO
INSERT [dbo].[Workout] ([Id], [UserId], [Name], [Notes], [CopiedFromId], [LogDate], [StartAt], [FinishAt], [Bodyweight], [BodyweightUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [IsCompleted]) VALUES (43, 13, N'w2 - Lower B', NULL, 39, CAST(N'2026-02-04' AS Date), NULL, NULL, CAST(87.50 AS Decimal(18, 2)), 1, CAST(N'2026-02-21T10:56:19.0738714' AS DateTime2), 13, CAST(N'2026-02-21T10:57:03.8461598' AS DateTime2), 13, NULL, NULL, 1, 1)
GO
INSERT [dbo].[Workout] ([Id], [UserId], [Name], [Notes], [CopiedFromId], [LogDate], [StartAt], [FinishAt], [Bodyweight], [BodyweightUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [IsCompleted]) VALUES (44, 13, N'w3 - Upper A', NULL, 40, CAST(N'2026-02-06' AS Date), NULL, NULL, CAST(87.40 AS Decimal(18, 2)), 1, CAST(N'2026-02-21T11:01:56.5306438' AS DateTime2), 13, CAST(N'2026-02-21T11:02:21.5011737' AS DateTime2), 13, NULL, NULL, 1, 1)
GO
INSERT [dbo].[Workout] ([Id], [UserId], [Name], [Notes], [CopiedFromId], [LogDate], [StartAt], [FinishAt], [Bodyweight], [BodyweightUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [IsCompleted]) VALUES (45, 13, N'w3 - Lower A', NULL, 41, CAST(N'2026-02-07' AS Date), NULL, NULL, CAST(86.50 AS Decimal(18, 2)), 1, CAST(N'2026-02-21T11:02:46.8333574' AS DateTime2), 13, CAST(N'2026-02-21T11:03:16.2959699' AS DateTime2), 13, NULL, NULL, 1, 1)
GO
INSERT [dbo].[Workout] ([Id], [UserId], [Name], [Notes], [CopiedFromId], [LogDate], [StartAt], [FinishAt], [Bodyweight], [BodyweightUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [IsCompleted]) VALUES (46, 13, N'w3 - Upper B', NULL, 42, CAST(N'2026-02-09' AS Date), NULL, NULL, CAST(87.20 AS Decimal(18, 2)), 1, CAST(N'2026-02-21T11:03:51.9074516' AS DateTime2), 13, CAST(N'2026-02-21T11:04:11.1444586' AS DateTime2), 13, NULL, NULL, 1, 1)
GO
INSERT [dbo].[Workout] ([Id], [UserId], [Name], [Notes], [CopiedFromId], [LogDate], [StartAt], [FinishAt], [Bodyweight], [BodyweightUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [IsCompleted]) VALUES (47, 13, N'w3 - Lower B', NULL, 43, CAST(N'2026-02-10' AS Date), NULL, NULL, CAST(87.90 AS Decimal(18, 2)), 1, CAST(N'2026-02-21T11:04:36.6609161' AS DateTime2), 13, CAST(N'2026-02-21T11:04:59.6731479' AS DateTime2), 13, NULL, NULL, 1, 1)
GO
INSERT [dbo].[Workout] ([Id], [UserId], [Name], [Notes], [CopiedFromId], [LogDate], [StartAt], [FinishAt], [Bodyweight], [BodyweightUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [IsCompleted]) VALUES (48, 13, N'w4 - Upper A', NULL, 44, CAST(N'2026-02-12' AS Date), NULL, NULL, CAST(87.60 AS Decimal(18, 2)), 1, CAST(N'2026-02-21T11:07:55.0843847' AS DateTime2), 13, CAST(N'2026-02-21T11:08:27.6863647' AS DateTime2), 13, NULL, NULL, 1, 1)
GO
INSERT [dbo].[Workout] ([Id], [UserId], [Name], [Notes], [CopiedFromId], [LogDate], [StartAt], [FinishAt], [Bodyweight], [BodyweightUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [IsCompleted]) VALUES (49, 13, N'w4 - Lower A', NULL, 45, CAST(N'2026-02-14' AS Date), NULL, NULL, CAST(87.30 AS Decimal(18, 2)), 1, CAST(N'2026-02-21T11:08:49.3425472' AS DateTime2), 13, CAST(N'2026-02-21T11:09:16.2724179' AS DateTime2), 13, NULL, NULL, 1, 1)
GO
INSERT [dbo].[Workout] ([Id], [UserId], [Name], [Notes], [CopiedFromId], [LogDate], [StartAt], [FinishAt], [Bodyweight], [BodyweightUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [IsCompleted]) VALUES (50, 13, N'w4 - Upper B', NULL, 46, CAST(N'2026-02-16' AS Date), NULL, NULL, CAST(87.30 AS Decimal(18, 2)), 1, CAST(N'2026-02-21T11:15:20.2949868' AS DateTime2), 13, CAST(N'2026-02-21T11:15:44.0261530' AS DateTime2), 13, NULL, NULL, 1, 1)
GO
INSERT [dbo].[Workout] ([Id], [UserId], [Name], [Notes], [CopiedFromId], [LogDate], [StartAt], [FinishAt], [Bodyweight], [BodyweightUnitId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [IsCompleted]) VALUES (51, 13, N'w4 - Lower B', NULL, 47, CAST(N'2026-02-17' AS Date), NULL, NULL, CAST(86.60 AS Decimal(18, 2)), 1, CAST(N'2026-02-21T11:16:04.8788384' AS DateTime2), 13, CAST(N'2026-02-21T11:16:25.5391432' AS DateTime2), 13, NULL, NULL, 1, 1)
GO
SET IDENTITY_INSERT [dbo].[Workout] OFF
GO
SET IDENTITY_INSERT [dbo].[WorkoutExercise] ON 
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (48, 16, 72, NULL, CAST(N'2026-01-25T15:41:35.9745062' AS DateTime2), 1, CAST(N'2026-01-25T15:43:42.7358868' AS DateTime2), 1, NULL, NULL, 1, 3)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (49, 16, 76, NULL, CAST(N'2026-01-25T15:42:36.3490708' AS DateTime2), 1, CAST(N'2026-01-25T15:43:46.0384506' AS DateTime2), 1, NULL, NULL, 1, 2)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (50, 16, 111, NULL, CAST(N'2026-01-25T15:43:38.2270467' AS DateTime2), 1, CAST(N'2026-01-25T15:43:46.0384506' AS DateTime2), 1, NULL, NULL, 1, 1)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (51, 22, 73, NULL, CAST(N'2026-01-31T13:24:54.9763347' AS DateTime2), 1, CAST(N'2026-01-31T13:24:54.9763347' AS DateTime2), 1, CAST(N'2026-02-08T18:15:31.9453520' AS DateTime2), 1, 0, 1)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (52, 23, 72, NULL, CAST(N'2026-01-31T17:28:13.6155976' AS DateTime2), 2, CAST(N'2026-01-31T17:28:13.6155976' AS DateTime2), 2, NULL, NULL, 1, 1)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (53, 23, 76, NULL, CAST(N'2026-01-31T17:28:39.2950914' AS DateTime2), 2, CAST(N'2026-01-31T17:28:39.2950914' AS DateTime2), 2, NULL, NULL, 1, 2)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (54, 23, 76, NULL, CAST(N'2026-01-31T17:29:06.2645676' AS DateTime2), 2, CAST(N'2026-01-31T17:29:06.2645676' AS DateTime2), 2, CAST(N'2026-01-31T17:36:12.1527910' AS DateTime2), 2, 0, 3)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (55, 23, 79, NULL, CAST(N'2026-01-31T17:36:16.7877225' AS DateTime2), 2, CAST(N'2026-01-31T17:36:16.7877225' AS DateTime2), 2, NULL, NULL, 1, 3)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (56, 23, 74, NULL, CAST(N'2026-02-01T09:54:51.8172193' AS DateTime2), 2, CAST(N'2026-02-01T09:54:51.8172193' AS DateTime2), 2, NULL, NULL, 1, 4)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (57, 1, 72, NULL, CAST(N'2026-02-01T12:50:06.4312074' AS DateTime2), 1, CAST(N'2026-02-08T18:12:27.8126254' AS DateTime2), 1, NULL, NULL, 1, 2)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (58, 5, 72, NULL, CAST(N'2026-02-01T12:50:38.2261988' AS DateTime2), 1, CAST(N'2026-02-01T12:50:38.2261988' AS DateTime2), 1, CAST(N'2026-02-08T18:12:45.2067890' AS DateTime2), 1, 0, 1)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (59, 2, 72, NULL, CAST(N'2026-02-01T12:50:50.7433501' AS DateTime2), 1, CAST(N'2026-02-01T12:50:50.7433501' AS DateTime2), 1, NULL, NULL, 1, 1)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (60, 7, 72, NULL, CAST(N'2026-02-01T12:51:39.2926354' AS DateTime2), 1, CAST(N'2026-02-01T12:51:39.2926354' AS DateTime2), 1, CAST(N'2026-02-08T18:15:12.9007931' AS DateTime2), 1, 0, 1)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (61, 13, 72, N'waaw', CAST(N'2026-02-01T12:51:59.6994724' AS DateTime2), 1, CAST(N'2026-02-07T16:13:58.5035891' AS DateTime2), 1, NULL, NULL, 1, 1)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (62, 15, 72, NULL, CAST(N'2026-02-01T12:52:22.9621664' AS DateTime2), 1, CAST(N'2026-02-01T12:52:22.9621664' AS DateTime2), 1, NULL, NULL, 1, 1)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (63, 20, 72, NULL, CAST(N'2026-02-01T12:53:04.8152348' AS DateTime2), 1, CAST(N'2026-02-01T12:53:04.8152348' AS DateTime2), 1, NULL, NULL, 1, 1)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (64, 1, 102, NULL, CAST(N'2026-02-01T13:04:01.5810406' AS DateTime2), 1, CAST(N'2026-02-08T18:12:25.6877227' AS DateTime2), 1, NULL, NULL, 1, 3)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (65, 6, 102, NULL, CAST(N'2026-02-01T13:04:13.7806768' AS DateTime2), 1, CAST(N'2026-02-01T13:04:13.7806768' AS DateTime2), 1, NULL, NULL, 1, 1)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (66, 13, 102, NULL, CAST(N'2026-02-01T13:04:24.7492542' AS DateTime2), 1, CAST(N'2026-02-01T13:04:24.7492542' AS DateTime2), 1, NULL, NULL, 1, 2)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (67, 13, 100, NULL, CAST(N'2026-02-01T14:56:59.3935120' AS DateTime2), 1, CAST(N'2026-02-01T14:56:59.3935120' AS DateTime2), 1, CAST(N'2026-02-01T14:58:00.8742907' AS DateTime2), 1, 0, 3)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (68, 13, 100, NULL, CAST(N'2026-02-01T14:58:13.6702541' AS DateTime2), 1, CAST(N'2026-02-01T14:58:13.6702541' AS DateTime2), 1, NULL, NULL, 1, 3)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (69, 1, 85, NULL, CAST(N'2026-02-08T18:11:53.5333986' AS DateTime2), 1, CAST(N'2026-02-08T18:12:27.8126254' AS DateTime2), 1, NULL, NULL, 1, 1)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (70, 11, 109, NULL, CAST(N'2026-02-17T11:43:58.6247580' AS DateTime2), 1, CAST(N'2026-02-17T11:43:58.6247580' AS DateTime2), 1, NULL, NULL, 1, 1)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (71, 11, 99, NULL, CAST(N'2026-02-17T11:44:10.5220654' AS DateTime2), 1, CAST(N'2026-02-17T11:44:10.5220654' AS DateTime2), 1, NULL, NULL, 1, 2)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (72, 11, 97, NULL, CAST(N'2026-02-17T11:44:17.8645016' AS DateTime2), 1, CAST(N'2026-02-17T11:44:17.8645016' AS DateTime2), 1, NULL, NULL, 1, 3)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (73, 10, 72, NULL, CAST(N'2026-02-17T11:46:19.6734273' AS DateTime2), 1, CAST(N'2026-02-17T11:46:19.6734273' AS DateTime2), 1, NULL, NULL, 1, 1)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (74, 10, 84, NULL, CAST(N'2026-02-17T11:46:23.5859727' AS DateTime2), 1, CAST(N'2026-02-17T11:46:23.5859727' AS DateTime2), 1, NULL, NULL, 1, 2)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (75, 10, 91, NULL, CAST(N'2026-02-17T11:46:30.1214446' AS DateTime2), 1, CAST(N'2026-02-17T11:46:30.1214446' AS DateTime2), 1, NULL, NULL, 1, 3)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (76, 24, 73, NULL, CAST(N'2026-02-17T13:21:21.8817068' AS DateTime2), 3, CAST(N'2026-02-17T13:21:21.8817068' AS DateTime2), 3, NULL, NULL, 1, 1)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (77, 24, 72, NULL, CAST(N'2026-02-17T13:21:27.9721211' AS DateTime2), 3, CAST(N'2026-02-17T13:21:27.9721211' AS DateTime2), 3, NULL, NULL, 1, 2)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (78, 25, 92, NULL, CAST(N'2026-02-17T13:25:24.8268750' AS DateTime2), 3, CAST(N'2026-02-17T13:25:24.8268750' AS DateTime2), 3, NULL, NULL, 1, 1)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (79, 25, 103, NULL, CAST(N'2026-02-17T13:25:31.1036348' AS DateTime2), 3, CAST(N'2026-02-17T13:25:31.1036348' AS DateTime2), 3, NULL, NULL, 1, 2)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (80, 26, 111, NULL, CAST(N'2026-02-17T13:28:24.6067590' AS DateTime2), 3, CAST(N'2026-02-17T13:28:24.6067590' AS DateTime2), 3, NULL, NULL, 1, 1)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (81, 26, 99, NULL, CAST(N'2026-02-17T13:28:29.7570175' AS DateTime2), 3, CAST(N'2026-02-17T13:28:29.7570175' AS DateTime2), 3, NULL, NULL, 1, 2)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (82, 27, 74, NULL, CAST(N'2026-02-17T13:31:03.0574915' AS DateTime2), 4, CAST(N'2026-02-17T13:31:03.0574915' AS DateTime2), 4, NULL, NULL, 1, 1)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (83, 27, 82, NULL, CAST(N'2026-02-17T13:31:09.1135800' AS DateTime2), 4, CAST(N'2026-02-17T13:31:09.1135800' AS DateTime2), 4, NULL, NULL, 1, 2)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (84, 28, 110, NULL, CAST(N'2026-02-17T13:32:22.3809588' AS DateTime2), 4, CAST(N'2026-02-17T13:32:22.3809588' AS DateTime2), 4, NULL, NULL, 1, 1)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (85, 28, 97, NULL, CAST(N'2026-02-17T13:32:27.9069305' AS DateTime2), 4, CAST(N'2026-02-17T13:32:27.9069305' AS DateTime2), 4, NULL, NULL, 1, 2)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (86, 29, 85, NULL, CAST(N'2026-02-17T13:36:07.8510013' AS DateTime2), 5, CAST(N'2026-02-17T13:36:07.8510013' AS DateTime2), 5, NULL, NULL, 1, 1)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (87, 29, 109, NULL, CAST(N'2026-02-17T13:36:12.6166309' AS DateTime2), 5, CAST(N'2026-02-17T13:36:12.6166309' AS DateTime2), 5, NULL, NULL, 1, 2)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (88, 30, 110, NULL, CAST(N'2026-02-17T13:37:30.1487935' AS DateTime2), 5, CAST(N'2026-02-17T13:37:30.1487935' AS DateTime2), 5, NULL, NULL, 1, 1)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (89, 30, 93, NULL, CAST(N'2026-02-17T13:37:35.7288727' AS DateTime2), 5, CAST(N'2026-02-17T13:37:35.7288727' AS DateTime2), 5, NULL, NULL, 1, 2)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (90, 31, 75, NULL, CAST(N'2026-02-17T13:41:52.8914100' AS DateTime2), 6, CAST(N'2026-02-17T13:41:52.8914100' AS DateTime2), 6, NULL, NULL, 1, 1)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (91, 31, 91, NULL, CAST(N'2026-02-17T13:41:57.6244786' AS DateTime2), 6, CAST(N'2026-02-17T13:41:57.6244786' AS DateTime2), 6, NULL, NULL, 1, 2)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (92, 31, 84, NULL, CAST(N'2026-02-17T13:42:02.9314361' AS DateTime2), 6, CAST(N'2026-02-17T13:42:02.9314361' AS DateTime2), 6, NULL, NULL, 1, 3)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (93, 32, 83, NULL, CAST(N'2026-02-17T13:44:41.7665512' AS DateTime2), 6, CAST(N'2026-02-17T13:44:41.7665512' AS DateTime2), 6, NULL, NULL, 1, 1)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (94, 32, 87, NULL, CAST(N'2026-02-17T13:44:47.4080420' AS DateTime2), 6, CAST(N'2026-02-17T13:44:47.4080420' AS DateTime2), 6, NULL, NULL, 1, 2)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (95, 33, 94, NULL, CAST(N'2026-02-17T13:46:36.7232544' AS DateTime2), 7, CAST(N'2026-02-17T13:46:36.7232544' AS DateTime2), 7, NULL, NULL, 1, 1)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (96, 33, 76, NULL, CAST(N'2026-02-17T13:46:42.4670594' AS DateTime2), 7, CAST(N'2026-02-17T13:46:42.4670594' AS DateTime2), 7, NULL, NULL, 1, 2)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (97, 34, 111, NULL, CAST(N'2026-02-17T13:51:51.9501244' AS DateTime2), 8, CAST(N'2026-02-17T13:51:51.9501244' AS DateTime2), 8, NULL, NULL, 1, 1)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (98, 34, 94, NULL, CAST(N'2026-02-17T13:51:58.6843316' AS DateTime2), 8, CAST(N'2026-02-17T13:51:58.6843316' AS DateTime2), 8, NULL, NULL, 1, 2)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (99, 35, 110, NULL, CAST(N'2026-02-17T14:02:08.5496046' AS DateTime2), 10, CAST(N'2026-02-17T14:02:08.5496046' AS DateTime2), 10, NULL, NULL, 1, 1)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (100, 35, 96, NULL, CAST(N'2026-02-17T14:02:12.8729280' AS DateTime2), 10, CAST(N'2026-02-17T14:02:12.8729280' AS DateTime2), 10, NULL, NULL, 1, 2)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (101, 36, 73, N'Comp standard - 5, 3, 1', CAST(N'2026-02-17T17:49:35.6743653' AS DateTime2), 13, CAST(N'2026-02-17T17:51:07.0886820' AS DateTime2), 13, NULL, NULL, 1, 1)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (102, 36, 76, N'> 15', CAST(N'2026-02-17T17:51:14.5143868' AS DateTime2), 13, CAST(N'2026-02-17T17:51:41.5738808' AS DateTime2), 13, NULL, NULL, 1, 2)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (103, 36, 81, NULL, CAST(N'2026-02-17T17:51:51.5866576' AS DateTime2), 13, CAST(N'2026-02-17T17:51:51.5866576' AS DateTime2), 13, NULL, NULL, 1, 3)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (104, 36, 83, N'> 12', CAST(N'2026-02-17T17:52:31.4615472' AS DateTime2), 13, CAST(N'2026-02-17T17:52:38.5643428' AS DateTime2), 13, NULL, NULL, 1, 4)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (105, 36, 84, N'> 12', CAST(N'2026-02-17T17:52:56.3397521' AS DateTime2), 13, CAST(N'2026-02-17T17:53:13.7912543' AS DateTime2), 13, NULL, NULL, 1, 5)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (106, 36, 86, N'Power curls', CAST(N'2026-02-17T17:53:21.5083533' AS DateTime2), 13, CAST(N'2026-02-17T17:53:52.9693856' AS DateTime2), 13, NULL, NULL, 1, 6)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (107, 36, 90, N'> 10, seated', CAST(N'2026-02-17T17:54:01.0337112' AS DateTime2), 13, CAST(N'2026-02-17T17:54:08.3820378' AS DateTime2), 13, NULL, NULL, 1, 7)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (108, 36, 91, NULL, CAST(N'2026-02-17T17:54:32.4295121' AS DateTime2), 13, CAST(N'2026-02-17T17:54:32.4295121' AS DateTime2), 13, NULL, NULL, 1, 8)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (109, 37, 92, N'6, 4, 2', CAST(N'2026-02-17T17:56:56.0036064' AS DateTime2), 13, CAST(N'2026-02-17T17:57:06.3104481' AS DateTime2), 13, NULL, NULL, 1, 1)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (110, 37, 96, N'> 16', CAST(N'2026-02-17T17:58:38.9895094' AS DateTime2), 13, CAST(N'2026-02-17T17:58:45.6719341' AS DateTime2), 13, NULL, NULL, 1, 2)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (111, 37, 97, NULL, CAST(N'2026-02-17T17:59:38.0308498' AS DateTime2), 13, CAST(N'2026-02-17T17:59:38.0308498' AS DateTime2), 13, NULL, NULL, 1, 3)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (112, 37, 101, NULL, CAST(N'2026-02-17T18:00:44.2881262' AS DateTime2), 13, CAST(N'2026-02-17T18:00:44.2881262' AS DateTime2), 13, NULL, NULL, 1, 4)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (113, 38, 104, NULL, CAST(N'2026-02-21T09:13:20.4507010' AS DateTime2), 13, CAST(N'2026-02-21T09:13:20.4507010' AS DateTime2), 13, NULL, NULL, 1, 1)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (114, 38, 76, NULL, CAST(N'2026-02-21T09:14:21.7801174' AS DateTime2), 13, CAST(N'2026-02-21T09:14:21.7801174' AS DateTime2), 13, NULL, NULL, 1, 2)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (115, 38, 103, NULL, CAST(N'2026-02-21T09:14:50.7076597' AS DateTime2), 13, CAST(N'2026-02-21T09:14:50.7076597' AS DateTime2), 13, NULL, NULL, 1, 3)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (116, 38, 86, NULL, CAST(N'2026-02-21T10:30:12.3866928' AS DateTime2), 13, CAST(N'2026-02-21T10:30:12.3866928' AS DateTime2), 13, NULL, NULL, 1, 4)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (117, 38, 86, NULL, CAST(N'2026-02-21T10:30:29.1651139' AS DateTime2), 13, CAST(N'2026-02-21T10:30:29.1651139' AS DateTime2), 13, CAST(N'2026-02-21T10:30:41.3880762' AS DateTime2), 13, 0, 4)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (118, 38, 86, NULL, CAST(N'2026-02-21T10:30:32.6344191' AS DateTime2), 13, CAST(N'2026-02-21T10:30:32.6344191' AS DateTime2), 13, CAST(N'2026-02-21T10:30:39.2184765' AS DateTime2), 13, 0, 4)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (119, 39, 111, NULL, CAST(N'2026-02-21T10:45:23.2115430' AS DateTime2), 13, CAST(N'2026-02-21T10:45:23.2115430' AS DateTime2), 13, NULL, NULL, 1, 1)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (120, 39, 96, NULL, CAST(N'2026-02-21T10:46:15.5169204' AS DateTime2), 13, CAST(N'2026-02-21T10:46:15.5169204' AS DateTime2), 13, NULL, NULL, 1, 2)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (121, 39, 99, NULL, CAST(N'2026-02-21T10:46:50.9969629' AS DateTime2), 13, CAST(N'2026-02-21T10:46:50.9969629' AS DateTime2), 13, NULL, NULL, 1, 3)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (122, 40, 73, N'Comp standard - 5, 3, 1', CAST(N'2026-02-21T10:51:04.6663454' AS DateTime2), 13, CAST(N'2026-02-21T10:51:04.6663454' AS DateTime2), 13, NULL, NULL, 1, 1)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (123, 40, 76, N'> 15', CAST(N'2026-02-21T10:51:04.6663454' AS DateTime2), 13, CAST(N'2026-02-21T10:51:04.6663454' AS DateTime2), 13, NULL, NULL, 1, 2)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (124, 40, 81, NULL, CAST(N'2026-02-21T10:51:04.6663454' AS DateTime2), 13, CAST(N'2026-02-21T10:51:04.6663454' AS DateTime2), 13, NULL, NULL, 1, 3)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (125, 40, 83, N'> 12', CAST(N'2026-02-21T10:51:04.6663454' AS DateTime2), 13, CAST(N'2026-02-21T10:51:04.6663454' AS DateTime2), 13, NULL, NULL, 1, 4)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (126, 40, 84, N'> 12', CAST(N'2026-02-21T10:51:04.6663454' AS DateTime2), 13, CAST(N'2026-02-21T10:51:04.6663454' AS DateTime2), 13, NULL, NULL, 1, 5)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (127, 40, 86, N'Power curls', CAST(N'2026-02-21T10:51:04.6663454' AS DateTime2), 13, CAST(N'2026-02-21T10:51:04.6663454' AS DateTime2), 13, NULL, NULL, 1, 6)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (128, 40, 90, N'> 10, seated', CAST(N'2026-02-21T10:51:04.6663454' AS DateTime2), 13, CAST(N'2026-02-21T10:51:04.6663454' AS DateTime2), 13, NULL, NULL, 1, 7)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (129, 40, 91, NULL, CAST(N'2026-02-21T10:51:04.6663454' AS DateTime2), 13, CAST(N'2026-02-21T10:51:04.6663454' AS DateTime2), 13, NULL, NULL, 1, 8)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (130, 41, 92, N'6, 4, 2', CAST(N'2026-02-21T10:52:19.0965891' AS DateTime2), 13, CAST(N'2026-02-21T10:52:19.0965891' AS DateTime2), 13, NULL, NULL, 1, 1)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (131, 41, 96, N'> 16', CAST(N'2026-02-21T10:52:19.0965891' AS DateTime2), 13, CAST(N'2026-02-21T10:52:19.0965891' AS DateTime2), 13, NULL, NULL, 1, 2)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (132, 41, 97, NULL, CAST(N'2026-02-21T10:52:19.0965891' AS DateTime2), 13, CAST(N'2026-02-21T10:52:19.0965891' AS DateTime2), 13, NULL, NULL, 1, 3)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (133, 41, 101, NULL, CAST(N'2026-02-21T10:52:19.0965891' AS DateTime2), 13, CAST(N'2026-02-21T10:52:19.0965891' AS DateTime2), 13, NULL, NULL, 1, 4)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (134, 42, 104, NULL, CAST(N'2026-02-21T10:55:21.6619210' AS DateTime2), 13, CAST(N'2026-02-21T10:55:21.6619210' AS DateTime2), 13, NULL, NULL, 1, 1)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (135, 42, 76, NULL, CAST(N'2026-02-21T10:55:21.6619210' AS DateTime2), 13, CAST(N'2026-02-21T10:55:21.6619210' AS DateTime2), 13, NULL, NULL, 1, 2)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (136, 42, 103, NULL, CAST(N'2026-02-21T10:55:21.6619210' AS DateTime2), 13, CAST(N'2026-02-21T10:55:21.6619210' AS DateTime2), 13, NULL, NULL, 1, 3)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (137, 42, 86, NULL, CAST(N'2026-02-21T10:55:21.6619210' AS DateTime2), 13, CAST(N'2026-02-21T10:55:21.6619210' AS DateTime2), 13, NULL, NULL, 1, 4)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (138, 43, 111, NULL, CAST(N'2026-02-21T10:56:19.0738714' AS DateTime2), 13, CAST(N'2026-02-21T10:56:19.0738714' AS DateTime2), 13, NULL, NULL, 1, 1)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (139, 43, 96, NULL, CAST(N'2026-02-21T10:56:19.0738714' AS DateTime2), 13, CAST(N'2026-02-21T10:56:19.0738714' AS DateTime2), 13, NULL, NULL, 1, 2)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (140, 43, 99, NULL, CAST(N'2026-02-21T10:56:19.0738714' AS DateTime2), 13, CAST(N'2026-02-21T10:56:19.0738714' AS DateTime2), 13, NULL, NULL, 1, 3)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (141, 44, 73, N'Comp standard - 5, 3, 1', CAST(N'2026-02-21T11:01:56.5306438' AS DateTime2), 13, CAST(N'2026-02-21T11:01:56.5306438' AS DateTime2), 13, NULL, NULL, 1, 1)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (142, 44, 76, N'> 15', CAST(N'2026-02-21T11:01:56.5306438' AS DateTime2), 13, CAST(N'2026-02-21T11:01:56.5306438' AS DateTime2), 13, NULL, NULL, 1, 2)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (143, 44, 81, NULL, CAST(N'2026-02-21T11:01:56.5306438' AS DateTime2), 13, CAST(N'2026-02-21T11:01:56.5306438' AS DateTime2), 13, NULL, NULL, 1, 3)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (144, 44, 83, N'> 12', CAST(N'2026-02-21T11:01:56.5306438' AS DateTime2), 13, CAST(N'2026-02-21T11:01:56.5306438' AS DateTime2), 13, NULL, NULL, 1, 4)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (145, 44, 84, N'> 12', CAST(N'2026-02-21T11:01:56.5306438' AS DateTime2), 13, CAST(N'2026-02-21T11:01:56.5306438' AS DateTime2), 13, NULL, NULL, 1, 5)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (146, 44, 86, N'Power curls', CAST(N'2026-02-21T11:01:56.5306438' AS DateTime2), 13, CAST(N'2026-02-21T11:01:56.5306438' AS DateTime2), 13, NULL, NULL, 1, 6)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (147, 44, 90, N'> 10, seated', CAST(N'2026-02-21T11:01:56.5306438' AS DateTime2), 13, CAST(N'2026-02-21T11:01:56.5306438' AS DateTime2), 13, NULL, NULL, 1, 7)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (148, 44, 91, NULL, CAST(N'2026-02-21T11:01:56.5306438' AS DateTime2), 13, CAST(N'2026-02-21T11:01:56.5306438' AS DateTime2), 13, NULL, NULL, 1, 8)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (149, 45, 92, N'6, 4, 2', CAST(N'2026-02-21T11:02:46.8333574' AS DateTime2), 13, CAST(N'2026-02-21T11:02:46.8333574' AS DateTime2), 13, NULL, NULL, 1, 1)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (150, 45, 96, N'> 16', CAST(N'2026-02-21T11:02:46.8333574' AS DateTime2), 13, CAST(N'2026-02-21T11:02:46.8333574' AS DateTime2), 13, NULL, NULL, 1, 2)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (151, 45, 97, NULL, CAST(N'2026-02-21T11:02:46.8333574' AS DateTime2), 13, CAST(N'2026-02-21T11:02:46.8333574' AS DateTime2), 13, NULL, NULL, 1, 3)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (152, 45, 101, NULL, CAST(N'2026-02-21T11:02:46.8333574' AS DateTime2), 13, CAST(N'2026-02-21T11:02:46.8333574' AS DateTime2), 13, NULL, NULL, 1, 4)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (153, 46, 104, NULL, CAST(N'2026-02-21T11:03:51.9074516' AS DateTime2), 13, CAST(N'2026-02-21T11:03:51.9074516' AS DateTime2), 13, NULL, NULL, 1, 1)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (154, 46, 76, NULL, CAST(N'2026-02-21T11:03:51.9074516' AS DateTime2), 13, CAST(N'2026-02-21T11:03:51.9074516' AS DateTime2), 13, NULL, NULL, 1, 2)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (155, 46, 103, NULL, CAST(N'2026-02-21T11:03:51.9074516' AS DateTime2), 13, CAST(N'2026-02-21T11:03:51.9074516' AS DateTime2), 13, NULL, NULL, 1, 3)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (156, 46, 86, NULL, CAST(N'2026-02-21T11:03:51.9074516' AS DateTime2), 13, CAST(N'2026-02-21T11:03:51.9074516' AS DateTime2), 13, NULL, NULL, 1, 4)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (157, 47, 111, NULL, CAST(N'2026-02-21T11:04:36.6609161' AS DateTime2), 13, CAST(N'2026-02-21T11:04:36.6609161' AS DateTime2), 13, NULL, NULL, 1, 1)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (158, 47, 96, NULL, CAST(N'2026-02-21T11:04:36.6609161' AS DateTime2), 13, CAST(N'2026-02-21T11:04:36.6609161' AS DateTime2), 13, NULL, NULL, 1, 2)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (159, 47, 99, NULL, CAST(N'2026-02-21T11:04:36.6609161' AS DateTime2), 13, CAST(N'2026-02-21T11:04:36.6609161' AS DateTime2), 13, NULL, NULL, 1, 3)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (160, 48, 73, N'Comp standard - 5, 3, 1', CAST(N'2026-02-21T11:07:55.0843847' AS DateTime2), 13, CAST(N'2026-02-21T11:07:55.0843847' AS DateTime2), 13, NULL, NULL, 1, 1)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (161, 48, 76, N'> 15', CAST(N'2026-02-21T11:07:55.0843847' AS DateTime2), 13, CAST(N'2026-02-21T11:07:55.0843847' AS DateTime2), 13, NULL, NULL, 1, 2)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (162, 48, 81, NULL, CAST(N'2026-02-21T11:07:55.0843847' AS DateTime2), 13, CAST(N'2026-02-21T11:07:55.0843847' AS DateTime2), 13, NULL, NULL, 1, 3)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (163, 48, 83, N'> 12', CAST(N'2026-02-21T11:07:55.0843847' AS DateTime2), 13, CAST(N'2026-02-21T11:07:55.0843847' AS DateTime2), 13, NULL, NULL, 1, 4)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (164, 48, 84, N'> 12', CAST(N'2026-02-21T11:07:55.0843847' AS DateTime2), 13, CAST(N'2026-02-21T11:07:55.0843847' AS DateTime2), 13, NULL, NULL, 1, 5)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (165, 48, 86, N'Power curls', CAST(N'2026-02-21T11:07:55.0843847' AS DateTime2), 13, CAST(N'2026-02-21T11:07:55.0843847' AS DateTime2), 13, NULL, NULL, 1, 6)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (166, 48, 90, N'> 10, seated', CAST(N'2026-02-21T11:07:55.0843847' AS DateTime2), 13, CAST(N'2026-02-21T11:07:55.0843847' AS DateTime2), 13, NULL, NULL, 1, 7)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (167, 48, 91, NULL, CAST(N'2026-02-21T11:07:55.0843847' AS DateTime2), 13, CAST(N'2026-02-21T11:07:55.0843847' AS DateTime2), 13, NULL, NULL, 1, 8)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (168, 49, 92, N'6, 4, 2', CAST(N'2026-02-21T11:08:49.3425472' AS DateTime2), 13, CAST(N'2026-02-21T11:08:49.3425472' AS DateTime2), 13, NULL, NULL, 1, 1)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (169, 49, 96, N'> 16', CAST(N'2026-02-21T11:08:49.3425472' AS DateTime2), 13, CAST(N'2026-02-21T11:08:49.3425472' AS DateTime2), 13, NULL, NULL, 1, 2)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (170, 49, 97, NULL, CAST(N'2026-02-21T11:08:49.3425472' AS DateTime2), 13, CAST(N'2026-02-21T11:08:49.3425472' AS DateTime2), 13, NULL, NULL, 1, 3)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (171, 49, 101, NULL, CAST(N'2026-02-21T11:08:49.3425472' AS DateTime2), 13, CAST(N'2026-02-21T11:08:49.3425472' AS DateTime2), 13, NULL, NULL, 1, 4)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (172, 50, 104, NULL, CAST(N'2026-02-21T11:15:20.2949868' AS DateTime2), 13, CAST(N'2026-02-21T11:15:20.2949868' AS DateTime2), 13, NULL, NULL, 1, 1)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (173, 50, 76, NULL, CAST(N'2026-02-21T11:15:20.2949868' AS DateTime2), 13, CAST(N'2026-02-21T11:15:20.2949868' AS DateTime2), 13, NULL, NULL, 1, 2)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (174, 50, 103, NULL, CAST(N'2026-02-21T11:15:20.2949868' AS DateTime2), 13, CAST(N'2026-02-21T11:15:20.2949868' AS DateTime2), 13, NULL, NULL, 1, 3)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (175, 50, 86, NULL, CAST(N'2026-02-21T11:15:20.2949868' AS DateTime2), 13, CAST(N'2026-02-21T11:15:20.2949868' AS DateTime2), 13, NULL, NULL, 1, 4)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (176, 51, 111, NULL, CAST(N'2026-02-21T11:16:04.8788384' AS DateTime2), 13, CAST(N'2026-02-21T11:16:04.8788384' AS DateTime2), 13, NULL, NULL, 1, 1)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (177, 51, 96, NULL, CAST(N'2026-02-21T11:16:04.8788384' AS DateTime2), 13, CAST(N'2026-02-21T11:16:04.8788384' AS DateTime2), 13, NULL, NULL, 1, 2)
GO
INSERT [dbo].[WorkoutExercise] ([Id], [WorkoutId], [ExerciseId], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order]) VALUES (178, 51, 99, NULL, CAST(N'2026-02-21T11:16:04.8788384' AS DateTime2), 13, CAST(N'2026-02-21T11:16:04.8788384' AS DateTime2), 13, NULL, NULL, 1, 3)
GO
SET IDENTITY_INSERT [dbo].[WorkoutExercise] OFF
GO
SET IDENTITY_INSERT [dbo].[WorkoutExerciseSet] ON 
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (90, 50, CAST(100.00 AS Decimal(18, 2)), 1, 12, NULL, 2, NULL, NULL, CAST(N'2026-01-25T15:53:56.9075440' AS DateTime2), 1, CAST(N'2026-01-25T15:53:56.9075440' AS DateTime2), 1, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (91, 57, CAST(60.00 AS Decimal(18, 2)), 1, 5, NULL, 2, NULL, NULL, CAST(N'2026-02-01T12:50:27.6591817' AS DateTime2), 1, CAST(N'2026-02-01T12:50:27.6591817' AS DateTime2), 1, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (92, 57, CAST(60.00 AS Decimal(18, 2)), 1, 5, NULL, 2, NULL, NULL, CAST(N'2026-02-01T12:50:27.6591817' AS DateTime2), 1, CAST(N'2026-02-01T12:50:27.6591817' AS DateTime2), 1, NULL, NULL, 1, 2, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (93, 57, CAST(60.00 AS Decimal(18, 2)), 1, 5, NULL, 2, NULL, NULL, CAST(N'2026-02-01T12:50:27.6591817' AS DateTime2), 1, CAST(N'2026-02-01T12:50:27.6591817' AS DateTime2), 1, NULL, NULL, 1, 3, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (94, 59, CAST(65.00 AS Decimal(18, 2)), 1, 5, 6, 2, NULL, NULL, CAST(N'2026-02-01T12:51:00.6264032' AS DateTime2), 1, CAST(N'2026-02-01T12:51:08.9965079' AS DateTime2), 1, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (95, 59, CAST(65.00 AS Decimal(18, 2)), 1, 5, 10, 3, 120, NULL, CAST(N'2026-02-01T12:51:00.6264032' AS DateTime2), 1, CAST(N'2026-02-01T12:51:21.2960887' AS DateTime2), 1, NULL, NULL, 1, 2, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (96, 59, CAST(65.00 AS Decimal(18, 2)), 1, 5, NULL, 2, NULL, N'last set', CAST(N'2026-02-01T12:51:00.6264032' AS DateTime2), 1, CAST(N'2026-02-01T12:51:29.8908577' AS DateTime2), 1, NULL, NULL, 1, 3, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (97, 60, CAST(70.00 AS Decimal(18, 2)), 1, 4, NULL, 1, NULL, NULL, CAST(N'2026-02-01T12:51:53.4441321' AS DateTime2), 1, CAST(N'2026-02-01T12:51:53.4441321' AS DateTime2), 1, CAST(N'2026-02-08T18:15:12.9007931' AS DateTime2), 1, 0, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (98, 61, CAST(75.00 AS Decimal(18, 2)), 1, 4, 10, 3, 120, N'wow really heavy', CAST(N'2026-02-01T12:52:13.6107462' AS DateTime2), 1, CAST(N'2026-02-07T15:51:32.2129947' AS DateTime2), 1, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (99, 62, CAST(60.00 AS Decimal(18, 2)), 1, 12, NULL, 2, NULL, NULL, CAST(N'2026-02-01T12:52:30.6421246' AS DateTime2), 1, CAST(N'2026-02-01T12:52:30.6421246' AS DateTime2), 1, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (100, 62, CAST(60.00 AS Decimal(18, 2)), 1, 7, NULL, 2, NULL, NULL, CAST(N'2026-02-01T12:52:37.7398260' AS DateTime2), 1, CAST(N'2026-02-01T12:52:37.7398260' AS DateTime2), 1, NULL, NULL, 1, 2, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (101, 48, CAST(90.00 AS Decimal(18, 2)), 1, 1, 10, NULL, NULL, NULL, CAST(N'2026-02-01T12:52:56.6618082' AS DateTime2), 1, CAST(N'2026-02-01T12:52:56.6618082' AS DateTime2), 1, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (102, 63, CAST(90.00 AS Decimal(18, 2)), 1, 1, NULL, 3, NULL, NULL, CAST(N'2026-02-01T12:53:20.9643034' AS DateTime2), 1, CAST(N'2026-02-01T12:53:20.9643034' AS DateTime2), 1, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (103, 63, CAST(80.00 AS Decimal(18, 2)), 1, 5, NULL, 4, NULL, NULL, CAST(N'2026-02-01T12:53:29.9415638' AS DateTime2), 1, CAST(N'2026-02-01T12:53:29.9415638' AS DateTime2), 1, NULL, NULL, 1, 2, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (104, 64, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2026-02-01T13:04:06.3679059' AS DateTime2), 1, CAST(N'2026-02-01T13:04:06.3679059' AS DateTime2), 1, NULL, NULL, 1, 1, 10)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (105, 65, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2026-02-01T13:04:18.1922023' AS DateTime2), 1, CAST(N'2026-02-01T13:04:18.1922023' AS DateTime2), 1, NULL, NULL, 1, 1, 25)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (106, 66, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2026-02-01T13:04:28.2386334' AS DateTime2), 1, CAST(N'2026-02-01T13:04:28.2386334' AS DateTime2), 1, NULL, NULL, 1, 1, 12)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (107, 66, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2026-02-01T13:04:30.4585607' AS DateTime2), 1, CAST(N'2026-02-01T13:04:30.4585607' AS DateTime2), 1, NULL, NULL, 1, 2, 12)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (108, 68, NULL, NULL, 20, NULL, 2, NULL, NULL, CAST(N'2026-02-01T15:00:19.2975156' AS DateTime2), 1, CAST(N'2026-02-01T15:00:19.2975156' AS DateTime2), 1, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (109, 69, CAST(220.00 AS Decimal(18, 2)), 2, 3, NULL, NULL, NULL, NULL, CAST(N'2026-02-08T18:12:03.2392700' AS DateTime2), 1, CAST(N'2026-02-08T18:12:20.1843260' AS DateTime2), 1, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (110, 69, CAST(220.00 AS Decimal(18, 2)), 2, 3, NULL, NULL, NULL, NULL, CAST(N'2026-02-08T18:12:13.5068519' AS DateTime2), 1, CAST(N'2026-02-08T18:12:13.5068519' AS DateTime2), 1, NULL, NULL, 1, 2, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (111, 69, CAST(220.00 AS Decimal(18, 2)), 2, 3, NULL, NULL, NULL, NULL, CAST(N'2026-02-08T18:12:13.5068519' AS DateTime2), 1, CAST(N'2026-02-08T18:12:13.5068519' AS DateTime2), 1, NULL, NULL, 1, 3, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (112, 70, CAST(100.00 AS Decimal(18, 2)), 2, 10, NULL, NULL, NULL, NULL, CAST(N'2026-02-17T11:44:26.2437631' AS DateTime2), 1, CAST(N'2026-02-17T11:44:26.2437631' AS DateTime2), 1, CAST(N'2026-02-17T11:44:31.4782307' AS DateTime2), 1, 0, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (113, 70, CAST(100.00 AS Decimal(18, 2)), 2, 10, NULL, NULL, NULL, NULL, CAST(N'2026-02-17T11:44:26.2437631' AS DateTime2), 1, CAST(N'2026-02-17T11:44:31.4782307' AS DateTime2), 1, CAST(N'2026-02-17T11:44:32.5687259' AS DateTime2), 1, 0, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (114, 70, CAST(100.00 AS Decimal(18, 2)), 2, 10, NULL, NULL, NULL, NULL, CAST(N'2026-02-17T11:44:26.2437631' AS DateTime2), 1, CAST(N'2026-02-17T11:44:32.5687259' AS DateTime2), 1, CAST(N'2026-02-17T11:44:34.1370714' AS DateTime2), 1, 0, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (115, 70, CAST(225.00 AS Decimal(18, 2)), 2, 10, NULL, NULL, NULL, NULL, CAST(N'2026-02-17T11:44:53.5929729' AS DateTime2), 1, CAST(N'2026-02-17T11:44:53.5929729' AS DateTime2), 1, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (116, 70, CAST(225.00 AS Decimal(18, 2)), 2, 10, NULL, NULL, NULL, NULL, CAST(N'2026-02-17T11:44:53.5929729' AS DateTime2), 1, CAST(N'2026-02-17T11:44:53.5929729' AS DateTime2), 1, NULL, NULL, 1, 2, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (117, 70, CAST(225.00 AS Decimal(18, 2)), 2, 10, NULL, NULL, NULL, NULL, CAST(N'2026-02-17T11:44:53.5929729' AS DateTime2), 1, CAST(N'2026-02-17T11:44:53.5929729' AS DateTime2), 1, NULL, NULL, 1, 3, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (118, 71, CAST(405.00 AS Decimal(18, 2)), 2, 12, NULL, NULL, NULL, NULL, CAST(N'2026-02-17T11:45:04.2566689' AS DateTime2), 1, CAST(N'2026-02-17T11:45:04.2566689' AS DateTime2), 1, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (119, 71, CAST(405.00 AS Decimal(18, 2)), 2, 12, NULL, NULL, NULL, NULL, CAST(N'2026-02-17T11:45:04.2566689' AS DateTime2), 1, CAST(N'2026-02-17T11:45:04.2566689' AS DateTime2), 1, NULL, NULL, 1, 2, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (120, 72, CAST(120.00 AS Decimal(18, 2)), 2, 16, NULL, NULL, NULL, NULL, CAST(N'2026-02-17T11:45:16.6265334' AS DateTime2), 1, CAST(N'2026-02-17T11:45:16.6265334' AS DateTime2), 1, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (121, 72, CAST(120.00 AS Decimal(18, 2)), 2, 12, NULL, NULL, NULL, NULL, CAST(N'2026-02-17T11:45:16.6265334' AS DateTime2), 1, CAST(N'2026-02-17T11:45:20.6944669' AS DateTime2), 1, NULL, NULL, 1, 2, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (122, 72, CAST(100.00 AS Decimal(18, 2)), 2, 6, NULL, 4, NULL, NULL, CAST(N'2026-02-17T11:45:16.6265334' AS DateTime2), 1, CAST(N'2026-02-17T11:45:34.1787860' AS DateTime2), 1, NULL, NULL, 1, 3, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (123, 75, CAST(20.00 AS Decimal(18, 2)), 2, 12, NULL, 3, NULL, NULL, CAST(N'2026-02-17T11:46:37.9879733' AS DateTime2), 1, CAST(N'2026-02-17T11:46:45.5563999' AS DateTime2), 1, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (124, 74, CAST(90.00 AS Decimal(18, 2)), 2, 12, NULL, NULL, NULL, NULL, CAST(N'2026-02-17T11:47:02.2582402' AS DateTime2), 1, CAST(N'2026-02-17T11:47:02.2582402' AS DateTime2), 1, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (125, 73, CAST(225.00 AS Decimal(18, 2)), 2, 5, NULL, NULL, NULL, NULL, CAST(N'2026-02-17T11:47:08.6832588' AS DateTime2), 1, CAST(N'2026-02-17T11:47:08.6832588' AS DateTime2), 1, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (126, 73, CAST(225.00 AS Decimal(18, 2)), 2, 5, NULL, NULL, NULL, NULL, CAST(N'2026-02-17T11:47:08.6832588' AS DateTime2), 1, CAST(N'2026-02-17T11:47:08.6832588' AS DateTime2), 1, NULL, NULL, 1, 2, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (127, 52, CAST(100.00 AS Decimal(18, 2)), 1, 2, NULL, NULL, NULL, NULL, CAST(N'2026-02-17T11:56:32.5704711' AS DateTime2), 2, CAST(N'2026-02-17T11:56:32.5704711' AS DateTime2), 2, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (128, 76, CAST(135.00 AS Decimal(18, 2)), 2, 8, 5, 1, 90, NULL, CAST(N'2026-02-17T13:21:50.0254973' AS DateTime2), 3, CAST(N'2026-02-17T13:21:50.0254973' AS DateTime2), 3, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (129, 76, CAST(225.00 AS Decimal(18, 2)), 2, 5, 7, 2, 180, NULL, CAST(N'2026-02-17T13:22:07.8125469' AS DateTime2), 3, CAST(N'2026-02-17T13:22:07.8125469' AS DateTime2), 3, NULL, NULL, 1, 2, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (130, 76, CAST(275.00 AS Decimal(18, 2)), 2, 3, 8, 2, 240, NULL, CAST(N'2026-02-17T13:22:22.4684406' AS DateTime2), 3, CAST(N'2026-02-17T13:22:22.4684406' AS DateTime2), 3, NULL, NULL, 1, 3, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (131, 77, CAST(225.00 AS Decimal(18, 2)), 2, 6, 8, 2, 180, NULL, CAST(N'2026-02-17T13:22:55.2557322' AS DateTime2), 3, CAST(N'2026-02-17T13:22:55.2557322' AS DateTime2), 3, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (132, 77, CAST(225.00 AS Decimal(18, 2)), 2, 5, 10, 3, NULL, NULL, CAST(N'2026-02-17T13:22:55.2557322' AS DateTime2), 3, CAST(N'2026-02-17T13:23:10.6525140' AS DateTime2), 3, NULL, NULL, 1, 2, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (133, 78, CAST(225.00 AS Decimal(18, 2)), 2, 5, 5, 1, NULL, NULL, CAST(N'2026-02-17T13:25:44.5455340' AS DateTime2), 3, CAST(N'2026-02-17T13:25:44.5455340' AS DateTime2), 3, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (134, 78, CAST(365.00 AS Decimal(18, 2)), 2, 3, 8, 2, NULL, NULL, CAST(N'2026-02-17T13:25:59.9860229' AS DateTime2), 3, CAST(N'2026-02-17T13:25:59.9860229' AS DateTime2), 3, NULL, NULL, 1, 2, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (135, 78, CAST(405.00 AS Decimal(18, 2)), 2, 2, 9, 2, NULL, NULL, CAST(N'2026-02-17T13:25:59.9860229' AS DateTime2), 3, CAST(N'2026-02-17T13:26:27.1536571' AS DateTime2), 3, NULL, NULL, 1, 3, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (136, 79, CAST(225.00 AS Decimal(18, 2)), 2, 6, 8, NULL, NULL, NULL, CAST(N'2026-02-17T13:26:42.4511750' AS DateTime2), 3, CAST(N'2026-02-17T13:26:42.4511750' AS DateTime2), 3, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (137, 79, CAST(225.00 AS Decimal(18, 2)), 2, 6, 9, NULL, NULL, NULL, CAST(N'2026-02-17T13:26:42.4511750' AS DateTime2), 3, CAST(N'2026-02-17T13:26:46.7625275' AS DateTime2), 3, NULL, NULL, 1, 2, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (138, 81, CAST(180.00 AS Decimal(18, 2)), 2, 12, NULL, NULL, NULL, NULL, CAST(N'2026-02-17T13:28:38.0830115' AS DateTime2), 3, CAST(N'2026-02-17T13:28:38.0830115' AS DateTime2), 3, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (139, 81, CAST(180.00 AS Decimal(18, 2)), 2, 12, NULL, NULL, NULL, NULL, CAST(N'2026-02-17T13:28:38.0830115' AS DateTime2), 3, CAST(N'2026-02-17T13:28:38.0830115' AS DateTime2), 3, NULL, NULL, 1, 2, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (140, 81, CAST(180.00 AS Decimal(18, 2)), 2, 12, NULL, NULL, NULL, NULL, CAST(N'2026-02-17T13:28:38.0830115' AS DateTime2), 3, CAST(N'2026-02-17T13:28:38.0830115' AS DateTime2), 3, NULL, NULL, 1, 3, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (141, 80, CAST(275.00 AS Decimal(18, 2)), 2, 5, 7, NULL, NULL, NULL, CAST(N'2026-02-17T13:29:05.4504441' AS DateTime2), 3, CAST(N'2026-02-17T13:29:19.8567908' AS DateTime2), 3, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (142, 80, CAST(315.00 AS Decimal(18, 2)), 2, 5, 8, NULL, NULL, NULL, CAST(N'2026-02-17T13:29:05.4504441' AS DateTime2), 3, CAST(N'2026-02-17T13:29:22.1203562' AS DateTime2), 3, NULL, NULL, 1, 2, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (143, 80, CAST(335.00 AS Decimal(18, 2)), 2, 3, 9, NULL, NULL, NULL, CAST(N'2026-02-17T13:29:05.4504441' AS DateTime2), 3, CAST(N'2026-02-17T13:29:33.6004130' AS DateTime2), 3, NULL, NULL, 1, 3, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (144, 82, CAST(60.00 AS Decimal(18, 2)), 2, 10, NULL, NULL, NULL, NULL, CAST(N'2026-02-17T13:31:19.8759961' AS DateTime2), 4, CAST(N'2026-02-17T13:31:19.8759961' AS DateTime2), 4, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (145, 82, CAST(70.00 AS Decimal(18, 2)), 2, 8, NULL, NULL, NULL, NULL, CAST(N'2026-02-17T13:31:19.8759961' AS DateTime2), 4, CAST(N'2026-02-17T13:31:26.7959288' AS DateTime2), 4, NULL, NULL, 1, 2, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (146, 83, CAST(120.00 AS Decimal(18, 2)), 2, 12, NULL, NULL, NULL, NULL, CAST(N'2026-02-17T13:31:37.2100333' AS DateTime2), 4, CAST(N'2026-02-17T13:31:37.2100333' AS DateTime2), 4, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (147, 83, CAST(130.00 AS Decimal(18, 2)), 2, 10, NULL, NULL, NULL, NULL, CAST(N'2026-02-17T13:31:37.2100333' AS DateTime2), 4, CAST(N'2026-02-17T13:31:44.4845534' AS DateTime2), 4, NULL, NULL, 1, 2, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (148, 84, CAST(185.00 AS Decimal(18, 2)), 2, 8, NULL, NULL, NULL, NULL, CAST(N'2026-02-17T13:32:35.8133832' AS DateTime2), 4, CAST(N'2026-02-17T13:32:35.8133832' AS DateTime2), 4, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (149, 84, CAST(205.00 AS Decimal(18, 2)), 2, 6, NULL, NULL, NULL, NULL, CAST(N'2026-02-17T13:32:45.3246967' AS DateTime2), 4, CAST(N'2026-02-17T13:32:45.3246967' AS DateTime2), 4, NULL, NULL, 1, 2, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (150, 85, CAST(110.00 AS Decimal(18, 2)), 2, 12, NULL, NULL, NULL, NULL, CAST(N'2026-02-17T13:32:55.6766434' AS DateTime2), 4, CAST(N'2026-02-17T13:32:55.6766434' AS DateTime2), 4, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (151, 85, CAST(120.00 AS Decimal(18, 2)), 2, 10, NULL, NULL, NULL, NULL, CAST(N'2026-02-17T13:33:01.5096018' AS DateTime2), 4, CAST(N'2026-02-17T13:33:01.5096018' AS DateTime2), 4, NULL, NULL, 1, 2, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (152, 87, CAST(100.00 AS Decimal(18, 2)), 1, 5, NULL, NULL, NULL, NULL, CAST(N'2026-02-17T13:36:20.4598632' AS DateTime2), 5, CAST(N'2026-02-17T13:36:20.4598632' AS DateTime2), 5, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (153, 87, CAST(120.00 AS Decimal(18, 2)), 1, 3, NULL, NULL, NULL, NULL, CAST(N'2026-02-17T13:36:25.3207073' AS DateTime2), 5, CAST(N'2026-02-17T13:36:25.3207073' AS DateTime2), 5, NULL, NULL, 1, 2, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (154, 86, CAST(60.00 AS Decimal(18, 2)), 1, 5, NULL, NULL, NULL, NULL, CAST(N'2026-02-17T13:36:33.2254771' AS DateTime2), 5, CAST(N'2026-02-17T13:36:33.2254771' AS DateTime2), 5, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (155, 86, CAST(80.00 AS Decimal(18, 2)), 1, 3, NULL, NULL, NULL, NULL, CAST(N'2026-02-17T13:36:41.1188051' AS DateTime2), 5, CAST(N'2026-02-17T13:36:41.1188051' AS DateTime2), 5, NULL, NULL, 1, 2, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (156, 86, CAST(90.00 AS Decimal(18, 2)), 1, 2, 9, NULL, NULL, NULL, CAST(N'2026-02-17T13:36:55.3342653' AS DateTime2), 5, CAST(N'2026-02-17T13:36:55.3342653' AS DateTime2), 5, NULL, NULL, 1, 3, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (157, 89, CAST(140.00 AS Decimal(18, 2)), 1, 5, NULL, NULL, NULL, NULL, CAST(N'2026-02-17T13:37:43.4279111' AS DateTime2), 5, CAST(N'2026-02-17T13:37:43.4279111' AS DateTime2), 5, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (158, 89, CAST(140.00 AS Decimal(18, 2)), 1, 5, NULL, NULL, NULL, NULL, CAST(N'2026-02-17T13:37:43.4279111' AS DateTime2), 5, CAST(N'2026-02-17T13:37:43.4279111' AS DateTime2), 5, NULL, NULL, 1, 2, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (159, 88, CAST(110.00 AS Decimal(18, 2)), 1, 5, NULL, NULL, NULL, NULL, CAST(N'2026-02-17T13:37:49.4469137' AS DateTime2), 5, CAST(N'2026-02-17T13:37:49.4469137' AS DateTime2), 5, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (160, 88, CAST(130.00 AS Decimal(18, 2)), 1, 3, NULL, NULL, NULL, NULL, CAST(N'2026-02-17T13:37:53.4937201' AS DateTime2), 5, CAST(N'2026-02-17T13:37:53.4937201' AS DateTime2), 5, NULL, NULL, 1, 2, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (161, 92, CAST(40.00 AS Decimal(18, 2)), 1, 12, NULL, NULL, NULL, NULL, CAST(N'2026-02-17T13:42:12.8787506' AS DateTime2), 6, CAST(N'2026-02-17T13:42:12.8787506' AS DateTime2), 6, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (162, 92, CAST(45.00 AS Decimal(18, 2)), 1, 10, NULL, NULL, NULL, NULL, CAST(N'2026-02-17T13:42:12.8787506' AS DateTime2), 6, CAST(N'2026-02-17T13:42:26.5314649' AS DateTime2), 6, NULL, NULL, 1, 2, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (163, 91, CAST(12.00 AS Decimal(18, 2)), 1, 15, NULL, NULL, NULL, NULL, CAST(N'2026-02-17T13:42:35.0998125' AS DateTime2), 6, CAST(N'2026-02-17T13:42:35.0998125' AS DateTime2), 6, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (164, 91, CAST(14.00 AS Decimal(18, 2)), 1, 12, NULL, 4, NULL, NULL, CAST(N'2026-02-17T13:42:44.8818546' AS DateTime2), 6, CAST(N'2026-02-17T13:42:44.8818546' AS DateTime2), 6, NULL, NULL, 1, 2, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (165, 90, CAST(70.00 AS Decimal(18, 2)), 1, 10, NULL, NULL, NULL, NULL, CAST(N'2026-02-17T13:42:58.0117994' AS DateTime2), 6, CAST(N'2026-02-17T13:43:58.9436651' AS DateTime2), 6, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (166, 90, CAST(80.00 AS Decimal(18, 2)), 1, 8, NULL, NULL, NULL, NULL, CAST(N'2026-02-17T13:42:58.0117994' AS DateTime2), 6, CAST(N'2026-02-17T13:43:58.9436651' AS DateTime2), 6, NULL, NULL, 1, 2, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (167, 94, CAST(35.00 AS Decimal(18, 2)), 1, 12, NULL, NULL, NULL, NULL, CAST(N'2026-02-17T13:44:53.6738475' AS DateTime2), 6, CAST(N'2026-02-17T13:44:53.6738475' AS DateTime2), 6, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (168, 94, CAST(40.00 AS Decimal(18, 2)), 1, 8, NULL, 3, NULL, NULL, CAST(N'2026-02-17T13:45:00.3121544' AS DateTime2), 6, CAST(N'2026-02-17T13:45:00.3121544' AS DateTime2), 6, NULL, NULL, 1, 2, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (169, 93, CAST(70.00 AS Decimal(18, 2)), 1, 12, NULL, NULL, NULL, NULL, CAST(N'2026-02-17T13:45:07.7670004' AS DateTime2), 6, CAST(N'2026-02-17T13:45:07.7670004' AS DateTime2), 6, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (170, 93, CAST(75.00 AS Decimal(18, 2)), 1, 10, NULL, NULL, NULL, NULL, CAST(N'2026-02-17T13:45:15.6493604' AS DateTime2), 6, CAST(N'2026-02-17T13:45:15.6493604' AS DateTime2), 6, NULL, NULL, 1, 2, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (171, 96, NULL, NULL, 10, NULL, NULL, NULL, NULL, CAST(N'2026-02-17T13:46:51.8363208' AS DateTime2), 7, CAST(N'2026-02-17T13:46:51.8363208' AS DateTime2), 7, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (172, 96, NULL, NULL, 8, NULL, NULL, NULL, NULL, CAST(N'2026-02-17T13:46:51.8363208' AS DateTime2), 7, CAST(N'2026-02-17T13:46:56.3392406' AS DateTime2), 7, NULL, NULL, 1, 2, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (173, 95, CAST(160.00 AS Decimal(18, 2)), 1, 3, NULL, NULL, NULL, NULL, CAST(N'2026-02-17T13:47:03.0022230' AS DateTime2), 7, CAST(N'2026-02-17T13:47:03.0022230' AS DateTime2), 7, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (174, 95, CAST(180.00 AS Decimal(18, 2)), 1, 2, NULL, NULL, NULL, NULL, CAST(N'2026-02-17T13:47:10.6507325' AS DateTime2), 7, CAST(N'2026-02-17T13:47:10.6507325' AS DateTime2), 7, NULL, NULL, 1, 2, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (175, 97, CAST(150.00 AS Decimal(18, 2)), 1, 6, NULL, NULL, NULL, NULL, CAST(N'2026-02-17T13:52:06.0087111' AS DateTime2), 8, CAST(N'2026-02-17T13:52:06.0087111' AS DateTime2), 8, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (176, 97, CAST(170.00 AS Decimal(18, 2)), 1, 3, NULL, NULL, NULL, NULL, CAST(N'2026-02-17T13:52:12.3504705' AS DateTime2), 8, CAST(N'2026-02-17T13:52:12.3504705' AS DateTime2), 8, NULL, NULL, 1, 2, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (177, 98, CAST(180.00 AS Decimal(18, 2)), 1, 3, NULL, NULL, NULL, NULL, CAST(N'2026-02-17T13:52:19.3403792' AS DateTime2), 8, CAST(N'2026-02-17T13:52:19.3403792' AS DateTime2), 8, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (178, 98, CAST(200.00 AS Decimal(18, 2)), 1, 2, NULL, NULL, NULL, NULL, CAST(N'2026-02-17T13:52:25.1000805' AS DateTime2), 8, CAST(N'2026-02-17T13:52:25.1000805' AS DateTime2), 8, NULL, NULL, 1, 2, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (179, 100, CAST(270.00 AS Decimal(18, 2)), 2, 12, NULL, NULL, NULL, NULL, CAST(N'2026-02-17T14:02:23.1846477' AS DateTime2), 10, CAST(N'2026-02-17T14:02:23.1846477' AS DateTime2), 10, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (180, 100, CAST(320.00 AS Decimal(18, 2)), 2, 10, NULL, NULL, NULL, NULL, CAST(N'2026-02-17T14:02:28.0334516' AS DateTime2), 10, CAST(N'2026-02-17T14:02:28.0334516' AS DateTime2), 10, NULL, NULL, 1, 2, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (181, 99, CAST(135.00 AS Decimal(18, 2)), 2, 8, NULL, NULL, NULL, NULL, CAST(N'2026-02-17T14:02:33.6824483' AS DateTime2), 10, CAST(N'2026-02-17T14:02:33.6824483' AS DateTime2), 10, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (182, 99, CAST(165.00 AS Decimal(18, 2)), 2, 6, NULL, NULL, NULL, NULL, CAST(N'2026-02-17T14:02:40.2116023' AS DateTime2), 10, CAST(N'2026-02-17T14:02:40.2116023' AS DateTime2), 10, NULL, NULL, 1, 2, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (183, 101, CAST(20.00 AS Decimal(18, 2)), 1, 5, NULL, 1, NULL, NULL, CAST(N'2026-02-17T17:49:52.4353505' AS DateTime2), 13, CAST(N'2026-02-17T17:49:52.4353505' AS DateTime2), 13, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (184, 101, CAST(40.00 AS Decimal(18, 2)), 1, 5, NULL, 1, NULL, NULL, CAST(N'2026-02-17T17:49:58.1581018' AS DateTime2), 13, CAST(N'2026-02-17T17:49:58.1581018' AS DateTime2), 13, NULL, NULL, 1, 2, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (185, 101, CAST(60.00 AS Decimal(18, 2)), 1, 3, NULL, 1, NULL, NULL, CAST(N'2026-02-17T17:50:11.9196717' AS DateTime2), 13, CAST(N'2026-02-17T17:50:11.9196717' AS DateTime2), 13, NULL, NULL, 1, 3, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (186, 101, CAST(80.00 AS Decimal(18, 2)), 1, 1, NULL, 1, NULL, NULL, CAST(N'2026-02-17T17:50:16.8243578' AS DateTime2), 13, CAST(N'2026-02-17T17:50:16.8243578' AS DateTime2), 13, NULL, NULL, 1, 4, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (187, 101, CAST(75.00 AS Decimal(18, 2)), 1, 5, 9, 2, NULL, NULL, CAST(N'2026-02-17T17:50:29.6833081' AS DateTime2), 13, CAST(N'2026-02-17T17:50:38.6474722' AS DateTime2), 13, NULL, NULL, 1, 5, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (188, 101, CAST(75.00 AS Decimal(18, 2)), 1, 5, 8, 2, NULL, NULL, CAST(N'2026-02-17T17:50:29.6833081' AS DateTime2), 13, CAST(N'2026-02-17T17:50:46.9223625' AS DateTime2), 13, NULL, NULL, 1, 6, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (189, 101, CAST(75.00 AS Decimal(18, 2)), 1, 5, 8, 2, NULL, NULL, CAST(N'2026-02-17T17:50:29.6833081' AS DateTime2), 13, CAST(N'2026-02-17T17:50:51.8493933' AS DateTime2), 13, NULL, NULL, 1, 7, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (190, 102, NULL, NULL, 9, 10, 3, NULL, NULL, CAST(N'2026-02-17T17:51:27.8938643' AS DateTime2), 13, CAST(N'2026-02-17T17:51:27.8938643' AS DateTime2), 13, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (191, 102, NULL, NULL, 5, 10, 3, NULL, NULL, CAST(N'2026-02-17T17:51:34.3288358' AS DateTime2), 13, CAST(N'2026-02-17T17:51:34.3288358' AS DateTime2), 13, NULL, NULL, 1, 2, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (192, 103, CAST(20.00 AS Decimal(18, 2)), 1, 4, NULL, 1, NULL, NULL, CAST(N'2026-02-17T17:52:00.8183955' AS DateTime2), 13, CAST(N'2026-02-17T17:52:00.8183955' AS DateTime2), 13, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (193, 103, CAST(30.00 AS Decimal(18, 2)), 1, 4, NULL, 1, NULL, NULL, CAST(N'2026-02-17T17:52:00.8183955' AS DateTime2), 13, CAST(N'2026-02-17T17:52:08.0783329' AS DateTime2), 13, NULL, NULL, 1, 2, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (194, 103, CAST(40.00 AS Decimal(18, 2)), 1, 4, 7, 2, NULL, NULL, CAST(N'2026-02-17T17:52:19.2905825' AS DateTime2), 13, CAST(N'2026-02-17T17:52:19.2905825' AS DateTime2), 13, NULL, NULL, 1, 3, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (195, 103, CAST(40.00 AS Decimal(18, 2)), 1, 4, 7, 2, NULL, NULL, CAST(N'2026-02-17T17:52:19.2905825' AS DateTime2), 13, CAST(N'2026-02-17T17:52:19.2905825' AS DateTime2), 13, NULL, NULL, 1, 4, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (196, 104, CAST(61.50 AS Decimal(18, 2)), 1, 13, 10, 3, NULL, NULL, CAST(N'2026-02-17T17:52:50.0784231' AS DateTime2), 13, CAST(N'2026-02-17T17:52:50.0784231' AS DateTime2), 13, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (197, 105, CAST(37.50 AS Decimal(18, 2)), 1, 9, 10, 3, NULL, NULL, CAST(N'2026-02-17T17:53:08.0198833' AS DateTime2), 13, CAST(N'2026-02-17T17:53:08.0198833' AS DateTime2), 13, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (198, 106, CAST(20.00 AS Decimal(18, 2)), 1, 6, NULL, 1, NULL, NULL, CAST(N'2026-02-17T17:53:30.0369974' AS DateTime2), 13, CAST(N'2026-02-17T17:53:30.0369974' AS DateTime2), 13, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (199, 106, CAST(35.00 AS Decimal(18, 2)), 1, 6, 8, 2, NULL, NULL, CAST(N'2026-02-17T17:53:42.7918470' AS DateTime2), 13, CAST(N'2026-02-17T17:53:42.7918470' AS DateTime2), 13, NULL, NULL, 1, 2, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (200, 106, CAST(35.00 AS Decimal(18, 2)), 1, 6, 8, 2, NULL, NULL, CAST(N'2026-02-17T17:53:42.7918470' AS DateTime2), 13, CAST(N'2026-02-17T17:53:42.7918470' AS DateTime2), 13, NULL, NULL, 1, 3, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (201, 106, CAST(35.00 AS Decimal(18, 2)), 1, 6, 8, 2, NULL, NULL, CAST(N'2026-02-17T17:53:42.7918470' AS DateTime2), 13, CAST(N'2026-02-17T17:53:42.7918470' AS DateTime2), 13, NULL, NULL, 1, 4, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (202, 107, CAST(15.00 AS Decimal(18, 2)), 1, 9, 10, 3, NULL, NULL, CAST(N'2026-02-17T17:54:20.5024247' AS DateTime2), 13, CAST(N'2026-02-17T17:54:20.5024247' AS DateTime2), 13, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (203, 107, CAST(15.00 AS Decimal(18, 2)), 1, 7, 10, 3, NULL, NULL, CAST(N'2026-02-17T17:54:20.5024247' AS DateTime2), 13, CAST(N'2026-02-17T17:54:26.2574295' AS DateTime2), 13, NULL, NULL, 1, 2, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (204, 108, CAST(7.00 AS Decimal(18, 2)), 1, 16, 10, 3, NULL, NULL, CAST(N'2026-02-17T17:54:44.2253860' AS DateTime2), 13, CAST(N'2026-02-17T17:54:44.2253860' AS DateTime2), 13, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (205, 108, CAST(7.00 AS Decimal(18, 2)), 1, 14, 10, 3, NULL, NULL, CAST(N'2026-02-17T17:54:44.2253860' AS DateTime2), 13, CAST(N'2026-02-17T17:54:48.3438919' AS DateTime2), 13, NULL, NULL, 1, 2, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (206, 109, CAST(20.00 AS Decimal(18, 2)), 1, 6, NULL, 1, NULL, NULL, CAST(N'2026-02-17T17:57:14.8545600' AS DateTime2), 13, CAST(N'2026-02-17T17:57:14.8545600' AS DateTime2), 13, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (207, 109, CAST(60.00 AS Decimal(18, 2)), 1, 6, NULL, 1, NULL, NULL, CAST(N'2026-02-17T17:57:18.9771606' AS DateTime2), 13, CAST(N'2026-02-17T17:57:18.9771606' AS DateTime2), 13, NULL, NULL, 1, 2, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (208, 109, CAST(100.00 AS Decimal(18, 2)), 1, 1, NULL, 1, NULL, NULL, CAST(N'2026-02-17T17:57:23.2741477' AS DateTime2), 13, CAST(N'2026-02-17T17:57:23.2741477' AS DateTime2), 13, NULL, NULL, 1, 3, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (209, 109, CAST(102.50 AS Decimal(18, 2)), 1, 6, 8, NULL, NULL, NULL, CAST(N'2026-02-17T17:57:37.6590525' AS DateTime2), 13, CAST(N'2026-02-17T17:58:22.3434351' AS DateTime2), 13, NULL, NULL, 1, 4, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (210, 109, CAST(102.50 AS Decimal(18, 2)), 1, 6, 9, NULL, NULL, NULL, CAST(N'2026-02-17T17:57:37.6590525' AS DateTime2), 13, CAST(N'2026-02-17T17:58:27.6870134' AS DateTime2), 13, NULL, NULL, 1, 5, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (211, 109, CAST(102.50 AS Decimal(18, 2)), 1, 6, 9, NULL, NULL, NULL, CAST(N'2026-02-17T17:57:37.6590525' AS DateTime2), 13, CAST(N'2026-02-17T17:58:32.4118773' AS DateTime2), 13, NULL, NULL, 1, 6, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (212, 110, CAST(120.00 AS Decimal(18, 2)), 1, 6, NULL, 1, NULL, NULL, CAST(N'2026-02-17T17:58:54.8857447' AS DateTime2), 13, CAST(N'2026-02-17T17:58:54.8857447' AS DateTime2), 13, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (213, 110, CAST(180.00 AS Decimal(18, 2)), 1, 15, 10, 3, NULL, NULL, CAST(N'2026-02-17T17:59:14.0725115' AS DateTime2), 13, CAST(N'2026-02-17T17:59:14.0725115' AS DateTime2), 13, NULL, NULL, 1, 2, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (214, 110, CAST(180.00 AS Decimal(18, 2)), 1, 11, 9, 3, NULL, NULL, CAST(N'2026-02-17T17:59:14.0725115' AS DateTime2), 13, CAST(N'2026-02-17T17:59:27.0462201' AS DateTime2), 13, NULL, NULL, 1, 3, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (215, 111, CAST(36.00 AS Decimal(18, 2)), 1, 6, NULL, 1, NULL, NULL, CAST(N'2026-02-17T17:59:49.1662285' AS DateTime2), 13, CAST(N'2026-02-17T17:59:49.1662285' AS DateTime2), 13, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (216, 111, CAST(49.40 AS Decimal(18, 2)), 1, 9, 10, 3, NULL, NULL, CAST(N'2026-02-17T18:00:22.5291201' AS DateTime2), 13, CAST(N'2026-02-17T18:00:22.5291201' AS DateTime2), 13, NULL, NULL, 1, 2, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (217, 111, CAST(49.40 AS Decimal(18, 2)), 1, 6, 10, 3, NULL, NULL, CAST(N'2026-02-17T18:00:22.5291201' AS DateTime2), 13, CAST(N'2026-02-17T18:00:28.3378212' AS DateTime2), 13, NULL, NULL, 1, 3, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (218, 112, NULL, NULL, 21, 10, 3, NULL, NULL, CAST(N'2026-02-17T18:00:53.1283730' AS DateTime2), 13, CAST(N'2026-02-17T18:00:53.1283730' AS DateTime2), 13, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (219, 113, CAST(20.00 AS Decimal(18, 2)), 1, 6, NULL, 1, NULL, NULL, CAST(N'2026-02-21T09:13:37.9280923' AS DateTime2), 13, CAST(N'2026-02-21T09:13:37.9280923' AS DateTime2), 13, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (220, 113, CAST(30.00 AS Decimal(18, 2)), 1, 6, NULL, 1, NULL, NULL, CAST(N'2026-02-21T09:13:37.9280923' AS DateTime2), 13, CAST(N'2026-02-21T09:13:45.2035409' AS DateTime2), 13, NULL, NULL, 1, 2, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (221, 113, CAST(40.00 AS Decimal(18, 2)), 1, 4, NULL, 1, NULL, NULL, CAST(N'2026-02-21T09:13:37.9280923' AS DateTime2), 13, CAST(N'2026-02-21T09:13:51.5809383' AS DateTime2), 13, NULL, NULL, 1, 3, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (222, 113, CAST(50.00 AS Decimal(18, 2)), 1, 1, NULL, 1, NULL, NULL, CAST(N'2026-02-21T09:13:37.9280923' AS DateTime2), 13, CAST(N'2026-02-21T09:13:58.3318287' AS DateTime2), 13, NULL, NULL, 1, 4, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (223, 113, CAST(50.00 AS Decimal(18, 2)), 1, 6, 9, NULL, NULL, NULL, CAST(N'2026-02-21T09:14:14.6032296' AS DateTime2), 13, CAST(N'2026-02-21T09:14:14.6032296' AS DateTime2), 13, NULL, NULL, 1, 5, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (224, 113, CAST(50.00 AS Decimal(18, 2)), 1, 6, 9, NULL, NULL, NULL, CAST(N'2026-02-21T09:14:14.6032296' AS DateTime2), 13, CAST(N'2026-02-21T09:14:14.6032296' AS DateTime2), 13, NULL, NULL, 1, 6, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (225, 113, CAST(50.00 AS Decimal(18, 2)), 1, 6, 9, NULL, NULL, NULL, CAST(N'2026-02-21T09:14:14.6032296' AS DateTime2), 13, CAST(N'2026-02-21T09:14:14.6032296' AS DateTime2), 13, NULL, NULL, 1, 7, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (226, 114, NULL, NULL, 5, NULL, NULL, NULL, NULL, CAST(N'2026-02-21T09:14:29.0820755' AS DateTime2), 13, CAST(N'2026-02-21T09:14:29.0820755' AS DateTime2), 13, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (227, 114, NULL, NULL, 5, NULL, NULL, NULL, NULL, CAST(N'2026-02-21T09:14:29.0820755' AS DateTime2), 13, CAST(N'2026-02-21T09:14:29.0820755' AS DateTime2), 13, NULL, NULL, 1, 2, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (228, 114, NULL, NULL, 5, NULL, NULL, NULL, NULL, CAST(N'2026-02-21T09:14:29.0820755' AS DateTime2), 13, CAST(N'2026-02-21T09:14:29.0820755' AS DateTime2), 13, NULL, NULL, 1, 3, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (229, 114, NULL, NULL, 5, NULL, NULL, NULL, NULL, CAST(N'2026-02-21T09:14:29.0820755' AS DateTime2), 13, CAST(N'2026-02-21T09:14:29.0820755' AS DateTime2), 13, NULL, NULL, 1, 4, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (230, 114, NULL, NULL, 5, NULL, NULL, NULL, NULL, CAST(N'2026-02-21T09:14:29.0820755' AS DateTime2), 13, CAST(N'2026-02-21T09:14:29.0820755' AS DateTime2), 13, NULL, NULL, 1, 5, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (231, 115, CAST(20.00 AS Decimal(18, 2)), 1, 6, NULL, 1, NULL, NULL, CAST(N'2026-02-21T09:14:59.8270743' AS DateTime2), 13, CAST(N'2026-02-21T09:14:59.8270743' AS DateTime2), 13, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (232, 115, CAST(60.00 AS Decimal(18, 2)), 1, 11, 10, 3, NULL, NULL, CAST(N'2026-02-21T09:15:12.9958973' AS DateTime2), 13, CAST(N'2026-02-21T09:15:46.6935587' AS DateTime2), 13, NULL, NULL, 1, 2, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (233, 116, CAST(20.00 AS Decimal(18, 2)), 1, 6, NULL, 1, NULL, NULL, CAST(N'2026-02-21T10:30:59.6057791' AS DateTime2), 13, CAST(N'2026-02-21T10:30:59.6057791' AS DateTime2), 13, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (234, 116, CAST(35.00 AS Decimal(18, 2)), 1, 6, NULL, NULL, NULL, NULL, CAST(N'2026-02-21T10:31:11.5981847' AS DateTime2), 13, CAST(N'2026-02-21T10:31:11.5981847' AS DateTime2), 13, NULL, NULL, 1, 2, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (235, 116, CAST(35.00 AS Decimal(18, 2)), 1, 6, NULL, NULL, NULL, NULL, CAST(N'2026-02-21T10:31:11.5981847' AS DateTime2), 13, CAST(N'2026-02-21T10:31:11.5981847' AS DateTime2), 13, NULL, NULL, 1, 3, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (236, 116, CAST(35.00 AS Decimal(18, 2)), 1, 6, NULL, NULL, NULL, NULL, CAST(N'2026-02-21T10:31:11.5981847' AS DateTime2), 13, CAST(N'2026-02-21T10:31:11.5981847' AS DateTime2), 13, NULL, NULL, 1, 4, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (237, 119, CAST(20.00 AS Decimal(18, 2)), 1, 5, NULL, 1, NULL, NULL, CAST(N'2026-02-21T10:45:38.4535608' AS DateTime2), 13, CAST(N'2026-02-21T10:45:38.4535608' AS DateTime2), 13, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (238, 119, CAST(60.00 AS Decimal(18, 2)), 1, 5, NULL, 1, NULL, NULL, CAST(N'2026-02-21T10:45:38.4535608' AS DateTime2), 13, CAST(N'2026-02-21T10:45:43.7817027' AS DateTime2), 13, NULL, NULL, 1, 2, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (239, 119, CAST(100.00 AS Decimal(18, 2)), 1, 3, NULL, 1, NULL, NULL, CAST(N'2026-02-21T10:45:38.4535608' AS DateTime2), 13, CAST(N'2026-02-21T10:45:49.9646409' AS DateTime2), 13, NULL, NULL, 1, 3, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (240, 119, CAST(120.00 AS Decimal(18, 2)), 1, 1, NULL, 1, NULL, NULL, CAST(N'2026-02-21T10:45:38.4535608' AS DateTime2), 13, CAST(N'2026-02-21T10:45:56.2128399' AS DateTime2), 13, NULL, NULL, 1, 4, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (241, 119, CAST(122.50 AS Decimal(18, 2)), 1, 5, NULL, NULL, NULL, NULL, CAST(N'2026-02-21T10:46:04.7412685' AS DateTime2), 13, CAST(N'2026-02-21T10:46:04.7412685' AS DateTime2), 13, NULL, NULL, 1, 5, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (242, 119, CAST(122.50 AS Decimal(18, 2)), 1, 5, NULL, NULL, NULL, NULL, CAST(N'2026-02-21T10:46:04.7412685' AS DateTime2), 13, CAST(N'2026-02-21T10:46:04.7412685' AS DateTime2), 13, NULL, NULL, 1, 6, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (243, 119, CAST(122.50 AS Decimal(18, 2)), 1, 5, NULL, NULL, NULL, NULL, CAST(N'2026-02-21T10:46:04.7412685' AS DateTime2), 13, CAST(N'2026-02-21T10:46:04.7412685' AS DateTime2), 13, NULL, NULL, 1, 7, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (244, 120, CAST(120.00 AS Decimal(18, 2)), 1, 6, NULL, 1, NULL, NULL, CAST(N'2026-02-21T10:46:21.9824941' AS DateTime2), 13, CAST(N'2026-02-21T10:46:21.9824941' AS DateTime2), 13, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (245, 120, CAST(180.00 AS Decimal(18, 2)), 1, 18, NULL, 3, NULL, NULL, CAST(N'2026-02-21T10:46:29.3558411' AS DateTime2), 13, CAST(N'2026-02-21T10:46:29.3558411' AS DateTime2), 13, NULL, NULL, 1, 2, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (246, 120, CAST(180.00 AS Decimal(18, 2)), 1, 11, NULL, 3, NULL, NULL, CAST(N'2026-02-21T10:46:29.3558411' AS DateTime2), 13, CAST(N'2026-02-21T10:46:35.9947895' AS DateTime2), 13, NULL, NULL, 1, 3, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (247, 121, CAST(170.00 AS Decimal(18, 2)), 1, 17, 10, 3, NULL, NULL, CAST(N'2026-02-21T10:47:09.3911791' AS DateTime2), 13, CAST(N'2026-02-21T10:47:09.3911791' AS DateTime2), 13, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (248, 121, CAST(170.00 AS Decimal(18, 2)), 1, 11, 10, 3, NULL, NULL, CAST(N'2026-02-21T10:47:15.0229587' AS DateTime2), 13, CAST(N'2026-02-21T10:47:15.0229587' AS DateTime2), 13, NULL, NULL, 1, 2, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (249, 122, CAST(20.00 AS Decimal(18, 2)), 1, 5, NULL, 1, NULL, NULL, CAST(N'2026-02-21T10:51:04.6663454' AS DateTime2), 13, CAST(N'2026-02-21T10:51:04.6663454' AS DateTime2), 13, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (250, 122, CAST(40.00 AS Decimal(18, 2)), 1, 5, NULL, 1, NULL, NULL, CAST(N'2026-02-21T10:51:04.6663454' AS DateTime2), 13, CAST(N'2026-02-21T10:51:04.6663454' AS DateTime2), 13, NULL, NULL, 1, 2, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (251, 122, CAST(60.00 AS Decimal(18, 2)), 1, 3, NULL, 1, NULL, NULL, CAST(N'2026-02-21T10:51:04.6663454' AS DateTime2), 13, CAST(N'2026-02-21T10:51:04.6663454' AS DateTime2), 13, NULL, NULL, 1, 3, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (252, 122, CAST(80.00 AS Decimal(18, 2)), 1, 1, NULL, 1, NULL, NULL, CAST(N'2026-02-21T10:51:04.6663454' AS DateTime2), 13, CAST(N'2026-02-21T10:51:04.6663454' AS DateTime2), 13, NULL, NULL, 1, 4, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (253, 122, CAST(77.50 AS Decimal(18, 2)), 1, 3, 9, 2, NULL, NULL, CAST(N'2026-02-21T10:51:04.6663454' AS DateTime2), 13, CAST(N'2026-02-21T10:51:19.9840554' AS DateTime2), 13, NULL, NULL, 1, 5, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (254, 122, CAST(77.50 AS Decimal(18, 2)), 1, 3, 8, 2, NULL, NULL, CAST(N'2026-02-21T10:51:04.6663454' AS DateTime2), 13, CAST(N'2026-02-21T10:51:25.2681340' AS DateTime2), 13, NULL, NULL, 1, 6, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (255, 122, CAST(77.50 AS Decimal(18, 2)), 1, 3, 8, 2, NULL, NULL, CAST(N'2026-02-21T10:51:04.6663454' AS DateTime2), 13, CAST(N'2026-02-21T10:51:31.3759183' AS DateTime2), 13, NULL, NULL, 1, 7, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (256, 123, NULL, NULL, 11, 10, 3, NULL, NULL, CAST(N'2026-02-21T10:51:04.6663454' AS DateTime2), 13, CAST(N'2026-02-21T10:51:37.6237965' AS DateTime2), 13, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (257, 123, NULL, NULL, 5, 10, 3, NULL, NULL, CAST(N'2026-02-21T10:51:04.6663454' AS DateTime2), 13, CAST(N'2026-02-21T10:51:04.6663454' AS DateTime2), 13, NULL, NULL, 1, 2, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (258, 124, CAST(20.00 AS Decimal(18, 2)), 1, 4, NULL, 1, NULL, NULL, CAST(N'2026-02-21T10:51:04.6663454' AS DateTime2), 13, CAST(N'2026-02-21T10:51:04.6663454' AS DateTime2), 13, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (259, 124, CAST(30.00 AS Decimal(18, 2)), 1, 4, NULL, 1, NULL, NULL, CAST(N'2026-02-21T10:51:04.6663454' AS DateTime2), 13, CAST(N'2026-02-21T10:51:04.6663454' AS DateTime2), 13, NULL, NULL, 1, 2, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (260, 124, CAST(40.00 AS Decimal(18, 2)), 1, 4, 7, 2, NULL, NULL, CAST(N'2026-02-21T10:51:04.6663454' AS DateTime2), 13, CAST(N'2026-02-21T10:51:04.6663454' AS DateTime2), 13, NULL, NULL, 1, 3, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (261, 124, CAST(40.00 AS Decimal(18, 2)), 1, 4, 7, 2, NULL, NULL, CAST(N'2026-02-21T10:51:04.6663454' AS DateTime2), 13, CAST(N'2026-02-21T10:51:04.6663454' AS DateTime2), 13, NULL, NULL, 1, 4, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (262, 125, CAST(61.50 AS Decimal(18, 2)), 1, 13, 10, 3, NULL, NULL, CAST(N'2026-02-21T10:51:04.6663454' AS DateTime2), 13, CAST(N'2026-02-21T10:51:04.6663454' AS DateTime2), 13, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (263, 126, CAST(37.50 AS Decimal(18, 2)), 1, 9, 10, 3, NULL, NULL, CAST(N'2026-02-21T10:51:04.6663454' AS DateTime2), 13, CAST(N'2026-02-21T10:51:04.6663454' AS DateTime2), 13, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (264, 127, CAST(20.00 AS Decimal(18, 2)), 1, 6, NULL, 1, NULL, NULL, CAST(N'2026-02-21T10:51:04.6663454' AS DateTime2), 13, CAST(N'2026-02-21T10:51:04.6663454' AS DateTime2), 13, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (265, 127, CAST(35.00 AS Decimal(18, 2)), 1, 6, 8, 2, NULL, NULL, CAST(N'2026-02-21T10:51:04.6663454' AS DateTime2), 13, CAST(N'2026-02-21T10:51:04.6663454' AS DateTime2), 13, NULL, NULL, 1, 2, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (266, 127, CAST(35.00 AS Decimal(18, 2)), 1, 6, 8, 2, NULL, NULL, CAST(N'2026-02-21T10:51:04.6663454' AS DateTime2), 13, CAST(N'2026-02-21T10:51:04.6663454' AS DateTime2), 13, NULL, NULL, 1, 3, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (267, 127, CAST(35.00 AS Decimal(18, 2)), 1, 6, 8, 2, NULL, NULL, CAST(N'2026-02-21T10:51:04.6663454' AS DateTime2), 13, CAST(N'2026-02-21T10:51:04.6663454' AS DateTime2), 13, NULL, NULL, 1, 4, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (268, 128, CAST(15.00 AS Decimal(18, 2)), 1, 9, 10, 3, NULL, NULL, CAST(N'2026-02-21T10:51:04.6663454' AS DateTime2), 13, CAST(N'2026-02-21T10:51:04.6663454' AS DateTime2), 13, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (269, 128, CAST(15.00 AS Decimal(18, 2)), 1, 7, 10, 3, NULL, NULL, CAST(N'2026-02-21T10:51:04.6663454' AS DateTime2), 13, CAST(N'2026-02-21T10:51:04.6663454' AS DateTime2), 13, NULL, NULL, 1, 2, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (270, 129, CAST(7.00 AS Decimal(18, 2)), 1, 16, 10, 3, NULL, NULL, CAST(N'2026-02-21T10:51:04.6663454' AS DateTime2), 13, CAST(N'2026-02-21T10:51:04.6663454' AS DateTime2), 13, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (271, 129, CAST(7.00 AS Decimal(18, 2)), 1, 14, 10, 3, NULL, NULL, CAST(N'2026-02-21T10:51:04.6663454' AS DateTime2), 13, CAST(N'2026-02-21T10:51:04.6663454' AS DateTime2), 13, NULL, NULL, 1, 2, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (272, 130, CAST(20.00 AS Decimal(18, 2)), 1, 6, NULL, 1, NULL, NULL, CAST(N'2026-02-21T10:52:19.0965891' AS DateTime2), 13, CAST(N'2026-02-21T10:52:19.0965891' AS DateTime2), 13, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (273, 130, CAST(60.00 AS Decimal(18, 2)), 1, 6, NULL, 1, NULL, NULL, CAST(N'2026-02-21T10:52:19.0965891' AS DateTime2), 13, CAST(N'2026-02-21T10:52:19.0965891' AS DateTime2), 13, NULL, NULL, 1, 2, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (274, 130, CAST(100.00 AS Decimal(18, 2)), 1, 1, NULL, 1, NULL, NULL, CAST(N'2026-02-21T10:52:19.0965891' AS DateTime2), 13, CAST(N'2026-02-21T10:52:19.0965891' AS DateTime2), 13, NULL, NULL, 1, 3, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (275, 130, CAST(107.50 AS Decimal(18, 2)), 1, 4, 8, NULL, NULL, NULL, CAST(N'2026-02-21T10:52:19.0965891' AS DateTime2), 13, CAST(N'2026-02-21T10:52:29.0169876' AS DateTime2), 13, NULL, NULL, 1, 4, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (276, 130, CAST(107.50 AS Decimal(18, 2)), 1, 4, 9, NULL, NULL, NULL, CAST(N'2026-02-21T10:52:19.0965891' AS DateTime2), 13, CAST(N'2026-02-21T10:52:34.1428872' AS DateTime2), 13, NULL, NULL, 1, 5, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (277, 130, CAST(107.50 AS Decimal(18, 2)), 1, 4, 9, NULL, NULL, NULL, CAST(N'2026-02-21T10:52:19.0965891' AS DateTime2), 13, CAST(N'2026-02-21T10:52:40.1870176' AS DateTime2), 13, NULL, NULL, 1, 6, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (278, 131, CAST(120.00 AS Decimal(18, 2)), 1, 6, NULL, 1, NULL, NULL, CAST(N'2026-02-21T10:52:19.0965891' AS DateTime2), 13, CAST(N'2026-02-21T10:52:19.0965891' AS DateTime2), 13, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (279, 131, CAST(180.00 AS Decimal(18, 2)), 1, 17, 10, 3, NULL, NULL, CAST(N'2026-02-21T10:52:19.0965891' AS DateTime2), 13, CAST(N'2026-02-21T10:52:46.3073297' AS DateTime2), 13, NULL, NULL, 1, 2, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (280, 131, CAST(180.00 AS Decimal(18, 2)), 1, 11, 9, 3, NULL, NULL, CAST(N'2026-02-21T10:52:19.0965891' AS DateTime2), 13, CAST(N'2026-02-21T10:52:19.0965891' AS DateTime2), 13, NULL, NULL, 1, 3, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (281, 132, CAST(36.00 AS Decimal(18, 2)), 1, 6, NULL, 1, NULL, NULL, CAST(N'2026-02-21T10:52:19.0965891' AS DateTime2), 13, CAST(N'2026-02-21T10:52:19.0965891' AS DateTime2), 13, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (282, 132, CAST(49.40 AS Decimal(18, 2)), 1, 9, 10, 3, NULL, NULL, CAST(N'2026-02-21T10:52:19.0965891' AS DateTime2), 13, CAST(N'2026-02-21T10:52:19.0965891' AS DateTime2), 13, NULL, NULL, 1, 2, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (283, 132, CAST(49.40 AS Decimal(18, 2)), 1, 6, 10, 3, NULL, NULL, CAST(N'2026-02-21T10:52:19.0965891' AS DateTime2), 13, CAST(N'2026-02-21T10:52:19.0965891' AS DateTime2), 13, NULL, NULL, 1, 3, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (284, 133, NULL, NULL, 20, 10, 3, NULL, NULL, CAST(N'2026-02-21T10:52:19.0965891' AS DateTime2), 13, CAST(N'2026-02-21T10:52:57.5680011' AS DateTime2), 13, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (285, 134, CAST(20.00 AS Decimal(18, 2)), 1, 6, NULL, 1, NULL, NULL, CAST(N'2026-02-21T10:55:21.6619210' AS DateTime2), 13, CAST(N'2026-02-21T10:55:21.6619210' AS DateTime2), 13, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (286, 134, CAST(30.00 AS Decimal(18, 2)), 1, 6, NULL, 1, NULL, NULL, CAST(N'2026-02-21T10:55:21.6619210' AS DateTime2), 13, CAST(N'2026-02-21T10:55:21.6619210' AS DateTime2), 13, NULL, NULL, 1, 2, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (287, 134, CAST(40.00 AS Decimal(18, 2)), 1, 4, NULL, 1, NULL, NULL, CAST(N'2026-02-21T10:55:21.6619210' AS DateTime2), 13, CAST(N'2026-02-21T10:55:21.6619210' AS DateTime2), 13, NULL, NULL, 1, 3, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (288, 134, CAST(50.00 AS Decimal(18, 2)), 1, 1, NULL, 1, NULL, NULL, CAST(N'2026-02-21T10:55:21.6619210' AS DateTime2), 13, CAST(N'2026-02-21T10:55:21.6619210' AS DateTime2), 13, NULL, NULL, 1, 4, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (289, 134, CAST(52.50 AS Decimal(18, 2)), 1, 4, 9, NULL, NULL, NULL, CAST(N'2026-02-21T10:55:21.6619210' AS DateTime2), 13, CAST(N'2026-02-21T10:55:29.6068087' AS DateTime2), 13, NULL, NULL, 1, 5, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (290, 134, CAST(52.50 AS Decimal(18, 2)), 1, 4, 9, NULL, NULL, NULL, CAST(N'2026-02-21T10:55:21.6619210' AS DateTime2), 13, CAST(N'2026-02-21T10:55:34.6628069' AS DateTime2), 13, NULL, NULL, 1, 6, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (291, 134, CAST(52.50 AS Decimal(18, 2)), 1, 4, 9, NULL, NULL, NULL, CAST(N'2026-02-21T10:55:21.6619210' AS DateTime2), 13, CAST(N'2026-02-21T10:55:40.2038243' AS DateTime2), 13, NULL, NULL, 1, 7, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (292, 135, NULL, NULL, 5, NULL, NULL, NULL, NULL, CAST(N'2026-02-21T10:55:21.6619210' AS DateTime2), 13, CAST(N'2026-02-21T10:55:21.6619210' AS DateTime2), 13, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (293, 135, NULL, NULL, 5, NULL, NULL, NULL, NULL, CAST(N'2026-02-21T10:55:21.6619210' AS DateTime2), 13, CAST(N'2026-02-21T10:55:21.6619210' AS DateTime2), 13, NULL, NULL, 1, 2, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (294, 135, NULL, NULL, 5, NULL, NULL, NULL, NULL, CAST(N'2026-02-21T10:55:21.6619210' AS DateTime2), 13, CAST(N'2026-02-21T10:55:21.6619210' AS DateTime2), 13, NULL, NULL, 1, 3, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (295, 135, NULL, NULL, 5, NULL, NULL, NULL, NULL, CAST(N'2026-02-21T10:55:21.6619210' AS DateTime2), 13, CAST(N'2026-02-21T10:55:21.6619210' AS DateTime2), 13, NULL, NULL, 1, 4, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (296, 135, NULL, NULL, 5, NULL, NULL, NULL, NULL, CAST(N'2026-02-21T10:55:21.6619210' AS DateTime2), 13, CAST(N'2026-02-21T10:55:21.6619210' AS DateTime2), 13, NULL, NULL, 1, 5, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (297, 136, CAST(20.00 AS Decimal(18, 2)), 1, 6, NULL, 1, NULL, NULL, CAST(N'2026-02-21T10:55:21.6619210' AS DateTime2), 13, CAST(N'2026-02-21T10:55:21.6619210' AS DateTime2), 13, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (298, 136, CAST(60.00 AS Decimal(18, 2)), 1, 11, 10, 3, NULL, NULL, CAST(N'2026-02-21T10:55:21.6619210' AS DateTime2), 13, CAST(N'2026-02-21T10:55:21.6619210' AS DateTime2), 13, NULL, NULL, 1, 2, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (299, 137, CAST(20.00 AS Decimal(18, 2)), 1, 6, NULL, 1, NULL, NULL, CAST(N'2026-02-21T10:55:21.6619210' AS DateTime2), 13, CAST(N'2026-02-21T10:55:21.6619210' AS DateTime2), 13, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (300, 137, CAST(35.00 AS Decimal(18, 2)), 1, 6, NULL, NULL, NULL, NULL, CAST(N'2026-02-21T10:55:21.6619210' AS DateTime2), 13, CAST(N'2026-02-21T10:55:21.6619210' AS DateTime2), 13, NULL, NULL, 1, 2, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (301, 137, CAST(35.00 AS Decimal(18, 2)), 1, 6, NULL, NULL, NULL, NULL, CAST(N'2026-02-21T10:55:21.6619210' AS DateTime2), 13, CAST(N'2026-02-21T10:55:21.6619210' AS DateTime2), 13, NULL, NULL, 1, 3, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (302, 137, CAST(35.00 AS Decimal(18, 2)), 1, 6, NULL, NULL, NULL, NULL, CAST(N'2026-02-21T10:55:21.6619210' AS DateTime2), 13, CAST(N'2026-02-21T10:55:21.6619210' AS DateTime2), 13, NULL, NULL, 1, 4, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (303, 138, CAST(20.00 AS Decimal(18, 2)), 1, 5, NULL, 1, NULL, NULL, CAST(N'2026-02-21T10:56:19.0738714' AS DateTime2), 13, CAST(N'2026-02-21T10:56:19.0738714' AS DateTime2), 13, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (304, 138, CAST(60.00 AS Decimal(18, 2)), 1, 5, NULL, 1, NULL, NULL, CAST(N'2026-02-21T10:56:19.0738714' AS DateTime2), 13, CAST(N'2026-02-21T10:56:19.0738714' AS DateTime2), 13, NULL, NULL, 1, 2, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (305, 138, CAST(100.00 AS Decimal(18, 2)), 1, 3, NULL, 1, NULL, NULL, CAST(N'2026-02-21T10:56:19.0738714' AS DateTime2), 13, CAST(N'2026-02-21T10:56:19.0738714' AS DateTime2), 13, NULL, NULL, 1, 3, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (306, 138, CAST(120.00 AS Decimal(18, 2)), 1, 1, NULL, 1, NULL, NULL, CAST(N'2026-02-21T10:56:19.0738714' AS DateTime2), 13, CAST(N'2026-02-21T10:56:19.0738714' AS DateTime2), 13, NULL, NULL, 1, 4, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (307, 138, CAST(127.50 AS Decimal(18, 2)), 1, 3, NULL, NULL, NULL, NULL, CAST(N'2026-02-21T10:56:19.0738714' AS DateTime2), 13, CAST(N'2026-02-21T10:56:27.2398091' AS DateTime2), 13, NULL, NULL, 1, 5, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (308, 138, CAST(127.50 AS Decimal(18, 2)), 1, 3, NULL, NULL, NULL, NULL, CAST(N'2026-02-21T10:56:19.0738714' AS DateTime2), 13, CAST(N'2026-02-21T10:56:39.5441834' AS DateTime2), 13, NULL, NULL, 1, 6, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (309, 138, CAST(127.50 AS Decimal(18, 2)), 1, 3, NULL, NULL, NULL, NULL, CAST(N'2026-02-21T10:56:19.0738714' AS DateTime2), 13, CAST(N'2026-02-21T10:56:44.9017629' AS DateTime2), 13, NULL, NULL, 1, 7, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (310, 139, CAST(120.00 AS Decimal(18, 2)), 1, 6, NULL, 1, NULL, NULL, CAST(N'2026-02-21T10:56:19.0738714' AS DateTime2), 13, CAST(N'2026-02-21T10:56:19.0738714' AS DateTime2), 13, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (311, 139, CAST(190.00 AS Decimal(18, 2)), 1, 14, NULL, 3, NULL, NULL, CAST(N'2026-02-21T10:56:19.0738714' AS DateTime2), 13, CAST(N'2026-02-21T10:56:55.2287656' AS DateTime2), 13, NULL, NULL, 1, 2, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (312, 139, CAST(190.00 AS Decimal(18, 2)), 1, 10, NULL, 3, NULL, NULL, CAST(N'2026-02-21T10:56:19.0738714' AS DateTime2), 13, CAST(N'2026-02-21T10:57:01.2534466' AS DateTime2), 13, NULL, NULL, 1, 3, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (313, 140, CAST(170.00 AS Decimal(18, 2)), 1, 17, 10, 3, NULL, NULL, CAST(N'2026-02-21T10:56:19.0738714' AS DateTime2), 13, CAST(N'2026-02-21T10:56:19.0738714' AS DateTime2), 13, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (314, 140, CAST(170.00 AS Decimal(18, 2)), 1, 11, 10, 3, NULL, NULL, CAST(N'2026-02-21T10:56:19.0738714' AS DateTime2), 13, CAST(N'2026-02-21T10:56:19.0738714' AS DateTime2), 13, NULL, NULL, 1, 2, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (315, 141, CAST(20.00 AS Decimal(18, 2)), 1, 5, NULL, 1, NULL, NULL, CAST(N'2026-02-21T11:01:56.5306438' AS DateTime2), 13, CAST(N'2026-02-21T11:01:56.5306438' AS DateTime2), 13, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (316, 141, CAST(40.00 AS Decimal(18, 2)), 1, 5, NULL, 1, NULL, NULL, CAST(N'2026-02-21T11:01:56.5306438' AS DateTime2), 13, CAST(N'2026-02-21T11:01:56.5306438' AS DateTime2), 13, NULL, NULL, 1, 2, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (317, 141, CAST(60.00 AS Decimal(18, 2)), 1, 3, NULL, 1, NULL, NULL, CAST(N'2026-02-21T11:01:56.5306438' AS DateTime2), 13, CAST(N'2026-02-21T11:01:56.5306438' AS DateTime2), 13, NULL, NULL, 1, 3, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (318, 141, CAST(80.00 AS Decimal(18, 2)), 1, 1, NULL, 1, NULL, NULL, CAST(N'2026-02-21T11:01:56.5306438' AS DateTime2), 13, CAST(N'2026-02-21T11:01:56.5306438' AS DateTime2), 13, NULL, NULL, 1, 4, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (319, 141, CAST(80.00 AS Decimal(18, 2)), 1, 1, 9, 2, NULL, NULL, CAST(N'2026-02-21T11:01:56.5306438' AS DateTime2), 13, CAST(N'2026-02-21T11:02:04.2653036' AS DateTime2), 13, NULL, NULL, 1, 5, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (320, 141, CAST(80.00 AS Decimal(18, 2)), 1, 1, 8, 2, NULL, NULL, CAST(N'2026-02-21T11:01:56.5306438' AS DateTime2), 13, CAST(N'2026-02-21T11:02:09.8247102' AS DateTime2), 13, NULL, NULL, 1, 6, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (321, 141, CAST(80.00 AS Decimal(18, 2)), 1, 1, 8, 2, NULL, NULL, CAST(N'2026-02-21T11:01:56.5306438' AS DateTime2), 13, CAST(N'2026-02-21T11:02:14.5636762' AS DateTime2), 13, NULL, NULL, 1, 7, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (322, 142, NULL, NULL, 11, 10, 3, NULL, NULL, CAST(N'2026-02-21T11:01:56.5306438' AS DateTime2), 13, CAST(N'2026-02-21T11:01:56.5306438' AS DateTime2), 13, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (323, 142, NULL, NULL, 5, 10, 3, NULL, NULL, CAST(N'2026-02-21T11:01:56.5306438' AS DateTime2), 13, CAST(N'2026-02-21T11:01:56.5306438' AS DateTime2), 13, NULL, NULL, 1, 2, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (324, 143, CAST(20.00 AS Decimal(18, 2)), 1, 4, NULL, 1, NULL, NULL, CAST(N'2026-02-21T11:01:56.5306438' AS DateTime2), 13, CAST(N'2026-02-21T11:01:56.5306438' AS DateTime2), 13, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (325, 143, CAST(30.00 AS Decimal(18, 2)), 1, 4, NULL, 1, NULL, NULL, CAST(N'2026-02-21T11:01:56.5306438' AS DateTime2), 13, CAST(N'2026-02-21T11:01:56.5306438' AS DateTime2), 13, NULL, NULL, 1, 2, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (326, 143, CAST(40.00 AS Decimal(18, 2)), 1, 4, 7, 2, NULL, NULL, CAST(N'2026-02-21T11:01:56.5306438' AS DateTime2), 13, CAST(N'2026-02-21T11:01:56.5306438' AS DateTime2), 13, NULL, NULL, 1, 3, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (327, 143, CAST(40.00 AS Decimal(18, 2)), 1, 4, 7, 2, NULL, NULL, CAST(N'2026-02-21T11:01:56.5306438' AS DateTime2), 13, CAST(N'2026-02-21T11:01:56.5306438' AS DateTime2), 13, NULL, NULL, 1, 4, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (328, 144, CAST(61.50 AS Decimal(18, 2)), 1, 13, 10, 3, NULL, NULL, CAST(N'2026-02-21T11:01:56.5306438' AS DateTime2), 13, CAST(N'2026-02-21T11:01:56.5306438' AS DateTime2), 13, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (329, 145, CAST(37.50 AS Decimal(18, 2)), 1, 9, 10, 3, NULL, NULL, CAST(N'2026-02-21T11:01:56.5306438' AS DateTime2), 13, CAST(N'2026-02-21T11:01:56.5306438' AS DateTime2), 13, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (330, 146, CAST(20.00 AS Decimal(18, 2)), 1, 6, NULL, 1, NULL, NULL, CAST(N'2026-02-21T11:01:56.5306438' AS DateTime2), 13, CAST(N'2026-02-21T11:01:56.5306438' AS DateTime2), 13, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (331, 146, CAST(35.00 AS Decimal(18, 2)), 1, 6, 8, 2, NULL, NULL, CAST(N'2026-02-21T11:01:56.5306438' AS DateTime2), 13, CAST(N'2026-02-21T11:01:56.5306438' AS DateTime2), 13, NULL, NULL, 1, 2, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (332, 146, CAST(35.00 AS Decimal(18, 2)), 1, 6, 8, 2, NULL, NULL, CAST(N'2026-02-21T11:01:56.5306438' AS DateTime2), 13, CAST(N'2026-02-21T11:01:56.5306438' AS DateTime2), 13, NULL, NULL, 1, 3, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (333, 146, CAST(35.00 AS Decimal(18, 2)), 1, 6, 8, 2, NULL, NULL, CAST(N'2026-02-21T11:01:56.5306438' AS DateTime2), 13, CAST(N'2026-02-21T11:01:56.5306438' AS DateTime2), 13, NULL, NULL, 1, 4, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (334, 147, CAST(15.00 AS Decimal(18, 2)), 1, 9, 10, 3, NULL, NULL, CAST(N'2026-02-21T11:01:56.5306438' AS DateTime2), 13, CAST(N'2026-02-21T11:01:56.5306438' AS DateTime2), 13, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (335, 147, CAST(15.00 AS Decimal(18, 2)), 1, 7, 10, 3, NULL, NULL, CAST(N'2026-02-21T11:01:56.5306438' AS DateTime2), 13, CAST(N'2026-02-21T11:01:56.5306438' AS DateTime2), 13, NULL, NULL, 1, 2, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (336, 148, CAST(7.00 AS Decimal(18, 2)), 1, 16, 10, 3, NULL, NULL, CAST(N'2026-02-21T11:01:56.5306438' AS DateTime2), 13, CAST(N'2026-02-21T11:01:56.5306438' AS DateTime2), 13, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (337, 148, CAST(7.00 AS Decimal(18, 2)), 1, 14, 10, 3, NULL, NULL, CAST(N'2026-02-21T11:01:56.5306438' AS DateTime2), 13, CAST(N'2026-02-21T11:01:56.5306438' AS DateTime2), 13, NULL, NULL, 1, 2, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (338, 149, CAST(20.00 AS Decimal(18, 2)), 1, 6, NULL, 1, NULL, NULL, CAST(N'2026-02-21T11:02:46.8333574' AS DateTime2), 13, CAST(N'2026-02-21T11:02:46.8333574' AS DateTime2), 13, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (339, 149, CAST(60.00 AS Decimal(18, 2)), 1, 6, NULL, 1, NULL, NULL, CAST(N'2026-02-21T11:02:46.8333574' AS DateTime2), 13, CAST(N'2026-02-21T11:02:46.8333574' AS DateTime2), 13, NULL, NULL, 1, 2, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (340, 149, CAST(100.00 AS Decimal(18, 2)), 1, 1, NULL, 1, NULL, NULL, CAST(N'2026-02-21T11:02:46.8333574' AS DateTime2), 13, CAST(N'2026-02-21T11:02:46.8333574' AS DateTime2), 13, NULL, NULL, 1, 3, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (341, 149, CAST(112.50 AS Decimal(18, 2)), 1, 2, 8, NULL, NULL, NULL, CAST(N'2026-02-21T11:02:46.8333574' AS DateTime2), 13, CAST(N'2026-02-21T11:03:02.3696931' AS DateTime2), 13, NULL, NULL, 1, 4, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (342, 149, CAST(112.50 AS Decimal(18, 2)), 1, 2, 9, NULL, NULL, NULL, CAST(N'2026-02-21T11:02:46.8333574' AS DateTime2), 13, CAST(N'2026-02-21T11:03:07.3821109' AS DateTime2), 13, NULL, NULL, 1, 5, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (343, 149, CAST(112.50 AS Decimal(18, 2)), 1, 2, 9, NULL, NULL, NULL, CAST(N'2026-02-21T11:02:46.8333574' AS DateTime2), 13, CAST(N'2026-02-21T11:03:14.1889087' AS DateTime2), 13, NULL, NULL, 1, 6, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (344, 150, CAST(120.00 AS Decimal(18, 2)), 1, 6, NULL, 1, NULL, NULL, CAST(N'2026-02-21T11:02:46.8333574' AS DateTime2), 13, CAST(N'2026-02-21T11:02:46.8333574' AS DateTime2), 13, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (345, 150, CAST(180.00 AS Decimal(18, 2)), 1, 17, 10, 3, NULL, NULL, CAST(N'2026-02-21T11:02:46.8333574' AS DateTime2), 13, CAST(N'2026-02-21T11:02:46.8333574' AS DateTime2), 13, NULL, NULL, 1, 2, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (346, 150, CAST(180.00 AS Decimal(18, 2)), 1, 11, 9, 3, NULL, NULL, CAST(N'2026-02-21T11:02:46.8333574' AS DateTime2), 13, CAST(N'2026-02-21T11:02:46.8333574' AS DateTime2), 13, NULL, NULL, 1, 3, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (347, 151, CAST(36.00 AS Decimal(18, 2)), 1, 6, NULL, 1, NULL, NULL, CAST(N'2026-02-21T11:02:46.8333574' AS DateTime2), 13, CAST(N'2026-02-21T11:02:46.8333574' AS DateTime2), 13, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (348, 151, CAST(49.40 AS Decimal(18, 2)), 1, 9, 10, 3, NULL, NULL, CAST(N'2026-02-21T11:02:46.8333574' AS DateTime2), 13, CAST(N'2026-02-21T11:02:46.8333574' AS DateTime2), 13, NULL, NULL, 1, 2, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (349, 151, CAST(49.40 AS Decimal(18, 2)), 1, 6, 10, 3, NULL, NULL, CAST(N'2026-02-21T11:02:46.8333574' AS DateTime2), 13, CAST(N'2026-02-21T11:02:46.8333574' AS DateTime2), 13, NULL, NULL, 1, 3, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (350, 152, NULL, NULL, 20, 10, 3, NULL, NULL, CAST(N'2026-02-21T11:02:46.8333574' AS DateTime2), 13, CAST(N'2026-02-21T11:02:46.8333574' AS DateTime2), 13, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (351, 153, CAST(20.00 AS Decimal(18, 2)), 1, 6, NULL, 1, NULL, NULL, CAST(N'2026-02-21T11:03:51.9074516' AS DateTime2), 13, CAST(N'2026-02-21T11:03:51.9074516' AS DateTime2), 13, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (352, 153, CAST(30.00 AS Decimal(18, 2)), 1, 6, NULL, 1, NULL, NULL, CAST(N'2026-02-21T11:03:51.9074516' AS DateTime2), 13, CAST(N'2026-02-21T11:03:51.9074516' AS DateTime2), 13, NULL, NULL, 1, 2, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (353, 153, CAST(40.00 AS Decimal(18, 2)), 1, 4, NULL, 1, NULL, NULL, CAST(N'2026-02-21T11:03:51.9074516' AS DateTime2), 13, CAST(N'2026-02-21T11:03:51.9074516' AS DateTime2), 13, NULL, NULL, 1, 3, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (354, 153, CAST(50.00 AS Decimal(18, 2)), 1, 1, NULL, 1, NULL, NULL, CAST(N'2026-02-21T11:03:51.9074516' AS DateTime2), 13, CAST(N'2026-02-21T11:03:51.9074516' AS DateTime2), 13, NULL, NULL, 1, 4, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (355, 153, CAST(55.00 AS Decimal(18, 2)), 1, 2, 9, NULL, NULL, NULL, CAST(N'2026-02-21T11:03:51.9074516' AS DateTime2), 13, CAST(N'2026-02-21T11:03:59.5321989' AS DateTime2), 13, NULL, NULL, 1, 5, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (356, 153, CAST(55.00 AS Decimal(18, 2)), 1, 2, 9, NULL, NULL, NULL, CAST(N'2026-02-21T11:03:51.9074516' AS DateTime2), 13, CAST(N'2026-02-21T11:04:04.0629988' AS DateTime2), 13, NULL, NULL, 1, 6, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (357, 153, CAST(55.00 AS Decimal(18, 2)), 1, 2, 9, NULL, NULL, NULL, CAST(N'2026-02-21T11:03:51.9074516' AS DateTime2), 13, CAST(N'2026-02-21T11:04:08.3294383' AS DateTime2), 13, NULL, NULL, 1, 7, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (358, 154, NULL, NULL, 5, NULL, NULL, NULL, NULL, CAST(N'2026-02-21T11:03:51.9074516' AS DateTime2), 13, CAST(N'2026-02-21T11:03:51.9074516' AS DateTime2), 13, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (359, 154, NULL, NULL, 5, NULL, NULL, NULL, NULL, CAST(N'2026-02-21T11:03:51.9074516' AS DateTime2), 13, CAST(N'2026-02-21T11:03:51.9074516' AS DateTime2), 13, NULL, NULL, 1, 2, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (360, 154, NULL, NULL, 5, NULL, NULL, NULL, NULL, CAST(N'2026-02-21T11:03:51.9074516' AS DateTime2), 13, CAST(N'2026-02-21T11:03:51.9074516' AS DateTime2), 13, NULL, NULL, 1, 3, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (361, 154, NULL, NULL, 5, NULL, NULL, NULL, NULL, CAST(N'2026-02-21T11:03:51.9074516' AS DateTime2), 13, CAST(N'2026-02-21T11:03:51.9074516' AS DateTime2), 13, NULL, NULL, 1, 4, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (362, 154, NULL, NULL, 5, NULL, NULL, NULL, NULL, CAST(N'2026-02-21T11:03:51.9074516' AS DateTime2), 13, CAST(N'2026-02-21T11:03:51.9074516' AS DateTime2), 13, NULL, NULL, 1, 5, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (363, 155, CAST(20.00 AS Decimal(18, 2)), 1, 6, NULL, 1, NULL, NULL, CAST(N'2026-02-21T11:03:51.9074516' AS DateTime2), 13, CAST(N'2026-02-21T11:03:51.9074516' AS DateTime2), 13, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (364, 155, CAST(60.00 AS Decimal(18, 2)), 1, 11, 10, 3, NULL, NULL, CAST(N'2026-02-21T11:03:51.9074516' AS DateTime2), 13, CAST(N'2026-02-21T11:03:51.9074516' AS DateTime2), 13, NULL, NULL, 1, 2, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (365, 156, CAST(20.00 AS Decimal(18, 2)), 1, 6, NULL, 1, NULL, NULL, CAST(N'2026-02-21T11:03:51.9074516' AS DateTime2), 13, CAST(N'2026-02-21T11:03:51.9074516' AS DateTime2), 13, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (366, 156, CAST(35.00 AS Decimal(18, 2)), 1, 6, NULL, NULL, NULL, NULL, CAST(N'2026-02-21T11:03:51.9074516' AS DateTime2), 13, CAST(N'2026-02-21T11:03:51.9074516' AS DateTime2), 13, NULL, NULL, 1, 2, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (367, 156, CAST(35.00 AS Decimal(18, 2)), 1, 6, NULL, NULL, NULL, NULL, CAST(N'2026-02-21T11:03:51.9074516' AS DateTime2), 13, CAST(N'2026-02-21T11:03:51.9074516' AS DateTime2), 13, NULL, NULL, 1, 3, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (368, 156, CAST(35.00 AS Decimal(18, 2)), 1, 6, NULL, NULL, NULL, NULL, CAST(N'2026-02-21T11:03:51.9074516' AS DateTime2), 13, CAST(N'2026-02-21T11:03:51.9074516' AS DateTime2), 13, NULL, NULL, 1, 4, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (369, 157, CAST(20.00 AS Decimal(18, 2)), 1, 5, NULL, 1, NULL, NULL, CAST(N'2026-02-21T11:04:36.6609161' AS DateTime2), 13, CAST(N'2026-02-21T11:04:36.6609161' AS DateTime2), 13, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (370, 157, CAST(60.00 AS Decimal(18, 2)), 1, 5, NULL, 1, NULL, NULL, CAST(N'2026-02-21T11:04:36.6609161' AS DateTime2), 13, CAST(N'2026-02-21T11:04:36.6609161' AS DateTime2), 13, NULL, NULL, 1, 2, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (371, 157, CAST(100.00 AS Decimal(18, 2)), 1, 3, NULL, 1, NULL, NULL, CAST(N'2026-02-21T11:04:36.6609161' AS DateTime2), 13, CAST(N'2026-02-21T11:04:36.6609161' AS DateTime2), 13, NULL, NULL, 1, 3, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (372, 157, CAST(120.00 AS Decimal(18, 2)), 1, 1, NULL, 1, NULL, NULL, CAST(N'2026-02-21T11:04:36.6609161' AS DateTime2), 13, CAST(N'2026-02-21T11:04:36.6609161' AS DateTime2), 13, NULL, NULL, 1, 4, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (373, 157, CAST(132.50 AS Decimal(18, 2)), 1, 1, NULL, NULL, NULL, NULL, CAST(N'2026-02-21T11:04:36.6609161' AS DateTime2), 13, CAST(N'2026-02-21T11:04:46.2928623' AS DateTime2), 13, NULL, NULL, 1, 5, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (374, 157, CAST(132.50 AS Decimal(18, 2)), 1, 1, NULL, NULL, NULL, NULL, CAST(N'2026-02-21T11:04:36.6609161' AS DateTime2), 13, CAST(N'2026-02-21T11:04:51.7726333' AS DateTime2), 13, NULL, NULL, 1, 6, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (375, 157, CAST(132.50 AS Decimal(18, 2)), 1, 1, NULL, NULL, NULL, NULL, CAST(N'2026-02-21T11:04:36.6609161' AS DateTime2), 13, CAST(N'2026-02-21T11:04:56.3450948' AS DateTime2), 13, NULL, NULL, 1, 7, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (376, 158, CAST(120.00 AS Decimal(18, 2)), 1, 6, NULL, 1, NULL, NULL, CAST(N'2026-02-21T11:04:36.6609161' AS DateTime2), 13, CAST(N'2026-02-21T11:04:36.6609161' AS DateTime2), 13, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (377, 158, CAST(190.00 AS Decimal(18, 2)), 1, 14, NULL, 3, NULL, NULL, CAST(N'2026-02-21T11:04:36.6609161' AS DateTime2), 13, CAST(N'2026-02-21T11:04:36.6609161' AS DateTime2), 13, NULL, NULL, 1, 2, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (378, 158, CAST(190.00 AS Decimal(18, 2)), 1, 10, NULL, 3, NULL, NULL, CAST(N'2026-02-21T11:04:36.6609161' AS DateTime2), 13, CAST(N'2026-02-21T11:04:36.6609161' AS DateTime2), 13, NULL, NULL, 1, 3, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (379, 159, CAST(170.00 AS Decimal(18, 2)), 1, 17, 10, 3, NULL, NULL, CAST(N'2026-02-21T11:04:36.6609161' AS DateTime2), 13, CAST(N'2026-02-21T11:04:36.6609161' AS DateTime2), 13, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (380, 159, CAST(170.00 AS Decimal(18, 2)), 1, 11, 10, 3, NULL, NULL, CAST(N'2026-02-21T11:04:36.6609161' AS DateTime2), 13, CAST(N'2026-02-21T11:04:36.6609161' AS DateTime2), 13, NULL, NULL, 1, 2, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (381, 160, CAST(20.00 AS Decimal(18, 2)), 1, 5, NULL, 1, NULL, NULL, CAST(N'2026-02-21T11:07:55.0843847' AS DateTime2), 13, CAST(N'2026-02-21T11:07:55.0843847' AS DateTime2), 13, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (382, 160, CAST(40.00 AS Decimal(18, 2)), 1, 5, NULL, 1, NULL, NULL, CAST(N'2026-02-21T11:07:55.0843847' AS DateTime2), 13, CAST(N'2026-02-21T11:07:55.0843847' AS DateTime2), 13, NULL, NULL, 1, 2, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (383, 160, CAST(60.00 AS Decimal(18, 2)), 1, 3, NULL, 1, NULL, NULL, CAST(N'2026-02-21T11:07:55.0843847' AS DateTime2), 13, CAST(N'2026-02-21T11:07:55.0843847' AS DateTime2), 13, NULL, NULL, 1, 3, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (384, 160, CAST(80.00 AS Decimal(18, 2)), 1, 1, NULL, 1, NULL, NULL, CAST(N'2026-02-21T11:07:55.0843847' AS DateTime2), 13, CAST(N'2026-02-21T11:07:55.0843847' AS DateTime2), 13, NULL, NULL, 1, 4, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (385, 160, CAST(77.50 AS Decimal(18, 2)), 1, 5, 9, 2, NULL, NULL, CAST(N'2026-02-21T11:07:55.0843847' AS DateTime2), 13, CAST(N'2026-02-21T11:08:02.5454901' AS DateTime2), 13, NULL, NULL, 1, 5, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (386, 160, CAST(77.50 AS Decimal(18, 2)), 1, 5, 8, 2, NULL, NULL, CAST(N'2026-02-21T11:07:55.0843847' AS DateTime2), 13, CAST(N'2026-02-21T11:08:10.4388860' AS DateTime2), 13, NULL, NULL, 1, 6, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (387, 160, CAST(77.50 AS Decimal(18, 2)), 1, 5, 8, 2, NULL, NULL, CAST(N'2026-02-21T11:07:55.0843847' AS DateTime2), 13, CAST(N'2026-02-21T11:08:15.8139082' AS DateTime2), 13, NULL, NULL, 1, 7, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (388, 161, NULL, NULL, 9, 10, 3, NULL, NULL, CAST(N'2026-02-21T11:07:55.0843847' AS DateTime2), 13, CAST(N'2026-02-21T11:08:25.5507942' AS DateTime2), 13, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (389, 161, NULL, NULL, 5, 10, 3, NULL, NULL, CAST(N'2026-02-21T11:07:55.0843847' AS DateTime2), 13, CAST(N'2026-02-21T11:07:55.0843847' AS DateTime2), 13, NULL, NULL, 1, 2, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (390, 162, CAST(20.00 AS Decimal(18, 2)), 1, 4, NULL, 1, NULL, NULL, CAST(N'2026-02-21T11:07:55.0843847' AS DateTime2), 13, CAST(N'2026-02-21T11:07:55.0843847' AS DateTime2), 13, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (391, 162, CAST(30.00 AS Decimal(18, 2)), 1, 4, NULL, 1, NULL, NULL, CAST(N'2026-02-21T11:07:55.0843847' AS DateTime2), 13, CAST(N'2026-02-21T11:07:55.0843847' AS DateTime2), 13, NULL, NULL, 1, 2, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (392, 162, CAST(40.00 AS Decimal(18, 2)), 1, 4, 7, 2, NULL, NULL, CAST(N'2026-02-21T11:07:55.0843847' AS DateTime2), 13, CAST(N'2026-02-21T11:07:55.0843847' AS DateTime2), 13, NULL, NULL, 1, 3, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (393, 162, CAST(40.00 AS Decimal(18, 2)), 1, 4, 7, 2, NULL, NULL, CAST(N'2026-02-21T11:07:55.0843847' AS DateTime2), 13, CAST(N'2026-02-21T11:07:55.0843847' AS DateTime2), 13, NULL, NULL, 1, 4, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (394, 163, CAST(61.50 AS Decimal(18, 2)), 1, 13, 10, 3, NULL, NULL, CAST(N'2026-02-21T11:07:55.0843847' AS DateTime2), 13, CAST(N'2026-02-21T11:07:55.0843847' AS DateTime2), 13, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (395, 164, CAST(37.50 AS Decimal(18, 2)), 1, 9, 10, 3, NULL, NULL, CAST(N'2026-02-21T11:07:55.0843847' AS DateTime2), 13, CAST(N'2026-02-21T11:07:55.0843847' AS DateTime2), 13, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (396, 165, CAST(20.00 AS Decimal(18, 2)), 1, 6, NULL, 1, NULL, NULL, CAST(N'2026-02-21T11:07:55.0843847' AS DateTime2), 13, CAST(N'2026-02-21T11:07:55.0843847' AS DateTime2), 13, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (397, 165, CAST(35.00 AS Decimal(18, 2)), 1, 6, 8, 2, NULL, NULL, CAST(N'2026-02-21T11:07:55.0843847' AS DateTime2), 13, CAST(N'2026-02-21T11:07:55.0843847' AS DateTime2), 13, NULL, NULL, 1, 2, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (398, 165, CAST(35.00 AS Decimal(18, 2)), 1, 6, 8, 2, NULL, NULL, CAST(N'2026-02-21T11:07:55.0843847' AS DateTime2), 13, CAST(N'2026-02-21T11:07:55.0843847' AS DateTime2), 13, NULL, NULL, 1, 3, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (399, 165, CAST(35.00 AS Decimal(18, 2)), 1, 6, 8, 2, NULL, NULL, CAST(N'2026-02-21T11:07:55.0843847' AS DateTime2), 13, CAST(N'2026-02-21T11:07:55.0843847' AS DateTime2), 13, NULL, NULL, 1, 4, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (400, 166, CAST(15.00 AS Decimal(18, 2)), 1, 9, 10, 3, NULL, NULL, CAST(N'2026-02-21T11:07:55.0843847' AS DateTime2), 13, CAST(N'2026-02-21T11:07:55.0843847' AS DateTime2), 13, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (401, 166, CAST(15.00 AS Decimal(18, 2)), 1, 7, 10, 3, NULL, NULL, CAST(N'2026-02-21T11:07:55.0843847' AS DateTime2), 13, CAST(N'2026-02-21T11:07:55.0843847' AS DateTime2), 13, NULL, NULL, 1, 2, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (402, 167, CAST(7.00 AS Decimal(18, 2)), 1, 16, 10, 3, NULL, NULL, CAST(N'2026-02-21T11:07:55.0843847' AS DateTime2), 13, CAST(N'2026-02-21T11:07:55.0843847' AS DateTime2), 13, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (403, 167, CAST(7.00 AS Decimal(18, 2)), 1, 14, 10, 3, NULL, NULL, CAST(N'2026-02-21T11:07:55.0843847' AS DateTime2), 13, CAST(N'2026-02-21T11:07:55.0843847' AS DateTime2), 13, NULL, NULL, 1, 2, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (404, 168, CAST(20.00 AS Decimal(18, 2)), 1, 6, NULL, 1, NULL, NULL, CAST(N'2026-02-21T11:08:49.3425472' AS DateTime2), 13, CAST(N'2026-02-21T11:08:49.3425472' AS DateTime2), 13, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (405, 168, CAST(60.00 AS Decimal(18, 2)), 1, 6, NULL, 1, NULL, NULL, CAST(N'2026-02-21T11:08:49.3425472' AS DateTime2), 13, CAST(N'2026-02-21T11:08:49.3425472' AS DateTime2), 13, NULL, NULL, 1, 2, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (406, 168, CAST(100.00 AS Decimal(18, 2)), 1, 1, NULL, 1, NULL, NULL, CAST(N'2026-02-21T11:08:49.3425472' AS DateTime2), 13, CAST(N'2026-02-21T11:08:49.3425472' AS DateTime2), 13, NULL, NULL, 1, 3, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (407, 168, CAST(105.00 AS Decimal(18, 2)), 1, 6, 8, NULL, NULL, NULL, CAST(N'2026-02-21T11:08:49.3425472' AS DateTime2), 13, CAST(N'2026-02-21T11:08:56.3270591' AS DateTime2), 13, NULL, NULL, 1, 4, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (408, 168, CAST(105.00 AS Decimal(18, 2)), 1, 6, 9, NULL, NULL, NULL, CAST(N'2026-02-21T11:08:49.3425472' AS DateTime2), 13, CAST(N'2026-02-21T11:09:03.6481365' AS DateTime2), 13, NULL, NULL, 1, 5, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (409, 168, CAST(105.00 AS Decimal(18, 2)), 1, 6, 9, NULL, NULL, NULL, CAST(N'2026-02-21T11:08:49.3425472' AS DateTime2), 13, CAST(N'2026-02-21T11:09:12.0911351' AS DateTime2), 13, NULL, NULL, 1, 6, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (410, 169, CAST(120.00 AS Decimal(18, 2)), 1, 6, NULL, 1, NULL, NULL, CAST(N'2026-02-21T11:08:49.3425472' AS DateTime2), 13, CAST(N'2026-02-21T11:08:49.3425472' AS DateTime2), 13, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (411, 169, CAST(180.00 AS Decimal(18, 2)), 1, 17, 10, 3, NULL, NULL, CAST(N'2026-02-21T11:08:49.3425472' AS DateTime2), 13, CAST(N'2026-02-21T11:08:49.3425472' AS DateTime2), 13, NULL, NULL, 1, 2, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (412, 169, CAST(180.00 AS Decimal(18, 2)), 1, 11, 9, 3, NULL, NULL, CAST(N'2026-02-21T11:08:49.3425472' AS DateTime2), 13, CAST(N'2026-02-21T11:08:49.3425472' AS DateTime2), 13, NULL, NULL, 1, 3, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (413, 170, CAST(36.00 AS Decimal(18, 2)), 1, 6, NULL, 1, NULL, NULL, CAST(N'2026-02-21T11:08:49.3425472' AS DateTime2), 13, CAST(N'2026-02-21T11:08:49.3425472' AS DateTime2), 13, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (414, 170, CAST(49.40 AS Decimal(18, 2)), 1, 9, 10, 3, NULL, NULL, CAST(N'2026-02-21T11:08:49.3425472' AS DateTime2), 13, CAST(N'2026-02-21T11:08:49.3425472' AS DateTime2), 13, NULL, NULL, 1, 2, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (415, 170, CAST(49.40 AS Decimal(18, 2)), 1, 6, 10, 3, NULL, NULL, CAST(N'2026-02-21T11:08:49.3425472' AS DateTime2), 13, CAST(N'2026-02-21T11:08:49.3425472' AS DateTime2), 13, NULL, NULL, 1, 3, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (416, 171, NULL, NULL, 20, 10, 3, NULL, NULL, CAST(N'2026-02-21T11:08:49.3425472' AS DateTime2), 13, CAST(N'2026-02-21T11:08:49.3425472' AS DateTime2), 13, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (417, 172, CAST(20.00 AS Decimal(18, 2)), 1, 6, NULL, 1, NULL, NULL, CAST(N'2026-02-21T11:15:20.2949868' AS DateTime2), 13, CAST(N'2026-02-21T11:15:20.2949868' AS DateTime2), 13, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (418, 172, CAST(30.00 AS Decimal(18, 2)), 1, 6, NULL, 1, NULL, NULL, CAST(N'2026-02-21T11:15:20.2949868' AS DateTime2), 13, CAST(N'2026-02-21T11:15:20.2949868' AS DateTime2), 13, NULL, NULL, 1, 2, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (419, 172, CAST(40.00 AS Decimal(18, 2)), 1, 4, NULL, 1, NULL, NULL, CAST(N'2026-02-21T11:15:20.2949868' AS DateTime2), 13, CAST(N'2026-02-21T11:15:20.2949868' AS DateTime2), 13, NULL, NULL, 1, 3, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (420, 172, CAST(50.00 AS Decimal(18, 2)), 1, 1, NULL, 1, NULL, NULL, CAST(N'2026-02-21T11:15:20.2949868' AS DateTime2), 13, CAST(N'2026-02-21T11:15:20.2949868' AS DateTime2), 13, NULL, NULL, 1, 4, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (421, 172, CAST(52.50 AS Decimal(18, 2)), 1, 6, 9, NULL, NULL, NULL, CAST(N'2026-02-21T11:15:20.2949868' AS DateTime2), 13, CAST(N'2026-02-21T11:15:27.4136318' AS DateTime2), 13, NULL, NULL, 1, 5, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (422, 172, CAST(52.50 AS Decimal(18, 2)), 1, 6, 9, NULL, NULL, NULL, CAST(N'2026-02-21T11:15:20.2949868' AS DateTime2), 13, CAST(N'2026-02-21T11:15:32.8499305' AS DateTime2), 13, NULL, NULL, 1, 6, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (423, 172, CAST(52.50 AS Decimal(18, 2)), 1, 6, 9, NULL, NULL, NULL, CAST(N'2026-02-21T11:15:20.2949868' AS DateTime2), 13, CAST(N'2026-02-21T11:15:39.4158754' AS DateTime2), 13, NULL, NULL, 1, 7, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (424, 173, NULL, NULL, 5, NULL, NULL, NULL, NULL, CAST(N'2026-02-21T11:15:20.2949868' AS DateTime2), 13, CAST(N'2026-02-21T11:15:20.2949868' AS DateTime2), 13, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (425, 173, NULL, NULL, 5, NULL, NULL, NULL, NULL, CAST(N'2026-02-21T11:15:20.2949868' AS DateTime2), 13, CAST(N'2026-02-21T11:15:20.2949868' AS DateTime2), 13, NULL, NULL, 1, 2, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (426, 173, NULL, NULL, 5, NULL, NULL, NULL, NULL, CAST(N'2026-02-21T11:15:20.2949868' AS DateTime2), 13, CAST(N'2026-02-21T11:15:20.2949868' AS DateTime2), 13, NULL, NULL, 1, 3, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (427, 173, NULL, NULL, 5, NULL, NULL, NULL, NULL, CAST(N'2026-02-21T11:15:20.2949868' AS DateTime2), 13, CAST(N'2026-02-21T11:15:20.2949868' AS DateTime2), 13, NULL, NULL, 1, 4, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (428, 173, NULL, NULL, 5, NULL, NULL, NULL, NULL, CAST(N'2026-02-21T11:15:20.2949868' AS DateTime2), 13, CAST(N'2026-02-21T11:15:20.2949868' AS DateTime2), 13, NULL, NULL, 1, 5, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (429, 174, CAST(20.00 AS Decimal(18, 2)), 1, 6, NULL, 1, NULL, NULL, CAST(N'2026-02-21T11:15:20.2949868' AS DateTime2), 13, CAST(N'2026-02-21T11:15:20.2949868' AS DateTime2), 13, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (430, 174, CAST(60.00 AS Decimal(18, 2)), 1, 11, 10, 3, NULL, NULL, CAST(N'2026-02-21T11:15:20.2949868' AS DateTime2), 13, CAST(N'2026-02-21T11:15:20.2949868' AS DateTime2), 13, NULL, NULL, 1, 2, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (431, 175, CAST(20.00 AS Decimal(18, 2)), 1, 6, NULL, 1, NULL, NULL, CAST(N'2026-02-21T11:15:20.2949868' AS DateTime2), 13, CAST(N'2026-02-21T11:15:20.2949868' AS DateTime2), 13, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (432, 175, CAST(35.00 AS Decimal(18, 2)), 1, 6, NULL, NULL, NULL, NULL, CAST(N'2026-02-21T11:15:20.2949868' AS DateTime2), 13, CAST(N'2026-02-21T11:15:20.2949868' AS DateTime2), 13, NULL, NULL, 1, 2, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (433, 175, CAST(35.00 AS Decimal(18, 2)), 1, 6, NULL, NULL, NULL, NULL, CAST(N'2026-02-21T11:15:20.2949868' AS DateTime2), 13, CAST(N'2026-02-21T11:15:20.2949868' AS DateTime2), 13, NULL, NULL, 1, 3, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (434, 175, CAST(35.00 AS Decimal(18, 2)), 1, 6, NULL, NULL, NULL, NULL, CAST(N'2026-02-21T11:15:20.2949868' AS DateTime2), 13, CAST(N'2026-02-21T11:15:20.2949868' AS DateTime2), 13, NULL, NULL, 1, 4, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (435, 176, CAST(20.00 AS Decimal(18, 2)), 1, 5, NULL, 1, NULL, NULL, CAST(N'2026-02-21T11:16:04.8788384' AS DateTime2), 13, CAST(N'2026-02-21T11:16:04.8788384' AS DateTime2), 13, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (436, 176, CAST(60.00 AS Decimal(18, 2)), 1, 5, NULL, 1, NULL, NULL, CAST(N'2026-02-21T11:16:04.8788384' AS DateTime2), 13, CAST(N'2026-02-21T11:16:04.8788384' AS DateTime2), 13, NULL, NULL, 1, 2, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (437, 176, CAST(100.00 AS Decimal(18, 2)), 1, 3, NULL, 1, NULL, NULL, CAST(N'2026-02-21T11:16:04.8788384' AS DateTime2), 13, CAST(N'2026-02-21T11:16:04.8788384' AS DateTime2), 13, NULL, NULL, 1, 3, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (438, 176, CAST(120.00 AS Decimal(18, 2)), 1, 1, NULL, 1, NULL, NULL, CAST(N'2026-02-21T11:16:04.8788384' AS DateTime2), 13, CAST(N'2026-02-21T11:16:04.8788384' AS DateTime2), 13, NULL, NULL, 1, 4, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (439, 176, CAST(125.00 AS Decimal(18, 2)), 1, 5, NULL, NULL, NULL, NULL, CAST(N'2026-02-21T11:16:04.8788384' AS DateTime2), 13, CAST(N'2026-02-21T11:16:13.7889017' AS DateTime2), 13, NULL, NULL, 1, 5, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (440, 176, CAST(125.00 AS Decimal(18, 2)), 1, 5, NULL, NULL, NULL, NULL, CAST(N'2026-02-21T11:16:04.8788384' AS DateTime2), 13, CAST(N'2026-02-21T11:16:18.5381277' AS DateTime2), 13, NULL, NULL, 1, 6, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (441, 176, CAST(125.00 AS Decimal(18, 2)), 1, 5, NULL, NULL, NULL, NULL, CAST(N'2026-02-21T11:16:04.8788384' AS DateTime2), 13, CAST(N'2026-02-21T11:16:23.2110187' AS DateTime2), 13, NULL, NULL, 1, 7, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (442, 177, CAST(120.00 AS Decimal(18, 2)), 1, 6, NULL, 1, NULL, NULL, CAST(N'2026-02-21T11:16:04.8788384' AS DateTime2), 13, CAST(N'2026-02-21T11:16:04.8788384' AS DateTime2), 13, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (443, 177, CAST(190.00 AS Decimal(18, 2)), 1, 14, NULL, 3, NULL, NULL, CAST(N'2026-02-21T11:16:04.8788384' AS DateTime2), 13, CAST(N'2026-02-21T11:16:04.8788384' AS DateTime2), 13, NULL, NULL, 1, 2, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (444, 177, CAST(190.00 AS Decimal(18, 2)), 1, 10, NULL, 3, NULL, NULL, CAST(N'2026-02-21T11:16:04.8788384' AS DateTime2), 13, CAST(N'2026-02-21T11:16:04.8788384' AS DateTime2), 13, NULL, NULL, 1, 3, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (445, 178, CAST(170.00 AS Decimal(18, 2)), 1, 17, 10, 3, NULL, NULL, CAST(N'2026-02-21T11:16:04.8788384' AS DateTime2), 13, CAST(N'2026-02-21T11:16:04.8788384' AS DateTime2), 13, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[WorkoutExerciseSet] ([Id], [WorkoutExerciseId], [Weight], [WeightUnitId], [Reps], [RpeTypeId], [TypeId], [Rest], [Notes], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DeletedOn], [DeletedBy], [IsActive], [Order], [DurationMinutes]) VALUES (446, 178, CAST(170.00 AS Decimal(18, 2)), 1, 11, 10, 3, NULL, NULL, CAST(N'2026-02-21T11:16:04.8788384' AS DateTime2), 13, CAST(N'2026-02-21T11:16:04.8788384' AS DateTime2), 13, NULL, NULL, 1, 2, NULL)
GO
SET IDENTITY_INSERT [dbo].[WorkoutExerciseSet] OFF
GO
/****** Object:  Index [IX_Bodyweight_IsActive]    Script Date: 3/11/2026 12:19:46 PM ******/
CREATE NONCLUSTERED INDEX [IX_Bodyweight_IsActive] ON [dbo].[Bodyweight]
(
	[IsActive] ASC
)
WHERE ([IsActive]=(1))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Bodyweight_UserId]    Script Date: 3/11/2026 12:19:46 PM ******/
CREATE NONCLUSTERED INDEX [IX_Bodyweight_UserId] ON [dbo].[Bodyweight]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_BodyweightGoal_IsActive]    Script Date: 3/11/2026 12:19:46 PM ******/
CREATE NONCLUSTERED INDEX [IX_BodyweightGoal_IsActive] ON [dbo].[BodyweightGoal]
(
	[IsActive] ASC
)
WHERE ([IsActive]=(1))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_BodyweightGoal_UserId]    Script Date: 3/11/2026 12:19:46 PM ******/
CREATE NONCLUSTERED INDEX [IX_BodyweightGoal_UserId] ON [dbo].[BodyweightGoal]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Exercise_Name]    Script Date: 3/11/2026 12:19:46 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Exercise_Name] ON [dbo].[Exercise]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ExerciseGoal_ExerciseId]    Script Date: 3/11/2026 12:19:46 PM ******/
CREATE NONCLUSTERED INDEX [IX_ExerciseGoal_ExerciseId] ON [dbo].[ExerciseGoal]
(
	[ExerciseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ExerciseGoal_IsActive]    Script Date: 3/11/2026 12:19:46 PM ******/
CREATE NONCLUSTERED INDEX [IX_ExerciseGoal_IsActive] ON [dbo].[ExerciseGoal]
(
	[IsActive] ASC
)
WHERE ([IsActive]=(1))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ExerciseGoal_UserId]    Script Date: 3/11/2026 12:19:46 PM ******/
CREATE NONCLUSTERED INDEX [IX_ExerciseGoal_UserId] ON [dbo].[ExerciseGoal]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Measurement_IsActive]    Script Date: 3/11/2026 12:19:46 PM ******/
CREATE NONCLUSTERED INDEX [IX_Measurement_IsActive] ON [dbo].[Measurement]
(
	[IsActive] ASC
)
WHERE ([IsActive]=(1))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Measurement_UserId]    Script Date: 3/11/2026 12:19:46 PM ******/
CREATE NONCLUSTERED INDEX [IX_Measurement_UserId] ON [dbo].[Measurement]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_MeasurementGoal_IsActive]    Script Date: 3/11/2026 12:19:46 PM ******/
CREATE NONCLUSTERED INDEX [IX_MeasurementGoal_IsActive] ON [dbo].[MeasurementGoal]
(
	[IsActive] ASC
)
WHERE ([IsActive]=(1))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_MeasurementGoal_UserId]    Script Date: 3/11/2026 12:19:46 PM ******/
CREATE NONCLUSTERED INDEX [IX_MeasurementGoal_UserId] ON [dbo].[MeasurementGoal]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_User_CountryId]    Script Date: 3/11/2026 12:19:46 PM ******/
CREATE NONCLUSTERED INDEX [IX_User_CountryId] ON [dbo].[User]
(
	[CountryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_User_IsActive]    Script Date: 3/11/2026 12:19:46 PM ******/
CREATE NONCLUSTERED INDEX [IX_User_IsActive] ON [dbo].[User]
(
	[IsActive] ASC
)
WHERE ([IsActive]=(1))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Users_Email]    Script Date: 3/11/2026 12:19:46 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Users_Email] ON [dbo].[User]
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Users_Username]    Script Date: 3/11/2026 12:19:46 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Users_Username] ON [dbo].[User]
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserMeasurementPreference_IsActive]    Script Date: 3/11/2026 12:19:46 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserMeasurementPreference_IsActive] ON [dbo].[UserMeasurementPreference]
(
	[IsActive] ASC
)
WHERE ([IsActive]=(1))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserMeasurementPreference_UserId]    Script Date: 3/11/2026 12:19:46 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserMeasurementPreference_UserId] ON [dbo].[UserMeasurementPreference]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserMeasurementPreferences_UserId_WeightUnitId_MeasurementUnitId]    Script Date: 3/11/2026 12:19:46 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_UserMeasurementPreferences_UserId_WeightUnitId_MeasurementUnitId] ON [dbo].[UserMeasurementPreference]
(
	[UserId] ASC,
	[WeightUnitId] ASC,
	[MeasurementUnitId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserRole_IsActive]    Script Date: 3/11/2026 12:19:46 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserRole_IsActive] ON [dbo].[UserRole]
(
	[IsActive] ASC
)
WHERE ([IsActive]=(1))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserRole_UserId]    Script Date: 3/11/2026 12:19:46 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserRole_UserId] ON [dbo].[UserRole]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserRoles_UserId_RoleId]    Script Date: 3/11/2026 12:19:46 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_UserRoles_UserId_RoleId] ON [dbo].[UserRole]
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserSelectedExercise_ExerciseId]    Script Date: 3/11/2026 12:19:46 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserSelectedExercise_ExerciseId] ON [dbo].[UserSelectedExercise]
(
	[ExerciseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserSelectedExercise_UserId]    Script Date: 3/11/2026 12:19:46 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserSelectedExercise_UserId] ON [dbo].[UserSelectedExercise]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Workout_CopiedFromId]    Script Date: 3/11/2026 12:19:46 PM ******/
CREATE NONCLUSTERED INDEX [IX_Workout_CopiedFromId] ON [dbo].[Workout]
(
	[CopiedFromId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Workout_IsActive]    Script Date: 3/11/2026 12:19:46 PM ******/
CREATE NONCLUSTERED INDEX [IX_Workout_IsActive] ON [dbo].[Workout]
(
	[IsActive] ASC
)
WHERE ([IsActive]=(1))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Workout_UserId]    Script Date: 3/11/2026 12:19:46 PM ******/
CREATE NONCLUSTERED INDEX [IX_Workout_UserId] ON [dbo].[Workout]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_WorkoutExercise_ExerciseId]    Script Date: 3/11/2026 12:19:46 PM ******/
CREATE NONCLUSTERED INDEX [IX_WorkoutExercise_ExerciseId] ON [dbo].[WorkoutExercise]
(
	[ExerciseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_WorkoutExercise_IsActive]    Script Date: 3/11/2026 12:19:46 PM ******/
CREATE NONCLUSTERED INDEX [IX_WorkoutExercise_IsActive] ON [dbo].[WorkoutExercise]
(
	[IsActive] ASC
)
WHERE ([IsActive]=(1))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_WorkoutExercise_WorkoutId]    Script Date: 3/11/2026 12:19:46 PM ******/
CREATE NONCLUSTERED INDEX [IX_WorkoutExercise_WorkoutId] ON [dbo].[WorkoutExercise]
(
	[WorkoutId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_WorkoutExerciseSet_IsActive]    Script Date: 3/11/2026 12:19:46 PM ******/
CREATE NONCLUSTERED INDEX [IX_WorkoutExerciseSet_IsActive] ON [dbo].[WorkoutExerciseSet]
(
	[IsActive] ASC
)
WHERE ([IsActive]=(1))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_WorkoutExerciseSet_WorkoutExerciseId]    Script Date: 3/11/2026 12:19:46 PM ******/
CREATE NONCLUSTERED INDEX [IX_WorkoutExerciseSet_WorkoutExerciseId] ON [dbo].[WorkoutExerciseSet]
(
	[WorkoutExerciseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Exercise] ADD  DEFAULT ((0)) FOR [PrimaryMuscleGroupId]
GO
ALTER TABLE [dbo].[Measurement] ADD  DEFAULT ('0001-01-01T00:00:00.0000000') FOR [LogDate]
GO
ALTER TABLE [dbo].[Measurement] ADD  DEFAULT ((0)) FOR [BodyPartId]
GO
ALTER TABLE [dbo].[Measurement] ADD  DEFAULT ((0.0)) FOR [Size]
GO
ALTER TABLE [dbo].[MeasurementGoal] ADD  DEFAULT ((0)) FOR [BodyPartId]
GO
ALTER TABLE [dbo].[MeasurementGoal] ADD  DEFAULT ((0.0)) FOR [Size]
GO
ALTER TABLE [dbo].[User] ADD  DEFAULT (N'') FOR [FullName]
GO
ALTER TABLE [dbo].[WorkoutExercise] ADD  DEFAULT ((0)) FOR [Order]
GO
ALTER TABLE [dbo].[WorkoutExerciseSet] ADD  DEFAULT ((0)) FOR [Order]
GO
ALTER TABLE [dbo].[Bodyweight]  WITH CHECK ADD  CONSTRAINT [FK_Bodyweight_User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Bodyweight] CHECK CONSTRAINT [FK_Bodyweight_User_UserId]
GO
ALTER TABLE [dbo].[BodyweightGoal]  WITH CHECK ADD  CONSTRAINT [FK_BodyweightGoal_User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BodyweightGoal] CHECK CONSTRAINT [FK_BodyweightGoal_User_UserId]
GO
ALTER TABLE [dbo].[ExerciseGoal]  WITH CHECK ADD  CONSTRAINT [FK_ExerciseGoal_Exercise_ExerciseId] FOREIGN KEY([ExerciseId])
REFERENCES [dbo].[Exercise] ([Id])
GO
ALTER TABLE [dbo].[ExerciseGoal] CHECK CONSTRAINT [FK_ExerciseGoal_Exercise_ExerciseId]
GO
ALTER TABLE [dbo].[ExerciseGoal]  WITH CHECK ADD  CONSTRAINT [FK_ExerciseGoal_User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[ExerciseGoal] CHECK CONSTRAINT [FK_ExerciseGoal_User_UserId]
GO
ALTER TABLE [dbo].[Measurement]  WITH CHECK ADD  CONSTRAINT [FK_Measurement_User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Measurement] CHECK CONSTRAINT [FK_Measurement_User_UserId]
GO
ALTER TABLE [dbo].[MeasurementGoal]  WITH CHECK ADD  CONSTRAINT [FK_MeasurementGoal_User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MeasurementGoal] CHECK CONSTRAINT [FK_MeasurementGoal_User_UserId]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Country_CountryId] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Country_CountryId]
GO
ALTER TABLE [dbo].[UserMeasurementPreference]  WITH CHECK ADD  CONSTRAINT [FK_UserMeasurementPreference_User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserMeasurementPreference] CHECK CONSTRAINT [FK_UserMeasurementPreference_User_UserId]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_UserRole_User_UserId]
GO
ALTER TABLE [dbo].[UserSelectedExercise]  WITH CHECK ADD  CONSTRAINT [FK_UserSelectedExercise_Exercise_ExerciseId] FOREIGN KEY([ExerciseId])
REFERENCES [dbo].[Exercise] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserSelectedExercise] CHECK CONSTRAINT [FK_UserSelectedExercise_Exercise_ExerciseId]
GO
ALTER TABLE [dbo].[UserSelectedExercise]  WITH CHECK ADD  CONSTRAINT [FK_UserSelectedExercise_User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserSelectedExercise] CHECK CONSTRAINT [FK_UserSelectedExercise_User_UserId]
GO
ALTER TABLE [dbo].[Workout]  WITH CHECK ADD  CONSTRAINT [FK_Workout_User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Workout] CHECK CONSTRAINT [FK_Workout_User_UserId]
GO
ALTER TABLE [dbo].[Workout]  WITH CHECK ADD  CONSTRAINT [FK_Workout_Workout_CopiedFromId] FOREIGN KEY([CopiedFromId])
REFERENCES [dbo].[Workout] ([Id])
GO
ALTER TABLE [dbo].[Workout] CHECK CONSTRAINT [FK_Workout_Workout_CopiedFromId]
GO
ALTER TABLE [dbo].[WorkoutExercise]  WITH CHECK ADD  CONSTRAINT [FK_WorkoutExercise_Exercise_ExerciseId] FOREIGN KEY([ExerciseId])
REFERENCES [dbo].[Exercise] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[WorkoutExercise] CHECK CONSTRAINT [FK_WorkoutExercise_Exercise_ExerciseId]
GO
ALTER TABLE [dbo].[WorkoutExercise]  WITH CHECK ADD  CONSTRAINT [FK_WorkoutExercise_Workout_WorkoutId] FOREIGN KEY([WorkoutId])
REFERENCES [dbo].[Workout] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[WorkoutExercise] CHECK CONSTRAINT [FK_WorkoutExercise_Workout_WorkoutId]
GO
ALTER TABLE [dbo].[WorkoutExerciseSet]  WITH CHECK ADD  CONSTRAINT [FK_WorkoutExerciseSet_WorkoutExercise_WorkoutExerciseId] FOREIGN KEY([WorkoutExerciseId])
REFERENCES [dbo].[WorkoutExercise] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[WorkoutExerciseSet] CHECK CONSTRAINT [FK_WorkoutExerciseSet_WorkoutExercise_WorkoutExerciseId]
GO
USE [master]
GO
ALTER DATABASE [PeakPerformance_2] SET  READ_WRITE 
GO
