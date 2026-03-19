[[ -r ~/.ssh/config ]] && _ssh_config+=($(cat ~/.ssh/config | sed -ne 's/Host[=\t ]//p' | grep -v '*'))

ZLE_REMOVE_SUFFIX_CHARS=""

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git

autoload -Uz compinit
_comp_path="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompdump"

[[ -d "${_comp_path:h}" ]] || mkdir -p "${_comp_path:h}"

if [[ -s "$_comp_path" && (! -f "$_comp_path" || -n "$_comp_path"(#qN.mh-24)) ]]; then
    compinit -C -d "$_comp_path"
else
    compinit -i -d "$_comp_path"
    zcompile "$_comp_path" 
fi
unset _comp_path

# === Completion styles (unchanged) ===
zstyle ':completion:*' completer _complete _approximate
zstyle ':completion:incremental:*' completer _complete 
zstyle ':completion:predict:*' completer _complete
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:cd:*' tag-order local-directories path-directories
zstyle ':completion:*:hosts' hosts $_ssh_config
zstyle ':completion:*' max-errors 0
zstyle -s ':completion:*:hosts' hosts _ssh_config
zstyle ':completion:*:warnings' format $'\e[01;31m -- NO MATCHES!! --\e[0m' 
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.cache/zsh
zstyle ':completion:*:*:vi*:*' file-sort modification
zstyle ':completion:*:*:vi*:*' ignored-patterns '*.(o|class)'
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'

# ZMX completions
if command -v zmx >/dev/null 2>&1; then
    eval "$(zmx completions zsh)" 
fi
