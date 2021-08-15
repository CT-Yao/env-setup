#================================================
# .zshrc
#
# - Author: Chengtao Yao
# - Email: chengtao.yao@outlook.com
# - Last Modified: 2021-08-15 23:24:35 
#
# ZSH configuration.
#================================================

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# ZSH theme.
ZSH_THEME="robbyrussell"

# oh-my-zsh plugins
plugins=(git
	zsh-autosuggestions
	zsh-syntax-highlighting
	autojump
	)

# Some alias.
alias v='nvim'

source $ZSH/oh-my-zsh.sh
