#!/usr/bin/env zsh

array=(
    $(
        perl -e '
            $json = `curl -k -L -s --compressed https://robinhood.com/us/en/stocks/VTI/`;
            if ($json =~ /"quote":\K(\{.*?\})/) {
                print "$1";
            }
        ' |
        jq -r '.adjusted_previous_close,.last_trade_price'
    )
)

change=$((
    ( (${array[2]} - ${array[1]}) / ${array[1]} ) *100
))

if [[ $change -ge 0 ]]; then 
    sketchybar --set $NAME icon.color=0xff{{ .dracula.hex.green }}
elif [[ $change -lt 0 ]]; then
    sketchybar --set $NAME icon.color=0xff{{ .dracula.hex.red }}
fi

sketchybar --set $NAME label=$(printf "%.*f\n" 2 "$change")
