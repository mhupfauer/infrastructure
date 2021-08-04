#!/bin/bash
chown brscan-skey /consume
chmod 777 -R /consume

su -c "brscan-skey -t" -m brscan-skey
sleep 1
su -c "brscan-skey" -m brscan-skey
sleep 1
su -c "brscan-skey -l" -m brscan-skey
sleep 1

exec tail -f /dev/null
