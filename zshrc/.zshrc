# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=50000
SAVEHIST=50000
setopt appendhistory autocd beep extendedglob nomatch notify HIST_IGNORE_DUPS completealiases prompt_subst 
# multiple shells history
setopt inc_append_history share_history

# Kill the lag
export KEYTIMEOUT=1


# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/awen/.zshrc'

autoload -Uz compinit
compinit
autoload -Uz compinit select-word-style promptinit colors


autoload -Uz colors && colors


bindkey -v




backward-kill-word () {
  local WORDCHARS="${WORDCHARS:s#/#}"
  zle backward-delete-word
}



bindkey "^P" up-history
# bindkey '^P' 

bindkey '^r' history-incremental-search-backward
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward

bindkey -a G end-of-buffer-or-history

bindkey '^r' history-incremental-search-backward


bindkey '^r' history-incremental-search-backward

zle -N backward-kill-word

bindkey -M visual 'U' up-case-word
bindkey -M visual 'u' down-case-word







autoload -U promptinit
promptinit

cdParentKey() {
    pushd .. > /dev/null
    zle      reset-prompt
    echo
    ls
    echo
}




bindkey '^A' beginning-of-line
bindkey '^E' end-of-line


bindkey '^F' forward-char
bindkey '^B' backward-char


__git_prompt() {
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


useful-enter () {
    if [[ -z $BUFFER ]]; then
        echo ""
        if [[ -d .git ]]; then
            git status
        else
            ls -CFl --color=auto
        fi
        zle redisplay
    else
        zle accept-line
    fi
}
zle -N useful-enter
bindkey "^M" useful-enter




function git_prompt {
ref=$(git symbolic-ref HEAD 2> /dev/null) || return
echo "[g:"${ref#refs/heads/}"]"
}


export PS1="%{$fg[cyan]%}%n%{$reset_color%}@%{$fg[cyan]%}%m%{$reset_color%}% :%{$fg_no_bold[yellow]%}%d %{$reset_color%}
→ %"

function zle-line-init zle-keymap-select {
VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
PS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/}$(git_custom_status) $EPS1"
PS1="%{$fg[cyan]%}%n%{$reset_color%}@%{$fg[cyan]%}%m%{$reset_color%}% :%{$fg_no_bold[yellow]%}%d %{$reset_color%}
${$VIM_PROMPT}→ %"
zle reset-prompt
}


_lineup=$'\e[1A'
_linedown=$'\e[1B'

#RPROMPT="$(__git_prompt)"
export RPS1='$(__git_prompt)'
#aliases
#
#
alias l='ls -N --color=always'
alias ll='ls -N -lrt --group-directories-first --color=always '
alias la='ls -N -la --color=always'
alias vim=nvim






alias ...='cd ../../..'
alias ....='cd ../../../..'

alias sudo='sudo '
#alias fuck='sudo $(fc -ln -1)'
alias rmf='rm -rf'

alias mpv='mpv --sub-scale=0.5 --sub-text-border-color=\#111111  --sub-text-font="FreeSans" --sub-text-bold="yes" --sub-codepage=enca:pl:cp1250'

alias pacman='sudo pacman'

take () {
  mkdir "$1"
  cd "$1"
}

KEYTIMEOUT=1




zstyle -s ':completion:*:hosts' hosts _ssh_config
[[ -r ~/.ssh/config ]] && _ssh_config+=($(cat ~/.ssh/config | sed -ne 's/Host[=\t ]//p'))
zstyle ':completion:*:hosts' hosts $_ssh_config

ZLE_REMOVE_SUFFIX_CHARS=""






# cursor's color based on mode 
# urxvt (and family) accepts even #RRGGBB
INSERT_PROMPT="gray"
COMMAND_PROMPT="red"
# helper for setting color including all kinds of terminals
set_prompt_color() {
    if [[ $TERM = "linux" ]]; then
        # nothing
    elif [[ $TMUX != '' ]]; then
        printf '\033Ptmux;\033\033]12;%b\007\033\\' "$1"
    else
        echo -ne "\033]12;$1\007"
    fi
}
# change cursor color basing on vi mode
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






#DEV SURROUND
#works so far

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




