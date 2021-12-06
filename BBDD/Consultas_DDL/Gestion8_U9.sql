-- Ejercicios de DDL Lenguaje de Definición de datos 
 
-- Crea nuevas consultas SQL para realizar lo que se pide mediante Transact-SQL. Algunas veces se puede 
-- conseguir lo mismo de varias formas, intenta averiguar las diferentes formas. 
-- 1.  Cambiar la intercalación de la base de datos Gestion8 para que el sistema sea sensible a las  mayúsculas y 
-- minúsculas. Realiza estos pasos: 

-- 1.1. Redacta primero una consulta simple que permita comprobar si el sistema es sensible a las 
-- mayúsculas. 
SELECT CONVERT (varchar, SERVERPROPERTY('collation'));

        -- ¿collation actua sobre el servidor o sobre la base de datos?
        SELECT CONVERT (varchar, DATABASEPROPERTYEX('gestion8','collation'));
        -- Listado de collations disponible
            SELECT * from ::fn_helpcollations()
-- 1.2. Redacta  y ejecuta una consulta para cambiar la intercalación. 
ALTER DATABASE Gestion8 COLLATE Greek_CS_AI
ALTER DATABASE Gestion8 COLLATE Modern_Spanish_CI_AS

-- 1.3. Vuelve a ejecutar la consulta del punto 1.1 para comprobar el efecto del punto 1.2. 
SELECT CONVERT (varchar, DATABASEPROPERTYEX('gestion8','collation'));
ALTER DATABASE Gestion8 COLLATE Greek_CS_AI
SELECT CONVERT (varchar, DATABASEPROPERTYEX('gestion8','collation'));
ALTER DATABASE Gestion8 COLLATE Modern_Spanish_CI_AS
SELECT CONVERT (varchar, DATABASEPROPERTYEX('gestion8','collation'));
-- 1.4. Vuelve a dejar la intercalación como estaba.  
ALTER DATABASE Gestion8 COLLATE Modern_Spanish_CI_AS
SELECT CONVERT (varchar, DATABASEPROPERTYEX('gestion8','collation'));
-- 2.   Crea una nueva base de datos Gestion2, los archivos físicos se llamarán también Gestion2 y se creará en la 
-- misma carpeta que la base de datos Gestion. 
CREATE DATABASE [Gestion2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Gestion2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRES\MSSQL\DATA\Gestion2.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Gestion2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRES\MSSQL\DATA\Gestion2_log.ldf' , SIZE = 3136KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
-- 3.   En Gestion2, crea las mismas tablas que tenemos en Gestion8 con las mismas relaciones entre ellas.  Este 
-- ejercicio se resuelve con varias sentencias. 
USE [Gestion2]
GO

/****** Object:  Table [dbo].[productos]    Script Date: 05/12/2021 10:35:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[productos](
	[idfab] [nvarchar](20) NOT NULL,
	[idproducto] [nvarchar](20) NOT NULL,
	[descripcion] [nvarchar](20) NOT NULL,
	[precio] [money] NULL,
	[existencias] [int] NOT NULL,
 CONSTRAINT [PK_productos] PRIMARY KEY CLUSTERED 
(
	[idfab] ASC,
	[idproducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

USE [Gestion2]
GO

/****** Object:  Table [dbo].[oficinas]    Script Date: 05/12/2021 10:38:34 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[oficinas](
	[oficina] [int] NOT NULL,
	[ciudad] [nvarchar](20) NOT NULL,
	[region] [nvarchar](20) NULL,
	[dir] [int] NULL,
	[objetivo] [money] NULL,
	[ventas] [money] NULL CONSTRAINT [d1]  DEFAULT ((0)),
 CONSTRAINT [PK_oficinas] PRIMARY KEY CLUSTERED 
(
	[oficina] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[pedidos]    Script Date: 05/12/2021 10:43:48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[pedidos](
	[codigo] [int] IDENTITY(1,1) NOT NULL,
	[numpedido] [nvarchar](20) NOT NULL,
	[fechapedido] [datetime] NOT NULL,
	[clie] [int] NOT NULL,
	[rep] [int] NOT NULL,
	[fab] [nvarchar](20) NOT NULL,
	[producto] [nvarchar](20) NOT NULL,
	[cant] [int] NOT NULL,
	[importe] [money] NULL,
 CONSTRAINT [PK_pedidos] PRIMARY KEY CLUSTERED 
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[clientes]    Script Date: 05/12/2021 10:45:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[clientes](
	[numclie] [int] NOT NULL,
	[nombre] [nvarchar](20) NOT NULL,
	[repclie] [int] NULL,
	[limitecredito] [int] NOT NULL,
 CONSTRAINT [PK_clientes] PRIMARY KEY CLUSTERED 
(
	[numclie] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[empleados]    Script Date: 05/12/2021 10:45:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[empleados](
	[numemp] [int] NOT NULL,
	[nombre] [nvarchar](20) NOT NULL,
	[edad] [int] NULL,
	[oficina] [int] NULL,
	[titulo] [nvarchar](20) NULL,
	[contrato] [datetime] NULL,
	[jefe] [int] NULL,
	[cuota] [money] NULL,
	[ventas] [money] NOT NULL,
 CONSTRAINT [pk] PRIMARY KEY CLUSTERED 
(
	[numemp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

-- Creación de referencias


-- 4.  La tabla Productos de Gestion2 consideramos que sufre pocas operaciones de nuevos registros o 
-- eliminación de registros y el único campo que sufre actualizaciones frecuentes es el campo existencias; por 
-- otro lado es frecuente consultar los productos por el campo descripcion (aunque varios productos puedan 
-- tener la misma descripción). ¿Se podría mejorar la base de datos? Si es que sí indica de qué forma y escribe 
-- la  instrucción correspondiente; en cualquier caso justifica la respuesta. 

-- 5.   ¿Qué se puede hacer para que no puedan existir en la tabla de clientes dos clientes con el mismo nombre? 
-- 6.   En nuestro sistema vamos a efectuar muchas consultas recuperando a la vez los pedidos y los productos 
-- asociados a cada uno de ellos, por eso sería bueno.... Completa la frase y escribe la sentencia SQL 
-- correspondiente. 

    /*Crear una vista en la que estuvieran los datos más consultados de ambas tablas*/

-- 7.   Elimina los clientes dejando en pedidos el campo cliente a NULL. Este ejercicio se resuelve con varias 
-- sentencias y se puede resolver de varias maneras. Resuélvelo de distintas formas. 

-- 8.   Ahora queremos permitir que dos clientes tengan el mismo nombre.  

-- 9.  Elimina la base de datos Gestion2, así podrás volver a hacer los ejercicios. 