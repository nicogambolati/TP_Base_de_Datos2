CREATE PROCEDURE Alta_Horarios_Disponibles
	@id_servicio_profesional int,
	@es_profesional bit,
	@fecha_hora_inicio datetime,
	@fecha_hora_fin datetime
AS
BEGIN
	INSERT INTO Horarios_disponibles (id_servicio_profesional, es_profesional, fecha_hora_inicio, fecha_hora_fin) VALUES (@id_servicio_profesional, @es_profesional, @fecha_hora_inicio, @fecha_hora_fin)
END