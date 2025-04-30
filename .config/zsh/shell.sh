export NODE_OPTIONS=--max_old_space_size=4096
source "$HOME/.config/zsh/scripts.sh"

eval "$(starship init zsh)"

alias neofetch="fastfetch -l ~/neko1.jpeg --logo-type iterm --logo-width 40 --logo-height 20 --logo-padding-top 3 --logo-padding-left 4"

unameOut="$(uname -s)"

if [ $unameOut = "Linux" ]; then
  echo "Loading nvm for linux"
  export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
else
  echo "Loading nvm for macos"
  export NVM_DIR="$HOME/.nvm"
    [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
    [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
fi
