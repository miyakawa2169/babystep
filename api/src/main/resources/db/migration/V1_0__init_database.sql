-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler  version: 0.9.2-alpha
-- PostgreSQL version: 10.0
-- Project Site: pgmodeler.io
-- Model Author: ---


-- Database creation must be done outside a multicommand file.
-- These commands were put in this file only as a convenience.
-- -- object: new_database | type: DATABASE --
-- -- DROP DATABASE IF EXISTS new_database;
-- CREATE DATABASE new_database;
-- -- ddl-end --
-- 

-- object: public.workers | type: TABLE --
-- DROP TABLE IF EXISTS public.workers CASCADE;
CREATE TABLE public.workers(
	id bigserial NOT NULL,
	last_name character varying NOT NULL,
	first_name character varying NOT NULL,
	last_name_ruby character varying,
	first_name_ruby character varying,
	age smallint NOT NULL,
	sex character varying NOT NULL,
	zip_code character varying(7) NOT NULL,
	address character varying NOT NULL,
	phone_number character varying(11) NOT NULL,
	mail_address character varying NOT NULL,
	active boolean NOT NULL,
	created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT workers_pk PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE public.workers OWNER TO postgres;
-- ddl-end --

-- object: public.clients | type: TABLE --
-- DROP TABLE IF EXISTS public.clients CASCADE;
CREATE TABLE public.clients(
	id bigserial NOT NULL,
	name character varying NOT NULL,
	name_ruby character varying,
	zip_code character varying(7) NOT NULL,
	address character varying NOT NULL,
	phone_number character varying(11) NOT NULL,
	mail_address character varying NOT NULL,
	active boolean NOT NULL,
	created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT clients_pk PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE public.clients OWNER TO postgres;
-- ddl-end --

-- object: public.employees | type: TABLE --
-- DROP TABLE IF EXISTS public.employees CASCADE;
CREATE TABLE public.employees(
	id bigserial NOT NULL,
	client_id bigint NOT NULL,
	last_name character varying NOT NULL,
	first_name character varying NOT NULL,
	last_name_ruby character varying,
	first_name_ruby character varying,
	role character varying NOT NULL,
	representative boolean NOT NULL,
	active boolean NOT NULL,
	created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT employees_pk PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE public.employees OWNER TO postgres;
-- ddl-end --

-- object: public.job_categories | type: TABLE --
-- DROP TABLE IF EXISTS public.job_categories CASCADE;
CREATE TABLE public.job_categories(
	id bigserial NOT NULL,
	title character varying NOT NULL,
	active boolean NOT NULL,
	created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT job_categories_pk PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE public.job_categories OWNER TO postgres;
-- ddl-end --

-- object: public.jobs | type: TABLE --
-- DROP TABLE IF EXISTS public.jobs CASCADE;
CREATE TABLE public.jobs(
	id bigserial NOT NULL,
	job_category_id bigint NOT NULL,
	client_id bigint NOT NULL,
	title character varying NOT NULL,
	description character varying NOT NULL,
	desire_date_time character varying NOT NULL,
	place character varying NOT NULL,
	active boolean NOT NULL,
	created_at timestamp NOT NULL DEFAULT now(),
	updated_at timestamp NOT NULL DEFAULT now(),
	CONSTRAINT jobs_pk PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE public.jobs OWNER TO postgres;
-- ddl-end --

-- object: public.job_details | type: TABLE --
-- DROP TABLE IF EXISTS public.job_details CASCADE;
CREATE TABLE public.job_details(
	job_id bigint NOT NULL,
	description character varying NOT NULL,
	desire_date_time character varying NOT NULL,
	prerequisite character varying NOT NULL,
	welcome_condition character varying,
	gift character varying,
	created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT job_details_pk PRIMARY KEY (job_id)

);
-- ddl-end --
ALTER TABLE public.job_details OWNER TO postgres;
-- ddl-end --

-- object: public.tags | type: TABLE --
-- DROP TABLE IF EXISTS public.tags CASCADE;
CREATE TABLE public.tags(
	id bigserial NOT NULL,
	title character varying NOT NULL,
	active boolean NOT NULL,
	created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT tags_pk PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE public.tags OWNER TO postgres;
-- ddl-end --

-- object: public.tag_job_idxs | type: TABLE --
-- DROP TABLE IF EXISTS public.tag_job_idxs CASCADE;
CREATE TABLE public.tag_job_idxs(
	id bigserial NOT NULL,
	tag_id bigint NOT NULL,
	job_id bigint NOT NULL,
	created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT tag_job_idxs_pk PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE public.tag_job_idxs OWNER TO postgres;
-- ddl-end --

-- object: public.worker_likes | type: TABLE --
-- DROP TABLE IF EXISTS public.worker_likes CASCADE;
CREATE TABLE public.worker_likes(
	id bigserial NOT NULL,
	worker_id bigint NOT NULL,
	job_id bigint NOT NULL,
	created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT worker_likes_pk PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE public.worker_likes OWNER TO postgres;
-- ddl-end --

-- object: public.worker_helps | type: TABLE --
-- DROP TABLE IF EXISTS public.worker_helps CASCADE;
CREATE TABLE public.worker_helps(
	id bigserial NOT NULL,
	worker_id bigint NOT NULL,
	job_id bigint NOT NULL,
	created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT worker_helps_pk PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE public.worker_helps OWNER TO postgres;
-- ddl-end --

-- object: client_id_fk | type: CONSTRAINT --
-- ALTER TABLE public.employees DROP CONSTRAINT IF EXISTS client_id_fk CASCADE;
ALTER TABLE public.employees ADD CONSTRAINT client_id_fk FOREIGN KEY (client_id)
REFERENCES public.clients (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: job_category_id_fk | type: CONSTRAINT --
-- ALTER TABLE public.jobs DROP CONSTRAINT IF EXISTS job_category_id_fk CASCADE;
ALTER TABLE public.jobs ADD CONSTRAINT job_category_id_fk FOREIGN KEY (job_category_id)
REFERENCES public.job_categories (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: client_id_fk | type: CONSTRAINT --
-- ALTER TABLE public.jobs DROP CONSTRAINT IF EXISTS client_id_fk CASCADE;
ALTER TABLE public.jobs ADD CONSTRAINT client_id_fk FOREIGN KEY (client_id)
REFERENCES public.clients (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: job_id_fk | type: CONSTRAINT --
-- ALTER TABLE public.job_details DROP CONSTRAINT IF EXISTS job_id_fk CASCADE;
ALTER TABLE public.job_details ADD CONSTRAINT job_id_fk FOREIGN KEY (job_id)
REFERENCES public.jobs (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: tag_id_fk | type: CONSTRAINT --
-- ALTER TABLE public.tag_job_idxs DROP CONSTRAINT IF EXISTS tag_id_fk CASCADE;
ALTER TABLE public.tag_job_idxs ADD CONSTRAINT tag_id_fk FOREIGN KEY (tag_id)
REFERENCES public.tags (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: job_id_fk | type: CONSTRAINT --
-- ALTER TABLE public.tag_job_idxs DROP CONSTRAINT IF EXISTS job_id_fk CASCADE;
ALTER TABLE public.tag_job_idxs ADD CONSTRAINT job_id_fk FOREIGN KEY (job_id)
REFERENCES public.jobs (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: worker_id_fk | type: CONSTRAINT --
-- ALTER TABLE public.worker_likes DROP CONSTRAINT IF EXISTS worker_id_fk CASCADE;
ALTER TABLE public.worker_likes ADD CONSTRAINT worker_id_fk FOREIGN KEY (worker_id)
REFERENCES public.workers (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: job_id_fk | type: CONSTRAINT --
-- ALTER TABLE public.worker_likes DROP CONSTRAINT IF EXISTS job_id_fk CASCADE;
ALTER TABLE public.worker_likes ADD CONSTRAINT job_id_fk FOREIGN KEY (job_id)
REFERENCES public.jobs (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: worker_id_fk | type: CONSTRAINT --
-- ALTER TABLE public.worker_helps DROP CONSTRAINT IF EXISTS worker_id_fk CASCADE;
ALTER TABLE public.worker_helps ADD CONSTRAINT worker_id_fk FOREIGN KEY (worker_id)
REFERENCES public.workers (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: job_id_fk | type: CONSTRAINT --
-- ALTER TABLE public.worker_helps DROP CONSTRAINT IF EXISTS job_id_fk CASCADE;
ALTER TABLE public.worker_helps ADD CONSTRAINT job_id_fk FOREIGN KEY (job_id)
REFERENCES public.jobs (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


