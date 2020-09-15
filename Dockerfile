FROM alpine:edge
LABEL Maintainer="Stanislav Khromov <stanislav+github@khromov.se>" \
      Description="Tiny PHP 7.4 container using multi-threaded PHP Built-in web server"

RUN apk --no-cache add php7 php7-opcache php7-mysqli php7-pdo php7-json php7-openssl php7-curl php7-zlib php7-xml php7-phar php7-intl php7-dom php7-ctype php7-session php7-simplexml php7-mbstring php7-gd php7-exif php7-zip php7-pecl-redis php7-pdo_mysql php7-pdo_sqlite tzdata htop
ENV PHP_CLI_SERVER_WORKERS=4

# Setup document root
RUN mkdir -p /var/www

# Make sure files/folders needed by the processes are accessable when they run under the nobody user
RUN chown -R nobody.nobody /var/www/

# Switch to use a non-root user from here on
USER nobody

# Add application
WORKDIR /var/www/
COPY --chown=nobody webroot/ /var/www/

# Expose the port nginx is reachable on
EXPOSE 8080

# Let supervisord start nginx & php-fpm
CMD ["php", "-S", "0.0.0.0:4000"]