FROM odoo:16

COPY --chown=odoo:odoo ./modules_from_github /mnt/extra-addons
COPY --chown=odoo:odoo transport.py /var/lib/odoo/.local/lib/python3.9/site-packages/pysimplesoap/transport.py

USER root
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        git \
        python3-m2crypto \
        python3-xlrd \
        python3-chardet \
        python3-ofxparse \
        libzbar0 \
        poppler-utils \
    && rm -rf /var/lib/apt/lists/*
COPY openssl.cnf /etc/ssl/openssl.cnf
COPY ir_actions_report_templates.xml /usr/lib/python3/dist-packages/odoo/addons/sale/report/ir_actions_report_templates.xml
COPY ./ocr_requirements.txt /tmp/ocr_requirements.txt
RUN pip install --no-cache-dir uv \
    && uv pip install --system --no-cache -r /tmp/ocr_requirements.txt \
    && rm -f /tmp/ocr_requirements.txt
#COPY odoo.conf /etc/odoo/odoo.conf


USER odoo
COPY ./requirements.txt /tmp/requirements.txt
RUN pip install --no-cache-dir -r /tmp/requirements.txt
    


