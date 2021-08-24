# folio-helm - Helm charts modules repository

## Introduction

FOLIO Helm charts modules repository.

Contains Helm sources and Helm packages repository.
Repository URL https://folio-org.github.io/folio-helm/
Master branch is configured as GitHub pages.

## Creating Helm package from source

Build package with:
```
  helm package <MODULE_NAME> -d ./charts
```
Update repository index
```
  helm repo index . --url https://folio-org.github.io/folio-helm/
```

Commit and push changes to GitHub

## Set env variables for database “okapi”
kubectl delete secret -n jgreben db-connect-modules

kubectl create secret -n jgreben generic db-connect-modules --from-literal=DB_HOST=folio-jgreben-okapi-rds.clqwjadk8neo.us-west-2.rds.amazonaws.com --from-literal=DB_DATABASE=okapi --from-literal=DB_USERNAME=okapi --from-literal=DB_PASSWORD=REDACTED --from-literal=DB_PORT=5432 --from-literal=ENV=dev --from-literal=KAFKA_HOST=kafka-jgreben.jgreben.svc.cluster.local --from-literal=KAFKA_PORT=9092 --from-literal=OKAPI_URL=http://localhost:9130

