#!/bin/sh
rm -Rf /tmp/*
mkdir -p /var/log/pgpool/
touch /var/log/pgpool/pgpool_status
rancher-gen --config=/app/conf/init.conf --onetime

pg_md5 -m -u $MANAGER_USERNAME $MANAGER_PASSWORD
forego start -r