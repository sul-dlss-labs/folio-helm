#!/bin/sh

echo Pushing module descriptor
curl -s -S -w'\n' 'http://folio-registry.aws.indexdata.com/_/proxy/modules?filter='$MODULE_NAME'&latest=1&full=true'| jq '.[0]' > /tmp/descriptor.json
MODULE_NAME_VERSION=$(curl -s -S -w'\n' 'http://folio-registry.aws.indexdata.com/_/proxy/modules?filter='$MODULE_NAME'&latest=1&full=true'| jq '.[0].id');
curl -L -w '\n' -D - -X POST -H "Content-type: application/json" -d @/tmp/descriptor.json $OKAPI_URL/_/proxy/modules

echo Pushing module deployment
cat > /tmp/deployment.json <<END
{
  "srvcId": $MODULE_NAME_VERSION,
  "instId": $MODULE_NAME_VERSION,
  "url": "http://$MODULE_NAME"
}
END
curl -L -w '\n' -D - -X POST -H "Content-type: application/json" -d @/tmp/deployment.json $OKAPI_URL/_/discovery/modules

echo Creating tenant
cat > /tmp/tenant.json <<END
{
  "id": "$TENANT_ID",
  "name" : "$TENANT_ID",
  "description" : "Default tenant"
}
END
curl -L -w '\n' -D - -X POST -H "Content-type: application/json" -d @/tmp/tenant.json $OKAPI_URL/_/proxy/tenants

echo Enabling tenant
cat > /tmp/tenant-enable.json <<END
{
  "id": $MODULE_NAME_VERSION,
  "action" : "enable"
}
END
curl -L -w '\n' -D - -X POST -H "Content-type: application/json" -d @/tmp/tenant-enable.json $OKAPI_URL/_/proxy/tenants/$TENANT_ID/modules

echo Done!

sleep 3m;