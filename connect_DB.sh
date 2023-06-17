#!/bin/bash

echo "-------------> Connect to database <-------------"

read -p "Enter db_name to connect :" db_name
	
    if [[ -d $DBs/$db_name ]]; then
		echo "you are connected $db_name" 
		
        select choice in createtb listtb droptb insertintotb selectfromtb deletefromtb updatetb Exit
		do
		    case $choice in
            "createtb" ) 
                . ./create_table.sh
            ;;    
            "listtb" )
                . ./list_table.sh
            ;;    
            "droptb" )
                . ./drop_table.sh
            ;;
            "insertintotb" )
                . ./insert_into_table.sh

            ;;
            "selectfromtb" )
                . ./select_from_table.sh
            ;;
            "deletefromtb" )
                . ./delete_from_table.sh

            ;;
            "updatetb" )
                . ./update_table.sh 

            ;;
            "Exit" )
                break

            ;;
            * )
        
            esac
        done
    else
		echo "disconnect, database didn't exist before" 
        . ./main.sh
    fi 