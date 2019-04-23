CREATE PROCEDURE Baja_Servicio
	@id int 
AS
BEGIN
	IF(SELECT baja FROM Servicio WHERE @id = id) = 0
		BEGIN
			UPDATE Servicio	
			SET baja = 1
			WHERE @id = id
			PRINT '* * * SE HA DADO DE BAJA AL SERVICIO * * *'
		END
	ELSE
		BEGIN	
			UPDATE Servicio	
			SET baja = 0
			WHERE id = @id
			PRINT '* * * SE HA DADO DE ALTA AL SERVICIO * * *'
		END
END