alias dcls="docker container ls"
alias dclsa="docker container ls -a"
alias ll="ls -la"

ds() {
  docker start $1 > /dev/null
}

dsp() {
  docker stop $1 > /dev/null
}

update() {
  brew update
  brew upgrade
}

alias dev="cd $HOME/Development/"

autoload -U add-zsh-hook
load-nvmrc() {
  local nvmrc_path="$(nvm_find_nvmrc)"
  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")
    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$(nvm version)" ]; then
      nvm use
    fi
  elif [ -n "$(PWD=$OLDPWD nvm_find_nvmrc)" ] && [ "$(nvm version)" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
} 

add-zsh-hook chpwd load-nvmrc
load-nvmrc
