#!/bin/bash

if [ $1 == "start" ]
then
  docker build -t mhupfauer/brscan images/brother_scan/.
  docker run --rm -d --network host --name br_consumer -v "$(pwd)"/apps.d/paperless-ng/consume:/consume:rw mhupfauer/brscan:latest
fi

if [ $1 == "stop" ]
then
   docker container stop br_consumer
fi
