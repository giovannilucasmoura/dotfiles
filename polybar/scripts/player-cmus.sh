#!/bin/sh

if info=$(cmus-remote -Q 2> /dev/null); then
	status=$(echo "$info" | grep -v "set " | grep -v "tag " | grep "status " | cut -d ' ' -f 2)

	if [ "$status" = "playing" ] || [ "$status" = "paused" ] || [ "$status" = "stopped" ]; then
		title=$(echo "$info" | grep -v 'set ' | grep " title " | cut -d ' ' -f 3-)
		artist=$(echo "$info" | grep -v 'set ' | grep " artist " | cut -d ' ' -f 3-)
		album=$(echo "$info" | grep -v 'set ' | grep " album " | cut -d ' ' -f 3-)

		if [ "$artist" ] || [ "$title" ]; then
			info_string="$artist: $title - $album"

			if [ "$status" = "playing" ]; then
				info_string="▶ $info_string"
			fi
			
			if [ ${#info_string} -gt 50 ]; then
				info_string="${info_string:0:50}..."
			fi

			echo "$info_string"
		else
			echo ""
		fi
	else
		echo ""
	fi
else
	echo ""
fi
