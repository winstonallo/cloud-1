FROM debian:latest

RUN apt update && apt upgrade
RUN apt install php-fpm -y
RUN apt install php-mysqli -y
RUN apt install curl -y

WORKDIR /var/www/html

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 
RUN chmod +x ./wp-cli.phar

COPY ./wordpress/init.sh .
RUN chmod +x ./init.sh

CMD [ "./init.sh" ]

ENTRYPOINT [ "php-fpm8.3", "-F" ]
