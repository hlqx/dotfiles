#!/usr/bin/env sh

BASEDIR="$HOME/.cry"
LOCKDIR="$BASEDIR/scripts/locker"

i3lock \
-c 000000 \
-i "$LOCKDIR"/final.png \
-s fill \
--layoutcolor=00000000 \
--linecolor=00000000 \
--verifcolor=00000000 \
--wrongcolor=00000000 \
--pass-media-keys \
--pass-power-keys \
--insidevercolor=00000000 \
--insidewrongcolor=00000000 \
--insidecolor=00000000 \
--ringwrongcolor=F47C7CFF \
--ringvercolor=F7F48BFF \
--ringcolor=FFFFFFFF \
--keyhlcolor=A1DE93FF \
--bshlcolor=A1DE93FF \
--radius 40 \
--pass-media-keys \
--pass-power-keys \
--ring-width 5
