FROM odoo:16

COPY --chown=odoo:odoo ./modules_from_github /mnt/extra-addons
COPY --chown=odoo:odoo transport.py /var/lib/odoo/.local/lib/python3.9/site-packages/pysimplesoap/transport.py

USER root
RUN apt-get update && apt-get install git -y
RUN apt-get install python3-m2crypto -y
RUN apt-get install python3-xlrd python3-chardet python3-ofxparse -y
COPY openssl.cnf /etc/ssl/openssl.cnf
COPY ir_actions_report_templates.xml /usr/lib/python3/dist-packages/odoo/addons/sale/report/ir_actions_report_templates.xml
#COPY odoo.conf /etc/odoo/odoo.conf
#COPY ./fixes/account_move_tax.py /mnt/extra-addons/account_move_tax/models/

USER odoo
COPY COPY ./requirements.txt /tmp/requirements.txt
RUN pip install --no-cache-dir -r /tmp/requirements.txt


