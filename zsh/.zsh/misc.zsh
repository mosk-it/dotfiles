# show execution time if command takes more than
export REPORTTIME=5
export TIMEFMT="%*Es total, %U user, %S system, %P cpu"
export KEYTIMEOUT=1


INS="white" #insert mode color prompt
COM="red" #command mode color prompt
zle-keymap-select () {
  if [ $KEYMAP = vicmd ]; then
    if [[ $TMUX = '' ]]; then
      echo -ne "\033]12;$COM\007"
    else
      printf "\033Ptmux;\033\033]12;$COM\007\033\\"
    fi
  else
    if [[ $TMUX = '' ]]; then
      echo -ne "\033]12;$INS\007"
    else
      printf "\033Ptmux;\033\033]12;$INS\007\033\\"
    fi
  fi
}
zle-line-init () {
  zle -K viins
  echo -ne "\033]12;$INS\007"
}
zle -N zle-keymap-select
zle -N zle-line-init






_tmux-command () {
    if [[ $TMUX != '' ]]; then

        echo -n "\033Ptmux;\033\033]12;yellow\007\033\\";

        if [[ $1 = 'scrollup' ]] then
            tmux copy-mode -u -e
        elif [[ $1 = 'copymode' ]] then
            tmux copy-mode
        fi
    fi
}


tmux-copymode () {
    _tmux-command copymode
}
tmux-scrollup () {
    _tmux-command scrollup
}

zle -N tmux-copymode
zle -N tmux-scrollup

bindkey '^_' tmux-copymode
bindkey -a '^_' tmux-copymode
bindkey -M vicmd '^B' tmux-scrollup
bindkey -M vicmd '^F' tmux-copymode
bindkey '^ ' tmux-copymode


[[ -r ~/.dircolors ]] && eval `dircolors  ~/.dircolors`
