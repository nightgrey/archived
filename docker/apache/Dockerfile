FROM php:7-apache

RUN set -x \
  && apt-get update \
  && apt-get install tar rsync curl sed bash python less mysql-client git optipng -y

RUN set -x \
  	&& apt-get install libjpeg62-turbo-dev libpng-dev libfreetype6-dev libicu-dev -y \
  	&& docker-php-ext-configure gd \
  		--with-gd \
  		--with-freetype-dir=/usr/include/ \
  		--with-png-dir=/usr/include/ \
  		--with-jpeg-dir=/usr/include/ \
  	#&& docker-php-ext-install pcre session xml filter hash mbstring spl standard fileinfo gd zip zlib openssl intl mysqli opcache exif
    && docker-php-ext-install gd

# Apply default development php.ini
RUN mv "$PHP_INI_DIR/php.ini-development" "$PHP_INI_DIR/php.ini"

# Example: Custom PHP configuration
# COPY customconfig.ini $PHP_INI_DIR/conf.d/

EXPOSE 80 443

CMD ["apache2-foreground"]
