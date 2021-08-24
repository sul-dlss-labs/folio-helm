#!/bin/bash

for d in core-modules/*; do
  helm package $d -d ./charts
done
helm repo index . --url https://folio-org.github.io/folio-helm/
