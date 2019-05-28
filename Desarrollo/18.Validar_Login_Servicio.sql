CREATE PROCEDURE validar_login_servicio
	@servicio varchar(50)
AS BEGIN
	IF EXISTS (SELECT * FROM Profesional p WHERE p.nombre = @servicio)
		PRINT 'Servicio encontrado'
	ELSE
		PRINT 'Servicio NO encontrado'
END