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

#ipptool -tv -f example-abstract.pdf http://raspberry.local:631/printers/x3 printfile.ipp
#printfile.ipp: { OPERATION Print-Job \n GROUP operation-attributes-tag \n ATTR charset attributes-charset utf-8 \n ATTR language attributes-natural-language en \n ATTR uri printer-uri $uri \n FILE $filename }
