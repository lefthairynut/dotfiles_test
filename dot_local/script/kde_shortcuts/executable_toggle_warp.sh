#!/usr/bin/env bash

status="$(warp-cli status | awk 'NR==1 {print $3}')"
#echo $status

if [[ "$status" == "Connected" ]]; then
    warp-cli disconnect
elif [[ "$status" == "Disconnected" ]]; then
    warp-cli connect
fi

