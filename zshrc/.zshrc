# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory autocd beep extendedglob nomatch notify HIST_IGNORE_DUPS completealiases prompt_subst

# Kill the lag
export KEYTIMEOUT=1

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/awen/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

autoload -U colors && colors

bindkey -v

bindkey '^A' beginning-of-line
bindkey '^E' end-of-line


bindkey '^F' forward-char
bindkey '^B' backward-char


autoload -U promptinit
promptinit

cdParentKey() {
    pushd .. > /dev/null
    zle      reset-prompt
    echo
    ls
    echo
}

alias vim=nvim


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
bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward



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


