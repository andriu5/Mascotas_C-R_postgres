-- Table: public.casos

-- DROP TABLE public.casos;

-- Create the function
CREATE OR REPLACE FUNCTION trigger_set_timestamp()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Create the table
CREATE TABLE casos (
	id SERIAL NOT NULL PRIMARY KEY,
  numero_de_caso VARCHAR(100),
	tipo_de_interesado VARCHAR(100),
  cliente VARCHAR(255),
  macrosegmento_nivel1_cliente VARCHAR(100),
  num_adherente_contrato VARCHAR(15),
  tipo_del_caso VARCHAR(12),
  estado_del_caso VARCHAR(12),
  tema2 VARCHAR(45),
  tema3 VARCHAR(60),
  tema4 VARCHAR(100),
  fecha_y_hora_creacion TIMESTAMPTZ,
  fecha_maxima_de_respuesta TIMESTAMPTZ,
  caso_a_nombre_de_tercero VARCHAR(2),
  autor VARCHAR(60),
  calidad_de_interesado VARCHAR(24),
  canal_preferido_de_respuesta VARCHAR(32),
  esta_desfasado VARCHAR(2),
  centro_de_trabajo VARCHAR(100),
  comuna VARCHAR(100),
  director_responsable_del_cliente VARCHAR(60),
  medio_de_respuesta VARCHAR(25),
  observaciones TEXT DEFAULT '',
  oficina_o_centro_de_atencion_salud VARCHAR(255),
  origen_de_la_presentacion VARCHAR(45),
  requiere_prorroga VARCHAR(2),
  sexo VARCHAR(10),
  via_de_respuesta VARCHAR(25),
  fecha_de_cierre VARCHAR(25),
  fecha_de_respuesta VARCHAR(12),
  canal_de_recepcion VARCHAR(255),
  descripcion_de_la_presentacion TEXT DEFAULT '',
	created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
	updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- Create the trigger
CREATE TRIGGER set_timestamp
BEFORE UPDATE ON casos
FOR EACH ROW
EXECUTE PROCEDURE trigger_set_timestamp();

-- Profit
-- Now we can insert and update rows in the table, and both 
-- the created_at and updated_at columns will be saved correctly :)

-- UPDATE field estado:
-- UPDATE public.casos
-- 	SET estado_del_caso='Resuelto'
-- 	WHERE id = 1;
-- UPDATE public.casos
-- 	SET estado_del_caso='Activo'
--  	WHERE id = 1;