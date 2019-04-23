CREATE TABLE Horarios_disponibles (
id_servicio_profesional int IDENTITY(1,1) NOT NULL,
es_profesional bit,
fecha_hora_inicio datetime,
fecha_hora_fin datetime
)