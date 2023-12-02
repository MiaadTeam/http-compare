#! /bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username $POSTGRES_USER --dbname $POSTGRES_PASSWORD <<-EOSQL
	CREATE USER $PG_USERNAME WITH PASSWORD '$PG_PASSWORD';
	CREATE DATABASE $PRISMA_POSTGRES_DBNAME;
    
	GRANT ALL PRIVILEGES ON DATABASE $PRISMA_POSTGRES_DBNAME TO $PG_USERNAME;
EOSQL
