#!/bin/sh

set -e -u #Exit immediately if a command exits with a non-zero status.

dbname="postgres"
dbhost="localhost"
dbuser="flixieuser"
dbpass="D0ugasaur"

echo "Executing script!"

export PGPASSWORD=$dbpass
# psql -U $dbuser -d $dbname -c "SELECT c_defaults  FROM user_info WHERE c_uid = 'testuser'"

## File based approach
# psql \
#   -h $hostname -d $dbname -U $dbuser \
#   -c "\copy mytable (column1, column2)  from '/path/to/local/file.csv' with delimiter as ','"

psql -h $dbhost -d $dbname -U $dbuser -f ./files/_colour.sql

echo "App Complete!"