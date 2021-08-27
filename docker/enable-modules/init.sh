#!/bin/sh
echo Started at : $(date)
#echo Preparing Databse
#export PGPASSWORD=$DB_PASSWORD
#export POSTGRES_PASSWORD='password'

#psql -h $DB_HOST -d $DB_DATABASE -U $DB_USERNAME -a -q -f ./create_views.sql
#echo Views have been created

#psql -h $DB_HOST -d $DB_DATABASE -U $DB_USERNAME -c "COPY (select module_requestor from (select module_requestor, row_number() over (order by depth, module_requestor) row_order from (select distinct depth, module_requestor from public.vmodules_hierarchy where ($SQL_WHERE) and max_depth = depth) x) y order by row_order) TO STDOUT" > /tmp/modules_ordered.txt
#echo List of modules has been created

cat  << EOM > /tmp/modules_ordered.txt
mod-agreements-5.0.0-SNAPSHOT.383
 mod-calendar-1.13.0-SNAPSHOT.121
 mod-codex-mux-2.12.0-SNAPSHOT.104
 mod-configuration-5.8.0-SNAPSHOT.95
 mod-data-import-converter-storage-1.12.0-SNAPSHOT.169
 mod-erm-usage-4.2.0-SNAPSHOT.141
 mod-event-config-2.2.0-SNAPSHOT.49
 mod-finance-storage-7.2.0-SNAPSHOT.190
 mod-inventory-storage-22.0.0-SNAPSHOT.595
 mod-invoice-storage-5.2.0-SNAPSHOT.101
 mod-licenses-4.0.0-SNAPSHOT.179
 mod-organizations-storage-4.2.0-SNAPSHOT.66
 mod-permissions-5.15.0-SNAPSHOT.116
 mod-source-record-storage-5.2.1-SNAPSHOT.336
 mod-tags-0.10.0-SNAPSHOT.63
 mod-users-18.1.0-SNAPSHOT.166
 mod-authtoken-2.9.0-SNAPSHOT.91
 mod-codex-inventory-2.1.0-SNAPSHOT.89
 mod-courses-1.4.1-SNAPSHOT.128
 mod-data-export-4.1.1-SNAPSHOT.253
 mod-email-1.12.0-SNAPSHOT.57
 mod-finance-4.3.0-SNAPSHOT.149
 mod-kb-ebsco-java-3.9.0-SNAPSHOT.290
 mod-login-7.5.0-SNAPSHOT.98
 mod-notes-2.13.0-SNAPSHOT.178
 mod-orders-storage-13.1.0-SNAPSHOT.233
 mod-organizations-1.4.0-SNAPSHOT.26
 mod-password-validator-2.2.0-SNAPSHOT.46
 mod-source-record-manager-3.2.0-SNAPSHOT.446
 mod-data-import-2.2.0-SNAPSHOT.200
 mod-login-saml-2.2.2-SNAPSHOT.74
 mod-pubsub-2.4.0-SNAPSHOT.169
 mod-quick-marc-2.2.0-SNAPSHOT.122
 mod-sender-1.7.0-SNAPSHOT.30
 mod-circulation-storage-13.1.0-SNAPSHOT.289
 mod-inventory-17.1.0-SNAPSHOT.406
 mod-patron-blocks-1.4.0-SNAPSHOT.58
 mod-template-engine-1.15.0-SNAPSHOT.72
 mod-notify-2.10.0-SNAPSHOT.106
 mod-feesfines-16.2.0-SNAPSHOT.160
 mod-users-bl-7.1.0-SNAPSHOT.105
 mod-circulation-22.1.0-SNAPSHOT.877
 mod-orders-12.2.0-SNAPSHOT.444
 mod-invoice-5.2.0-SNAPSHOT.244
EOM


if [ "$MODULE_NAME" ]; then
  export MODULE_ID=${MODULE_NAME}
  ./create-deploy.sh
else
  cat /tmp/modules_ordered.txt | while read id ; do
    export MODULE_ID=${id}
    ./create-deploy.sh
  done
fi

echo Completed at : $(date)
