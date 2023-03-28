FROM php:8.1-apache

LABEL maintainer="Patric Nox <hello@patricnox.info>"

# Extract the PHP source
RUN docker-php-source extract

# Install libs
RUN apt-get update \
    && apt-get install -y \
        git \
        libfontconfig \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng-dev \
        libpq-dev \
        libxrender1 \
        default-mysql-client \
        unzip \
        wget \
        zip \
        libxml2-dev \
        libzip-dev \
    && rm -rf /var/lib/apt/lists/*

# Install PHP extensions
RUN docker-php-ext-install \
        bcmath \
        opcache \
        pdo \
        pdo_mysql \
        zip \
        soap

# Install GD.
RUN docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd

# Copy the development PHP config from the PHP source
RUN cp /usr/src/php/php.ini-development /usr/local/etc/php/php.ini

# Delete the PHP source
RUN docker-php-source delete

# Copy the PHP configuration
COPY app/php/app.ini /usr/local/etc/php/conf.d/

# Copy the Apache configuration
COPY app/apache/app.conf /etc/apache2/sites-available/000-default.conf

# Add init file to MySQL
ADD app/mysql/init.sql /docker-entrypoint-initdb.d

# Enable Apache mods
RUN a2enmod rewrite

# Fix permissions
RUN chown -R www-data:www-data /var/www

# Set working directory
WORKDIR /var/www/html

# Install composer. This requires Docker 17.05
COPY --from=composer:2.2.0 /usr/bin/composer /usr/bin/composer

# Install Mailhog sendmail (mhsendmail)
USER root
RUN curl -Lsf 'https://storage.googleapis.com/golang/go1.8.3.linux-amd64.tar.gz' | tar -C '/usr/local' -xvzf -
ENV PATH /usr/local/go/bin:$PATH
RUN go get github.com/mailhog/mhsendmail
RUN cp /root/go/bin/mhsendmail /usr/bin/mhsendmail
