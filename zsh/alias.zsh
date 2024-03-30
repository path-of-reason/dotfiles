
# aliases
alias ls='colorls'
alias vim='nvim'
alias vimset='nvim ~/.config/nvim/init.lua'
alias x='exit'
alias :q='exit'
alias lvim='/Users/wistaria/.local/bin/lvim'
alias c='clear'
alias rc='lvim ~/.config/zsh/'
alias s='source $HOME/.zshrc'
alias yb='yabai --start-service'
alias hk='skhd --start-service'
alias cd..='cd ..'
alias h="cd $HOME"
function mc {
  mkdir -p $1
  cd $1
}
function d {
  rm -rf $1
}
alias ip="curl -s https://checkip.org | grep -Eo '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}'"
# node pkg manager

alias pn="pnpm"
alias y="yarn"

# git
alias ga="git add ."
alias gc="git commit -m"
alias gps="git push"
alias gpl="git pull"
alias gch="git checkout"
alias gb="git branch"
