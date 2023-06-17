#!/bin/bash

echo "-------------> List table <-------------"


read -p "enter database you want to list in table :" db_name

    ls $DBs/$db_name
    echo "this is all table that exist here"
    . ./connectdb.sh