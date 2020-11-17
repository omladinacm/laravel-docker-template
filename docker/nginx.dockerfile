FROM nginx:1.19.3
LABEL "com.vendor"="SEA Solutions" version="1.0"

ADD docker/nginx/nginx.conf /etc/nginx/nginx.conf

RUN mkdir -p /var/www/html

# http://www.inanzzz.com/index.php/post/hmjt/using-a-custom-user-for-php-fpm-and-nginx-configurations-in-docker-containers
# Create group "laravel"
# set group id "1000"
RUN groupadd -g 1000 laravel
# Create user "laravel"
# set user id "1000"
# assign to existing group id "1000"
# set home directory "/home/laravel"
# set shell "/bin/bash"
RUN useradd -d /home/laravel -s /bin/bash -u 1000 -g 1000 laravel
# Create home directory
RUN mkdir /home/laravel
# User and group own home directory
RUN chown -R laravel:laravel /home/laravel

# Necessary steps to avoid permission errors
RUN touch /var/run/nginx.pid \
 && chown -R laravel:laravel /var/run/nginx.pid /var/cache/nginx

RUN chown laravel:laravel /var/www/html