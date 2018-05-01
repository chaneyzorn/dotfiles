#!/bin/bash
maim -s -u -b 3.5 -c 0.45,0.7,1,0.2 -l /tmp/main-screenshot.png
if [ -f /tmp/main-screenshot.png ]; then
    echo 'maim: screenshot successed!'
    xclip -selection c -t image/png /tmp/main-screenshot.png
    mv /tmp/main-screenshot.png /home/chaney/Desktop/`date +%Y-%m-%d-%H:%M:%S`-screenshot.png
else
    echo 'maim: screenshot cancelled!'
fi