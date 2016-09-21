alias l='ls -N --color=always'
alias ll='ls -N -lrt -F --color=always '
alias la='ls -N -la --color=always'


[[ -x `which ranger` ]] && alias r=ranger
[[ -x `which nvim` ]] && alias vim=nvim


alias orm=/usr/bin/rm
alias frm=/usr/bin/rm
alias rm="safe-rm"


alias ...='cd ../../..'
alias ....='cd ../../../..'

alias sudo='sudo '

alias pacman='sudo pacman --color=always'

alias calc='python -i -c "from math import *"'

alias sh="PS1='\u@\h:`pwd`# ' sh"


alias "ls -l"=abc


alias sortnr='sort -nr'

alias p='|most'


take () {
  mkdir "$1"
  cd "$1"
}








#ipptool -tv -f example-abstract.pdf http://raspberry.local:631/printers/x3 printfile.ipp
#printfile.ipp: { OPERATION Print-Job \n GROUP operation-attributes-tag \n ATTR charset attributes-charset utf-8 \n ATTR language attributes-natural-language en \n ATTR uri printer-uri $uri \n FILE $filename }
