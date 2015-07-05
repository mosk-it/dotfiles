# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory autocd beep extendedglob nomatch notify correct HIST_IGNORE_DUPS completealiases prompt_subst

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
alias l='ls'
alias ll='ls -l'
alias la='ls -la'
alias lr='ls -ltr'

bindkey ';5D' emacs-backward-word
bindkey ';5C' emacs-forward-word
bindkey '^b' backward-word
bindkey '^f' forward-word


export TERM='rxvt-256color'
