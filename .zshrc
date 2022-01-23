# start command: /opt/homebrew/bin/tmux new-session -A -s 0

# shell
export SHELL="$(ps -p $$ -oargs=)"

# oh-my-zsh
export ZSH="/Users/alexsocha/.oh-my-zsh"
ZSH_THEME=""
plugins=(git)
source $ZSH/oh-my-zsh.sh
source ~/.my-zsh-theme

# docker
export COMPOSE_DOCKER_CLI_BUILD=1
export DOCKER_BUILDKIT=1

# jenv
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# aliases
alias vim=nvim
alias dc=docker-compose
alias ctags="/usr/local/bin/ctags"
alias matlab="/Applications/MATLAB_R2020a.app/bin/matlab -nodesktop"
alias ibrew="/opt/homebrew-rosetta/bin/brew"
alias izsh="/opt/homebrew-rosetta/bin/zsh"

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
