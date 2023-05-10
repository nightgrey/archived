#!/bin/bash

if [[ ! -f /var/www/public/typo3conf/LocalConfiguration.php ]]; then
    echo 'Running typo3cms install:setup ...'

    php /var/www/vendor/bin/typo3cms install:setup \
    --site-name=$TYPO3_SITE_NAME \
    --database-user-name=$MYSQL_USER \
    --database-user-password=$MYSQL_PASSWORD \
    --database-name=$MYSQL_DATABASE \
    --database-host-name=$MYSQL_HOST \
    --use-existing-database \
    --admin-user-name=$TYPO3_USER \
    --admin-password=$TYPO3_PASSWORD \
    --web-server-config=apache \
    --no-interaction

    echo 'Setting permissions ...'
    chown www-data:www-data -R /var/www/
	  chmod g+rwx -R /var/www/
else
    echo 'TYPO3 already installed.'
fi