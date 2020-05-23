#!/bin/bash
DATE=$(date +%d-%m-%Y)
#HOST="--host=127.0.0.1"
#PORT="--port=3306"
#USER="root"
#PASS="mysql"
#mysqldump $HOST $PORT -u$USER -p$PASS test11 > /home/test11_$DATE.sql
HPUP="--host=172.20.128.2 --port=3306 -uroot -pmysql"
#HPUP="-uroot -pmysql"
mysqladmin $HPUP --force create wordprestest
#mysqladmin $HPUP create wordprestest
#mysqladmin $HPUP --force drop wordprestest
mysql $HPUP -e "create user 'wordprestest'@'%' IDENTIFIED BY 'wordprestest';"
#mysql $HPUP -e "drop user 'wordprestest'@'%';"
mysql $HPUP -e "grant all privileges on wordprestest .* to 'wordprestest'@'%';"
#mysqldump $HPUP wordprestest > /home/wordprestest/backups/wordprestest_$DATE.sql
mysql $HPUP -e "source /home/wordprestest/backups/wordtest_may_18_2020.sql" wordprestest


