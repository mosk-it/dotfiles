# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory autocd beep extendedglob nomatch notify HIST_IGNORE_DUPS completealiases prompt_subst

bindkey -e
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

function git_prompt {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "("${ref#refs/heads/}")"
}

test() {
    echo $(date +"%s");
}


PROMPT="%{$fg[cyan]%}%n%{$reset_color%}@%{$fg[cyan]%}%m%{$reset_color%}% :%{$fg_no_bold[yellow]%}%d %{$reset_color%}
→ %"


_lineup=$'\e[1A'
_linedown=$'\e[1B'

RPROMPT='%{${_lineup}%}$(git_prompt)%{${_linedown}%}'

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


eval "$(thefuck-alias fuck)"
eval `dircolors ~/.dircolors`
