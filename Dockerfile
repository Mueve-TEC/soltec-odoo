# Usar la imagen base de Odoo v19
FROM odoo:19.0

# Deps externas de l10n_ar_factura_qr (escaneo de QR ARCA en facturas):
#   - libzbar0 + pyzbar: decode de códigos QR
#   - poppler-utils + pdf2image: conversión de PDF a imagen
#   - numpy: procesamiento de imágenes (requerido por pyzbar/Pillow)
# La imagen base no incluye estas dependencias; instalarlas aquí evita el
# error "Hay una dependencia externa sin resolver: pyzbar" al instalar el módulo.
USER root
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        libzbar0 \
        poppler-utils \
        git \
    && rm -rf /var/lib/apt/lists/*
# La imagen base de Odoo usa un Python "externally-managed" (PEP 668), por lo
# que pip exige --break-system-packages para instalar en el entorno del sistema.
RUN pip install --break-system-packages --no-cache-dir \
        pyzbar>=0.1.9 \
        pdf2image>=1.16.3 \
        numpy>=1.21.0
COPY odoo.conf /etc/odoo/odoo.conf
COPY ./requirements.txt /tmp/requirements.txt
RUN curl -LsSf https://astral.sh/uv/install.sh | env UV_INSTALL_DIR=/usr/local/bin sh
RUN uv pip install --system --break-system-packages -r /tmp/requirements.txt

USER odoo
COPY --chown=odoo:odoo ./custom-addons /mnt/extra-addons

