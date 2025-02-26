FROM debian:bookworm

RUN apt update -y
RUN apt upgrade -y
RUN apt install mariadb-server -y

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY scripts/init.sh .

RUN mkdir -p /run/mysqld
RUN chmod +x init.sh 
RUN chown -R mysql:mysql /var/lib/mysql

ENTRYPOINT [ "./init.sh" ]
