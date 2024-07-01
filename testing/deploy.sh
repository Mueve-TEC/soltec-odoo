#!/bin/bash

SWARM_FILE="./docker-compose.yml"
STACK_NAME="odoo-stack-base-dev"
REQUIRED_IMAGE="muevetec/soltec-odoo:1.0-dev"
REQUIRED_PG_IMAGE="postgres:14"

echo "Desplegando el stack: $STACK_NAME usando el archivo: $SWARM_FILE"

#Revisar si docker está en modo swarm
if ! docker info | grep -q "Swarm: active"; then
    echo "Docker Swarm no esta activo. Inicializarlo y probar nuevamente." >&2
    exit 1
fi

#Revisar si existen la imagenes localmente
if ! docker images --format "{{.Repository}}:{{.Tag}}" | grep -q "^${REQUIRED_IMAGE}$"; then
    echo "Imagen ${REQUIRED_IMAGE} no encontrada. Haciendo pull..."
    if docker pull $REQUIRED_IMAGE; then
        echo "Imagen ${REQUIRED_IMAGE} descargada."
    else
        echo "Falló la descarga de la imagen ${REQUIRED_IMAGE}." >&2
        exit 1
    fi
fi

if ! docker images --format "{{.Repository}}:{{.Tag}}" | grep -q "^${REQUIRED_PG_IMAGE}$"; then
    echo "Imagen ${REQUIRED_PG_IMAGE} no encontrada. Haciendo pull..."
    if docker pull $REQUIRED_PG_IMAGE; then
        echo "Imagen ${REQUIRED_PG_IMAGE} descargada."
    else
        echo "Falló la descarga de la imagen ${REQUIRED_PG_IMAGE}." >&2
        exit 1
    fi
fi

# Desplegar
if docker stack deploy -c "$SWARM_FILE" "$STACK_NAME"; then
    echo "Stack $STACK_NAME desplegado exitosamente."
else
    echo "Fallo el despliegue del stack $STACK_NAME." >&2
    exit 1
fi

echo "Completado exitosamente."
exit 0
