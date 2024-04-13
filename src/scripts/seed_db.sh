#!/bin/sh

set -e -u #Exit immediately if a command exits with a non-zero status.

dbname="postgres"
dbhost="localhost"
dbuser="flixieuser"
dbpass="D0ugasaur"

echo "Seeding database with data..."

export PGPASSWORD=$dbpass
# psql -U $dbuser -d $dbname -c "SELECT c_defaults  FROM user_info WHERE c_uid = 'testuser'"

## File based approach
# psql \
#   -h $hostname -d $dbname -U $dbuser \
#   -c "\copy mytable (column1, column2)  from '/path/to/local/file.csv' with delimiter as ','"

echo "Seeding Colours"
psql -h $dbhost -d $dbname -U $dbuser -f ./files/_colour.sql

echo "Seeding Countries"
psql -h $dbhost -d $dbname -U $dbuser -f ./files/_country.sql


echo "Seeding Image Types"
psql -h $dbhost -d $dbname -U $dbuser -f ./files/_imagetype.sql


echo "Seeding Languages"
psql -h $dbhost -d $dbname -U $dbuser -f ./files/_language.sql

echo "Seeding Complete!"