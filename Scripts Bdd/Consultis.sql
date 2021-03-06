USE [master]
GO
/****** Object:  Database [Consultis]    Script Date: 03-07-2022 23:55:20 ******/
CREATE DATABASE [Consultis]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Consultis', FILENAME = N'/var/opt/mssql/data/Consultis.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Consultis_log', FILENAME = N'/var/opt/mssql/data/Consultis_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Consultis] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Consultis].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Consultis] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Consultis] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Consultis] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Consultis] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Consultis] SET ARITHABORT OFF 
GO
ALTER DATABASE [Consultis] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Consultis] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Consultis] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Consultis] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Consultis] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Consultis] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Consultis] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Consultis] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Consultis] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Consultis] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Consultis] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Consultis] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Consultis] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Consultis] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Consultis] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Consultis] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Consultis] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Consultis] SET RECOVERY FULL 
GO
ALTER DATABASE [Consultis] SET  MULTI_USER 
GO
ALTER DATABASE [Consultis] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Consultis] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Consultis] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Consultis] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Consultis] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Consultis] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Consultis', N'ON'
GO
ALTER DATABASE [Consultis] SET QUERY_STORE = OFF
GO
USE [Consultis]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 03-07-2022 23:55:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Apellidos] [nvarchar](50) NOT NULL,
	[Correo] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[spCreateUser]    Script Date: 03-07-2022 23:55:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		JPIbarra
-- Create date: -
-- Description:	Procedimiento que crea a un usuario de la aplicación.
-- =============================================
CREATE PROCEDURE [dbo].[spCreateUser](
	@Nombre nvarchar(50)
	,@Apellidos nvarchar(50)
	,@Correo nvarchar(150)
)
AS
BEGIN
	SET NOCOUNT ON;
	
	INSERT INTO Usuarios (Nombre, Apellidos, Correo)
	VALUES (@Nombre, @Apellidos, @Correo)

END
GO
/****** Object:  StoredProcedure [dbo].[spDeleteUser]    Script Date: 03-07-2022 23:55:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		JPIbarra
-- Create date: -
-- Description:	Procedimiento que elimina un usuario de la aplicación.
-- =============================================
CREATE PROCEDURE [dbo].[spDeleteUser](
	@Id int
)
AS
BEGIN
	SET NOCOUNT ON;
	
	DELETE FROM Usuarios WHERE Id = @Id

END
GO
/****** Object:  StoredProcedure [dbo].[spGetUser]    Script Date: 03-07-2022 23:55:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		JPIbarra
-- Create date: -
-- Description:	Procedimiento que obtiene a un usuario de la aplicación.
-- =============================================
CREATE PROCEDURE [dbo].[spGetUser](@Id int)
AS
BEGIN
	SET NOCOUNT ON;

	SELECT u.Id
		, u.Nombre
		, u.Apellidos
		, u.Correo 
	from Usuarios u
	where u.Id = @Id

END
GO
/****** Object:  StoredProcedure [dbo].[spGetUserList]    Script Date: 03-07-2022 23:55:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		JPIbarra
-- Create date: -
-- Description:	Procedimiento que obtiene el listado de usuarios de la aplicación.
-- =============================================
CREATE PROCEDURE [dbo].[spGetUserList]
AS
BEGIN
	SET NOCOUNT ON;

	SELECT u.Id
		, u.Nombre
		, u.Apellidos
		, u.Correo 
	from Usuarios u

END
GO
/****** Object:  StoredProcedure [dbo].[spUpdateUser]    Script Date: 03-07-2022 23:55:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		JPIbarra
-- Create date: -
-- Description:	Procedimiento que actualiza la información de un usuario de la aplicación.
-- =============================================
CREATE PROCEDURE [dbo].[spUpdateUser](
	@Id int
	,@Nombre nvarchar(50)
	,@Apellidos nvarchar(50)
	,@Correo nvarchar(150)
)
AS
BEGIN
	SET NOCOUNT ON;

		UPDATE Usuarios 
		SET Nombre = @Nombre
		, Apellidos = @Apellidos
		, Correo = @Correo
		WHERE Id = @Id


END
GO
USE [master]
GO
ALTER DATABASE [Consultis] SET  READ_WRITE 
GO
