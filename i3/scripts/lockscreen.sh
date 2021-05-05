#!/bin/bash

icon="/home/mconceicao/.config/i3/.lock.png"

img=$(mktemp /tmp/XXXXXXXXXX.png)

import -window root $img

convert $img -scale 10% -scale 1000% $img
convert $img $icon -gravity center -composite $img
i3lock -u -i $img

rm $img 2>&1 > /dev/null
