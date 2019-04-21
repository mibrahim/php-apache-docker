FROM php:7.3.3-apache

RUN a2enmod rewrite
RUN apt-get update
RUN apt-get install --yes php7.3-gd/testing
