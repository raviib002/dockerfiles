#### Pulling the image from docker hub repository and other centos/mariadb55-centos7
FROM baryonsit/mariadb:5.5
#### Updating the packages
#RUN yum -y update
#### installing the basic packages
RUN yum install -y lynx wget rsync vim bash-completion curl unzip net-tools
#### Exporting the ports outside
EXPOSE 3306
### running the service
CMD ["mysqld"]
######################################################################
#### creating the container for mariadb and resetting the root password of mariadb
###docker run --name=mariadb -itd -p 3306:3306 -e MYSQL_ROOT_PASSWORD=mysql <image name/id>
#### command for login to the container mariadb from local machine
###mysql --host=127.0.0.1 --port=3306 -u root -p 
