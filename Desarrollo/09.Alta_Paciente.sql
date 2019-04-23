CREATE PROCEDURE Alta_Paciente
	@nombre varchar(255),
	@email varchar(80),
	@telefono varchar (40)
AS
BEGIN
	INSERT INTO Paciente (nombre, email, telefono, baja) VALUES (@nombre, @email, @telefono, 0)
	PRINT '* * * SE HA DADO DE ALTA AL PACIENTE * * *'
END