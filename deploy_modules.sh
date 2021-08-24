#!/bin/bash

NAMESPACE=$1

for MOD in charts/*; do
  if [[ "$MOD" =~ "okapi" ]] || [[ "$MOD" =~ "edge-" ]] || [[ "$MOD" =~ "platform-" ]]; then
    continue
  fi
  mod_name=`echo $MOD | awk -F'/' '{print $2}' | awk -F'-' 'BEGIN {OFS = FS} { $(NF--)=""; print }' | sed 's/-$//'`
  helm install $mod_name $MOD -n $NAMESPACE
done
