HISTFILE=~/.histfile
HISTSIZE=50000
SAVEHIST=50000

setopt autocd extendedglob nomatch notify chaselinks
setopt prompt_subst no_beep no_flowcontrol interactive_comments
setopt complete_in_word completealiases always_to_end list_types
setopt appendhistory hist_ignore_space extended_history hist_ignore_dups
setopt inc_append_history share_history histverify
setopt hash_list_all 


# Kill the lag
export KEYTIMEOUT=1

autoload -Uz colors && colors

bindkey -v

WORDCHARS='*?_~&!#$%^)}]>'




export PS1="%{$fg_bold[red]%}%n%{$reset_color%}@%{$fg_bold[red]%}%m%{$reset_color%}% :%{$fg_no_bold[yellow]%}%d %{$reset_color%}
→ %"

#ugly fix for right line alignment
_lineup=$'\e[1A'
_linedown=$'\e[1B'
export RPS1='$(_git_prompt)'



zle -N _useful_enter
bindkey "^M" _useful_enter

bindkey '^A' beginning-of-line
bindkey '^E' end-of-line


bindkey '^F' forward-char
bindkey '^B' backward-char


bindkey "^P" up-history
bindkey '^r' history-incremental-search-backward
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-delete-word
bindkey '^u' backward-kill-line
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word

bindkey -a G end-of-buffer-or-history
bindkey -M visual 'U' up-case-word
bindkey -M visual 'u' down-case-word
