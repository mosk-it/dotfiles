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

# credits https://github.com/robbyrussell/oh-my-zsh/blob/master/plugins/fancy-ctrl-z/fancy-ctrl-z.plugin.zsh
fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z



autoload -U select-bracketed
for m in visual viopp; do
    for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do
        bindkey -M $m $c select-bracketed
    done
done
zle -N select-bracketed
autoload -U select-quoted
for m in visual viopp; do
    for c in {a,i}{\',\",\`}; do
        bindkey -M $m $c select-quoted
    done
done
zle -N select-quoted



# surround prefixed with space to avoid conflicts
# bindkey -M vicmd -r ' '
# autoload -Uz surround
# bindkey -M vicmd ' cs' change-surround
# bindkey -M vicmd ' ds' delete-surround

# bindkey -M vicmd 's' add-surround

# bindkey -M visual S add-surround
# zle -N delete-surround surround
# zle -N add-surround surround
# zle -N change-surround surround
autoload -Uz surround
zle -N delete-surround surround
zle -N add-surround surround
zle -N change-surround surround
bindkey -a cs change-surround
bindkey -a ds delete-surround
#bindkey -a s add-surround
#bindkey -M visual S add-surround



setopt prompt_subst
autoload -Uz vcs_info
zstyle ':vcs_info:*' actionformats \
    '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:*' formats       \
    '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{5}]%f '
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'

zstyle ':vcs_info:*' enable git cvs svn

# or use pre_cmd, see man zshcontrib
vcs_info_wrapper() {
  vcs_info
  if [ -n "$vcs_info_msg_0_" ]; then
    echo "%{$fg[grey]%}${vcs_info_msg_0_}%{$reset_color%}$del"
  fi
}
RPROMPT=$'$(vcs_info_wrapper)'




surround-fast() {

  __searching=$WIDGET

  local match mbegin mend pat1 pat2 word1 word2 ws1 ws2

   __savecursor=$CURSOR

   zle select-a-blank-word
   echo '3'
   zle vi-backward-word
   echo '5'

#   ${LBUFFER}
  # pat1=${LBUFFER%%(#b)([^[:blank:]]##)([[:blank:]]#)}
  # word1=$match[1]
  # ws1=$match[2]

  # match=()
  # pat2=${RBUFFER##(#b)(?[[:blank:]]#)([^[:blank:]]##)}
  # ws2=$match[1]
  # word2=$match[2]

  # if [[ -n $word1 && -n $word2 ]]; then
  #   LBUFFER="$pat1$word2$ws1"
  #   RBUFFER="$ws2$word1$pat2"
  # else
    zle beep
  #fi

# local _save_cut="$CUTBUFFER" REPLY

# echo $CUTBUFFER;
# echo $_save_cut
# echo $REPLY
#
# cut buffer contains the deleted text and can be modified
# CUTBUFFER="$(eval "$REPLY" <<<$CUTBUFFER)"
# CUTBUFFER=$(eval "$REPLY" <<<"$CUTBUFFER")

}


zle -N surround-fast surround-fast
bindkey -M vicmd 's' surround-fast




 
# -# Use the standard vi-delete to accept a vi motion.
# -zle .vi-delete || return
# +# force movement to default to line mode
# +zle -U V
# +# Use the standard vi-change to accept a vi motion.
# +zle .vi-change || return
#  read-from-minibuffer "!"
# +zle .vi-cmd-mode
#  local _save_cur=$CURSOR
 
#  # cut buffer contains the deleted text and can be modified
# -CUTBUFFER="$(eval $REPLY <<<$CUTBUFFER)"
# +CUTBUFFER=$(eval "$REPLY" <<<"$CUTBUFFER")
 
#  # put the modified text back in position.
