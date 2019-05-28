CREATE PROCEDURE validar_login_profesional
	@profesional varchar(50)
AS BEGIN
	IF EXISTS (SELECT * FROM Profesional p WHERE p.nombre = @profesional)
		PRINT 'Profesional encontrado'
	ELSE
		PRINT 'Profesional NO encontrado'
END