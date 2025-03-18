set -o emacs
alias ll='ls -lart --color=auto'



# (white ) '@'
# (yellow) number of bgjobs if any
# (red   ) user
# (blue  ) pwd
PS1="\$(if [ \j -gt 0 ]; then echo \"\[\033[01;33m\]\j \"; fi)\[\033[01;31m\]\h\[\033[01;34m\] \w \$\[\033[00m\] "
