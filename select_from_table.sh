#!/bin/bash

echo "-------------> Select from table <-------------"

read -p "enter table to select from : " table_name
select choice in selectall selectPK Exit
do
    case $choice in
    "selectall" )
        output= $(cat $DBs/$db_name/$tb_name)
        for line in $output; do
            echo $line
        done
            echo "All records are selected in $tb_name "

    ;;    
    "selectPK" )
        read -p "Enter the primary key: " pk
        ID=$(awk -F ":" '{if($1=="'$pk'") print "Pk existed" }' $DBs/$db_name/$tb_name)
            echo $ID
            echo " Record Is Selected Successfully from $tb_name"
        
    ;;
    "Exit" )
        . ./connectdb.sh
    ;;
    *) 
        echo "there is no select in the choice" 
        break
    ;;
    esac
done
