#!/bin/bash

image=$(find ./wallpapers -type f | shuf | head -1)
feh --randomize --bg-scale /home/mconceicao/.config/i3/wallpapers/${image}
