CREATE PROCEDURE validar_login_paciente
	@paciente varchar(255)
AS BEGIN
	IF EXISTS (SELECT * FROM Paciente p WHERE p.nombre = @paciente)
		PRINT 'Paciente encontrado'
	ELSE
		PRINT 'Paciente NO encontrado'
END