export COMPOSE_DOCKER_CLI_BUILD=1
export DOCKER_BUILDKIT=1

# === aliases ===
alias ctags='/usr/local/bin/ctags'
alias matlab='/Applications/MATLAB_R2020a.app/bin/matlab -nodesktop'

alias vim=nvim
alias d=docker
alias dc=docker-compose

# fzf config
[ -f ~/.fzf.bash ] && source ~/.fzf.zsh

# extra config options
source ~/.bash_profile

