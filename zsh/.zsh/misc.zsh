# show execution time if command takes more than
export REPORTTIME=5
export TIMEFMT="%*Es total, %U user, %S system, %P cpu"
export KEYTIMEOUT=1

# cursor's color based on zsh's vi mode 
INSERT_PROMPT="white"
COMMAND_PROMPT="red"
# helper for setting color including all kinds of terminals
set_prompt_color() {
    if [[ $TERM = "linux" ]]; then
        # nothing
    elif [[ $TMUX != '' ]]; then
        printf '\033Ptmux;\033\033]12;%b\007\033\\' "$1"
    else
        echo -ne "\033]12;$1\007"
    fi
}
zle-keymap-select () {
    if [ $KEYMAP = vicmd ]; then
        set_prompt_color $COMMAND_PROMPT
    else
        set_prompt_color $INSERT_PROMPT
    fi
}
zle-line-finish() {
    set_prompt_color $INSERT_PROMPT
}
zle-line-init () {
    zle -K viins
    set_prompt_color $INSERT_PROMPT
}
zle -N zle-keymap-select
zle -N zle-line-init
zle -N zle-line-finish



autoload -Uz compinit && compinit
autoload -Uz compinit select-word-style promptinit



[[ -r ~/.dircolors ]] && eval `dircolors  ~/.dircolors`
