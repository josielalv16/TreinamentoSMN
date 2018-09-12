-- Database diff generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler  version: 0.9.0
-- PostgreSQL version: 9.5

-- [ Diff summary ]
-- Dropped objects: 0
-- Created objects: 10
-- Changed objects: 0
-- Truncated tables: 0

SET search_path=public,pg_catalog,administrativo,veiculo;
-- ddl-end --


-- [ Created objects ] --
-- object: administrativo | type: SCHEMA --
-- DROP SCHEMA IF EXISTS administrativo CASCADE;
CREATE SCHEMA administrativo;
-- ddl-end --
ALTER SCHEMA administrativo OWNER TO postgres;
-- ddl-end --
COMMENT ON SCHEMA administrativo IS 'Eschema adminisatitrativo loja carro';
-- ddl-end --

-- object: administrativo.loja | type: TABLE --
-- DROP TABLE IF EXISTS administrativo.loja CASCADE;
CREATE TABLE administrativo.loja(
	id serial NOT NULL,
	endereco varchar(100) NOT NULL,
	razao_social varchar(100) NOT NULL,
	nome_fantasia varchar(100) NOT NULL,
	telefone varchar(100) NOT NULL,
	CONSTRAINT loja_pk PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE administrativo.loja IS 'Eschema adminisatitrativo pizzaria';
-- ddl-end --
ALTER TABLE administrativo.loja OWNER TO postgres;
-- ddl-end --

-- object: veiculo | type: SCHEMA --
-- DROP SCHEMA IF EXISTS veiculo CASCADE;
CREATE SCHEMA veiculo;
-- ddl-end --
ALTER SCHEMA veiculo OWNER TO postgres;
-- ddl-end --
COMMENT ON SCHEMA veiculo IS 'Eschema veiculo loja';
-- ddl-end --

-- object: veiculo.veiculo | type: TABLE --
-- DROP TABLE IF EXISTS veiculo.veiculo CASCADE;
CREATE TABLE veiculo.veiculo(
	id serial NOT NULL,
	modelo integer NOT NULL,
	estoque numeric(100) NOT NULL,
	placa numeric(100,0) NOT NULL,
	preco numeric(100,2) NOT NULL,
	CONSTRAINT "Carro_pk" PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE veiculo.veiculo IS 'Eschema carro loja';
-- ddl-end --
ALTER TABLE veiculo.veiculo OWNER TO postgres;
-- ddl-end --

-- object: veiculo.modelo | type: TABLE --
-- DROP TABLE IF EXISTS veiculo.modelo CASCADE;
CREATE TABLE veiculo.modelo(
	id serial NOT NULL,
	nome varchar(100) NOT NULL,
	CONSTRAINT modelo_pk PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE veiculo.modelo OWNER TO postgres;
-- ddl-end --

-- object: veiculo.marca | type: TABLE --
-- DROP TABLE IF EXISTS veiculo.marca CASCADE;
CREATE TABLE veiculo.marca(
	id serial NOT NULL,
	nome varchar(100) NOT NULL,
	CONSTRAINT marca_pk PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE veiculo.marca OWNER TO postgres;
-- ddl-end --

-- object: veiculo.estoque | type: TABLE --
-- DROP TABLE IF EXISTS veiculo.estoque CASCADE;
CREATE TABLE veiculo.estoque(
	id serial NOT NULL,
	quantidade numeric(100) NOT NULL,
	CONSTRAINT estoque_pk PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE veiculo.estoque OWNER TO postgres;
-- ddl-end --



-- [ Created foreign keys ] --
-- object: fk_veiculo_modelo | type: CONSTRAINT --
-- ALTER TABLE veiculo.veiculo DROP CONSTRAINT IF EXISTS fk_veiculo_modelo CASCADE;
ALTER TABLE veiculo.veiculo ADD CONSTRAINT fk_veiculo_modelo FOREIGN KEY (modelo)
REFERENCES veiculo.modelo (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_modelo_marca | type: CONSTRAINT --
-- ALTER TABLE veiculo.modelo DROP CONSTRAINT IF EXISTS fk_modelo_marca CASCADE;
ALTER TABLE veiculo.modelo ADD CONSTRAINT fk_modelo_marca FOREIGN KEY (id)
REFERENCES veiculo.marca (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_veiculo_estoque | type: CONSTRAINT --
-- ALTER TABLE veiculo.veiculo DROP CONSTRAINT IF EXISTS fk_veiculo_estoque CASCADE;
ALTER TABLE veiculo.veiculo ADD CONSTRAINT fk_veiculo_estoque FOREIGN KEY (id)
REFERENCES veiculo.estoque (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

