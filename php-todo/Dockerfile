FROM php:7-apache

ENV MYSQL_HOST=mysqlhostserver
ENV MYSQL_USER=pauly
ENV MYSQL_PASSWORD=pauly1234
ENV MYSQL_DBNAME=homestead


RUN docker-php-ext-install mysqli
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
COPY apache-config.conf /etc/apache2/sites-available/000-default.conf
COPY start-apache /usr/local/bin
RUN a2enmod rewrite

COPY . /var/www/html/
RUN chown -R www-data:www-data /var/www/html
# RUN rm -rf /var/www/html/index.html
# RUN chmod 777 /var/www/html/.

CMD ["start-apache"]