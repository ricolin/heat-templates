#!/bin/bash

# ./scale.sh up to scale up, and ./scale.sh dn to scale down
URL=$(openstack stack output show nginx scale_$1_url|grep output_value|awk '{print $4}')
Token=$(curl -i -H "Content-Type: application/json" -d '{ "auth": { "identity": { "methods": ["password"], "password": { "user": { "name": "admin", "domain": { "id": "default" }, "password": "admin" } } }, "scope": { "project": { "name": "admin", "domain": { "id": "default" } } } }}' http://192.168.1.101/identity/v3/auth/tokens|grep "X-Subject-Token"|awk '{print $2}')
#echo $Token
Handler="X-Auth-Token: $Token"
res=$(curl -i -H $Handler -X POST $URL)

echo "Scaled"
