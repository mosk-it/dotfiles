#!/bin/bash
# ~/.local/bin/i3blocks-zram

read DATA COMPR <<< $(zramctl --noheadings /dev/zram0 2>/dev/null | awk '{print $6,$7}')
[ -z "$DATA" ] && echo "N/A" && exit

# Remove units (K/M/G/T) and normalize to MB
normalize() {
    local val=$1 unit=${1: -1}
    val=${val%[KMGT]}
    case $unit in
        K) echo $((val / 1024)) ;;
        M) echo $val ;;
        G) echo $((val * 1024)) ;;
        T) echo $((val * 1024 * 1024)) ;;
        *) echo $val ;;
    esac
}

DATA_MB=$(normalize "$DATA")
COMPR_MB=$(normalize "$COMPR")
[ "$DATA_MB" -eq 0 ] && echo "0M" && exit

RATIO=$(echo "scale=1; $DATA_MB / $COMPR_MB" | bc 2>/dev/null || echo "?")

# Color by pressure
[ "$DATA_MB" -gt 3072 ] && COLOR="#ff5555"      # >75% full
[ "$DATA_MB" -gt 2048 ] && COLOR="#f1fa8c"      # >50% full
[ "$DATA_MB" -le 2048 ] && COLOR="#50fa7b"      # <50%

echo "${COMPR_MB}M/${DATA_MB}M (${RATIO}x)"
echo
echo "$COLOR"
