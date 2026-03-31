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



# example function ctrl-y - edit, enter - run
fzf-cd-widget() {
  local out key dir
  out=$(find . -type d -not -path '*/.*' 2>/dev/null | \
    fzf --height 40% --reverse --expect=ctrl-y,enter)

  key=${${(f)out}[1]}
  dir=${${(f)out}[2]}

  [[ -z "$dir" ]] && return

  BUFFER="cd ${(q)dir}"

  if [[ "$key" == "ctrl-y" ]]; then
    # Ctrl-Y: Put on prompt for editing
    CURSOR=$#BUFFER
    zle reset-prompt
  else
    # Enter: Execute immediately
    zle accept-line
  fi
}
# zle -N fzf-cd-widget
# bindkey '^O' fzf-cd-widget



fzf-zoxide-widget() {
  local out key dir
  out=$(zoxide query -l | fzf --height 40% --reverse --expect=ctrl-y,enter)

  key=${${(f)out}[1]}
  dir=${${(f)out}[2]}

  [[ -z "$dir" ]] && return

  BUFFER="cd ${(q)dir}"

  if [[ "$key" == "ctrl-y" ]]; then
    # Ctrl+Y: Put on prompt for editing
    CURSOR=$#BUFFER
    zle reset-prompt
  else
    # Enter: Execute immediately
    zle accept-line
  fi
}
zle -N fzf-zoxide-widget

bindkey '^[[1;6F' fzf-zoxide-widget








fzf-zoxide-widget() {
  local out key dir
  out=$(zoxide query -l | fzf --height 40% --reverse --expect=ctrl-y,enter --bind 'ctrl-b:half-page-up,ctrl-f:half-page-down,ctrl-u:half-page-up,ctrl-d:half-page-down')

  key=${${(f)out}[1]}
  dir=${${(f)out}[2]}

  [[ -z "$dir" ]] && return

  BUFFER="cd ${(q)dir}"

  if [[ "$key" == "ctrl-y" ]]; then
    CURSOR=$#BUFFER
    zle reset-prompt
  else
    zle accept-line
  fi
}
zle -N fzf-zoxide-widget
bindkey '^O' fzf-zoxide-widget
