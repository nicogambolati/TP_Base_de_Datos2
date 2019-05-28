CREATE PROCEDURE consulta_actividad
	@actividad char(1), @filas_por_pag int,	@num_pag int

	AS BEGIN
		SELECT id, usuario, tipo_actividad
		FROM Auditoria
		WHERE tipo_actividad = @actividad AND id <= @filas_por_pag*@num_pag AND id > (@num_pag-1)*@filas_por_pag
	END

----------------------------------------------------


CREATE TRIGGER audit_insert_horarios ON Horarios_disponibles
AFTER INSERT
	AS BEGIN		
		INSERT INTO Auditoria (tipo_actividad)
						VALUES('I')
	END

----------------------------------------------------


CREATE TRIGGER audit_update_horarios ON Horarios_disponibles
AFTER UPDATE
	AS BEGIN		
		INSERT INTO Auditoria (tipo_actividad)
						VALUES('U')
	END

----------------------------------------------------


CREATE TRIGGER audit_delete_horarios ON Horarios_disponibles
AFTER DELETE
	AS BEGIN		
		INSERT INTO Auditoria (tipo_actividad)
						VALUES('D')
	END
----------------------------------------------------


CREATE TRIGGER audit_insert_pacientes ON Paciente
AFTER INSERT
	AS BEGIN		
		INSERT INTO Auditoria (tipo_actividad)
						VALUES('I')
	END
----------------------------------------------------


CREATE TRIGGER audit_update_pacientes ON Paciente
AFTER UPDATE
	AS BEGIN		
		INSERT INTO Auditoria (tipo_actividad)
						VALUES('U')
	END
----------------------------------------------------


CREATE TRIGGER audit_delete_pacientes ON Paciente
AFTER DELETE
	AS BEGIN		
		INSERT INTO Auditoria (tipo_actividad)
						VALUES('D')
	END
----------------------------------------------------

CREATE TRIGGER audit_insert_profesionales ON Profesional
AFTER INSERT
	AS BEGIN		
		INSERT INTO Auditoria (tipo_actividad)
						VALUES('I')
	END
----------------------------------------------------

CREATE TRIGGER audit_update_profesionales ON Profesional
AFTER UPDATE
	AS BEGIN		
		INSERT INTO Auditoria (tipo_actividad)
						VALUES('U')
	END

----------------------------------------------------

CREATE TRIGGER audit_delete_profesionales ON Profesional
AFTER DELETE
	AS BEGIN		
		INSERT INTO Auditoria (tipo_actividad)
						VALUES('D')
	END

----------------------------------------------------

CREATE TRIGGER audit_insert_servicios ON Servicio
AFTER INSERT
	AS BEGIN		
		INSERT INTO Auditoria (tipo_actividad)
						VALUES('I')
	END

----------------------------------------------------

CREATE TRIGGER audit_update_servicios ON Servicio
AFTER UPDATE
	AS BEGIN		
		INSERT INTO Auditoria (tipo_actividad)
						VALUES('U')
	END

----------------------------------------------------

CREATE TRIGGER audit_delete_servicios ON Servicio
AFTER DELETE
	AS BEGIN		
		INSERT INTO Auditoria (tipo_actividad)
						VALUES('D')
	END