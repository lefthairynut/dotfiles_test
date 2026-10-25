#!/usr/bin/env bash


function focus_or_launch()
{
    program_name="$1"
    program_command="${*:2}"
    window_id="$(wmctrl -lpx | awk -v program="$program_name" 'tolower($5) ~ program {print $1}')"
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

my_command='/home/so/.BurpSuite/burpbrowser/151.0.7922.137/chrome --force-device-scale-factor=1.5 --disable-ipc-flooding-protection --disable-xss-auditor --disable-bundled-ppapi-flash --disable-plugins-discovery --disable-default-apps --disable-prerender-local-predictor --disable-breakpad --disable-crash-reporter --disable-prerender-local-predictor --disk-cache-size=0 --disable-settings-window --disable-notifications --disable-speech-api --disable-file-system --disable-presentation-api --disable-permissions-api --disable-new-zip-unpacker --disable-media-session-api --no-experiments --no-events --no-first-run --no-default-browser-check --no-pings --no-service-autorun --media-cache-size=0 --use-fake-device-for-media-stream --dbus-stub --disable-background-networking --disable-features=ChromeWhatsNewUI,HttpsUpgrades,ImageServiceObserveSyncDownloadStatus,LensOverlay,RenderDocument,SessionRestoreInfobar,TrackingProtection3pcd --proxy-server=localhost:8080 --proxy-bypass-list="<-loopback>" --user-data-dir=/home/so/.BurpSuite/pre-wired-browser --remote-debugging-port=0 --class=burp-browser --ignore-certificate-errors --load-extension=/home/so/.BurpSuite/new-tab,/home/so/.BurpSuite/navigation-recorder,/home/so/.BurpSuite/dom-invader chrome://newtab'
focus_or_launch 'burp-browser' "$my_command"
