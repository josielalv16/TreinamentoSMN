-- Database diff generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler  version: 0.9.0
-- PostgreSQL version: 9.5

-- [ Diff summary ]
-- Dropped objects: 0
-- Created objects: 8
-- Changed objects: 0
-- Truncated tables: 0

SET search_path=public,pg_catalog,administrativo,cozinha;
-- ddl-end --


-- [ Created objects ] --
-- object: administrativo | type: SCHEMA --
-- DROP SCHEMA IF EXISTS administrativo CASCADE;
CREATE SCHEMA administrativo;
-- ddl-end --
COMMENT ON SCHEMA administrativo IS 'Eschema adminisatitrativo pizzaria';
-- ddl-end --

-- object: administrativo.pizzaria | type: TABLE --
-- DROP TABLE IF EXISTS administrativo.pizzaria CASCADE;
CREATE TABLE administrativo.pizzaria(
	id serial NOT NULL,
	endereco varchar(100) NOT NULL,
	razao_social varchar(100) NOT NULL,
	nome_fantasia varchar(100) NOT NULL,
	telefone varchar(14) NOT NULL,
	CONSTRAINT pizzaria_pk PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE administrativo.pizzaria IS 'Eschema adminisatitrativo pizzaria';
-- ddl-end --
COMMENT ON COLUMN administrativo.pizzaria.endereco IS 'Eschema adminisatitrativo pizzaria';
-- ddl-end --
COMMENT ON COLUMN administrativo.pizzaria.razao_social IS 'razao social da pizzaria';
-- ddl-end --
COMMENT ON COLUMN administrativo.pizzaria.nome_fantasia IS 'nome fantasia da pizzaria';
-- ddl-end --
COMMENT ON COLUMN administrativo.pizzaria.telefone IS 'telefone da pizzaria';
-- ddl-end --
ALTER TABLE administrativo.pizzaria OWNER TO postgres;
-- ddl-end --

-- object: cozinha | type: SCHEMA --
-- DROP SCHEMA IF EXISTS cozinha CASCADE;
CREATE SCHEMA cozinha;
-- ddl-end --
ALTER SCHEMA cozinha OWNER TO postgres;
-- ddl-end --
COMMENT ON SCHEMA cozinha IS 'esquema da cozinha';
-- ddl-end --

-- object: cozinha.ingrediente | type: TABLE --
-- DROP TABLE IF EXISTS cozinha.ingrediente CASCADE;
CREATE TABLE cozinha.ingrediente(
	id serial NOT NULL,
	nome varchar(100) NOT NULL,
	CONSTRAINT ingrediente_pk PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE cozinha.ingrediente IS 'Tabela de ingredientes da pizza';
-- ddl-end --
COMMENT ON COLUMN cozinha.ingrediente.id IS 'chave da tabela';
-- ddl-end --
COMMENT ON COLUMN cozinha.ingrediente.nome IS 'nome do ingrediente';
-- ddl-end --
ALTER TABLE cozinha.ingrediente OWNER TO postgres;
-- ddl-end --

-- object: cozinha.pizza | type: TABLE --
-- DROP TABLE IF EXISTS cozinha.pizza CASCADE;
CREATE TABLE cozinha.pizza(
	id serial NOT NULL,
	nome varchar(100) NOT NULL,
	preco numeric(10,2) NOT NULL,
	CONSTRAINT pizza_pk PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE cozinha.pizza IS 'Tabela de pizzas do sistema';
-- ddl-end --
COMMENT ON COLUMN cozinha.pizza.id IS 'Chave da tabela';
-- ddl-end --
COMMENT ON COLUMN cozinha.pizza.nome IS 'Nome da pizza cadastrada';
-- ddl-end --
COMMENT ON COLUMN cozinha.pizza.preco IS 'Preço da pizza';
-- ddl-end --
ALTER TABLE cozinha.pizza OWNER TO postgres;
-- ddl-end --

-- object: cozinha.pizzaingredientes | type: TABLE --
-- DROP TABLE IF EXISTS cozinha.pizzaingredientes CASCADE;
CREATE TABLE cozinha.pizzaingredientes(
	idpizza integer NOT NULL,
	idingrediente integer NOT NULL,
	CONSTRAINT pk_pizzaingrediente_pizza_igrediente PRIMARY KEY (idpizza,idingrediente)

);
-- ddl-end --
COMMENT ON TABLE cozinha.pizzaingredientes IS 'Tabela de ingredientes da pizza';
-- ddl-end --
COMMENT ON COLUMN cozinha.pizzaingredientes.idpizza IS 'Chave por pizza';
-- ddl-end --
COMMENT ON COLUMN cozinha.pizzaingredientes.idingrediente IS 'Chave por ingrediente';
-- ddl-end --
COMMENT ON CONSTRAINT pk_pizzaingrediente_pizza_igrediente ON cozinha.pizzaingredientes  IS 'Chave composta da tabela';
-- ddl-end --
ALTER TABLE cozinha.pizzaingredientes OWNER TO postgres;
-- ddl-end --



-- [ Created foreign keys ] --
-- object: fk_pizzaingrediente_pizza | type: CONSTRAINT --
-- ALTER TABLE cozinha.pizzaingredientes DROP CONSTRAINT IF EXISTS fk_pizzaingrediente_pizza CASCADE;
ALTER TABLE cozinha.pizzaingredientes ADD CONSTRAINT fk_pizzaingrediente_pizza FOREIGN KEY (idpizza)
REFERENCES cozinha.pizza (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_pizzariaingrediente_ingrediente | type: CONSTRAINT --
-- ALTER TABLE cozinha.pizzaingredientes DROP CONSTRAINT IF EXISTS fk_pizzariaingrediente_ingrediente CASCADE;
ALTER TABLE cozinha.pizzaingredientes ADD CONSTRAINT fk_pizzariaingrediente_ingrediente FOREIGN KEY (idingrediente)
REFERENCES cozinha.ingrediente (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

