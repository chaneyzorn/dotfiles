#!/bin/bash
maim -s -u -b 3.5 -c 0.45,0.7,1,0.2 -l /tmp/main-screenshot.png
if [ -f /tmp/main-screenshot.png ]; then
    xclip -selection c -t image/png /tmp/main-screenshot.png
    img_name=/home/chaney/Desktop/`date +%Y-%m-%d-%H:%M:%S`-screenshot.png
    mv /tmp/main-screenshot.png $img_name
    notify-send -i $img_name 'maim' 'screenshot successed!\nimage has been saved to '$img_name
else
    notify-send 'maim' 'screenshot cancelled!'
fi

