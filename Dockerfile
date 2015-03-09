FROM eboraas/apache-php

RUN apt-get update && apt-get install php5-mcrypt -y
RUN a2enmod rewrite

RUN rm /var/www/* -rf
RUN sed -i "s/AllowOverride None/AllowOverride All/g" /etc/apache2/sites-enabled/000-default
ADD . /var/www/
COPY php.ini /usr/local/etc/php/php.ini

RUN chmod 0777 -R /var/www/uploads/ /var/www/application/config/database.php /var/www/application/helpers/mpdf/tmp/ /var/www/application/logs/
