#!/bin/bash

# ./scale.sh up to scale up, and ./scale.sh dn to scale down
URL=$(openstack stack output show nginx website_url|grep output_value|awk '{print $4}')
while true; do curl $URL; sleep 0.5; done
