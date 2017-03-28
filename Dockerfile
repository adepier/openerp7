FROM debian:wheezy
MAINTAINER Albokasoft

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y wget nano sudo

RUN wget --no-check-certificate -O - https://nightly.odoo.com/odoo.key | apt-key add -
RUN echo "deb http://nightly.openerp.com/7.0/nightly/deb/ ./" >> /etc/apt/sources.list

RUN apt-get update && apt-get install -y openerp

RUN apt-get clean

COPY ./entrypoint.sh /
COPY ./openerp-server.conf /etc/openerp/
RUN chown openerp /etc/openerp/openerp-server.conf
RUN chmod +x /entrypoint.sh
RUN chown openerp /entrypoint.sh

# Expose Opererp services
EXPOSE 8069 8071

# Set the default config file
ENV OPENERP_SERVER /etc/openerp/openerp-server.conf

USER openerp

ENTRYPOINT ["/entrypoint.sh"]
CMD ["openerp-server"]
