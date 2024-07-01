#!/bin/bash
./get_modules_from_github.sh

IMAGENAME="muevetec/soltec-odoo"
IMAGEVERSION="1.0-dev"

echo "Construyendo: $IMAGENAME:$IMAGEVERSION"

# Hacer el build
if docker build -t $IMAGENAME:$IMAGEVERSION . --no-cache; then
    echo "Imagen $IMAGENAME:$IMAGEVERSION construida exitosamente."
else
    echo "Falló la construcción de la imagen $IMAGENAME:$IMAGEVERSION." >&2
    exit 1
fi

echo "Completado de manera exitosa."
exit 0
