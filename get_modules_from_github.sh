#!/bin/bash

set -euo pipefail

REPO_PATHS=(
    "./submodules/odoo-argentina"
    "./submodules/odoo-argentina-ce"
    "./submodules/account-financial-tools"
    "./submodules/account-payment"
    "./submodules/account-reconcile"
    "./submodules/bank-statement-import"
    "./submodules/odooapps"
    "./submodules/vertical-association"
    "./submodules/reporting-engine"
    "./submodules/odoo-union"
    "./submodules/helpdesk"
   # "./submodules/odoo-website-fixes"
   # "./submodules/payment_sipago"
)


DEST_PATH="./modules_from_github"
EXCLUSION_FILE="./exclusion_list.txt"


log_info() {
    echo "[INFO] $1"
}

log_error() {
    echo "[ERROR] $1" >&2 # >&2 redirige los errores a la salida de error estándar
}



log_info "Iniciando el proceso de sincronización de módulos..."

if [ ! -f "$EXCLUSION_FILE" ]; then
    log_error "El archivo de exclusión '$EXCLUSION_FILE' no existe."
    exit 1
fi

log_info "Asegurando que el directorio de destino '$DEST_PATH' existe..."
mkdir -p "$DEST_PATH"


for repo_path in "${REPO_PATHS[@]}"; do    
    if [ ! -d "$repo_path" ]; then
        log_error "El directorio del repositorio '$repo_path' no existe. Abortando."
        exit 1 
    fi

    log_info "Procesando repositorio: $(basename "$repo_path")..."       
    rsync -av --exclude-from="$EXCLUSION_FILE" --include='*/' "$repo_path"/ "$DEST_PATH"    
    log_info "Sincronización de '$(basename "$repo_path")' completada."
done

log_info "Todos los repositorios han sido procesados exitosamente."
exit 0
