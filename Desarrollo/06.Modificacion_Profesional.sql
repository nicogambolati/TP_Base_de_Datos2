CREATE PROCEDURE Modificacion_Profesional
	@id int,
	@nuevo_nombre varchar(255)=NULL,
	@nuevo_email varchar(80)=NULL,
	@nuevo_telefono varchar (40)=NULL
AS 
BEGIN
	UPDATE Profesional
	SET nombre = ISNULL (@nuevo_nombre, Profesional.nombre), 
		email = ISNULL (@nuevo_email, Profesional.email), 
		telefono = ISNULL(@nuevo_telefono, Profesional.telefono)
	WHERE id = @id
	PRINT ' * * * SE HA DADO MODIFICADO EL PROFESIONAL * * *'
END