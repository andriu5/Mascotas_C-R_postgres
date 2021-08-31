-- Table: public.pets

DROP TABLE public.pets;

-- Create the function
CREATE OR REPLACE FUNCTION trigger_set_timestamp()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;



CREATE TABLE public.pets
(
    id SERIAL NOT NULL PRIMARY KEY,
    name VARCHAR(45),
    type VARCHAR(45),
	created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
	updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
)

TABLESPACE pg_default;

ALTER TABLE public.pets
    OWNER to postgres;

-- Create the trigger
CREATE TRIGGER set_timestamp
BEFORE UPDATE ON pets
FOR EACH ROW
EXECUTE PROCEDURE trigger_set_timestamp();
