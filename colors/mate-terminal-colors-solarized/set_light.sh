#!/usr/bin/env bash

dir=`dirname $0`

PROFILE=${1:-Default}

# set palette
mateconftool-2 -s -t string /apps/mate-terminal/profiles/$PROFILE/palette `cat $dir/colors/palette`

# set highlighted color to be different from foreground-color
mateconftool-2 -s -t bool /apps/mate-terminal/profiles/$PROFILE/bold_color_same_as_fg false

# set foreground to base00 and background to base3 and highlight color to
# base01
mateconftool-2 -s -t string /apps/mate-terminal/profiles/$PROFILE/background_color `cat $dir/colors/base3`
mateconftool-2 -s -t string /apps/mate-terminal/profiles/$PROFILE/foreground_color `cat $dir/colors/base00`
mateconftool-2 -s -t string /apps/mate-terminal/profiles/$PROFILE/bold_color `cat $dir/colors/base01`

# make sure the profile is set to not use theme colors
mateconftool-2 -s -t bool /apps/mate-terminal/profiles/$PROFILE/use_theme_colors false