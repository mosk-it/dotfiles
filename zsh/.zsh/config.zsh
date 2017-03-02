HISTFILE=~/.histfile
HISTSIZE=50000
SAVEHIST=50000

setopt auto_cd extended_glob nomatch notify chaselinks cdablevars
setopt prompt_subst no_beep no_flowcontrol interactive_comments
setopt complete_in_word completealiases always_to_end list_types
setopt appendhistory hist_ignore_space  hist_ignore_dups
setopt inc_append_history share_history hist_reduce_blanks
setopt hash_list_all extended_history

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
[ `echo $TMUX | tr $'\n' ' ' | wc -c` -gt 1 ] && TMUX_COLR='green';



update-status-suspended-jobs() {
    local jb="${(Mw)#jobstates#suspended:}"
    PR_JOBS="$(printf '%*s' "$jb" | tr ' ' '!')";
}

autoload -Uz update-status-suspended-jobs
PR_SEP="%b%{$fg[{$TMUX_COLR}]:%}%B";


PR_DATA_1="%B%{$fg[red]%}%n@%m%b";
PR_DATA_2="%{$fg[yellow]%}%d";
PR_DATA_TAIL=$'\n'"%{$reset_color%}→ ";

export PROMPT="`printf "%s" ${PR_JOBS} ${PR_DATA_1} ${PR_SEP} ${PR_DATA_2} ${PR_DATA_TAIL}`";

export RPROMPT="$(_git_prompt)" #_git_prompt declared in zle.zsh
