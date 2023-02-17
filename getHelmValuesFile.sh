#!/usr/bin/env bash
set -o errexit  # exit on nonzero exitstatus
set -o nounset  # exit on unbound variable  
set -o pipefail # don't hide errors within pipes

printf "Enter the name of the Grafana OSS Product (loki,mimir,tempo,grafana): "
read -r   PRODUCT;  

case "$PRODUCT" in
  loki) valueUrl="https://raw.githubusercontent.com/grafana/loki/main/production/helm/loki/values.yaml" ;;
  mimir) valueUrl="https://raw.githubusercontent.com/grafana/mimir/main/operations/helm/charts/mimir-distributed/values.yaml" ;;
  tempo) valueUrl="https://github.com/grafana/helm-charts/blob/main/charts/tempo/values.yaml" ;;
  grafana) valueUrl="https://raw.githubusercontent.com/grafana/helm-charts/main/charts/grafana/values.yaml" ;;
  *)  echo "Invalid Product Name" ;;
esac

wget "$valueUrl" -O "$PRODUCT-values.yaml"