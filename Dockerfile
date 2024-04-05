FROM wordpress:php8.3-fpm-alpine

# Install required packages
RUN docker-php-ext-install -j "$(nproc)" \
    opcache

COPY --chown=www-data:www-data php.ini /usr/local/etc/php/conf.d/wp_php.ini
COPY --chown=www-data:www-data opcache.ini /usr/local/etc/php/conf.d/wp_opcache.ini

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["php-fpm"]