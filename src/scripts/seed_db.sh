#!/bin/sh

###################################################
# First Bash Shell script to execute psql copy commands 
###################################################

set -e -u #Exit immediately if a command exits with a non-zero status.

dbname="postgres"
dbhost="localhost"
dbuser="user1"
dbpass="password"

echo "Seeding database with utils data..."

export PGPASSWORD=$dbpass
# psql -U $dbuser -d $dbname -c "SELECT c_defaults  FROM user_info WHERE c_uid = 'testuser'"

## File based approach
# psql \
#   -h $hostname -d $dbname -U $dbuser \
#   -c "\copy mytable (column1, column2)  from '/path/to/local/file.csv' with delimiter as ','"

echo "Seeding Colours"
psql -h $dbhost -d $dbname -U $dbuser -f ./files/_colour.sql -l output.txt
#Assign table count to variable
ColorTableCount=$(psql -h $dbhost -d $dbname -U $dbuser -f "select count(1) from utils.Color")
#Print the value of variable
echo "Total color record count....:"$ColorTableCount

echo "Seeding Countries"
psql -h $dbhost -d $dbname -U $dbuser -f ./files/_country.sql

echo "Seeding Image Types"
psql -h $dbhost -d $dbname -U $dbuser -f ./files/_imagetype.sql

echo "Seeding Languages"
psql -h $dbhost -d $dbname -U $dbuser -f ./files/_language.sql

echo "!Seeding Complete!"