alias l='ls -N --color=always'
alias ll='ls -N -lrt -F --color=always '
alias la='ls -N -la --color=always'


[[ -x `which ranger` ]] && alias r=ranger
[[ -x `which nvim` ]] && alias vim=nvim
[[ -x `which trash` ]] && alias rm=trash


alias ...='cd ../../..'
alias ....='cd ../../../..'

alias sudo='sudo '

alias pacman='sudo pacman --color=always'

alias calc='python -i -c "from math import *"'

export LESS=iMR

take () {
  mkdir "$1"
  cd "$1"
}

#ipptool -tv -f example-abstract.pdf http://raspberry.local:631/printers/x3 printfile.ipp
#printfile.ipp: { OPERATION Print-Job \n GROUP operation-attributes-tag \n ATTR charset attributes-charset utf-8 \n ATTR language attributes-natural-language en \n ATTR uri printer-uri $uri \n FILE $filename }
