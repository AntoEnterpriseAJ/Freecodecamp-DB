#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=salon -t -c";
max_menu_option=$($PSQL "SELECT MAX(s.service_id) FROM services s;")
max_menu_option=$(echo "$max_menu_option" | xargs)

menu() {
  $PSQL "SELECT s.service_id, s.name FROM services s;" | while IFS='|' read -r id name;
  do
    id=$(echo "$id" | xargs)
    name=$(echo "$name" | xargs)

    if [[ -z $id ]]; then
      continue
    fi

    echo "$id) $name";
  done
}

main() {
  SERVICE_ID_SELECTED=0
  echo -e "~~~~~ MY SALON ~~~~~\n\nWelcome to My Salon, how can I help you?\n"
  menu
  read SERVICE_ID_SELECTED

  while [[ $SERVICE_ID_SELECTED -le 0 || $SERVICE_ID_SELECTED -gt $max_menu_option ]];
  do
      echo -e "\nI could not find that service. What would you like today?"
      menu

      read SERVICE_ID_SELECTED
  done

    echo -e "\nWhat's your phone number?"
    read CUSTOMER_PHONE

    CUSTOMER_NAME=$($PSQL "SELECT c.name FROM customers c WHERE c.phone='$CUSTOMER_PHONE';")
    if [[ -z $CUSTOMER_NAME ]]; then
      echo -e "\nI don't have a record for that phone number, what's your name?"
      read CUSTOMER_NAME
      $PSQL "INSERT INTO customers (phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME');"
    fi

    echo -e "\nWhat time would you like your cut, $CUSTOMER_NAME?";
    read SERVICE_TIME

    CUSTOMER_ID=$($PSQL "SELECT c.customer_id FROM customers c WHERE c.phone='$CUSTOMER_PHONE';");

    $PSQL "INSERT INTO appointments (time, customer_id, service_id) VALUES('$SERVICE_TIME', $CUSTOMER_ID, $SERVICE_ID_SELECTED);"

    SERVICE_NAME=$($PSQL "SELECT s.name FROM services s WHERE s.service_id=$SERVICE_ID_SELECTED;")
    SERVICE_NAME=$(echo "$SERVICE_NAME" | xargs)

    echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
}

main
