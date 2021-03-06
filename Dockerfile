FROM php:7.2-apache
MAINTAINER Daniel Alves <daniel@alvestechnology.io>

EXPOSE 80

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install php-xml && apt-get install -y --no-install-recommends \
    unzip \
 && rm -rf /var/lib/apt/lists/*

ARG KIMAI_VERSION=1.3.1

RUN curl -L -o kimai.zip https://github.com/kimai/kimai/releases/download/${KIMAI_VERSION}/kimai_${KIMAI_VERSION}.zip \
  && unzip kimai.zip -d /var/www/html \
  && chown -R www-data:www-data /var/www/html \
  && rm *.zip

RUN docker-php-ext-install mysqli
