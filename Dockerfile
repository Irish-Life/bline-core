# Use the drupal image to build
FROM drupal:8.7.7-fpm
# FROM composer


# Set working directory
WORKDIR /var/www/html

# Copy the current directory into the container

COPY . /var/www/html



# Update and install php packages
#RUN apt-get update
#apt-get install libpng-dev && \
#apt-get install gd

# FROM php:7.2-fpm
# RUN apt-get update && apt-get install -y \
#         libfreetype6-dev \
#         libjpeg62-turbo-dev \
#         libpng-dev \
#     && docker-php-ext-install -j$(nproc) iconv \
#     && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
#     && docker-php-ext-install -j$(nproc) gd


# WORKDIR /var/www/html
# FROM composer
# WORKDIR /var/www/html
COPY --from=composer /usr/bin/composer /usr/bin/composer
# COPY --from=0 /var/www/html .
RUN cd /var/www/html && \
ls -al && \
lsb_release -a && \
composer install && \
cd web/themes/custom/bline && \
vendor/bin/drush -v && \
npm install

# Expose port 80
EXPOSE 80


