#!/bin/bash

# assemble the screenshots for the readme

set -e

n=3
hspace=50
border=0
width=$((n*144+(n-1)*hspace+2*border))
height=$((194+2*border))
x1=$((0*(144+hspace)+border))
x2=$((1*(144+hspace)+border))
x3=$((2*(144+hspace)+border))
textx1=$((8+x1))
textx2=$((8+x2))
textx3=$((8+x3))
texty=$((190+border))

# low battery look
convert data/white.png -background white -resize ${width}x${height}! tmp.png
composite -compose atop -geometry +$x1+$border screenshots/battery-low-1.png tmp.png tmp.png
composite -compose atop -geometry +$x2+$border screenshots/battery-low-2.png tmp.png tmp.png
composite -compose atop -geometry +$x3+$border screenshots/battery-low-3.png tmp.png tmp.png
convert tmp.png -pointsize 15 -font /usr/share/fonts/truetype/msttcorefonts/verdana.ttf -annotate +$textx1+$texty '30%% battery left' tmp.png
convert tmp.png -pointsize 15 -font /usr/share/fonts/truetype/msttcorefonts/verdana.ttf -annotate +$textx2+$texty '20%% battery left' tmp.png
convert tmp.png -pointsize 15 -font /usr/share/fonts/truetype/msttcorefonts/verdana.ttf -annotate +$textx3+$texty '10%% battery left' tmp.png
mv tmp.png screenshots/battery.png

textx1=$((12+x1))
textx2=$((-5+x2))
textx3=$((15+x3))

# bluetooth
convert data/white.png -background white -resize ${width}x${height}! tmp.png
composite -compose atop -geometry +$x1+$border screenshots/bluetooth-popup-2.png tmp.png tmp.png
composite -compose atop -geometry +$x2+$border screenshots/bluetooth-popup-1.png tmp.png tmp.png
composite -compose atop -geometry +$x3+$border screenshots/bluetooth-icon.png tmp.png tmp.png
convert tmp.png -pointsize 15 -font /usr/share/fonts/truetype/msttcorefonts/verdana.ttf -annotate +$textx1+$texty 'Connection lost' tmp.png
convert tmp.png -pointsize 15 -font /usr/share/fonts/truetype/msttcorefonts/verdana.ttf -annotate +$textx2+$texty 'Connection regained' tmp.png
convert tmp.png -pointsize 15 -font /usr/share/fonts/truetype/msttcorefonts/verdana.ttf -annotate +$textx3+$texty 'No connection' tmp.png
mv tmp.png screenshots/bluetooth.png

textx1=$((12+x1))
textx2=$((1+x2))
textx3=$((-11+x3))

# date
convert data/white.png -background white -resize ${width}x${height}! tmp.png
composite -compose atop -geometry +$x1+$border screenshots/main.png tmp.png tmp.png
composite -compose atop -geometry +$x2+$border screenshots/date-1.png tmp.png tmp.png
composite -compose atop -geometry +$x3+$border screenshots/date-2.png tmp.png tmp.png
convert tmp.png -pointsize 15 -font /usr/share/fonts/truetype/msttcorefonts/verdana.ttf -annotate +$textx1+$texty 'Normal position' tmp.png
convert tmp.png -pointsize 15 -font /usr/share/fonts/truetype/msttcorefonts/verdana.ttf -annotate +$textx2+$texty 'Date moved to left' tmp.png
convert tmp.png -pointsize 15 -font /usr/share/fonts/truetype/msttcorefonts/verdana.ttf -annotate +$textx3+$texty 'Date moved to right' tmp.png
mv tmp.png screenshots/date.png
