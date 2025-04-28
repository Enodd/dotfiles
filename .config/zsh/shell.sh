export ZSH="$HOME/.oh-my-zsh"
# ZSH_THEME="powerlevel10k/powerlevel10k"
#plugins=(
#  git
#  zsh-autosuggestions
#)
source $ZSH/oh-my-zsh.sh
#[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export NODE_OPTIONS=--max_old_space_size=4096
source "$HOME/.config/zsh/scripts.sh"

eval "$(starship init zsh)"

alias ls="ll"
alias neofetch="fastfetch -l ~/neko1.jpeg --logo-type iterm --logo-width 40 --logo-height 20 --logo-padding-top 3 --logo-padding-left 4"
