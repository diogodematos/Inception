#Use the debian 11 (bullseye) image
FROM debian:bullseye 

#Port Default of Wordpress
EXPOSE 9000

#Set a variable to use in the next commands. 
#ARG is only avaliable in the build time.
ARG	PHPPATH=/etc/php/7.4/fpm

#Update and install patchs
RUN apt-get update && \
    apt-get install -y --no-install-recommends --no-install-suggests \
    ca-certificates \
    wget \
    tar \
    php7.4-fpm \
    php7.4-mysql && \
    rm -rf /var/lib/apt/lists/*

#Stop service for change the configuration file
RUN	service php7.4-fpm stop

#Copy the configuration file to the php folder 
#Then change some values in the php config files.
COPY	conf/www.conf ${PHPPATH}/pool.d/
RUN		sed -i 's/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/g' ${PHPPATH}/php.ini && \
		sed -i "s/listen = \/run\/php\/php$PHP_VERSION_ENV-fpm.sock/listen = 9000/g" ${PHPPATH}/pool.d/www.conf && \
		sed -i 's/;listen.mode = 0660/listen.mode = 0660/g' ${PHPPATH}/pool.d/www.conf && \
		sed -i 's/;daemonize = yes/daemonize = no/g' ${PHPPATH}/pool.d/www.conf

#Download and install Wordpress
RUN	wget --no-check-certificate https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp

#
RUN	mkdir -p /run/php/ && \
mkdir -p /var/run/php/ && \
mkdir -p /var/www/inception/

RUN	chown -R www-data:www-data /var/www/inception/

    #Copy the configuration file to the wordpress folder
COPY	conf/wp-config.php /var/www/html/wordpress/

#Copy the setup script to the container and change its permissions
COPY tools/setup.sh /bin/
RUN chmod +x /bin/setup.sh

#Run the setup script and start the php server
CMD	["setup.sh", "php-fpm7.4"]