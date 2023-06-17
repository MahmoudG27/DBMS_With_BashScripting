#!/bin/bash
echo "-------------> Delete from table <-------------"

read -p "enter table you want to delete from :" tb_name

if [[ -f $DBs/$db_name/$tb_name ]]; then
    echo "table Existed"

    select choice in deleteall deletePK Exit
    do
        case $choice in
        "deleteall" )
            echo "" > $DBs/$db_name/$tb_name
            echo "files' content deleted"
            
        ;;
        "deletePK" )
            read -p "Enter the primary key: " pk
            Record_no=$(awk -F ":" '{if($1=="'$pk'") print "Pk existed" }' $DBs/$db_name/$tb_name)

            
            if [[ "$Record_no" = "Pk existed" ]]; then
                Record_no=$(awk -F ":" '{if($1=="'$pk'") print NR}' $DBs/$db_name/$tb_name)
                sed -i ''$Record_no'd' $DBs/$db_name/$tb_name
                echo "item deleted"

            else
                echo "Pk didn't exist before"
            fi
        ;;
        "Exit" )
            . ./connectdb.sh
        
        ;;
        * ) 
            echo "not in the choice" ;;

        esac
    done

  
else
    echo "table didn't exist before"
fi
