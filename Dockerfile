FROM debian:wheezy
MAINTAINER Albokasoft

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y wget nano sudo

RUN wget -O - https://nightly.odoo.com/odoo.key | apt-key add -
RUN echo "deb http://nightly.openerp.com/7.0/nightly/deb/ ./" >> /etc/apt/sources.list

RUN apt-get update && apt-get install -y openerp

RUN apt-get clean

# Expose Opererp services
EXPOSE 8069 8071
