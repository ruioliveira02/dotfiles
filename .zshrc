# ASDF
export PATH="$HOME/go/bin:$PATH"
export ASDF_DATA_DIR=$HOME/.asdf
export PATH="${ASDF_DATA_DIR}/shims:$PATH"
mkdir -p "${ASDF_DATA_DIR}/completions"
asdf completion zsh > "${ASDF_DATA_DIR}/completions/_asdf"
fpath=(${ASDF_DATA_DIR}/completions $fpath)

# Custom setup
source ${HOME}/.config/zsh/completions.zsh
source ${HOME}/.config/zsh/prompt.zsh
source ${HOME}/.config/zsh/bindings.zsh
source ${HOME}/.config/zsh/dirstack.zsh
source ${HOME}/.config/zsh/vim.zsh
source ${HOME}/.config/zsh/git.zsh

source <(fzf --zsh)


# ICPC compilation flags
alias myg++='g++ -g -x c++ -Wall -Wextra -O0 -std=gnu++20  -pipe "$@"'

# Confirm removal
alias rm="rm -i"

# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit

eval "$(zoxide init zsh)"

alias docker-compose="docker compose"

