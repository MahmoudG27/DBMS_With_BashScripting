#!/bin/bash

echo "-------------> Drop database <-------------"

read -p "enter database you want to drop :" db_name

if [[ -d $DBs/$db_name/ ]]; then 
    rm -r $DBs/$db_name 
    echo "database dropped" 
    . ./main.sh
else 
    "database didn't exist before"
    break

fi 
