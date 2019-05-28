CREATE PROCEDURE consulta_profesional
	@nombre varchar(50)

AS BEGIN
	SELECT *
	FROM Profesional p
	WHERE @nombre = p.nombre
END