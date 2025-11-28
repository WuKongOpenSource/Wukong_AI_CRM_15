#!/bin/bash
# readiness.sh
if [ ! -f /var/lib/mysql/.initialized ]; then
  echo "DB not initialized"
  exit 1
fi
mysqladmin ping -h 127.0.0.1 -uroot -p"$MYSQL_ROOT_PASSWORD" --silent
