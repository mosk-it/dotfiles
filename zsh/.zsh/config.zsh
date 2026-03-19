HISTFILE=~/.histfile
HISTSIZE=10000000
SAVEHIST=10000000

setopt auto_cd extended_glob nomatch notify chaselinks cdablevars
setopt prompt_subst no_beep interactive_comments
setopt complete_in_word completealiases always_to_end list_types
setopt appendhistory hist_ignore_space  hist_expire_dups_first
setopt inc_append_history share_history hist_reduce_blanks
setopt hash_list_all extended_history
setopt no_flowcontrol

# Kill the lag
export KEYTIMEOUT=1

autoload -Uz colors && colors

#bindkey -r "^[/"
#bindkey -M vicmd -r "/"
bindkey -r "^H" backward-delete-char


WORDCHARS='*?_~&!#$%^)}]>'




bindkey '^A' beginning-of-line
bindkey '^E' end-of-line


bindkey '^F' forward-char
bindkey '^B' backward-char








bindkey "^P" up-history
bindkey '^r' history-incremental-search-backward
bindkey '^N' down-history
#bindkey '^?' backward-delete-char
#bindkey '^h' backward-delete-char
bindkey '^w' backward-delete-word
bindkey '^u' backward-kill-line
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word

bindkey -a G end-of-buffer-or-history
bindkey -M visual 'U' up-case-word
bindkey -M visual 'u' down-case-word

[[ -n $DISPLAY ]] && (( $+commands[xclip] )) && {

  function cutbuffer() {
    zle .$WIDGET
    echo $CUTBUFFER | xclip -selection primary
  }

  zle_cut_widgets=(
    vi-backward-delete-char
    vi-change
    vi-change-eol
    vi-change-whole-line
    vi-delete
    vi-delete-char
    vi-kill-eol
    vi-substitute
    vi-yank
    vi-yank-eol
  )
  for widget in $zle_cut_widgets
  do
    zle -N $widget cutbuffer
  done

  function putbuffer() {
    zle copy-region-as-kill "$(xclip -o)"
    zle .$WIDGET
  }

  zle_put_widgets=(
    vi-put-after
    vi-put-before
  )
  for widget in $zle_put_widgets
  do
    zle -N $widget putbuffer
  done
}



TMUX_COLR='white';

[ `echo $TMUX | wc -l` -gt 1 ] && TMUX_COLR='green';



setopt prompt_subst
autoload -Uz update-status-suspended-jobs



# Color definitions
ZVM_MODE_COLORi="%{$fg[white]%}"   # insert (default)
ZVM_MODE_COLORn="%{$fg[red]%}"   # normal
ZVM_MODE_COLORv="%{$fg[green]%}"  # visual
ZVM_MODE_COLORvl="%{$fg[green]%}"    # visual-line
ZVM_MODE_COLOR=i

zvm_after_select_vi_mode() {
  case $ZVM_MODE in
    $ZVM_MODE_NORMAL)       ZVM_MODE_COLOR=n ;;
    $ZVM_MODE_INSERT)       ZVM_MODE_COLOR=i ;;
    $ZVM_MODE_VISUAL)       ZVM_MODE_COLOR=v ;;
    $ZVM_MODE_VISUAL_LINE)  ZVM_MODE_COLOR=vl ;;
  esac
  zle reset-prompt
}



PR_SEP="%b%{$fg[{$TMUX_COLR}]:%}%B";

precmd() {
  local git_info=$(git symbolic-ref --short HEAD 2>/dev/null)
  GIT_BRANCH=""
  [[ -n $git_info ]] && GIT_BRANCH="%{$fg[cyan]%}ψ[$git_info]%{$reset_color%} "

  local jobs=$(jobs -l 2>/dev/null | wc -l | tr -d ' ')
  JOBS_LIGHTNING=""
  (( jobs > 0 )) && JOBS_LIGHTNING="%{$fg[yellow]%}$(printf '⚡%.0s' {1..$jobs})%{$reset_color%} "
}

PS1=$'%{$fg[red]%}%n@%m%{$reset_color%} %{$fg[white]%}%~%{$reset_color%} %{$fg[green]%}[>_${ZMX_SESSION}]%{$reset_color%} ${GIT_BRANCH}${JOBS_LIGHTNING}'$'\n${(P)${:-ZVM_MODE_COLOR$ZVM_MODE_COLOR}}$%{$reset_color%} '




zle -N _complete_debug_generic _complete_help_generic
bindkey '^x:' _complete_debug_generic
