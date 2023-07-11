#!/bin/sh

LY='#FFF684FF'    # light yellow
YL='#FFD301FF'    # yellow?
LB='#CAE9F5FF'    # light blue
TLB='#CAE9F588'   # transparent light blue
VTLB='#CAE9F511'  # very transparent light blue
LR='#FF6865FF'    # light red
TLR='#FF686588'   # transparent light red
VTLR='#FF686511'  # very transparent light red
DRK='#86C5D8FF'   # darker tint
BLNK='#00000000'  # blank / transparent

i3lock \
--verif-text=""           \
--wrong-text="WRONG"      \
--noinput-text="NO INPUT" \
--radius="120"            \
--ring-width="8"          \
--insidever-color=$TLB    \
--ringver-color=$VTLB     \
--insidewrong-color=$VTLR \
--ringwrong-color=$LR     \
--inside-color=$VTLB      \
--ring-color=$LB      \
--line-color=$BLNK    \
--separator-color=$YL \
--verif-color=$TLR    \
--wrong-color=$LR     \
--time-color=$LB      \
--date-color=$BLNK    \
--keyhl-color=$LY     \
--bshl-color=$LR      \
--time-pos="ix:iy+9"  \
--no-modkey-text      \
--screen 1            \
--blur 5              \
--clock               \
--time-str="%H:%M:%S"  \
