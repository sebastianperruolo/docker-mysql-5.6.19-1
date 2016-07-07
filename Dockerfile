FROM oraclelinux:latest

ENV PACKAGE_URL http://cdn.mysql.com/archives/mysql-5.6/MySQL-server-5.6.19-1.el6.x86_64.rpm

# Install server
RUN rpmkeys --import http://repo.mysql.com/RPM-GPG-KEY-mysql \
  && yum install -y $PACKAGE_URL \
  && yum install -y perl-Data-Dumper \
  && yum install -y libpwquality \
  && rm -rf /var/cache/yum/*

RUN mkdir /docker-entrypoint-initdb.d

VOLUME /var/lib/mysql

COPY docker-entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 3306
CMD ["mysqld"]
