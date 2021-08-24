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
mod-authtoken-2.9.0-SNAPSHOT.91
mod-calendar-1.13.0-SNAPSHOT.121
mod-circulation-22.1.0-SNAPSHOT.875
mod-circulation-storage-13.1.0-SNAPSHOT.288
mod-codex-inventory-2.1.0-SNAPSHOT.88
mod-codex-mux-2.12.0-SNAPSHOT.104
mod-configuration-5.8.0-SNAPSHOT.94
mod-data-export-4.1.1-SNAPSHOT.252
mod-email-1.12.0-SNAPSHOT.57
mod-event-config-2.2.0-SNAPSHOT.49
mod-feesfines-16.2.0-SNAPSHOT.160
mod-inventory-17.1.0-SNAPSHOT.406
mod-inventory-storage-22.0.0-SNAPSHOT.594
mod-invoice-5.2.0-SNAPSHOT.244
mod-invoice-storage-5.2.0-SNAPSHOT.101
mod-login-7.5.0-SNAPSHOT.98
mod-login-saml-2.2.2-SNAPSHOT.74
mod-notes-2.13.0-SNAPSHOT.178
mod-notify-2.10.0-SNAPSHOT.106
mod-password-validator-2.2.0-SNAPSHOT.45
mod-patron-blocks-1.4.0-SNAPSHOT.58
mod-permissions-5.15.0-SNAPSHOT.116
mod-pubsub-2.4.0-SNAPSHOT.169
mod-source-record-storage-5.2.0-SNAPSHOT.334
mod-tags-0.10.0-SNAPSHOT.63
mod-template-engine-1.15.0-SNAPSHOT.72
mod-users-18.1.0-SNAPSHOT.165
mod-users-bl-7.1.0-SNAPSHOT.105
EOM

#cat /tmp/modules_ordered.txt

if [ -z "$MODULE_NAME" ]; then
  export MODULE_ID=${MODULE_NAME}
  ./create-deploy.sh
else
  cat /tmp/modules_ordered.txt | while read id ; do
    echo "Processing: ${id}"
    export MODULE_ID=${id}
    ./create-deploy.sh
  done
fi

echo Completed at : $(date)
