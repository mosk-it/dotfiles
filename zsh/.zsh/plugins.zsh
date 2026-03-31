
source $ZSH_CONF_PATH/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

function zvm_config() {
    ZVM_CLIPBOARD_COPY_CMD='xclip'
    ZVM_CLIPBOARD_PASTE_CMD='xclip -o'
    ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
    ZVM_CLIPBOARD_COPY_CMD='xclip'
    ZVM_CLIPBOARD_PASTE_CMD='xclip -o'
    ZVM_SYSTEM_CLIPBOARD_ENABLED=true
    ZVM_ESCAPE_KEYTIMEOUT=0.01
    ZVM_VI_HIGHLIGHT_BACKGROUND=8
    ZVM_VI_HIGHLIGHT_FOREGROUND=0
    ZVM_CURSOR_STYLE_ENABLED=false
}

function zvm_after_init() {
    # ctrl-p always history up
    bindkey -M viins '^P' up-history
}

source $ZSH_CONF_PATH/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh

eval "$(zoxide init zsh)"
