#!/bin/bash
DATE=$(date +%d-%m-%Y)
#HOST="--host=127.0.0.1"
#PORT="--port=3306"
#USER="root"
#PASS="mysql"
#mysqldump $HOST $PORT -u$USER -p$PASS test11 > /home/test11_$DATE.sql
HPUP="--host=127.0.0.1 --port=3306 -uroot -pmysql"
#HPUP="-uroot -pmysql"
mysqladmin $HPUP --force create wordprestest
#mysqladmin $HPUP create wordprestest
#mysqladmin $HPUP --force drop wordprestest
mysql $HPUP -e "create user 'wordprestest'@'localhost' IDENTIFIED BY 'wordprestest';"
#mysql $HPUP -e "drop user 'wordprestest'@'%';"
mysql $HPUP -e "grant all privileges on wordprestest .* to 'wordprestest'@'localhost';"
#mysqldump $HPUP wordprestest > /home/wordprestest/backups/wordprestest_$DATE.sql
mysql $HPUP -e "source /home/wordprestest/backups/wordprestest_07_may_2020.sql" wordprestest


