#!/bin/bash

# Asignar argumentos a variables
REPO_PATH_OA=./submodules/odoo-argentina
REPO_PATH_AFT=./submodules/account-financial-tools
REPO_PATH_AP=./submodules/account-payment
DEST_PATH=./modules_from_github
EXCLUSION_FILE=./exclusion_list.txt

# Verificar si el directorio del repositorio existe
if [ ! -d "$REPO_PATH_OA" ]; then
    echo "Error: El directorio del repositorio '$REPO_PATH_OA' no existe."
    exit 1
fi
if [ ! -d "$REPO_PATH_AFT" ]; then
    echo "Error: El directorio del repositorio '$REPO_PATH_AFT' no existe."
    exit 1
fi
if [ ! -d "$REPO_PATH_AP" ]; then
    echo "Error: El directorio del repositorio '$REPO_PATH_AP' no existe."
    exit 1
fi

# Crear el directorio de destino si no existe
if [ ! -d "$DEST_PATH" ]; then
    echo "El directorio de destino '$DEST_PATH' no existe. Creando..."
    mkdir -p "$DEST_PATH"
    if [ $? -ne 0 ]; then
        echo "Error: No se pudo crear el directorio de destino '$DEST_PATH'."
        exit 1
    fi
fi

# Verificar si el archivo de exclusión existe
if [ ! -f "$EXCLUSION_FILE" ]; then
    echo "Error: El archivo de exclusión '$EXCLUSION_FILE' no existe."
    exit 1
fi

# Copiar solo los directorios usando rsync con exclusión
rsync -av --exclude-from="$EXCLUSION_FILE" --include '*/' "$REPO_PATH_OA"/ "$DEST_PATH"
if [ $? -eq 0 ]; then
    echo "Directorios copiados exitosamente de '$REPO_PATH_OA' a '$DEST_PATH'."
else
    echo "Error: Ocurrió un problema al copiar los directorios de '$REPO_PATH_OA'."
    exit 1
fi

rsync -av --exclude-from="$EXCLUSION_FILE" --include '*/' "$REPO_PATH_AFT"/ "$DEST_PATH"
if [ $? -eq 0 ]; then
    echo "Directorios copiados exitosamente de '$REPO_PATH_AFT' a '$DEST_PATH'."
else
    echo "Error: Ocurrió un problema al copiar los directorios de '$REPO_PATH_AFT'."
    exit 1
fi

rsync -av --exclude-from="$EXCLUSION_FILE" --include '*/' "$REPO_PATH_AP"/ "$DEST_PATH"
if [ $? -eq 0 ]; then
    echo "Directorios copiados exitosamente de '$REPO_PATH_AP' a '$DEST_PATH'."
else
    echo "Error: Ocurrió un problema al copiar los directorios de '$REPO_PATH_AP'."
    exit 1
fi

exit 0
