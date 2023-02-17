
CREATE SEQUENCE profesores_id_profesores_seq;

CREATE TABLE profesores (
                id_profesores INTEGER NOT NULL DEFAULT nextval('profesores_id_profesores_seq'),
                especialidad VARCHAR NOT NULL,
                nombre VARCHAR NOT NULL,
                fecha_ingreso_academia VARCHAR NOT NULL,
                equipo_asignado VARCHAR NOT NULL,
                curso_realizado VARCHAR NOT NULL,
                CONSTRAINT profesores_pk PRIMARY KEY (id_profesores)
);


ALTER SEQUENCE profesores_id_profesores_seq OWNED BY profesores.id_profesores;

CREATE SEQUENCE tipo_categoria_id_tipo_categoria_seq;

CREATE TABLE tipo_categoria (
                id_tipo_categoria INTEGER NOT NULL DEFAULT nextval('tipo_categoria_id_tipo_categoria_seq'),
                nombre_categoria VARCHAR NOT NULL,
                CONSTRAINT tipo_categoria_pk PRIMARY KEY (id_tipo_categoria)
);


ALTER SEQUENCE tipo_categoria_id_tipo_categoria_seq OWNED BY tipo_categoria.id_tipo_categoria;

CREATE SEQUENCE vehiculo_id_vehiculo_seq;

CREATE TABLE vehiculo (
                id_vehiculo INTEGER NOT NULL DEFAULT nextval('vehiculo_id_vehiculo_seq'),
                placa VARCHAR NOT NULL,
                modelo VARCHAR NOT NULL,
                marca VARCHAR NOT NULL,
                color VARCHAR NOT NULL,
                CONSTRAINT vehiculo_pk PRIMARY KEY (id_vehiculo)
);


ALTER SEQUENCE vehiculo_id_vehiculo_seq OWNED BY vehiculo.id_vehiculo;

CREATE SEQUENCE representante_id_representantes_seq;

CREATE TABLE representante (
                id_representantes INTEGER NOT NULL DEFAULT nextval('representante_id_representantes_seq'),
                id_vehiculo INTEGER NOT NULL,
                nombre VARCHAR NOT NULL,
                numero_telefonico VARCHAR NOT NULL,
                numero_trabajo VARCHAR NOT NULL,
                cedula VARCHAR NOT NULL,
                CONSTRAINT representante_pk PRIMARY KEY (id_representantes, id_vehiculo)
);


ALTER SEQUENCE representante_id_representantes_seq OWNED BY representante.id_representantes;

CREATE SEQUENCE datos_personales__id_datos_personales_seq;

CREATE TABLE Datos_Personales  (
                id_datos_personales INTEGER NOT NULL DEFAULT nextval('datos_personales__id_datos_personales_seq'),
                id_representantes INTEGER NOT NULL,
                numero_telefonico  VARCHAR NOT NULL,
                numero_casa  VARCHAR NOT NULL,
                direccion VARCHAR NOT NULL,
                nombre VARCHAR NOT NULL,
                cedula VARCHAR NOT NULL,
                edad VARCHAR NOT NULL,
                CONSTRAINT datos_personales_pk PRIMARY KEY (id_datos_personales, id_representantes)
);


ALTER SEQUENCE datos_personales__id_datos_personales_seq OWNED BY Datos_Personales .id_datos_personales;

CREATE SEQUENCE categoria_id_categoria_seq;

CREATE TABLE categoria (
                id_categoria INTEGER NOT NULL DEFAULT nextval('categoria_id_categoria_seq'),
                id_tipo_categoria VARCHAR NOT NULL,
                id_profesores VARCHAR NOT NULL,
                Cantidad_atletas_categoria VARCHAR NOT NULL,
                cantidad_entrenadores_asignados_categoria  VARCHAR NOT NULL,
                cantidad_auxiliares_asignados_categoria  VARCHAR NOT NULL,
                juegos_ganados_categoria VARCHAR NOT NULL,
                juegos_perdidos_categoria VARCHAR NOT NULL,
                juegos_empatados_categoria VARCHAR NOT NULL,
                CONSTRAINT categoria_pk PRIMARY KEY (id_categoria, id_tipo_categoria)
);


ALTER SEQUENCE categoria_id_categoria_seq OWNED BY categoria.id_categoria;

CREATE SEQUENCE torneo_id_torneo_seq;

CREATE TABLE torneo (
                id_torneo VARCHAR NOT NULL DEFAULT nextval('torneo_id_torneo_seq'),
                id_equipo INTEGER NOT NULL,
                nombre_torneo VARCHAR NOT NULL,
                fecha_inscripcion_torneo  VARCHAR NOT NULL,
                fecha_inicio_torneo VARCHAR NOT NULL,
                categorias_inscritas_torneo  VARCHAR NOT NULL,
                equipos_inscritos_torneo VARCHAR NOT NULL,
                calendario_juego VARCHAR NOT NULL,
                posicion_actual_equipo_torneo VARCHAR NOT NULL,
                posicion_final_equipo_torneo  VARCHAR NOT NULL,
                juegos_ganados_torneo VARCHAR NOT NULL,
                juegos_perdidos_torneo  VARCHAR NOT NULL,
                juegos_empatados_torneo VARCHAR NOT NULL,
                CONSTRAINT torneo_pk PRIMARY KEY (id_torneo)
);


ALTER SEQUENCE torneo_id_torneo_seq OWNED BY torneo.id_torneo;

CREATE SEQUENCE equipo_id_equipo_seq;

CREATE TABLE equipo (
                id_equipo INTEGER NOT NULL DEFAULT nextval('equipo_id_equipo_seq'),
                id_torneo VARCHAR NOT NULL,
                id_categoria INTEGER NOT NULL,
                id_tipo_categoria VARCHAR NOT NULL,
                id_profesores INTEGER NOT NULL,
                nombre_equipo VARCHAR NOT NULL,
                numero_total_atletas INTEGER NOT NULL,
                numero_atletas_activos VARCHAR NOT NULL,
                numero_atletas_inativos  VARCHAR NOT NULL,
                director_tecnico  VARCHAR NOT NULL,
                entrenador VARCHAR NOT NULL,
                auxiliar_entrenador  VARCHAR NOT NULL,
                cancha_asignada  VARCHAR NOT NULL,
                juegos_ganados_equipo VARCHAR NOT NULL,
                juegos_perdidos_equipo  VARCHAR NOT NULL,
                juegos_empatados_equipo  VARCHAR NOT NULL,
                CONSTRAINT equipo_pk PRIMARY KEY (id_equipo, id_torneo, id_categoria, id_tipo_categoria, id_profesores)
);


ALTER SEQUENCE equipo_id_equipo_seq OWNED BY equipo.id_equipo;

CREATE SEQUENCE historial_ascenso_atleta_id_historial_ascenso_atleta_seq;

CREATE TABLE historial_ascenso_atleta (
                id_historial_ascenso_atleta INTEGER NOT NULL DEFAULT nextval('historial_ascenso_atleta_id_historial_ascenso_atleta_seq'),
                id_atleta INTEGER NOT NULL,
                fecha_ingreso_academia  VARCHAR NOT NULL,
                fecha_ingreso_equipo VARCHAR NOT NULL,
                categoria_Inicial VARCHAR NOT NULL,
                posicion_anterior  VARCHAR NOT NULL,
                tiempo_categoria VARCHAR NOT NULL,
                tiempo_equipo VARCHAR NOT NULL,
                fecha_ascenso_categoria VARCHAR NOT NULL,
                fecha_ascenso_equipo  VARCHAR NOT NULL,
                CONSTRAINT historial_ascenso_atleta_pk PRIMARY KEY (id_historial_ascenso_atleta)
);


ALTER SEQUENCE historial_ascenso_atleta_id_historial_ascenso_atleta_seq OWNED BY historial_ascenso_atleta.id_historial_ascenso_atleta;

CREATE SEQUENCE historia_medica_atleta_id_historia_medica_atleta_seq;

CREATE TABLE historia_medica_atleta (
                id_historia_medica_atleta INTEGER NOT NULL DEFAULT nextval('historia_medica_atleta_id_historia_medica_atleta_seq'),
                id_atleta INTEGER,
                fecha_ingreso DATE NOT NULL,
                tratamiento VARCHAR NOT NULL,
                tiempo_reposo VARCHAR NOT NULL,
                fecha_egreso VARCHAR NOT NULL,
                hora_ingreso VARCHAR NOT NULL,
                medico_guardia  VARCHAR(250) NOT NULL,
                hora_egreso  VARCHAR NOT NULL,
                notas VARCHAR NOT NULL,
                Reposo VARCHAR NOT NULL,
                diagnostico  VARCHAR NOT NULL,
                CONSTRAINT historia_medica_atleta_pk PRIMARY KEY (id_historia_medica_atleta)
);


ALTER SEQUENCE historia_medica_atleta_id_historia_medica_atleta_seq OWNED BY historia_medica_atleta.id_historia_medica_atleta;

CREATE SEQUENCE atleta__id_atleta_seq;

CREATE TABLE atleta  (
                id_atleta INTEGER NOT NULL DEFAULT nextval('atleta__id_atleta_seq'),
                id_historia_medica_atleta INTEGER NOT NULL,
                id_historial_ascenso_atleta INTEGER NOT NULL,
                id_equipo INTEGER NOT NULL,
                id_torneo VARCHAR NOT NULL,
                id_categoria INTEGER NOT NULL,
                id_tipo_categoria VARCHAR NOT NULL,
                Datos_Personales _id_datos_personales INTEGER NOT NULL,
                id_representantes INTEGER NOT NULL,
                id_datos_personales VARCHAR NOT NULL,
                altura VARCHAR NOT NULL,
                peso VARCHAR NOT NULL,
                fecha_nacimiento INTEGER NOT NULL,
                equipo_actual VARCHAR NOT NULL,
                Pierna Dominante VARCHAR NOT NULL,
                posicion_juego VARCHAR NOT NULL,
                horario_pratica VARCHAR NOT NULL,
                categoria VARCHAR NOT NULL,
                CONSTRAINT atleta_pk PRIMARY KEY (id_atleta, id_historia_medica_atleta, id_historial_ascenso_atleta, id_equipo, id_torneo, id_categoria, id_tipo_categoria, Datos_Personales _id_datos_personales, id_representantes)
);


ALTER SEQUENCE atleta__id_atleta_seq OWNED BY atleta .id_atleta;

ALTER TABLE equipo ADD CONSTRAINT profesores_equipo_fk
FOREIGN KEY (id_profesores)
REFERENCES profesores (id_profesores)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

/*
Warning: Column types mismatch in the following column mapping(s):
        id_tipo_categoria: INTEGER -- id_tipo_categoria: VARCHAR
*/
ALTER TABLE categoria ADD CONSTRAINT tipo_categoria_categoria_fk
FOREIGN KEY (id_tipo_categoria)
REFERENCES tipo_categoria (id_tipo_categoria)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE representante ADD CONSTRAINT vehiculo_representante_fk
FOREIGN KEY (id_vehiculo)
REFERENCES vehiculo (id_vehiculo)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Datos_Personales  ADD CONSTRAINT representante_datos_personales__fk
FOREIGN KEY (id_representantes)
REFERENCES representante (id_representantes)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE atleta  ADD CONSTRAINT datos_personales__atleta__fk
FOREIGN KEY (Datos_Personales _id_datos_personales, id_representantes)
REFERENCES Datos_Personales  (id_datos_personales, id_representantes)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE equipo ADD CONSTRAINT categoria_equipo_fk
FOREIGN KEY (id_categoria, id_tipo_categoria)
REFERENCES categoria (id_categoria, id_tipo_categoria)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE equipo ADD CONSTRAINT torneo_equipo_fk
FOREIGN KEY (id_torneo)
REFERENCES torneo (id_torneo)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE atleta  ADD CONSTRAINT equipo_atleta__fk
FOREIGN KEY (id_equipo, id_torneo, id_categoria, id_tipo_categoria)
REFERENCES equipo (id_equipo, id_torneo, id_categoria, id_tipo_categoria)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE atleta  ADD CONSTRAINT historial_ascenso_atleta_atleta__fk
FOREIGN KEY (id_historial_ascenso_atleta)
REFERENCES historial_ascenso_atleta (id_historial_ascenso_atleta)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE atleta  ADD CONSTRAINT historia_medica_atleta_atleta__fk
FOREIGN KEY (id_historia_medica_atleta)
REFERENCES historia_medica_atleta (id_historia_medica_atleta)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
