CREATE PROCEDURE Alta_Horarios_Recurrentes
	@id_servicio_profesional int,
	@es_profesional bit,
	@tipo_repeticion bit,
	@cantidad_repeticiones int,
	@fecha_hora_inicio datetime,
	@fecha_hora_fin datetime
AS
BEGIN
	INSERT INTO Horarios_Recurrentes(id_servicio_profesional, es_profesional,tipo_repeticion,cantidad_repeticiones, fecha_hora_inicio, fecha_hora_fin)
	 VALUES (@id_servicio_profesional, @es_profesional,@tipo_repeticion,@cantidad_repeticiones, @fecha_hora_inicio, @fecha_hora_fin)
END