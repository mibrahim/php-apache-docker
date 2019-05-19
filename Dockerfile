FROM php:7.3.5-apache

ADD php.ini /usr/local/etc/php/
RUN a2enmod rewrite
RUN apt-get update
RUN apt-get install --yes php7.3-gd/testing cron imagemagick less openjdk-11-jre/testing
RUN ln -s /etc/php/7.3/mods-available/* /usr/local/etc/php/conf.d/
