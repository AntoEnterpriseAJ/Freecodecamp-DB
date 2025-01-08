#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ -z $1 ]]; then
  echo "Please provide an element as an argument."
  exit
fi

ELEMENT_DATA=$1

if [[ $ELEMENT_DATA =~ ^[1-9][0-9]*$ ]]; then
  QUERY_RESULT=$($PSQL "SELECT e.atomic_number, e.symbol, e.name, t.type, p.atomic_mass, p.melting_point_celsius, p.boiling_point_celsius
                        FROM elements e
                        JOIN properties p ON e.atomic_number = p.atomic_number
                        JOIN types t ON t.type_id=p.type_id
                        WHERE e.atomic_number = $ELEMENT_DATA;")
elif [[ $ELEMENT_DATA =~ ^[a-zA-Z]{1,2}$ ]]; then
  QUERY_RESULT=$($PSQL "SELECT e.atomic_number, e.symbol, e.name, t.type, p.atomic_mass, p.melting_point_celsius, p.boiling_point_celsius
                        FROM elements e
                        JOIN properties p ON e.atomic_number = p.atomic_number
                        JOIN types t ON t.type_id=p.type_id
                        WHERE e.symbol = '$ELEMENT_DATA';")
elif [[ $ELEMENT_DATA =~ ^[a-zA-Z]+$ ]]; then
  QUERY_RESULT=$($PSQL "SELECT e.atomic_number, e.symbol, e.name, t.type, p.atomic_mass, p.melting_point_celsius, p.boiling_point_celsius
                        FROM elements e
                        JOIN properties p ON e.atomic_number = p.atomic_number
                        JOIN types t ON t.type_id=p.type_id
                        WHERE e.name = '$ELEMENT_DATA';")
else
  echo "I could not find that element in the database."
  exit
fi

if [[ -z $QUERY_RESULT ]]; then
  echo "I could not find that element in the database."
  exit
fi

IFS='|' read ELEMENT_ID ELEMENT_SYMBOL ELEMENT_NAME ELEMENT_TYPE ELEMENT_MASS ELEMENT_MELTING_POINT ELEMENT_BOILING_POINT <<< "$QUERY_RESULT"

echo "The element with atomic number $ELEMENT_ID is $ELEMENT_NAME ($ELEMENT_SYMBOL). It's a $ELEMENT_TYPE, with a mass of $ELEMENT_MASS amu. $ELEMENT_NAME has a melting point of $ELEMENT_MELTING_POINT celsius and a boiling point of $ELEMENT_BOILING_POINT celsius."
