#!/bin/bash 

DBs=$PWD/DB_Stored
export DBs

echo "-------------> Welcome to My DBMS <-------------"

select dbs in Create_DB List_DB Connect_DB Drop_DB Exit
do 
	case $dbs in 
	"Create_DB" )
		. ./create_DB.sh		

	;;
	"List_DB" )
		. ./list_DB.sh	

	;;
	"Connect_DB" )
		. ./connect_DB.sh
	
	;;
	"Drop_DB" ) 
		. ./drop_DB.sh

	;;
	"Exit" )
		break

	;;
	* )
	echo "Invalid choice"
	esac 
done	