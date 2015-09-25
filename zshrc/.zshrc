# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory autocd beep extendedglob nomatch notify HIST_IGNORE_DUPS completealiases prompt_subst

bindkey -v
# Kill the lag
export KEYTIMEOUT=1

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/awen/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

autoload -U colors && colors

autoload -U promptinit
promptinit

cdParentKey() {
  pushd .. > /dev/null
  zle      reset-prompt
  echo
  ls
  echo
}

vim_ins_mode="%{$fg[green]%}[INC]%{$reset_color%}"
vim_cmd_mode="%{$fg[red]%}[N]%{$reset_color%}"
vim_mode=$vim_ins_mode


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


bindkey '^R' history-incremental-search-backward




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


zle-keymap-select () {
    if [ $KEYMAP = vicmd ]; then
        echo -ne "\033]12;Red\007"
    else
        echo -ne "\033]12;Grey\007"
    fi
}


zle -N zle-keymap-select
zle-line-init () {
    zle -K viins
    echo -ne "\033]12;Grey\007"
}
zle -N zle-line-init
bindkey -v


function git_prompt {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "[g:"${ref#refs/heads/}"]"
}


export PS1="%{$fg[cyan]%}%n%{$reset_color%}@%{$fg[cyan]%}%m%{$reset_color%}% :%{$fg_no_bold[yellow]%}%d %{$reset_color%}
→ %"

_lineup=$'\e[1A'
_linedown=$'\e[1B'

#RPROMPT="$(__git_prompt)"
export RPS1='$(__git_prompt)'
#aliases
alias l='ls --color=auto'
alias ll='ls -l --color=auto'
alias la='ls -la --color=auto'
alias lr='ls -ltr --color=auto'

alias ...='cd ../../..'
alias ....='cd ../../../..'

alias sudo='sudo '
#alias fuck='sudo $(fc -ln -1)'
alias rmf='rm -rf'

alias mpv='mpv --sub-scale=0.5 --sub-text-border-color=\#111111  --sub-text-font="FreeSans" --sub-text-bold="yes" --sub-codepage=enca:pl:cp1250'



KEYTIMEOUT=1


#eval "$(thefuck-alias fuck)"
eval `dircolors ~/.dircolors`
