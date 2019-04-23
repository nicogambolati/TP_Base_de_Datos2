CREATE PROCEDURE Modificacion_Servicio
	@id int,
	@nuevo_nombre varchar(50) NULL,
	@nuevo_tipo char(2) NULL
AS 
BEGIN
	UPDATE Servicio		
	SET nombre = ISNULL (@nuevo_nombre, Servicio.nombre), 
		tipo = ISNULL (@nuevo_tipo, Servicio.tipo)
	WHERE id = @id
	PRINT ' * * * SE HA DADO MODIFICADO EL SERVICIO * * *'
END