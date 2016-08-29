export ZSH_CONF_PATH=$HOME/.zsh

bindkey -v
source $ZSH_CONF_PATH/zle.zsh
source $ZSH_CONF_PATH/config.zsh
source $ZSH_CONF_PATH/misc.zsh
source $ZSH_CONF_PATH/alias.zsh
source $ZSH_CONF_PATH/completion.zsh

if [[ -a ~/.localzshrc ]]
then
  source ~/.localzshrc
fi

if [[ $1 == eval ]]
then
    "$@"
set --
fi
