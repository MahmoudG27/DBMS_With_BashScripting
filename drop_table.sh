#!/bin/bash 

echo "-------------> Drop table <-------------"

read -p "enter table you want to drop :" tb_name

if [[ -f $DBs/$db_name/$tb_name ]]; then

    rm -r $DBs/$db_name/$tb_name
    echo "table dropped"

else
    echo "table didn't exist before"

fi

# ./ connect_table.sh 