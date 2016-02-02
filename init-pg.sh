#! /bin/bash

psql --username "$POSTGRES_USER" linshare < /createSchema.sql
psql --username "$POSTGRES_USER" linshare < /import-postgresql.sql
