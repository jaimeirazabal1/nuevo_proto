CREATE TABLE usuario
(
  id serial NOT NULL,
  nombre_usuario character varying(50) NOT NULL,
  password character varying(100),
  created timestamp without time zone,
  admin integer,
  CONSTRAINT usuario_pkey PRIMARY KEY (id),
  CONSTRAINT usuario_nombre_usuario_key UNIQUE (nombre_usuario)
)
CREATE TABLE permiso
(
  id serial NOT NULL,
  titulo character varying(100),
  hidden integer,
  usuario_id integer,
  activo integer,
  controlador_id integer,
  CONSTRAINT permiso_pkey PRIMARY KEY (id)
)
CREATE TABLE controlador
(
  id serial NOT NULL,
  controlador character varying(100),
  created timestamp without time zone DEFAULT now(),
  CONSTRAINT controlador_pkey PRIMARY KEY (id)
)