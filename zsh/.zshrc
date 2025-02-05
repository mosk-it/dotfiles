export ZSH_CONF_PATH=$HOME/.zsh

bindkey -v


source $ZSH_CONF_PATH/env.zsh
source $ZSH_CONF_PATH/zle.zsh
source $ZSH_CONF_PATH/config.zsh
source $ZSH_CONF_PATH/misc.zsh
source $ZSH_CONF_PATH/alias.zsh

source $ZSH_CONF_PATH/completion.zsh

source $ZSH_CONF_PATH/zsh-autosuggestions/zsh-autosuggestions.zsh

export XDG_CONFIG_HOME=$HOME/.config
