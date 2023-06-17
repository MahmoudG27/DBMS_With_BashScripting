#!/bin/bash 

DBs=$PWD/DB_Stored
export DBs

echo "-------------> Welcome to My DBMS <-------------"

select dbs in createdb listdb connectdb dropdb Exit
do 
	case $dbs in 
	"createdb" )
		. ./createdb.sh		

	;;
	"listdb" )
		. ./listdb.sh	

	;;
	"connectdb" )
		. ./connectdb.sh
	
	;;
	"dropdb" ) 
		. ./dropdb.sh

	;;
	"Exit" )
		break

	;;
	* )
	echo "Invalid choice"
	esac 
done	