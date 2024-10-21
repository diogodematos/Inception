#Change the owner of the wordpress files to www-data user.
chown -R www-data:www-data /var/www/html/wordpress

#Move the wp-config.php file to the root of the wordpress files.
mv /var/www/html/wordpress/wp-config.php /var/www/html/wp-config.php

#Create the temp var to be used now, but at the end, we'll have a .env file with all the variables. So you need to remove these declaration lines.
WP_URL=login.42.fr
WP_TITLE=Inception
WP_ADMIN_USER=theroot
WP_ADMIN_PASSWORD=123
WP_ADMIN_EMAIL=theroot@123.com
WP_USER=theuser
WP_PASSWORD=abc
WP_EMAIL=theuser@123.com
WP_ROLE=editor

#Download the wordpress files
sleep 10
wp --allow-root --path="/var/www/inception/" core download || true

#If the wordpress files aren't there, create install wordpress and set it, if not move foward
if ! wp --allow-root --path="/var/www/inception/" core is-installed;
then
    wp  --allow-root --path="/var/www/inception/" core install \
        --url=$WP_URL \
        --title=$WP_TITLE \
        --admin_user=$WP_ADMIN_USER \
        --admin_password=$WP_ADMIN_PASSWORD \
        --admin_email=$WP_ADMIN_EMAIL
fi;

#Create the non-admin user and set its role.
if ! wp --allow-root --path="/var/www/inception/" user get $WP_USER;
then
    wp  --allow-root --path="/var/www/inception/" user create \
        $WP_USER \
        $WP_EMAIL \
        --user_pass=$WP_PASSWORD \
        --role=$WP_ROLE
fi;

#Download another theme and activate it. It's not necessary, but I did because I don't like the default theme.
wp --allow-root --path="/var/www/inception/" theme install raft --activate 

#start the php server in foreground
exec $@

