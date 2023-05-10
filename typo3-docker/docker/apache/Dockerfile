FROM php:7.2-apache

ENV COMPOSER_ALLOW_SUPERUSER=1

# Packages
RUN set -x \
    && apt-get update \
    # Install packages
    && apt-get install \
        supervisor \
        wget \
        curl \
        vim \
        net-tools \
        tzdata -y

RUN set -x \
    # Install services
    && apt-get install \
        # Install common tools
        zip \
        unzip \
        bzip2 \
        moreutils \
        dnsutils \
        openssh-client \
        rsync \
        git \
        patch -y

RUN set -x \
    # Install php environment
    && apt-get install \
        # Install tools
        imagemagick \
        graphicsmagick \
        ghostscript \
        jpegoptim \
        libjpeg-turbo-progs \
        pngcrush \
        optipng \
        apngopt \
        pngnq \
        pngquant \
        # Libraries
        libldap-2.4-2 \
        libxslt1.1 \
        zlibc \
        zlib1g \
        libpq5 \
        libpng16-16 \
        libmcrypt4 \
        libzip4 \
        libjpeg62-turbo-dev \
        libfreetype6-dev \
        # Dev and headers
        libbz2-dev \
        libicu-dev \
        libldap2-dev \
        libldb-dev \
        libmcrypt-dev \
        libxml2-dev \
        libxslt1-dev \
        zlib1g-dev \
        libmemcached-dev \
        libpng-dev \
        libpq-dev \
        libzip-dev \
        libc-client-dev \
        libkrb5-dev -y \
        # Install guetzli
        && wget https://github.com/google/guetzli/archive/master.zip \
        && unzip master.zip \
        && make -C guetzli-master \
        && cp guetzli-master/bin/Release/guetzli /usr/local/bin/ \
        && rm -rf master.zip guetzli-master \
        # Install extensions
        && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
        && docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu/ \
        && docker-php-ext-configure imap --with-kerberos --with-imap-ssl \
        && docker-php-ext-install \
            bcmath \
            bz2 \
            calendar \
            exif \
            intl \
            imap \
            gettext \
            ldap \
            mysqli \
            hash \
            pcntl \
            pdo_mysql \
            pdo_pgsql \
            pgsql \
            soap \
            sockets \
            tokenizer \
            sysvmsg \
            sysvsem \
            sysvshm \
            shmop \
            xmlrpc \
            xsl \
            zip \
            gd \
            gettext \
            opcache \
        # Install extensions for PHP 7.x
        && pecl install apcu \
        # Uninstall dev and header packages
        && apt-get purge -y -f --force-yes \
            libc-client-dev \
            libkrb5-dev \
            libbz2-dev \
            libicu-dev \
            libldap2-dev \
            libldb-dev \
            libmcrypt-dev \
            libxml2-dev \
            libxslt1-dev \
            zlib1g-dev \
            libpng-dev \
            libpq-dev \
            libzip-dev

# PHP configuration
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"
COPY ./docker/apache/src/typo3.ini $PHP_INI_DIR/conf.d/typo3.ini
# @TODO: Get xdebug to work.
# COPY ./docker/apache/src/xdebug.ini $PHP_INI_DIR/conf.d/xdebug.ini

# apache2 configuration
ADD ./docker/apache/src/vhost.conf /etc/apache2/sites-available/000-default.conf

# Composer
RUN set -x \
		&& curl -o /tmp/composer-setup.php https://getcomposer.org/installer \
		&& php /tmp/composer-setup.php --no-ansi --install-dir=/usr/local/bin --filename=composer --version=1.6.2 && rm -rf /tmp/composer-setup.php

# Install TYPO3
WORKDIR /var/www/

ADD ./composer.json ./
COPY ./composer.lock ./

RUN composer install

# TYPO3 setup
ADD ./docker/apache/src/setup-typo3.sh /tmp/setup-typo3.sh
RUN chmod +x /tmp/setup-typo3.sh

EXPOSE 80 443

CMD ["sh", "-c", "/tmp/setup-typo3.sh; /usr/local/bin/apache2-foreground"]