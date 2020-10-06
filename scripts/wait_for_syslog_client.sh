#!/bin/bash
printf "Waiting for syslog client"

count=0
until docker-compose exec -T syslog_client ls /tmp/server_started 2> /dev/null
do
  printf "."
  sleep 1
  let count++

  if [ $count -ge 10 ]; then
    echo "Failed to start server"
    exit 1
  fi
done
printf "\n"
