CREATE ROLE geo_master WITH
	LOGIN
	NOSUPERUSER
	NOCREATEDB
	CREATEROLE
	INHERIT
	NOREPLICATION
	CONNECTION LIMIT -1
	PASSWORD 'xxxxxx';
COMMENT ON ROLE geo_master IS 'The geo database master user.';

CREATE DATABASE geo
    WITH 
    OWNER = geo_master
    ENCODING = 'UTF8'
    CONNECTION LIMIT = -1;

COMMENT ON DATABASE geo
    IS 'Geospatial database for training';
	
