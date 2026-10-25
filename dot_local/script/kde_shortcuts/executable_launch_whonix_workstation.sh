#!/usr/bin/env bash


function focus_or_launch()
{
    program_name="$1"
    program_command="${*:2}"
    window_id="$(wmctrl -lpx | awk -v program="$program_name" 'tolower($8) ~ program {print $1}')"
    #echo "$window_id"
    if [ -n "$window_id" ]; then
        echo "Focusing on the existing window with ID: $window_id"
        wmctrl -ia "$window_id"
    else
        echo "Launching the program: $program_name"
        if [ "$#" -eq 1 ]; then
            $program_name &
        elif [ "$#" -gt 1 ]; then
    	$program_command &
        fi
    fi
}

focus_or_launch 'whonix-workstation' 'VirtualBoxVM --startvm=Whonix-Workstation-LXQt --fullscreen'
