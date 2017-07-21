FROM ubuntu:12.04

MAINTAINER Pedro Alarcao

# Instalação dos pacotes
RUN apt-get update \
&& apt-get install -y software-properties-common  \
&& apt-get install -y sudo \
git \
apache2 \
php5 \
php5-cli \
php5-common \
php5-gd \
php5-curl \
php5-mcrypt \
php5-ldap \
php5-mysql \
php5-pgsql \
php5-imagick \
php5-sybase \
php5-xdebug \
php5-apc \
phpunit \
    && apt-get autoremove -y \
    && apt-get clean \
    && apt-get autoclean

# Enable apache mods.
RUN a2enmod rewrite

# Update the PHP.ini file, enable <? ?> tags and quieten logging.
RUN sed -i "s/short_open_tag = Off/short_open_tag = On/" /etc/php5/apache2/php.ini \
        && sed -i "s/short_open_tag = Off/short_open_tag = On/" /etc/php5/cli/php.ini \
        && sed -i "s/;date.timezone =/date.timezone = America\/Sao_Paulo/" /etc/php5/cli/php.ini \
        && sed -i "s/;date.timezone =/date.timezone = America\/Sao_Paulo/" /etc/php5/apache2/php.ini \
        && sed -i "s/error_reporting = E_ALL & ~E_DEPRECATED & ~E_STRICT/error_reporting = E_ALL/" /etc/php5/cli/php.ini \
        && sed -i "s/error_reporting = E_ALL & ~E_DEPRECATED & ~E_STRICT/error_reporting = E_ALL/" /etc/php5/apache2/php.ini \
        && sed -i "s/display_errors = Off/display_errors = On/" /etc/php5/cli/php.ini \
        && sed -i "s/display_errors = Off/display_errors = On/" /etc/php5/apache2/php.ini \
        && sed -i "s/display_startup_errors = Off/display_startup_errors = On/" /etc/php5/cli/php.ini \
        && sed -i "s/display_startup_errors = Off/display_startup_errors = On/" /etc/php5/apache2/php.ini 

# Expose apache.
EXPOSE 80 443

RUN mkdir /var/www/public

# add a phpinfo script for INFO purposes
RUN echo "<?php phpinfo();" >> /var/www/public/index.php

# apache mountable directory for apps
VOLUME [ "/var/www" ]
WORKDIR /var/www

# Update the default apache site with the config we created.
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
