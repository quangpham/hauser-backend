# Select ubuntu as the base image
FROM ubuntu:latest
MAINTAINER me@quangpham.com

# Install nginx, nodejs and curl
RUN apt-get update -q
RUN apt-get install -qy nginx
RUN apt-get install -qy curl
RUN apt-get install -qy nodejs

# Install mysql
RUN apt-get install -qy libmysqld-dev libmysqlclient-dev mysql-client mysql-server
RUN rm -rf /var/lib/mysql/mysql
RUN rm -rf /var/lib/apt/lists/* # 20140818

# Setup nginx
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

# Install rvm, ruby, bundler
RUN curl -sSL https://get.rvm.io | bash -s stable
RUN /bin/bash -l -c "rvm requirements"
RUN /bin/bash -l -c "rvm install 2.1.0"
RUN /bin/bash -l -c "gem install bundler --no-ri --no-rdoc"

# Add configuration files in repository to filesystem
ADD _docker/nginx-sites.conf /etc/nginx/sites-enabled/default
ADD _docker/start-server.sh /usr/bin/start-server
RUN chmod +x /usr/bin/start-server

# Config mysql
ADD _docker/mysql_start.sh /mysql_start.sh
RUN chmod 755 /mysql_start.sh

# Add rails project to project directory
ADD ./ /rails

# set WORKDIR
WORKDIR /rails

# bundle install
RUN /bin/bash -l -c "bundle install"

# Publish port 80
EXPOSE 80

VOLUME ["/var/lib/mysql"]
VOLUME ["/var/run/mysqld"]

# Startup commands
ENTRYPOINT /usr/bin/start-server
