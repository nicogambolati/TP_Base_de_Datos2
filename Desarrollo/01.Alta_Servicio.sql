CREATE PROCEDURE Alta_Servicio
	@nombre varchar (50),
	@tipo char (2)
AS
BEGIN
	INSERT INTO Servicio (nombre, tipo, baja) VALUES (@nombre, @tipo,0)
	PRINT ' * * * SE HA DADO DE ALTA AL SERVICIO * * *'
END