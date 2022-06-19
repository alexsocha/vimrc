# start command: /opt/homebrew/bin/tmux new-session -A -s 0

# shell
export SHELL="$(ps -p $$ -oargs=)"

# brew
export PATH="/opt/homebrew/bin:$PATH"

# oh-my-zsh
export ZSH="/Users/alexsocha/.oh-my-zsh"
ZSH_THEME=""
plugins=(git)
source $ZSH/oh-my-zsh.sh
source ~/.my-zsh-theme

# bat
export BAT_THEME="TwoDark"

# docker
export COMPOSE_DOCKER_CLI_BUILD=1
export DOCKER_BUILDKIT=1

# jenv
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# pyenv
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init --path --no-rehash)"

# nvm
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# aliases
alias vim=nvim
alias dc=docker-compose
alias ctags="/usr/local/bin/ctags"
alias matlab="/Applications/MATLAB_R2020a.app/bin/matlab -nodesktop"
alias ibrew="/opt/homebrew-rosetta/bin/brew"
alias izsh="/opt/homebrew-rosetta/bin/zsh"
alias igpg="/opt/homebrew-rosetta/bin/gpg"

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
