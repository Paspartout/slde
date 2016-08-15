#!/bin/sh
# notify: notify the user using dzen

die() {
	echo $* 1>&2
	exit 1
}

test -z "$(command -v dzen2)" && die 'error: no dzen2 program found'

case $# in
0)	echo 'usage: notify [-e|-w|-i|-s] text' 1>&2; exit 1
esac

seconds=5

# colors
col_err='#base08'
col_warn='#base09'
col_info='#base0C'
col_success='#base0B'

# default color is info
color=$col_info

case $1 in
-e)	color=$col_err ; shift ;;
-w)	color=$col_warn ; shift ;;
-i)	color=$col_info ; shift ;;
-s)	color=$col_success ; shift ;;
esac

# position msg at top right screen
rwh=$(wattr wh $(lsw -r))
rw=${rwh% *}
rh=${rwh#* }
w=400
h=100
barh=25 # height of top bar

x=$(($rw - $w))
y=$barh


echo "$*" |
dzen2 -y $y -x $x -w $w -h $h \
-bg $color -fg '#FAFAFA' \
-p $seconds \
-fn "Source Sans Pro:pixelsize=20" \
-e 'button3=exit;button1=exit'
