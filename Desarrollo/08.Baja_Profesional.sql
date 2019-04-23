CREATE PROCEDURE Baja_Profesional
	@id int 
AS
BEGIN
	IF(SELECT baja FROM Profesional WHERE @id = id) = 0
		BEGIN
			UPDATE Profesional	
			SET baja = 1
			WHERE @id = id
			PRINT '* * * SE HA DADO DE BAJA AL PROFESIONAL * * *'
		END
	ELSE
		BEGIN	
			UPDATE Profesional	
			SET baja = 0
			WHERE id = @id
			PRINT '* * * SE HA DADO DE ALTA AL PROFESIONAL * * *'
		END
END