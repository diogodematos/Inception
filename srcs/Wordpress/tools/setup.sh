#!/bin/bash

sleep 2s

cd /var/www/wordpress

if [ ! -f wp-config.php ]; then
    echo "'wp-config.php' not found. Generating wp-config.php..."

#Create the temp var to be used now, but at the end, we'll have a .env file with all the variables. So you need to remove these declaration lines.
# WP_URL=login.42.fr
# WP_TITLE=Inception
# WP_ADMIN_USER=theroot
# WP_ADMIN_PASSWORD=123
# WP_ADMIN_EMAIL=theroot@123.com
# WP_USER=theuser
# WP_PASSWORD=abc
# WP_EMAIL=theuser@123.com
# WP_ROLE=editor

else
    echo "'wp-config.php' already exists, skipping config creation."
fi

if ! wp core is-installed --allow-root; then
    echo "WordPress not detected, installing WordPress..."

    wp core install --allow-root \
        --url=https://$WP_DOMAIN \
        --title="$WP_TITLE" \
        --admin_user=$WP_ADMIN_USER \
        --admin_password=$WP_ADMIN_PASSWORD \
        --admin_email=$WP_ADMIN_EMAIL

    echo "WordPress installation complete."
else
    echo "WordPress is already installed, skipping installation."
fi

if ! wp user get $WP_GUEST_USER --allow-root > /dev/null 2>&1; then
    wp user create --allow-root \
        $WP_GUEST_USER \
        $WP_GUEST_EMAIL \
        --role=author \
        --user_pass=$WP_GUEST_PASSWORD
    echo "Guest user created."
else
    echo "Guest user '$WP_GUEST_USER' already exists, skipping user creation."
fi

echo "Starting PHP-FPM in foreground..."

service php7.4-fpm start 
service php7.4-fpm stop
/usr/sbin/php-fpm7.4 -F 

