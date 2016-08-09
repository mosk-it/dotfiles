_useful_enter () {
    if [[ -z $BUFFER ]]; then
        echo ""
        if [[ -d .git ]]; then
            git status
        else
            ls -N -lrt -F --color=always 
        fi
        print
        zle redisplay
    else
        zle accept-line
    fi
}



_git_prompt() {
    local DIRTY="%{$fg[yellow]%}"
    local CLEAN="%{$fg[green]%}"
    local UNMERGED="%{$fg[red]%}"
    local RESET="%{$terminfo[sgr0]%}"
    git rev-parse --git-dir >& /dev/null
    if [[ $? == 0 ]]
    then
        echo -n "["
        if [[ `git ls-files -u >& /dev/null` == '' ]]
        then
            git diff --quiet >& /dev/null
            if [[ $? == 1 ]]
            then
                echo -n $DIRTY
            else
                git diff --cached --quiet >& /dev/null
                if [[ $? == 1 ]]
                then
                    echo -n $DIRTY
                else
                    echo -n $CLEAN
                fi
            fi
        else
            echo -n $UNMERGED
        fi
        echo -n `git branch | grep '* ' | sed 's/..//'`
        echo -n $RESET
        echo -n "]"
    fi
}



#DEV SURROUND
#https://github.com/zsh-users/zsh/blob/master/Functions/Zle/surround

# Implementation of some functionality of the popular vim surround plugin.
# Allows "surroundings" to be changes: parentheses, brackets and quotes.

# To use
   autoload -Uz surround
   zle -N delete-surround surround
   zle -N add-surround surround
   zle -N change-surround surround
   bindkey -a cs change-surround
   bindkey -a ds delete-surround
   bindkey -a ys add-surround
   bindkey -M visual S add-surround
#
#  This doesn't allow yss to operate on a line but VS will work

setopt localoptions noksharrays
autoload -Uz select-quoted select-bracketed
local before after
local -A matching
matching=( \( \) \{ \} \< \> \[ \] )

case $WIDGET in
  change-*)
    local MARK="$MARK" CURSOR="$CURSOR" call
    read -k 1 before
    if [[ ${(kvj::)matching} = *$before* ]]; then
      call=select-bracketed
    else
      call=select-quoted
    fi
    read -k 1 after
    $call "a$before" || return 1
    before="$after"
    if [[ -n $matching[$before] ]]; then
      after=" $matching[$before]"
      before+=' '
    elif [[ -n $matching[(r)[$before:q]] ]]; then
      before="${(k)matching[(r)[$before:q]]}"
    fi
    BUFFER[CURSOR]="$after"
    BUFFER[MARK+1]="$before"
    CURSOR=MARK
  ;;
  delete-*)
    local MARK="$MARK" CURSOR="$CURSOR" call
    read -k 1 before
    if [[ ${(kvj::)matching} = *$before* ]]; then
      call=select-bracketed
    else
      call=select-quoted
    fi
    if $call "a$before"; then
      BUFFER[CURSOR]=''
      BUFFER[MARK+1]=''
      CURSOR=MARK
    fi
  ;;
  add-*)
    local save_cut="$CUTBUFFER"
    zle .vi-change || return
    local save_cur="$CURSOR"
    zle .vi-cmd-mode
    read -k 1 before
    after="$before"
    if [[ -n $matching[$before] ]]; then
      after=" $matching[$before]"
      before+=' '
    elif [[ -n $matching[(r)[$before:q]] ]]; then
      before="${(k)matching[(r)[$before:q]]}"
    fi
    CUTBUFFER="$before$CUTBUFFER$after"
    zle .vi-put-after -n 1
    CUTBUFFER="$save_cut" CURSOR="$save_cur"
  ;;
esac



function zle-line-init zle-keymap-select {
    VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
    PS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/}$(git_custom_status) $EPS1"
    PS1="%{$fg[cyan]%}%n%{$reset_color%}@%{$fg[cyan]%}%m%{$reset_color%}% :%{$fg_no_bold[yellow]%}%d %{$reset_color%}
    ${$VIM_PROMPT}→ %"
    zle reset-prompt
}

# cursor's color based on vi mode 
INSERT_PROMPT="white"
COMMAND_PROMPT="red"
set_prompt_color() {
    if [[ $TERM = "linux" ]]; then
        # nothing
    elif [[ $TMUX != '' ]]; then
        printf '\033Ptmux;\033\033]12;%b\007\033\\' "$1"
    else
        echo -ne "\033]12;$1\007"
    fi
}
zle-keymap-select () {
    if [ $KEYMAP = vicmd ]; then
        set_prompt_color $COMMAND_PROMPT
    else
        set_prompt_color $INSERT_PROMPT
    fi
}
zle-line-finish() {
    set_prompt_color $INSERT_PROMPT
}
zle-line-init () {
    zle -K viins
    set_prompt_color $INSERT_PROMPT
}
zle -N zle-keymap-select
zle -N zle-line-init
zle -N zle-line-finish





