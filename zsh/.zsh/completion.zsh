[[ -r ~/.ssh/config ]] && _ssh_config+=($(cat ~/.ssh/config | sed -ne 's/Host[=\t ]//p' | grep -v '*'))

ZLE_REMOVE_SUFFIX_CHARS=""

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git

autoload -Uz compinit
compinit

zstyle ':completion:*' completer _complete _approximate
zstyle ':completion:incremental:*' completer _complete 
zstyle ':completion:predict:*' completer _complete
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion::complete:cd:' tag-order local-directories path-directories
zstyle ':completion:*:hosts' hosts $_ssh_config
zstyle ':completion:*' max-errors 0
zstyle -s ':completion:*:hosts' hosts _ssh_config
zstyle ':completion:*:warnings' format $'\e[01;31m -- NO MATCHES!! --\e[0m' 
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.cache/zsh
zstyle ':completion:*:*:vi*:*' file-sort modification
zstyle ':completion:*:*:vi*:*' ignored-patterns '*.(o|class)'
 zstyle ':completion:*' squeeze-slashes true

compdef _gnu_generic sort





