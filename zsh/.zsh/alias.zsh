alias l='ls -rt --color=always'
alias ll='ls -lrt -F --color=always '
alias la='ls -la --color=always'


[[ -x `which ranger` ]] && alias r=ranger
[[ -x `which nvim` ]] && alias vim=nvim

alias ...='cd ../../..'
alias ....='cd ../../../..'

alias sudo='sudo '

alias pacman='sudo pacman --color=always'

alias calc='python -i -c "from math import *"'

alias sortnr='sort -nr'

alias p='|most'

alias feh='feh --draw-filename'

take () {
  mkdir "$1"
  cd "$1"
}


tt () {
    date +$fmr;
}

ww () {
    date +"$fmr"
}

jj () { echo `date +"$fmr"` }

alias sharehttp='python2 -m SimpleHTTPServer 28088'

alias daysfrom='echo "(`date "+%s"`-`date -d "2016-12-12" "+%s"`)/(60*60*24)"|bc'


# ZMX
if command -v zmx >/dev/null 2>&1; then
  alias zl='zmx list'
  alias zls='zmx list --short'

if command -v fzf >/dev/null 2>&1; then
    zmx-select() {
      local display
      display=$(zmx list 2>/dev/null | while IFS=$'\t' read -r name pid clients created dir; do
      name=${name#session_name=}
      pid=${pid#pid=}
      clients=${clients#clients=}
      dir=${dir#started_in=}
      printf "%-20s  pid:%-8s  clients:%-2s  %s\n" "$name" "$pid" "$clients" "$dir"
    done)

    local output query key selected session_name
    output=$({ [[ -n "$display" ]] && echo "$display"; } | fzf \
      --bind 'ctrl-n:down,ctrl-p:up' \
      --print-query \
      --expect=ctrl-t \
      --height=80% \
      --reverse \
      --prompt="zmx> " \
      --header="Enter: select | Ctrl-t: create new" \
      --preview='zmx history {1}' \
      --preview-window=right:60%:follow \
    )
    local rc=$?

    query=$(echo "$output" | sed -n '1p')
    key=$(echo "$output" | sed -n '2p')
    selected=$(echo "$output" | sed -n '3p')

    if [[ "$key" == "ctrl-t" && -n "$query" ]]; then
      session_name="$query"
    elif [[ $rc -eq 0 && -n "$selected" ]]; then
      session_name=$(echo "$selected" | awk '{print $1}')
    elif [[ -n "$query" ]]; then
      session_name="$query"
    else
      return 130
    fi

    zmx attach "$session_name"
  }
fi

fi


#ipptool -tv -f example-abstract.pdf http://raspberry.local:631/printers/x3 printfile.ipp
#printfile.ipp: { OPERATION Print-Job \n GROUP operation-attributes-tag \n ATTR charset attributes-charset utf-8 \n ATTR language attributes-natural-language en \n ATTR uri printer-uri $uri \n FILE $filename }
