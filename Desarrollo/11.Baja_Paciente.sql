CREATE PROCEDURE baja_paciente
	@id int
AS
BEGIN
	IF (SELECT baja FROM Paciente WHERE @id = id) = 0
		BEGIN
			UPDATE Paciente
			SET baja = 1
			WHERE @id = id
			PRINT '* * * SE HA DADO DE BAJA AL PACIENTE * * *'
		END
	ELSE
		BEGIN
			UPDATE Paciente
			SET baja = 0
			WHERE id = @id
			PRINT '* * * SE HA DADO DE ALTA AL PACIENTE * * *'
		END
END