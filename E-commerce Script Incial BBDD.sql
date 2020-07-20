USE [TiendaOnline]
GO
/****** Object:  Table [dbo].[CATEGORIA]    Script Date: 13/07/2020 17:55:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CATEGORIA](
	[Id_Categoria] [int] IDENTITY(1,1) NOT NULL,
	[Categoria] [varchar](50) NOT NULL,
 CONSTRAINT [PK_CATEGORIA] PRIMARY KEY CLUSTERED 
(
	[Id_Categoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ciudad]    Script Date: 13/07/2020 17:55:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ciudad](
	[Id_Ciudad] [int] IDENTITY(1,1) NOT NULL,
	[Ciudad] [varchar](50) NOT NULL,
	[Id_Provincia] [int] NOT NULL,
 CONSTRAINT [PK_Ciudad] PRIMARY KEY CLUSTERED 
(
	[Id_Ciudad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DOMICILIO]    Script Date: 13/07/2020 17:55:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DOMICILIO](
	[Id_Domicilio] [int] IDENTITY(1,1) NOT NULL,
	[Calle] [varchar](50) NOT NULL,
	[Numero] [int] NOT NULL,
	[Piso] [varchar](10) NULL,
	[Dpto] [varchar](10) NULL,
	[Datos_Adicionales] [varchar](100) NULL,
	[Id_Ciudad] [int] NULL,
 CONSTRAINT [PK_DOMICILIO] PRIMARY KEY CLUSTERED 
(
	[Id_Domicilio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MARCA]    Script Date: 13/07/2020 17:55:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MARCA](
	[Id_Marca] [int] IDENTITY(1,1) NOT NULL,
	[Marca] [varchar](30) NOT NULL,
 CONSTRAINT [PK_MARCA] PRIMARY KEY CLUSTERED 
(
	[Id_Marca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PRODUCTO]    Script Date: 13/07/2020 17:55:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCTO](
	[Id_Producto] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](60) NOT NULL,
	[Descripcion] [varchar](1000) NOT NULL,
	[Precio_Venta] [decimal](18, 2) NOT NULL,
	[Stock_Actual] [int] NULL,
	[Id_Marca] [int] NULL,
	[Id_Categoria] [int] NULL,
 CONSTRAINT [PK_PRODUCTO] PRIMARY KEY CLUSTERED 
(
	[Id_Producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PROVINCIA]    Script Date: 13/07/2020 17:55:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PROVINCIA](
	[Id_Provincia] [int] IDENTITY(1,1) NOT NULL,
	[Provincia] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Provincia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USUARIO]    Script Date: 13/07/2020 17:55:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USUARIO](
	[Id_Usuario] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Contraseña] [varchar](50) NOT NULL,
 CONSTRAINT [PK__USUARIO__63C76BE2A0EF783C] PRIMARY KEY CLUSTERED 
(
	[Id_Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USUARIO_DOMICILIO]    Script Date: 13/07/2020 17:55:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USUARIO_DOMICILIO](
	[id_Usuario_Domicilio] [int] IDENTITY(1,1) NOT NULL,
	[Id_Usuario] [int] NULL,
	[Id_Domicilio] [int] NULL,
 CONSTRAINT [PK_USUARIO_DOMICILIO] PRIMARY KEY CLUSTERED 
(
	[id_Usuario_Domicilio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USUARIO_ROL]    Script Date: 13/07/2020 17:55:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USUARIO_ROL](
	[Id_Usuario_Rol] [int] IDENTITY(1,1) NOT NULL,
	[Rol] [varchar](15) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Usuario_Rol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VENTA]    Script Date: 13/07/2020 17:55:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VENTA](
	[Id_Venta] [int] IDENTITY(1,1) NOT NULL,
	[Precio_Total] [money] NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[Id_Usuario] [int] NOT NULL,
 CONSTRAINT [PK_VENTA] PRIMARY KEY CLUSTERED 
(
	[Id_Venta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VENTA_DETALLE]    Script Date: 13/07/2020 17:55:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VENTA_DETALLE](
	[Id_Venta_Detalle] [int] IDENTITY(1,1) NOT NULL,
	[Item] [int] NOT NULL,
	[Precio_Unitario] [decimal](18, 0) NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Id_Venta] [int] NOT NULL,
	[Id_Producto] [int] NOT NULL,
 CONSTRAINT [PK_Venta_Detalle] PRIMARY KEY CLUSTERED 
(
	[Id_Venta_Detalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vwProducto]    Script Date: 13/07/2020 17:55:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwProducto]
AS
	SELECT * FROM PRODUCTO 
GO
/****** Object:  View [dbo].[vwProductosGV]    Script Date: 13/07/2020 17:55:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwProductosGV] 
AS
	SELECT Id_Producto, Nombre, SUBSTRING(Descripcion, 1, 100) AS Descripcion, 
	Precio_Venta AS 'Precio Venta', Stock_Actual AS Stock 
	FROM PRODUCTO
GO
SET IDENTITY_INSERT [dbo].[CATEGORIA] ON 
GO
INSERT [dbo].[CATEGORIA] ([Id_Categoria], [Categoria]) VALUES (1, N'Plastimodelismo')
GO
INSERT [dbo].[CATEGORIA] ([Id_Categoria], [Categoria]) VALUES (2, N'RadioControl')
GO
SET IDENTITY_INSERT [dbo].[CATEGORIA] OFF
GO
SET IDENTITY_INSERT [dbo].[MARCA] ON 
GO
INSERT [dbo].[MARCA] ([Id_Marca], [Marca]) VALUES (1, N'ITALERI')
GO
INSERT [dbo].[MARCA] ([Id_Marca], [Marca]) VALUES (2, N'Airfix')
GO
INSERT [dbo].[MARCA] ([Id_Marca], [Marca]) VALUES (3, N'Batracio')
GO
INSERT [dbo].[MARCA] ([Id_Marca], [Marca]) VALUES (5, N'Chapita y pinturita')
GO
SET IDENTITY_INSERT [dbo].[MARCA] OFF
GO
SET IDENTITY_INSERT [dbo].[PRODUCTO] ON 
GO
INSERT [dbo].[PRODUCTO] ([Id_Producto], [Nombre], [Descripcion], [Precio_Venta], [Stock_Actual], [Id_Marca], [Id_Categoria]) VALUES (18, N'pato', N'es blanco', CAST(7.00 AS Decimal(18, 2)), 2, NULL, NULL)
GO
INSERT [dbo].[PRODUCTO] ([Id_Producto], [Nombre], [Descripcion], [Precio_Venta], [Stock_Actual], [Id_Marca], [Id_Categoria]) VALUES (1019, N'Perro', N'Es marron', CAST(300.00 AS Decimal(18, 2)), 5, NULL, NULL)
GO
INSERT [dbo].[PRODUCTO] ([Id_Producto], [Nombre], [Descripcion], [Precio_Venta], [Stock_Actual], [Id_Marca], [Id_Categoria]) VALUES (2034, N'Producto1', N'Descripcion de producto', CAST(50.00 AS Decimal(18, 2)), 150, 2, NULL)
GO
INSERT [dbo].[PRODUCTO] ([Id_Producto], [Nombre], [Descripcion], [Precio_Venta], [Stock_Actual], [Id_Marca], [Id_Categoria]) VALUES (2035, N'Producto2', N'Descripcion de producto', CAST(5000.00 AS Decimal(18, 2)), 150, 2, 1)
GO
INSERT [dbo].[PRODUCTO] ([Id_Producto], [Nombre], [Descripcion], [Precio_Venta], [Stock_Actual], [Id_Marca], [Id_Categoria]) VALUES (2038, N'Ranita', N'armable y pintable', CAST(354.00 AS Decimal(18, 2)), 15, 3, 1)
GO
INSERT [dbo].[PRODUCTO] ([Id_Producto], [Nombre], [Descripcion], [Precio_Venta], [Stock_Actual], [Id_Marca], [Id_Categoria]) VALUES (2040, N'Fanta', N'khfhgf hgd hds ouyt vcd dfnbvfd jgsdf gjfdljg puitpuyt kfg', CAST(300.00 AS Decimal(18, 2)), 100, 2, 1)
GO
INSERT [dbo].[PRODUCTO] ([Id_Producto], [Nombre], [Descripcion], [Precio_Venta], [Stock_Actual], [Id_Marca], [Id_Categoria]) VALUES (2041, N'Coca', N'lñkjasdf ñkjlsdg ñpiouasb askñjha dfb,mñhnñk jjkgy ljgh lgb lhghv ,nbgliug', CAST(500.00 AS Decimal(18, 2)), 15, 1, 1)
GO
INSERT [dbo].[PRODUCTO] ([Id_Producto], [Nombre], [Descripcion], [Precio_Venta], [Stock_Actual], [Id_Marca], [Id_Categoria]) VALUES (2042, N'Pepsi', N'jkhdsañjh as ñjkg ñkjhasfg ñjkhas ljhagsdf gñjkhasfd iñuashdg ljbhadfg iugas g', CAST(1500.00 AS Decimal(18, 2)), 6, 2, 1)
GO
INSERT [dbo].[PRODUCTO] ([Id_Producto], [Nombre], [Descripcion], [Precio_Venta], [Stock_Actual], [Id_Marca], [Id_Categoria]) VALUES (2043, N'Pritty', N'lkjas  lñkjf`p piarug ñkljaf ñkjhasdf jkñhaf ñkjhdf pjhñkjdfg ñkjafhg ñkjdfhg oiafg ñkjafh puhaf ñkjh', CAST(1900.55 AS Decimal(18, 2)), 15, 2, 2)
GO
INSERT [dbo].[PRODUCTO] ([Id_Producto], [Nombre], [Descripcion], [Precio_Venta], [Stock_Actual], [Id_Marca], [Id_Categoria]) VALUES (2044, N'Doble Cola', N',.jbhadf E fj DF  ljkgh asrfgl kjh', CAST(853.33 AS Decimal(18, 2)), 1000, 3, 1)
GO
INSERT [dbo].[PRODUCTO] ([Id_Producto], [Nombre], [Descripcion], [Precio_Venta], [Stock_Actual], [Id_Marca], [Id_Categoria]) VALUES (2045, N'Paso De Los Toros', N'jkhaf sñkjgh ñkjafg ñh p uifgsd luh  pujhg pjhg sdfgjkh', CAST(15000.00 AS Decimal(18, 2)), 5, 2, 1)
GO
INSERT [dbo].[PRODUCTO] ([Id_Producto], [Nombre], [Descripcion], [Precio_Venta], [Stock_Actual], [Id_Marca], [Id_Categoria]) VALUES (2046, N'Mirinda', N'ljkghfklg ñkjg 654 sdhg df', CAST(50.00 AS Decimal(18, 2)), 1235, 2, 1)
GO
INSERT [dbo].[PRODUCTO] ([Id_Producto], [Nombre], [Descripcion], [Precio_Venta], [Stock_Actual], [Id_Marca], [Id_Categoria]) VALUES (2047, N'Naranpol', N'ñhaf  ñkjh', CAST(435.00 AS Decimal(18, 2)), 54, 2, 2)
GO
INSERT [dbo].[PRODUCTO] ([Id_Producto], [Nombre], [Descripcion], [Precio_Venta], [Stock_Actual], [Id_Marca], [Id_Categoria]) VALUES (2048, N'Baggio', N'es un jugo sabor a frutas', CAST(6500.00 AS Decimal(18, 2)), 5, 3, 1)
GO
INSERT [dbo].[PRODUCTO] ([Id_Producto], [Nombre], [Descripcion], [Precio_Venta], [Stock_Actual], [Id_Marca], [Id_Categoria]) VALUES (2049, N'Lagartija', N'verde', CAST(0.50 AS Decimal(18, 2)), 3, 3, 1)
GO
INSERT [dbo].[PRODUCTO] ([Id_Producto], [Nombre], [Descripcion], [Precio_Venta], [Stock_Actual], [Id_Marca], [Id_Categoria]) VALUES (2050, N'Madera', N'de arbol', CAST(1500.00 AS Decimal(18, 2)), 100, 5, 1)
GO
SET IDENTITY_INSERT [dbo].[PRODUCTO] OFF
GO
SET IDENTITY_INSERT [dbo].[PROVINCIA] ON 
GO
INSERT [dbo].[PROVINCIA] ([Id_Provincia], [Provincia]) VALUES (1, N'Buenos Aires')
GO
INSERT [dbo].[PROVINCIA] ([Id_Provincia], [Provincia]) VALUES (2, N'Buenos Aires-GBA')
GO
INSERT [dbo].[PROVINCIA] ([Id_Provincia], [Provincia]) VALUES (3, N'Capital Federal')
GO
INSERT [dbo].[PROVINCIA] ([Id_Provincia], [Provincia]) VALUES (4, N'Catamarca')
GO
INSERT [dbo].[PROVINCIA] ([Id_Provincia], [Provincia]) VALUES (5, N'Chaco')
GO
INSERT [dbo].[PROVINCIA] ([Id_Provincia], [Provincia]) VALUES (6, N'Chubut')
GO
INSERT [dbo].[PROVINCIA] ([Id_Provincia], [Provincia]) VALUES (7, N'Córdoba')
GO
INSERT [dbo].[PROVINCIA] ([Id_Provincia], [Provincia]) VALUES (8, N'Corrientes')
GO
INSERT [dbo].[PROVINCIA] ([Id_Provincia], [Provincia]) VALUES (9, N'Entre Ríos')
GO
INSERT [dbo].[PROVINCIA] ([Id_Provincia], [Provincia]) VALUES (10, N'Formosa')
GO
INSERT [dbo].[PROVINCIA] ([Id_Provincia], [Provincia]) VALUES (11, N'Jujuy')
GO
INSERT [dbo].[PROVINCIA] ([Id_Provincia], [Provincia]) VALUES (12, N'La Pampa')
GO
INSERT [dbo].[PROVINCIA] ([Id_Provincia], [Provincia]) VALUES (13, N'La Rioja')
GO
INSERT [dbo].[PROVINCIA] ([Id_Provincia], [Provincia]) VALUES (14, N'Mendoza')
GO
INSERT [dbo].[PROVINCIA] ([Id_Provincia], [Provincia]) VALUES (15, N'Misiones')
GO
INSERT [dbo].[PROVINCIA] ([Id_Provincia], [Provincia]) VALUES (16, N'Neuquén')
GO
INSERT [dbo].[PROVINCIA] ([Id_Provincia], [Provincia]) VALUES (17, N'Río Negro')
GO
INSERT [dbo].[PROVINCIA] ([Id_Provincia], [Provincia]) VALUES (18, N'Salta')
GO
INSERT [dbo].[PROVINCIA] ([Id_Provincia], [Provincia]) VALUES (19, N'San Juan')
GO
INSERT [dbo].[PROVINCIA] ([Id_Provincia], [Provincia]) VALUES (20, N'San Luis')
GO
INSERT [dbo].[PROVINCIA] ([Id_Provincia], [Provincia]) VALUES (21, N'Santa Cruz')
GO
INSERT [dbo].[PROVINCIA] ([Id_Provincia], [Provincia]) VALUES (22, N'Santa Fe')
GO
INSERT [dbo].[PROVINCIA] ([Id_Provincia], [Provincia]) VALUES (23, N'Santiago del Estero')
GO
INSERT [dbo].[PROVINCIA] ([Id_Provincia], [Provincia]) VALUES (24, N'Tierra del Fuego')
GO
INSERT [dbo].[PROVINCIA] ([Id_Provincia], [Provincia]) VALUES (25, N'Tucumán')
GO
SET IDENTITY_INSERT [dbo].[PROVINCIA] OFF
GO
SET IDENTITY_INSERT [dbo].[USUARIO] ON 
GO
INSERT [dbo].[USUARIO] ([Id_Usuario], [Nombre], [Apellido], [Email], [Contraseña]) VALUES (1007, N'administrador', N'de prueba', N'admin@admin.com', N'123456789')
GO
INSERT [dbo].[USUARIO] ([Id_Usuario], [Nombre], [Apellido], [Email], [Contraseña]) VALUES (1009, N'jose pepe', N'argento', N'pepe@email.com', N'987654321')
GO
SET IDENTITY_INSERT [dbo].[USUARIO] OFF
GO
ALTER TABLE [dbo].[Ciudad]  WITH CHECK ADD  CONSTRAINT [FK_Ciudad_PROVINCIA] FOREIGN KEY([Id_Provincia])
REFERENCES [dbo].[PROVINCIA] ([Id_Provincia])
GO
ALTER TABLE [dbo].[Ciudad] CHECK CONSTRAINT [FK_Ciudad_PROVINCIA]
GO
ALTER TABLE [dbo].[PRODUCTO]  WITH CHECK ADD  CONSTRAINT [FK_PRODUCTO_CATEGORIA] FOREIGN KEY([Id_Categoria])
REFERENCES [dbo].[CATEGORIA] ([Id_Categoria])
GO
ALTER TABLE [dbo].[PRODUCTO] CHECK CONSTRAINT [FK_PRODUCTO_CATEGORIA]
GO
ALTER TABLE [dbo].[PRODUCTO]  WITH CHECK ADD  CONSTRAINT [FK_PRODUCTO_MARCA] FOREIGN KEY([Id_Marca])
REFERENCES [dbo].[MARCA] ([Id_Marca])
GO
ALTER TABLE [dbo].[PRODUCTO] CHECK CONSTRAINT [FK_PRODUCTO_MARCA]
GO
ALTER TABLE [dbo].[VENTA]  WITH CHECK ADD  CONSTRAINT [FK_VENTA_USUARIO] FOREIGN KEY([Id_Usuario])
REFERENCES [dbo].[USUARIO] ([Id_Usuario])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[VENTA] CHECK CONSTRAINT [FK_VENTA_USUARIO]
GO
ALTER TABLE [dbo].[VENTA_DETALLE]  WITH CHECK ADD  CONSTRAINT [FK_VENTA_DETALLE_PRODUCTO] FOREIGN KEY([Id_Producto])
REFERENCES [dbo].[PRODUCTO] ([Id_Producto])
GO
ALTER TABLE [dbo].[VENTA_DETALLE] CHECK CONSTRAINT [FK_VENTA_DETALLE_PRODUCTO]
GO
ALTER TABLE [dbo].[VENTA_DETALLE]  WITH CHECK ADD  CONSTRAINT [FK_VENTA_DETALLE_VENTA] FOREIGN KEY([Id_Venta])
REFERENCES [dbo].[VENTA] ([Id_Venta])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[VENTA_DETALLE] CHECK CONSTRAINT [FK_VENTA_DETALLE_VENTA]
GO
/****** Object:  StoredProcedure [dbo].[InsertarProducto]    Script Date: 13/07/2020 17:55:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertarProducto]
@Nombre VARCHAR(60),
@Descripcion VARCHAR(1000),
@Precio_Venta DECIMAL,
@Stock_Actual INT
AS
INSERT INTO PRODUCTO VALUES (@Nombre, @Descripcion, @Precio_Venta, @Stock_Actual)
GO
/****** Object:  StoredProcedure [dbo].[spCategoriaActualizar]    Script Date: 13/07/2020 17:55:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ACTUALIZAR CATEGORIA
CREATE PROC [dbo].[spCategoriaActualizar]
	@Id_Categoria INT, @Categoria VARCHAR(50)
AS
	UPDATE CATEGORIA 
		SET Categoria = @Categoria
	WHERE Id_Categoria = @Id_Categoria
GO
/****** Object:  StoredProcedure [dbo].[spCategoriaCrear]    Script Date: 13/07/2020 17:55:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spCategoriaCrear]
	@Categoria VARCHAR(50)
AS
	INSERT INTO CATEGORIA
		(Categoria)
	VALUEs 
		(@Categoria)
GO
/****** Object:  StoredProcedure [dbo].[spCategoriaEliminar]    Script Date: 13/07/2020 17:55:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spCategoriaEliminar]
	@Id_Categoria INT
AS
	DELETE FROM CATEGORIA 
	WHERE Id_Categoria = @Id_Categoria
GO
/****** Object:  StoredProcedure [dbo].[spMarcaActualizar]    Script Date: 13/07/2020 17:55:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spMarcaActualizar]
	@Id_Marca INT, @Marca VARCHAR(50)
AS
	UPDATE MARCA 
		SET Marca = @Marca
	WHERE Id_Marca = @Id_Marca
GO
/****** Object:  StoredProcedure [dbo].[spMarcaCrear]    Script Date: 13/07/2020 17:55:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spMarcaCrear]
	--Declaro parametros
	@Marca VARCHAR(30)
AS
	-- Declaro Sentencia SQL
	INSERT INTO MARCA
		(Marca)
	VALUEs 
		(@Marca)
GO
/****** Object:  StoredProcedure [dbo].[spMarcaEliminar]    Script Date: 13/07/2020 17:55:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spMarcaEliminar]
	@Id_Marca INT
AS
	DELETE FROM MARCA 
	WHERE Id_Marca = @Id_Marca
GO
/****** Object:  StoredProcedure [dbo].[spMarcaObtener]    Script Date: 13/07/2020 17:55:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Obtener
CREATE PROC [dbo].[spMarcaObtener]
	@Id_Marca INT	
AS
	SELECT * FROM MARCA 
	WHERE Id_Marca = @Id_Marca
GO
/****** Object:  StoredProcedure [dbo].[spMarcaObtener_Todo]    Script Date: 13/07/2020 17:55:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spMarcaObtener_Todo]
AS
	SELECT * FROM MARCA
GO
/****** Object:  StoredProcedure [dbo].[spUsuarioActualizar]    Script Date: 13/07/2020 17:55:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spUsuarioActualizar]
	@Id_Usuario INT, @Nombre VARCHAR(50), @Apellido VARCHAR(50), @Email VARCHAR(50), @Contraseña VARCHAR(50)
AS
	UPDATE USUARIO 
		SET Nombre = @Nombre, Apellido = @Apellido, Email = @Email, Contraseña = @Contraseña     
	WHERE Id_Usuario = @Id_Usuario
GO
/****** Object:  StoredProcedure [dbo].[spUsuarioCrear]    Script Date: 13/07/2020 17:55:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spUsuarioCrear]
	@Nombre VARCHAR(50), @Apellido VARCHAR(50), @Email VARCHAR(50), @Contraseña VARCHAR(50)
AS
	INSERT INTO USUARIO
		(Nombre, Apellido, Email, Contraseña)
	VALUEs 
		(@Nombre, @Apellido, @Email, @Contraseña)
GO
/****** Object:  StoredProcedure [dbo].[spUsuarioEliminar]    Script Date: 13/07/2020 17:55:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--ELIMINAR USUARIO
CREATE PROC [dbo].[spUsuarioEliminar]
	@Id_Usuario INT
AS
	DELETE FROM USUARIO 
	WHERE Id_Usuario = @Id_Usuario
GO
/****** Object:  StoredProcedure [dbo].[spUsuarioObtener]    Script Date: 13/07/2020 17:55:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spUsuarioObtener]
	@Id_Usuario INT
AS
	SELECT * FROM USUARIO 
	WHERE Id_Usuario = @Id_Usuario
GO
