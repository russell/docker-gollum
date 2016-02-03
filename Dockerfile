FROM linuxserver/baseimage

MAINTAINER Russell Sim <russell.sim@gmail.com>

# Packages
RUN apt-get update && \

apt-get install -y build-essential bison libgdbm-dev libicu-dev zlib1g-dev ruby ruby-dev git && \
apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN gem install gollum
RUN gem install redcarpet org-ruby

# Adding custom files
ADD init/ /etc/my_init.d/
ADD services/ /etc/service/
ADD defaults/ /defaults/
RUN chmod -v +x /etc/service/*/run /etc/my_init.d/*.sh

EXPOSE 4567
