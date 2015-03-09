FROM php:5.6-apache

RUN apt-get update && apt-get install php5-mcrypt -y

COPY php.ini /usr/local/etc/php/php.ini
COPY . /var/www/html/

RUN chmod 0777 -R /var/www/html/uploads/ /var/www/html/application/config/database.php /var/www/html/application/helpers/mpdf/tmp/ /var/www/html/application/logs/

RUN a2enmod rewrite
