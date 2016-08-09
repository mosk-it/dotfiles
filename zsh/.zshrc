export ZSH_CONF_PATH=$HOME/.zsh


source $ZSH_CONF_PATH/function.zsh
source $ZSH_CONF_PATH/alias.zsh
source $ZSH_CONF_PATH/config.zsh
source $ZSH_CONF_PATH/completion.zsh
source $ZSH_CONF_PATH/misc.zsh

if [[ -a ~/.localzshrc ]]
then
  source ~/.localzshrc
fi

