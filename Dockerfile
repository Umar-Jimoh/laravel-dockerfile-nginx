FROM php:8.4-fpm

RUN apt-get update && apt-get install -y \
    build-essential \
    libicu-dev \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    locales \
    zip \
    nginx \
    supervisor \
    jpegoptim optipng pngquant gifsicle \
    vim unzip git curl libonig-dev libxml2-dev libzip-dev pkg-config \
    vim unzip git curl libonig-dev libxml2-dev libzip-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install \
        mbstring \
        exif \
        pcntl \
        bcmath \
        gd \
        zip \
        intl \
        xml

# PostgreSQL support (uncomment if needed)
# RUN apt-get install -y libpq-dev \
#     && docker-php-ext-install pdo_pgsql pgsql

# # MySQL support (uncomment if needed)
# RUN docker-php-ext-install pdo_mysql


# Install Composer from composer container (best method)
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Allow Composer to run as root
ENV COMPOSER_ALLOW_SUPERUSER=1

WORKDIR /var/www/html

# Copy composer files early for caching remove laravel path later
COPY composer.json composer.lock ./

# Copy application files
COPY . .

# SQLite support (uncomment if needed)
RUN mkdir -p /var/www/html/database \
    && touch /var/www/html/database/database.sqlite \
    && chmod -R 777 /var/www/html/database

# Remove possible existing nginx config
RUN rm -f /etc/nginx/sites-enabled/default /etc/nginx/conf.d/default.conf

# Copy configs (nginx, supervisor, php.ini, startup script)
COPY docker/nginx/default.conf /etc/nginx/conf.d/default.conf
COPY docker/supervisor/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY docker/php/php.ini /usr/local/etc/php/conf.d/php.ini
COPY docker/script/startup.sh /usr/local/bin/startup.sh

# Run composer install for production
RUN composer install --no-dev --optimize-autoloader --ignore-platform-req=php

# Give execute permission
RUN chmod +x /usr/local/bin/startup.sh

# Set app permissions
RUN mkdir -p storage/framework/{sessions,views,cache} \
    && chmod -R 775 storage bootstrap/cache \
    && chown -R www-data:www-data storage bootstrap/cache

# Expose standard web port 80
EXPOSE 80

CMD ["/usr/local/bin/startup.sh"]
