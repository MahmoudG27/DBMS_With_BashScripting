#!/bin/bash

echo "-------------> Create database <-------------"

read -p "enter name of database :" db_name
if  [[ $db_name =~ ^[a-zA-Z]*$ ]]; then		
        
		if [[ -d $DBs/$db_name/ ]]; then
			echo "db existed before"
		
        else 
			mkdir $DBs/$db_name 
			echo "db created"
			. ./main.sh
		fi
else
    echo "db didn't create because there is special characters"
	. ./createdb.sh
fi
