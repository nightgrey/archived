FROM composer AS composer
FROM php:7-apache

# Packages
RUN set -x \
  && apt-get update \
  && apt-get install tar rsync curl sed bash python less mysql-client git optipng nano -y

# PHP extensions
RUN set -x \
  	&& apt-get install libxml2-dev libfreetype6-dev libjpeg62-turbo-dev libmcrypt-dev libpng-dev imagemagick zlib1g-dev ssl-cert \
		&& apt-get clean \
  	&& docker-php-ext-configure gd \
  		--with-gd \
  		--with-freetype-dir=/usr/include/ \
  		--with-png-dir=/usr/include/ \
  		--with-jpeg-dir=/usr/include/ \
  	#&& docker-php-ext-install pcre session xml filter hash mbstring spl standard fileinfo gd zip zlib openssl intl mysqli opcache exif
    && docker-php-ext-install -j$(nproc) mysqli soap gd zip

# XDebug
RUN pecl install xdebug \
    && echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > /usr/local/etc/php/conf.d/xdebug-extension.ini

# PHP configuration
RUN mv "$PHP_INI_DIR/php.ini-development" "$PHP_INI_DIR/php.ini"

# Example: Custom PHP configuration
# COPY customconfig.ini $PHP_INI_DIR/conf.d/

# apache2 configuration
ADD ./docker/apache/src/vhost.conf /etc/apache2/sites-available/000-default.conf

# Composer
RUN set -x \
		&& curl -o /tmp/composer-setup.php https://getcomposer.org/installer \
		&& php /tmp/composer-setup.php --no-ansi --install-dir=/usr/local/bin --filename=composer --version=1.6.2 && rm -rf /tmp/composer-setup.php

# Install dependencies
WORKDIR /var/www/

ADD ./composer.json ./
COPY ./composer.lock ./

RUN composer install

RUN set -x \
	&& php /var/www/vendor/bin/typo3cms install:setup \
	--site-name=$TYPO3_SITE_NAME \
	--database-user-name=$MYSQL_USER \
	--database-user-password=$MYSQL_PASSWORD \
	--database-name=$MYSQL_DATABASE \
	--database-host-name=database \
	--use-existing-database \
	--admin-user-name=$TYPO3_USER \
	--admin-password=12345678 \
	--web-server-config=apache \
	--no-interaction

EXPOSE 80 443