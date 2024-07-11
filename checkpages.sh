#!/bin/bash

# Dirección de la página web a verificar
url="https://url"

# Intervalo de verificación en segundos
interval=30

# Bucle infinito
while :
do
  # Verificar si la página web está activa
  status_code=$(curl -s -o /dev/null -w "%{http_code}" $url)
  if [ $status_code -eq 200 ]; then
    # Página web activa, continuar con el siguiente script
    echo "La página web está activa, continuando con el siguiente script."
    break
  else
    # Página web inactiva, esperar el intervalo
    echo "La página web no está activa, esperando $interval segundos."
    sleep $interval
  fi
done

