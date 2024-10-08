USE [master]
GO
/****** Object:  Database [SystemAlturaCoffee]    Script Date: 02/10/2024 11:56:40 ******/
CREATE DATABASE [SystemAlturaCoffee]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SystemAlturaCoffee', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\SystemAlturaCoffee.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SystemAlturaCoffee_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\SystemAlturaCoffee_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [SystemAlturaCoffee] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SystemAlturaCoffee].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SystemAlturaCoffee] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SystemAlturaCoffee] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SystemAlturaCoffee] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SystemAlturaCoffee] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SystemAlturaCoffee] SET ARITHABORT OFF 
GO
ALTER DATABASE [SystemAlturaCoffee] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [SystemAlturaCoffee] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SystemAlturaCoffee] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SystemAlturaCoffee] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SystemAlturaCoffee] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SystemAlturaCoffee] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SystemAlturaCoffee] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SystemAlturaCoffee] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SystemAlturaCoffee] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SystemAlturaCoffee] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SystemAlturaCoffee] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SystemAlturaCoffee] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SystemAlturaCoffee] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SystemAlturaCoffee] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SystemAlturaCoffee] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SystemAlturaCoffee] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SystemAlturaCoffee] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SystemAlturaCoffee] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SystemAlturaCoffee] SET  MULTI_USER 
GO
ALTER DATABASE [SystemAlturaCoffee] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SystemAlturaCoffee] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SystemAlturaCoffee] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SystemAlturaCoffee] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SystemAlturaCoffee] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SystemAlturaCoffee] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SystemAlturaCoffee] SET QUERY_STORE = ON
GO
ALTER DATABASE [SystemAlturaCoffee] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [SystemAlturaCoffee]
GO
/****** Object:  Table [dbo].[categoria]    Script Date: 02/10/2024 11:56:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categoria](
	[idcategoria] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[idcategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cliente]    Script Date: 02/10/2024 11:56:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cliente](
	[idcliente] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[apellidos] [varchar](50) NULL,
	[dni] [varchar](16) NULL,
	[ruc] [varchar](11) NULL,
	[telefono] [varchar](8) NULL,
	[estado] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[idcliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[compra]    Script Date: 02/10/2024 11:56:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[compra](
	[idcompra] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [date] NULL,
	[num_documento] [varchar](7) NULL,
	[subtotal] [decimal](8, 2) NULL,
	[iva] [decimal](8, 2) NULL,
	[total] [decimal](8, 2) NULL,
	[estado] [varchar](20) NULL,
	[idusuario] [int] NULL,
	[idproveedor] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idcompra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Crédito]    Script Date: 02/10/2024 11:56:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Crédito](
	[IdCrédito] [int] NOT NULL,
	[PlazoPago] [int] NOT NULL,
	[TasaInteres] [int] NOT NULL,
	[Monto] [decimal](10, 0) NOT NULL,
	[FechaInicio] [date] NOT NULL,
 CONSTRAINT [PK_ControlCrédito] PRIMARY KEY NONCLUSTERED 
(
	[IdCrédito] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detallecompra]    Script Date: 02/10/2024 11:56:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detallecompra](
	[iddetallecompra] [int] IDENTITY(1,1) NOT NULL,
	[cantidad] [int] NULL,
	[precio] [decimal](8, 2) NULL,
	[total] [decimal](8, 2) NULL,
	[idcompra] [int] NULL,
	[idproducto] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[iddetallecompra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleCrédito]    Script Date: 02/10/2024 11:56:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleCrédito](
	[IdDetalleCrédito] [int] NOT NULL,
	[FechaPago] [date] NOT NULL,
	[MontoAbono] [decimal](10, 0) NOT NULL,
 CONSTRAINT [PK_DetalleCrédito] PRIMARY KEY NONCLUSTERED 
(
	[IdDetalleCrédito] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detalleventa]    Script Date: 02/10/2024 11:56:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalleventa](
	[iddetalleventa] [int] IDENTITY(1,1) NOT NULL,
	[cantidad] [int] NULL,
	[precio] [decimal](8, 2) NULL,
	[total] [decimal](8, 2) NULL,
	[idventa] [int] NULL,
	[idproducto] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[iddetalleventa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Devolución]    Script Date: 02/10/2024 11:56:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Devolución](
	[IdDevolución] [int] IDENTITY(1,1) NOT NULL,
	[FechaDevolución] [date] NOT NULL,
	[Motivo] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Devolución] PRIMARY KEY NONCLUSTERED 
(
	[IdDevolución] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[empleado]    Script Date: 02/10/2024 11:56:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[empleado](
	[idempleado] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[apellidos] [varchar](50) NULL,
	[dni] [varchar](16) NULL,
	[telefono] [varchar](8) NULL,
	[direccion] [varchar](150) NULL,
	[estado] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[idempleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[producto]    Script Date: 02/10/2024 11:56:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[producto](
	[idproducto] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [varchar](30) NULL,
	[nombre] [varchar](50) NULL,
	[descripcion] [varchar](150) NULL,
	[f_ingreso] [date] NULL,
	[f_vencimiento] [date] NULL,
	[precio_compra] [decimal](8, 2) NULL,
	[precio_venta] [decimal](8, 2) NULL,
	[stock] [int] NULL,
	[estado] [varchar](10) NULL,
	[idcategoria] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idproducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[proveedor]    Script Date: 02/10/2024 11:56:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[proveedor](
	[idproveedor] [int] IDENTITY(1,1) NOT NULL,
	[razonsocial] [varchar](30) NULL,
	[dni] [varchar](16) NULL,
	[ruc] [varchar](11) NULL,
	[telefono] [varchar](8) NULL,
	[direccion] [varchar](150) NULL,
	[estado] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[idproveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuario]    Script Date: 02/10/2024 11:56:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuario](
	[idusuario] [int] IDENTITY(1,1) NOT NULL,
	[usuario] [varchar](20) NULL,
	[pass] [varchar](20) NULL,
	[acceso] [varchar](20) NULL,
	[estado] [varchar](10) NULL,
	[idempleado] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idusuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[venta]    Script Date: 02/10/2024 11:56:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[venta](
	[idventa] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [date] NULL,
	[serie] [varchar](7) NULL,
	[num_documento] [varchar](7) NULL,
	[subtotal] [decimal](8, 2) NULL,
	[iva] [decimal](8, 2) NULL,
	[total] [decimal](8, 2) NULL,
	[estado] [varchar](20) NULL,
	[idusuario] [int] NULL,
	[idcliente] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idventa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[compra]  WITH CHECK ADD FOREIGN KEY([idproveedor])
REFERENCES [dbo].[proveedor] ([idproveedor])
GO
ALTER TABLE [dbo].[compra]  WITH CHECK ADD FOREIGN KEY([idusuario])
REFERENCES [dbo].[usuario] ([idusuario])
GO
ALTER TABLE [dbo].[detallecompra]  WITH CHECK ADD FOREIGN KEY([idcompra])
REFERENCES [dbo].[compra] ([idcompra])
GO
ALTER TABLE [dbo].[detallecompra]  WITH CHECK ADD FOREIGN KEY([idproducto])
REFERENCES [dbo].[producto] ([idproducto])
GO
ALTER TABLE [dbo].[detalleventa]  WITH CHECK ADD FOREIGN KEY([idproducto])
REFERENCES [dbo].[producto] ([idproducto])
GO
ALTER TABLE [dbo].[detalleventa]  WITH CHECK ADD FOREIGN KEY([idventa])
REFERENCES [dbo].[venta] ([idventa])
GO
ALTER TABLE [dbo].[producto]  WITH CHECK ADD FOREIGN KEY([idcategoria])
REFERENCES [dbo].[categoria] ([idcategoria])
GO
ALTER TABLE [dbo].[usuario]  WITH CHECK ADD FOREIGN KEY([idempleado])
REFERENCES [dbo].[empleado] ([idempleado])
GO
ALTER TABLE [dbo].[venta]  WITH CHECK ADD FOREIGN KEY([idcliente])
REFERENCES [dbo].[cliente] ([idcliente])
GO
ALTER TABLE [dbo].[venta]  WITH CHECK ADD FOREIGN KEY([idusuario])
REFERENCES [dbo].[usuario] ([idusuario])
GO
/****** Object:  StoredProcedure [dbo].[pA_editar_producto]    Script Date: 02/10/2024 11:56:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[pA_editar_producto](
@idproducto int, 
@codigo varchar(30) null,
@nombre varchar(50) null,
@descripcion varchar(150) null,
@precio_compra decimal(8, 2) null,
@precio_venta decimal (8, 2) null,
@stock int null,
@estado varchar(10) null
) as 
begin

update producto set

codigo = isnull(@codigo, codigo),
nombre = isnull(@nombre, nombre),
descripcion = isnull(@descripcion, descripcion),
precio_compra = isnull(@precio_compra, precio_compra),
precio_venta = isnull(@precio_venta, precio_venta),
stock = isnull(@stock, stock),
estado = isnull(@estado, estado)
where idproducto = @idproducto

end
GO
/****** Object:  StoredProcedure [dbo].[pA_eliminar_productos]    Script Date: 02/10/2024 11:56:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[pA_eliminar_productos](
@idproducto int
)
as 
begin
delete from producto where idproducto = @idproducto
end
GO
/****** Object:  StoredProcedure [dbo].[pA_guardar_productos]    Script Date: 02/10/2024 11:56:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[pA_guardar_productos](
@codigo varchar(30),
@nombre varchar(50),
@descripcion varchar(150),
@f_ingreso date,
@f_vencimiento date,
@precio_compra decimal(8, 2),
@precio_venta decimal (8, 2),
@stock int,
@estado varchar(10)
) as 
begin
     insert into producto(codigo, nombre, descripcion, f_ingreso, f_vencimiento,
	                      precio_compra, precio_venta, stock, estado)
	 values (@codigo, @nombre, @descripcion, @f_ingreso, @f_vencimiento, @precio_compra, 
	         @precio_venta, @stock, @estado)
end
GO
/****** Object:  StoredProcedure [dbo].[pA_lista_productos]    Script Date: 02/10/2024 11:56:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[pA_lista_productos]
as
begin
     select 
	 idproducto, codigo, nombre, descripcion, f_ingreso,
	 f_vencimiento, precio_compra, precio_venta, stock,
	 estado
	 from producto
end
GO
USE [master]
GO
ALTER DATABASE [SystemAlturaCoffee] SET  READ_WRITE 
GO
