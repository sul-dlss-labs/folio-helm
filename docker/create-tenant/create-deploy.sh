#!/bin/sh

echo ------------------ Creating tenant ------------------
cat > /tmp/tenant.json <<END
{
  "id": "$TENANT_ID",
  "name" : "$TENANT_ID",
  "description" : "Stanford University Libraries"
}
END
curl -sL -w '\n' -D - -X POST -H "Content-type: application/json" -d @/tmp/tenant.json $OKAPI_URL/_/proxy/tenants
curl -sL -w '\n' -D - -X POST -H "Content-type: application/json" -d '{"id":"okapi"}' $OKAPI_URL/_/proxy/tenants/$TENANT_ID/modules

echo Done!
