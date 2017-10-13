FROM debian:jessie
MAINTAINER  Pedro Alarcao

RUN apt-get update && \
    apt-get install -y \
      locales \
      apache2 \
      php5 \
      php5-cli \
      libapache2-mod-php5 \
      php-apc \
      php5-gd \
      php5-json \
      php5-ldap \
      php5-mysql \
      php5-xdebug \
      php5-pgsql

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
        
EXPOSE 80

# apache mountable directory for apps
VOLUME [ "/var/www" ]

# Update the default apache site with the config we created.
COPY apache-config.conf /etc/apache2/sites-available/000-default.conf

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
