###Pulling the Image from docker hub repository
FROM centos:7
#FROM    baryonsit/basecentos:7
###updating the packages ## default config ...###
RUN yum -y update 
###installing the apache packages
RUN yum install -y httpd httpd-tools 
###installing some basic packages
RUN yum install -y lynx wget rsync vim bash-completion curl unzip net-tools git
###sample for the testing
RUN touch /var/www/html/index.html
RUN echo "this is the testing for the basic apache for docker././././././/././././...:wq" >> /var/www/html/index.html
###Mariadb cline install
RUN touch /etc/yum.repos.d/mariadb.repo
RUN echo "[mariadb]" >> /etc/yum.repos.d/mariadb.repo
RUN echo "name = MariaDB" >> /etc/yum.repos.d/mariadb.repo
RUN echo "baseurl = http://yum.mariadb.org/5.5/rhel7-amd64/" >> /etc/yum.repos.d/mariadb.repo
RUN echo "gpgkey=https://yum.mariadb.org/RPM-GPG-KEY-MariaDB" >> /etc/yum.repos.d/mariadb.repo
RUN echo "gpgcheck=1" >> /etc/yum.repos.d/mariadb.repo
RUN yum install -y MariaDB-client
####Php environment create
RUN wget -q http://rpms.remirepo.net/enterprise/remi-release-7.rpm
RUN wget -q https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN rpm -i remi-release-7.rpm epel-release-latest-7.noarch.rpm
RUN yum-config-manager --enable remi-php70
RUN yum install -y php.x86_64 php-bcmath.x86_64 php-cli.x86_64 php-common.x86_64 php-fedora-autoloader.noarch php-gd.x86_64 php-gmp.x86_64 php-intl.x86_64 php-json.x86_64 php-mbstring.x86_64 php-mcrypt.x86_64 php-mysqlnd.x86_64 php-opcache.x86_64 php-pdo.x86_64 php-pecl-igbinary.x86_64 php-pecl-memcached.x86_64 php-pecl-msgpack.x86_64 php-pecl-xdebug.x86_64 php-pecl-zip.x86_64 php-php-gettext.noarch php-process.x86_64 php-soap.x86_64 php-tcpdf.noarch php-tcpdf-dejavu-sans-fonts.noarch php-tidy.x86_64 php-xml.x86_64 php-xmlrpc.x86_64 phpMyAdmin.noarch
RUN sed -i 's/Require ip 127.0.0.1/Require all granted/g' /etc/httpd/conf.d/phpMyAdmin.conf
RUN sed -i 's/Require ip ::1/#Require ip ::1/g' /etc/httpd/conf.d/phpMyAdmin.conf
##### custom apache port ##########################
RUN sed -i 's/Listen 80/Listen 8091/g' /etc/httpd/conf/httpd.conf
###customizing the httpd configuration file for multiple projects
RUN sed -i 's/DirectoryIndex index.html/DirectoryIndex index.html index.php/g' /etc/httpd/conf/httpd.conf
###adding the one line space to the httpd configuration file
RUN echo " " >> /etc/httpd/conf/httpd.conf
######## Cross origin Enabled ######
RUN echo "## Cross Origin Enabled" >> /etc/httpd/conf/httpd.conf
RUN echo 'Header set Access-Control-Allow-Origin "*"' >> /etc/httpd/conf/httpd.conf
RUN echo 'Header set Access-Control-Allow-Headers "Origin, X-Requested-With, Content-Type, Accept"' >> /etc/httpd/conf/httpd.conf
RUN echo " " >> /etc/httpd/conf/httpd.conf
RUN echo "KeepAlive on" >> /etc/httpd/conf/httpd.conf
RUN echo "KeepAliveTimeout 7" >> /etc/httpd/conf/httpd.conf
RUN echo " " >> /etc/httpd/conf/httpd.conf
RUN echo "##################################" >> /etc/httpd/conf/httpd.conf
####this is the virtual host configuration for the projects
RUN echo "<VirtualHost *:8091>" >> /etc/httpd/conf/httpd.conf
RUN echo "DocumentRoot /var/www/html" >> /etc/httpd/conf/httpd.conf
RUN echo "ServerName 172.105.51.125" >> /etc/httpd/conf/httpd.conf
RUN echo "</VirtualHost>" >> /etc/httpd/conf/httpd.conf
####################################################################################
###Exporting the port to the externel
EXPOSE  8091
EXPOSE  3306
###restarting the apache
CMD ["/usr/sbin/httpd","-D","FOREGROUND"]
#########################################################################################################
##After this we need to do the port mapping command is as below
##docker run -itd -p <local machine port number>:<container machine port number> <image name/id>
##Ex: docker run -itd -p <ipadress>:9090:8091 <image name/id>
##docker run --name=apache_centos --link mariadb -itd -v /home/wordprestest:/home/wordprestest -p 8091:8091 centos:7
