FROM php:7.3.5-apache

ADD php.ini /usr/local/etc/php/
RUN a2enmod rewrite

# Workaround for java-8 breaking in Debian during installation. Should remove in the future
RUN mkdir -p /usr/share/man/man1

# Install packages
RUN apt-get update
RUN apt-get install --yes php7.3-gd/stable php7.3-bz2/stable php7.3-xml/stable cron imagemagick less ca-certificates-java
RUN ln -s /etc/php/7.3/mods-available/* /usr/local/etc/php/conf.d/
RUN ln -s /etc/apache2/mods-available/headers.load /etc/apache2/mods-enabled/
COPY policy.xml /etc/ImageMagick-6/policy.xml
COPY limits.conf /etc/security/limits.conf
COPY basrc /root/.bashrc
RUN echo 'session required pam_limits.so' >> /etc/pam.d/login
