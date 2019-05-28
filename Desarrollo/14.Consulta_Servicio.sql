CREATE PROCEDURE consulta_servicio
	@nombre varchar(50) = NULL
	
AS BEGIN
	SELECT *
	FROM Servicio s
	WHERE @nombre = s.nombre
END