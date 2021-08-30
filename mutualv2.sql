CREATE TABLE casos (
	id SERIAL NOT NULL PRIMARY KEY,
    numero_de_caso VARCHAR(100) NOT NULL,
	is_processed BOOLEAN DEFAULT FALSE,
	tipo_de_interesado VARCHAR(100) NOT NULL,
    cliente VARCHAR(255) NOT NULL,
    macrosegmento_nivel1_cliente VARCHAR(100),
    num_adherente_contrato VARCHAR(8),
    tipo_del_caso VARCHAR(12) NOT NULL,
    estado_del_caso VARCHAR(12) NOT NULL,
    tema2 VARCHAR(45) NOT NULL,
    tema3 VARCHAR(60) NOT NULL,
    tema4 VARCHAR(100) NOT NULL,
    fecha_y_hora_creacion TIMESTAMPTZ NOT NULL,
    fecha_maxima_de_respuesta TIMESTAMPTZ NOT NULL,
    caso_a_nombre_de_tercero VARCHAR(2) NOT NULL,
    autor VARCHAR(60) NOT NULL,
    calidad_de_interesado VARCHAR(24) NOT NULL,
    canal_preferido_de_respuesta VARCHAR(32) NOT NULL,
    esta_desfasado VARCHAR(2) NOT NULL,
    centro_de_trabajo VARCHAR(100),
    comuna VARCHAR(100),
    director_responsable_del_cliente VARCHAR(60) NOT NULL,
    medio_de_respuesta VARCHAR(25),
    observaciones TEXT DEFAULT '',
    oficina_o_centro_de_atencion_salud VARCHAR(255),
    origen_de_la_presentacion VARCHAR(45) NOT NULL,
    requiere_prorroga VARCHAR(2),
    sexo VARCHAR(10) NOT NULL,
    via_de_respuesta VARCHAR(25),
    fecha_de_cierre DATE,
    fecha_de_respuesta VARCHAR(12) NOT NULL,
    canal_de_recepcion VARCHAR(255) NOT NULL,
    descripcion_de_la_presentacion TEXT DEFAULT '',
	created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
	updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);