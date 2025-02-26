FROM debian:bookworm

RUN apt update -y
RUN apt upgrade -y
RUN apt install php-fpm -y
RUN apt install php-mysqli -y
RUN apt install curl -y

RUN mkdir -p /run/php 

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/ 
COPY scripts/install_wordpress.sh .

RUN chmod +x install_wordpress.sh 

ENTRYPOINT [ "./install_wordpress.sh" ]
