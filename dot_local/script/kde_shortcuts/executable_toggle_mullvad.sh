#!/usr/bin/env bash

mullvad_status="$(mullvad status)"
#echo "$mullvad_status"

if [[ "$mullvad_status" == "Disconnected" ]]; then
    mullvad connect &
else
    mullvad disconnect &
fi
