#!/bin/bash

ARCHIVO="subs_a_sincronizar.txt"
RAMA="${1:-19.0}"
DIRECTORIO="./submodules"

if [[ ! -f "$ARCHIVO" ]]; then
    echo "Error: No se encuentra $ARCHIVO"
    exit 1
fi

while IFS= read -r submodulo || [[ -n "$submodulo" ]]; do

    # Ignorar líneas vacías y comentarios
    [[ -z "$submodulo" || "$submodulo" =~ ^[[:space:]]*# ]] && continue

    RUTA="$DIRECTORIO/$submodulo"

    echo "----------------------------------------"
    echo "Sincronizando: $submodulo (rama $RAMA)"
    echo "----------------------------------------"

    if [[ ! -d "$RUTA/.git" && ! -f "$RUTA/.git" ]]; then
        echo "ERROR: No es un submódulo válido: $RUTA"
        continue
    fi

    git -C "$RUTA" pull origin "$RAMA"

done < "$ARCHIVO"

echo "Sincronización finalizada."