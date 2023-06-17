#!/bin/bash
echo "-------------> Create table <-------------"

read -p "enter table name you want to create :" tb_name
if  [[ $tb_name =~ ^[a-zA-Z]*$ ]]; then	
    if [[ -f $DBs/$db_name/$tb_name ]]; then
        echo "table existed before"

    else
        touch $DBs/$db_name/$tb_name
        echo "table created"

   
        read -p "How many column do you want to add in table? " col_num 
        echo $col_num 
        for (( c = 1; c <= $col_num ; c++ ))
        do
            read -p "enter name of field num $c :" fname 
            echo $fname
            if [[ $c = $col_num ]]; then
                echo -n "PK:" >> $DBs/$db_name/$tb_name
            else
                break
            fi
        done


        for (( i = 1; i <= $col_num ; i++ ))
        do

            if [ $i = $col_num ]; then
            echo "enter data type for column number :"
            select datatype in int varchar Exit
            do
                case $datatype in
                "int" )
                    echo -n $fname:$datatype >> $DBs/$db_name/$tb_name
                    echo "data type entered"
                    . ./connectdb.sh
                ;;
                "varchar" )   
                    echo -n $fname:$datatype >> $DBs/$db_name/$tb_name
                    echo "data type entered"
                    . ./connectdb.sh
                ;;
                "Exit" )  
                    break
                ;; 
                * )
                esac
            done
       
            fi
        done

    fi
else 
    echo "db didn't create because there is special characters"
fi