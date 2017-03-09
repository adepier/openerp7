FROM debian:wheezy
MAINTAINER Albokasoft

RUN wget -O - https://nightly.odoo.com/odoo.key | apt-key add -
echo "deb http://nightly.openerp.com/7.0/nightly/deb/ ./" >> /etc/apt/sources.list

RUN apt-get update && apt-get install odoo nano sudo

RUN apt-get clean

# Expose Opererp services
EXPOSE 8069 8071
