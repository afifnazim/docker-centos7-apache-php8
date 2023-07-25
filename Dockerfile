FROM centos:centos7.7.1908

# Install Apache/Httpd
RUN yum -y update
RUN yum -y install httpd httpd-tools yum-utils openssh-clients openssh-server

# Install Repo for PHP8
RUN yum install -y https://rpms.remirepo.net/enterprise/remi-release-7.rpm

# Install PHP
RUN yum-config-manager --disable 'remi-php*'
RUN yum-config-manager --enable remi-php80
RUN yum -y install php mod_php php-cli php-common php-gd php-json php-mbstring php-mysqlnd php-pdo php-process php-xml

# Update Apache Configuration
RUN sed -E -i -e '/<Directory "\/var\/www\/html">/,/<\/Directory>/s/AllowOverride None/AllowOverride All/' /etc/httpd/conf/httpd.conf
RUN sed -E -i -e 's/DirectoryIndex (.*)$/DirectoryIndex index.php \1/g' /etc/httpd/conf/httpd.conf

EXPOSE 80
EXPOSE 443

# Start Apache
CMD ["/usr/sbin/httpd","-D","FOREGROUND"]
