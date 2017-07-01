FROM koder/apache-php-5.3

MAINTAINER Pedro Alarcao

# Install apache, PHP, and supplimentary programs. openssh-server, curl, and lynx-cur are for debugging the container.
RUN PACKAGES_TO_INSTALL="sudo git re2c php5-sybase=5.3.29-0ubuntu4 php5-pgsql=5.3.29-0ubuntu4 php5-cli=5.3.29-0ubuntu4 php5-gd=5.3.29-0ubuntu4  php5-mcrypt=5.3.29-0ubuntu4 " \
    && apt-get update \
    && apt-get install -y software-properties-common  \
    && apt-get install -y $PACKAGES_TO_INSTALL \
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
COPY apache-config.conf /etc/apache2/sites-enabled/000-default.conf

ENTRYPOINT service apache2 start && /bin/bash
