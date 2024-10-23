#Use the debian 11 (bullseye) image
FROM debian:bullseye 

#Port Default of MariaDB
EXPOSE 3306

#Update and instale MariaDB
RUN	apt update && \
	apt install -y --no-install-recommends --no-install-suggests mariadb-server && \
	rm -rf /var/lib/apt/lists/*

#Copy files of configuration
COPY	conf/my.cnf /etc/mysql/my.cnf

#Copy the setup script to the container and change its permissions
COPY tools/setup.sh /bin/
RUN chmod +x /bin/setup.sh

#Run the setup script and start MariaDB server
CMD	["setup.sh", "mysqld_safe"]