FROM debian:latest

RUN apt update && apt upgrade
RUN apt install mariadb-server -y

COPY ./mariadb/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./mariadb/init.sh .

RUN mkdir -p /run/mysqld
RUN chmod +x init.sh
RUN chown -R mysql:mysql /var/lib/mysql 

CMD [ "./init.sh" ]

ENTRYPOINT [ "sh", "-c", "mysql -u root < /etc/init/init.sql" ]
