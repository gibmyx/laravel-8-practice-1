FROM php:7.3-apache

RUN a2enmod rewrite

RUN apt-get update && apt-get install -y \
        zlib1g-dev \
        libicu-dev \
        libxml2-dev \
        libpq-dev \
        libzip-dev \
        && docker-php-ext-install pdo pdo_mysql zip intl xmlrpc soap opcache \
        && docker-php-ext-configure pdo_mysql --with-pdo-mysql=mysqlnd


RUN apt-get update -y

COPY --from=composer /usr/bin/composer /usr/bin/composer
#RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

COPY  000-default.conf /etc/apache2/sites-available/000-default.conf
COPY  php.ini /usr/local/etc/php/php.ini

ENV COMPOSER_ALLOW_SUPERUSER 1



# Create 'me' user like local machime user.
#RUN useradd me && usermod -G www-data -a me

# Add www-data to adm group
#RUN usermod -a -G adm www-data

#COPY  . /var/www/html/
#COPY  ./.env.example /var/www/html/.env
#WORKDIR /var/www/html/
#
#RUN chown -R www-data:www-data /var/www/html  \
#    && composer install  && composer dumpautoload
