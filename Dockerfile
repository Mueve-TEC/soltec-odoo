FROM odoo:16

COPY --chown=odoo:odoo ./modules_from_github /mnt/extra-addons
COPY --chown=odoo:odoo transport.py /var/lib/odoo/.local/lib/python3.9/site-packages/pysimplesoap/transport.py

USER root
RUN apt-get update && apt-get install git -y
RUN apt-get install python3-m2crypto -y
RUN apt-get install python3-xlrd python3-chardet python3-ofxparse -y
COPY openssl.cnf /etc/ssl/openssl.cnf

USER odoo
COPY ./requirements.txt /var/lib/odoo/requirements.txt
RUN pip3 install -r /var/lib/odoo/requirements.txt


