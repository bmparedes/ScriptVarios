#!/bin/bash

# Archivo que contiene la lista de deployments
deployment_list="./lista_deployments.txt"

# Espacio de nombres (namespace) donde se encuentran los deployments
namespace="produccion"

# Directorio donde se guardarán los archivos YAML (opcional)
output_dir="./deployments_yaml"

# Crear el directorio de salida si no existe
mkdir -p "$output_dir"

# Verificar si el archivo de lista existe
if [ ! -f "$deployment_list" ]; then
    echo "Error: No se encuentra el archivo '$deployment_list'"
    exit 1
fi

# Leer cada línea del archivo como un nombre de deployment
while IFS= read -r deployment; do
    # Ignorar líneas vacías o comentarios (que empiezan con '#')
    if [[ -n "$deployment" && "$deployment" != \#* ]]; then
        # Construir el nombre del archivo YAML de salida
        output_file="$output_dir/${deployment}.yaml"

        # Ejecutar el comando kubectl y guardar el resultado en el archivo YAML
        kubectl get deploy "$deployment" -n "$namespace" -o yaml > "$output_file"

        # Mensaje de confirmación (opcional)
        echo "YAML de '$deployment' guardado en: $output_file"
    fi
done < "$deployment_list"
