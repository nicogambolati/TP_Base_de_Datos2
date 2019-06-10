CREATE PROCEDURE consulta_servicio_profesional
AS BEGIN
	SELECT *
	FROM Servicio s INNER JOIN Profesional p ON s.id = p.id
END

CREATE PROCEDURE validar_login_paciente
AS BEGIN
	IF CURRENT_USER NOT IN (select name from sysusers)
		PRINT 'Login NO autorizado'
	ELSE
		PRINT 'Login autorizado'
END

CREATE PROCEDURE validar_login_servicio_profesional
AS BEGIN
	IF CURRENT_USER NOT IN (select name from sysusers)
		PRINT 'Login NO autorizado'
	ELSE
		PRINT 'Login autorizado'
END

CREATE PROCEDURE consultar_disponibilidad_servicio
	@nombre_servicio varchar(50),
	@fecha datetime
AS BEGIN
	IF EXISTS (SELECT * FROM Servicio s INNER JOIN Horarios_disponibles h ON s.id = h.id_servicio_profesional WHERE @nombre_servicio = s.nombre AND CONVERT(date, h.fecha_hora_inicio) = CONVERT(date, @fecha))
		PRINT 'El servicio esta disponible'
	ELSE
		PRINT 'El servicio NO esta disponible'
END

CREATE PROCEDURE consultar_proximo_turno_servicio
	@nombre_servicio varchar(50),
	@turno_disponible_inicio datetime output
AS BEGIN
	IF EXISTS (SELECT h.fecha_hora_inicio FROM Servicio s INNER JOIN Horarios_disponibles h ON s.id = h.id_servicio_profesional WHERE @nombre_servicio = s.nombre)
		SET @turno_disponible_inicio = (SELECT h.fecha_hora_inicio
										FROM Servicio s INNER JOIN Horarios_disponibles h ON s.id = h.id_servicio_profesional
										WHERE @nombre_servicio = s.nombre)							
	ELSE
		PRINT 'El servicio NO esta disponible'
END

CREATE TABLE Turnos(
	id int IDENTITY (1,1) NOT NULL,
	id_servicio int NOT NULL,
	id_profesional int NOT NULL,
	id_paciente int NOT NULL,
	fecha_hora_inicio datetime NOT NULL,
	baja bit DEFAULT 0
)

CREATE PROCEDURE reservar_turno
	@id_servicio int,
	@id_profesional int,
	@id_paciente int,
	@fecha_hora datetime
AS BEGIN
	INSERT INTO Turnos (id_servicio, id_profesional, id_paciente, fecha_hora_inicio)
				VALUES (@id_servicio, @id_profesional, @id_paciente, @fecha_hora)
END

CREATE PROCEDURE baja_turno
	@id_turno int
AS BEGIN
	IF (SELECT baja FROM Turnos WHERE @id_turno = id) = 0
		BEGIN
			UPDATE Turnos
			SET baja = 1
			WHERE @id_turno = id
			PRINT 'Se ha dado de baja el turno'
		END
		
	ELSE
		PRINT 'El turno se encuentra dado de baja'
END

CREATE PROCEDURE lista_turnos
	@id_profesional int
AS BEGIN
	SELECT t.id_servicio, t.id_profesional, t.id_paciente, t.id
	FROM Turnos t
	WHERE id_profesional = @id_profesional AND baja = 0 AND CONVERT(date, GETDATE()) = CONVERT(date, fecha_hora_inicio) 
END