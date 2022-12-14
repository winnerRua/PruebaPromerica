USE PruebaPromerica

--CREACIÓN TABLAS
CREATE TABLE TIPO_INFORMACION
(
	COD_TIPO_INFORMACION INT IDENTITY(1,1) PRIMARY KEY,
	NOMBRE VARCHAR(60)
)

CREATE TABLE TIPO
(
	COD_TIPO INT IDENTITY(1,1) PRIMARY KEY,
	NOMBRE VARCHAR(60)
)

CREATE TABLE FORMATO_MENSAJE
(
	COD_FORMATO INT IDENTITY(1,1) PRIMARY KEY,
	COD_TIPO INT FOREIGN KEY REFERENCES TIPO(COD_TIPO),
	COD_TIPO_INFORMACION INT FOREIGN KEY REFERENCES TIPO_INFORMACION(COD_TIPO_INFORMACION),
	NOMBRE VARCHAR(60),
	REMITENTE VARCHAR(60),
	ASUNTO VARCHAR(150)
)

CREATE TABlE PROYECTO
(
	PROYECTO INT IDENTITY(1,1) PRIMARY KEY,
	NOMBRE VARCHAR(60)
)

CREATE TABLE PRODUCTO
(
	PRODUCTO INT IDENTITY(1,1) PRIMARY KEY,
	DESCRIPCION VARCHAR(150)
)

CREATE TABLE MENSAJE
(
	COD_MENSAJE INT IDENTITY(1,1) PRIMARY KEY,
	COD_FORMATO INT FOREIGN KEY REFERENCES FORMATO_MENSAJE(COD_FORMATO),
	PROYECTO INT FOREIGN KEY REFERENCES PROYECTO(PROYECTO),
	PRODUCTO INT FOREIGN KEY REFERENCES PRODUCTO(PRODUCTO)
)

CREATE TABLE PRODUCTO_PROYECTO
(
	PROYECTO INT FOREIGN KEY REFERENCES PROYECTO(PROYECTO),
	PRODUCTO INT FOREIGN KEY REFERENCES PRODUCTO(PRODUCTO)
)


DROP TABLE TIPO_INFORMACION
DROP TABLE TIPO
DROP TABLE FORMATO_MENSAJE
DROP TABLE MENSAJE
DROP TABLE PRODUCTO_PROYECTO
DROP TABLE PRODUCTO
DROP TABLE PROYECTO

--A.
SELECT P.NOMBRE, P1.DESCRIPCION 
	FROM PRODUCTO_PROYECTO A
	INNER JOIN PRODUCTO P1 ON A.PRODUCTO = P1.PRODUCTO
	INNER JOIN PROYECTO P ON A.PROYECTO = P.PROYECTO
	WHERE P.PROYECTO = 1

--B
SELECT A.ASUNTO, B.NOMBRE, C.DESCRIPCION
	FROM FORMATO_MENSAJE A
	INNER JOIN MENSAJE D ON D.COD_FORMATO = A.COD_FORMATO
	INNER JOIN PROYECTO B ON D.PROYECTO = B.PROYECTO
	INNER JOIN PRODUCTO C ON D.PRODUCTO = C.PRODUCTO
	WHERE B.PROYECTO = 1

--C


SELECT * FROM TIPO_INFORMACION
SELECT * FROM TIPO
SELECT * FROM FORMATO_MENSAJE
SELECT * FROM PROYECTO
SELECT * FROM PRODUCTO
SELECT * FROM MENSAJE

--Inserción TIPO_INFORMACION
INSERT INTO TIPO_INFORMACION VALUES('Bienvenid@')
INSERT INTO TIPO_INFORMACION VALUES('Al día')
INSERT INTO TIPO_INFORMACION VALUES('Moros@')
INSERT INTO TIPO_INFORMACION VALUES('Cancelado')

--Inserción TIPO
INSERT INTO TIPO VALUES('E-mail')
INSERT INTO TIPO VALUES('Llamada')
INSERT INTO TIPO VALUES('Correspondencia')
INSERT INTO TIPO VALUES(

--Inserción PROYECTO
INSERT INTO PROYECTO VALUES('Premia')
INSERT INTO PROYECTO VALUES('Konmi')
INSERT INTO PROYECTO VALUES('Yujule')

--Inserción PRODUCTO
INSERT INTO PRODUCTO VALUES('Premia Clásica')
INSERT INTO PRODUCTO VALUES('Premia Platinum')
INSERT INTO PRODUCTO VALUES('Premia Oro')
INSERT INTO PRODUCTO VALUES('Konmi Clásica')
INSERT INTO PRODUCTO VALUES('Konmi Platinum')
INSERT INTO PRODUCTO VALUES('Konmi Oro')
INSERT INTO PRODUCTO VALUES('Yujule Clásica')
INSERT INTO PRODUCTO VALUES('Yujule Platinum')
INSERT INTO PRODUCTO VALUES('Yujule Oro')

--Inserción PRODUCTO_PROYECTO
INSERT INTO PRODUCTO_PROYECTO VALUES(1,1)
INSERT INTO PRODUCTO_PROYECTO VALUES(1,2)
INSERT INTO PRODUCTO_PROYECTO VALUES(2,4)
INSERT INTO PRODUCTO_PROYECTO VALUES(2,5)
INSERT INTO PRODUCTO_PROYECTO VALUES(1,3)
INSERT INTO PRODUCTO_PROYECTO VALUES(3,6)

--Inserción FORMATO_MENSAJE
INSERT INTO FORMATO_MENSAJE VALUES(1, 1, 'Bienvenid@', 'Edwin', 'Primer ingreso al banco')
INSERT INTO FORMATO_MENSAJE VALUES(1, 1, 'Bienvenid@', 'María', 'Primer ingreso al banco')
INSERT INTO FORMATO_MENSAJE VALUES(1, 1, 'Bienvenid@', 'Brandon', 'Primer ingreso al banco')
INSERT INTO FORMATO_MENSAJE VALUES(3, 4, 'Cancelado', 'Cristina', 'Cancelación de su crédito')
INSERT INTO FORMATO_MENSAJE VALUES(3, 3, 'Pendiente de pago', 'Martha', 'Tiene una deuda')
INSERT INTO FORMATO_MENSAJE VALUES(1, 2, 'Estado de cuenta', 'Carlos', 'Bitácora de su cuenta actual')
INSERT INTO FORMATO_MENSAJE VALUES(2, 2, 'Estado de cuenta', 'Marcos', 'Consula de su cuenta actual')
INSERT INTO FORMATO_MENSAJE VALUES(2, 3, 'Estado de cuenta', 'Sofía', 'Cuota pendiente en su cuenta')
INSERT INTO FORMATO_MENSAJE VALUES(3, 1, 'Bienvenid@', 'Mercedes', 'Primer ingreso al banco')

--Inserción MENSAJE
INSERT INTO MENSAJE VALUES(3, 1, 2)
INSERT INTO MENSAJE VALUES(4, 2, 4)
INSERT INTO MENSAJE VALUES(5, 1, 1)
INSERT INTO MENSAJE VALUES(6, 3, 9)
INSERT INTO MENSAJE VALUES(7, 2, 4)
INSERT INTO MENSAJE VALUES(8, 2, 6)
INSERT INTO MENSAJE VALUES(4, 2, 4)
INSERT INTO MENSAJE VALUES(4, 2, 4)
INSERT INTO MENSAJE VALUES(4, 2, 4)