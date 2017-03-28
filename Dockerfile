FROM debian:wheezy
MAINTAINER Albokasoft

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y wget nano sudo

RUN wget --no-check-certificate -O - https://nightly.odoo.com/odoo.key | apt-key add -
RUN echo "deb http://nightly.openerp.com/7.0/nightly/deb/ ./" >> /etc/apt/sources.list

RUN apt-get update && apt-get install -y openerp

RUN apt-get clean

# Expose Opererp services
EXPOSE 8069 8071

USER openerp

CMD ["/usr/bin/openerp-server", "-c", "/etc/openerp/openerp-server.conf"]
