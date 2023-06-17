#!/bin/bash

echo "-------------> Insert into table <-------------"

read -p "enter table you want to insert into : " tb_name

if [[ -f $DBs/$db_name/$tb_name ]]; then

    colsNum=$(awk 'BEGIN{FS=":"}{if(NR == 1) print NF}' $DBs/$db_name/$tb_name)

    if [[ -s $DBs/$db_name/$tb_name ]]; then
        ID=$( tail -1 $DBs/$db_name/$tb_name | cut -d':' -f1 )
        auto_incremnt=$(($ID + 1))
    
        echo -n "$auto_incremnt:" >> $DBs/$db_name/$tb_name
    else
        echo -n "1:" >> $DBs/$db_name/$tb_name

    fi

   
    for i in $(seq 2 $colsNum); do

        fname=$(awk 'BEGIN{FS=":"}{if(NR == 1) print $'$i'}' $DBs/$db_name/$tb_name)

        coltype=$(awk 'BEGIN{FS=":"}{if(NR == 2) print $'$i'}' $DBs/$db_name/$tb_name)
        read -p "Enter $fname To Insert Into It : " column_value


        if [[ $i = $colsNum ]]; then
            echo -n "$column_value" >> $DBs/$db_name/$tb_name
        else
            echo "none"
        fi

    done
   
else
    echo "File Doesn't exist"
fi