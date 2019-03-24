FROM php:7.3.3-apache

MAINTAINER Djenko <djenko-it@protonmail.com>

RUN chmod +x /usr/local/bin/*

RUN apt-get update && apt-get install -y --no-install-recommends \
	libxml2-dev \
	libpng-dev \
	libjpeg-dev \
	libldap2-dev \
	libc-client-dev \
	libkrb5-dev \
	libssl-dev ; \
	rm -rf /var/lib/apt/lists/*

#Install exet
RUN docker-php-ext-configure gd --with-jpeg-dir=/usr/include --with-png-dir=/usr/include ; \
	docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu/ ; \
	docker-php-ext-configure imap --with-kerberos --with-imap-ssl ; \
	docker-php-ext-configure opcache ; \
	docker-php-ext-configure xmlrpc ; \
	docker-php-ext-install gd ldap mysqli imap opcache xmlrpc

RUN printf "\n" | pecl install apcu apcu_bc-beta
RUN echo extension=apcu.so > /usr/local/etc/php/php.ini
RUN docker-php-ext-enable apc

# Install CAS
COPY apache2-foreground /usr/local/bin/
COPY cas.tgz /var/www/html/
RUN pear install cas.tgz

EXPOSE 80 443

ENTRYPOINT ["docker-php-entrypoint"]
