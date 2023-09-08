#! /bin/bash
# A bash script for an advanced setup of a Wacom on Linux :
# with a grep, automatic parsing of the Wacom identifier, of the screen, of dpi and with a precision mode
# ( drawing at 1:1 scale , the tablet / the screen ) .
# Only the button layout remain custom to the model ( Intuos 3 in this example )
# and can be easily adapted with other buttons ID.
#
# Dependencies: libwacom (xsetwacom), Bash and bc for the math, xrandr
#               optional: Gnome icon, notify-send
#               ( tested/created on Mint 17.2 Cinnamon, 11/2015 )
#
# Usage: Edit the script to enter the real world size of your tablet active zone (around line 20),
#        Edit the script to get your button layout correctly setup ( around line 80),
#        Execute the script to setup the tablet. It's a toggle:
#        1. First launch, tablet will be mapped fullscreen, with ratio correction.
#        2. Second launch, tablet will setup a precision mode.
#        3. Third launch loop to 1 , etc... a toggle.
#        4. I'm using the Linux Mint settings to attribute a keybind to launch this script.
#           (the unused 'email' button on my keyboard)
#         Art usage: I like to paint with fullscreen mapping (normal) mode
#                    I like to draw with precision mode.
#        (Note: Krita does support live change of config without any observed bugs.)
#
# License: CC-0/Public-Domain/WTFPL (http://www.wtfpl.net/) license
# autor: www.peppercarrot.com

tabletstylus=$(xsetwacom --list | grep STYLUS | cut -d ' ' -f 1-5 | sed -e 's/[[:space:]]*$//')
tabletpad=$(xsetwacom --list | grep PAD | cut -d ' ' -f 1-5 | sed -e 's/[[:space:]]*$//')

xsetwacom set "$tabletpad" Button 1 "key +ctrl +z"
xsetwacom set "$tabletpad" Button 2 "key +ctrl +lshift +z"
xsetwacom set "$tabletpad" Button 3 "key e"
# xsetwacom set "$tabletpad" Button 4 "key KP_Divide" # '/' key to swap current brush preset with previous used on Krita.

# In case of Nvidia gfx:
xsetwacom set "$tabletstylus" MapToOutput "HEAD-0"
xsetwacom set "$tabletpad" MapToOutput "HEAD-0"
