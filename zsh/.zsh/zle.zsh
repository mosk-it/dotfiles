
# _useful_enter () {
#     if [[ -z $BUFFER ]]; then
#         echo ""
#         if [[ -d .git ]]; then
#             git status
#         else
#             ls -N -lrt -F --color=always 
#         fi
#         print
#         zle redisplay
#     else
#         zle accept-line -w
#     fi
# }

# zle -N _useful_enter
# bindkey "^M" _useful_enter


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
bindkey -M vicmd -r ' '
autoload -Uz surround
bindkey -M vicmd ' cs' change-surround
bindkey -M vicmd ' ds' delete-surround
bindkey -M vicmd ' ys' add-surround
bindkey -M visual S add-surround
zle -N delete-surround surround
zle -N add-surround surround
zle -N change-surround surround



#precmd_functions+=(omz_termsupport_precmd)
#preexec_functions+=(count_jobs_in_background)
