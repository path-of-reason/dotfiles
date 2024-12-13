# aliases
alias vim='nvim'
alias v='nvim'
alias vi='neovide'
alias vrc='nvim ~/.config/nvim/'
alias lrc='nvim ~/.config/lvim/'
alias krc='nvim ~/.config/kitty/'
alias x='exit'
alias lvim='/Users/wistaria/.local/bin/lvim'
alias c='clear'
alias rc='nvim ~/.config/zsh/'
alias s='source $HOME/.zshrc'
alias yb='yabai --start-service'
alias hk='skhd --start-service'
alias cd..='cd ..'
alias h="cd $HOME"
function mc {
  mkdir -p $1
  cd $1
}
function del {
  rm -rf $1
}
alias ip="curl -s https://checkip.org | grep -Eo '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}'"
# docker
alias d="docker"
alias dls="docker images"
alias dps="docker ps"
alias dpa="docker ps -a"
alias drun="docker run -d -p 80:80"
# kitty term
alias icat="kitten icat"
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

# lad
# unalias ls
# alias l='colorls -l'
# alias ls='colorls -l' # 폴더만 보기
# alias ll='colorls -l' # list
# alias lf='colorls -f' # files
# alias ld='colorls -d' # directory
# alias la='colorls -a' # all
# alias lla='colorls -la' # list all
# alias lt='colorls --tree'

alias ll='lsd -l' # list
alias lf='lsd -f' # files
alias la='lsd -a' # all
alias lla='lsd -la' # list all
alias lt='lsd --tree'
alias ltd='lsd --tree -d'
alias ld='lsd --tree -d'

# python3
alias py='python3'
alias pip='pip3'
alias pipi='pip install -r requirements.txt'
alias whichpy='which python3' # 가상환경 뭐쓰는지 확인하기
alias pyinit='python3 -m venv .venv' # 가상환경 생성하기. 뒤에 이름
alias pyactivate='source .venv/bin/activate' # 가상환경 폴더가서 실행하면 해당 가상환경 진입
# deactivate -- 가상환경 종료

# displayplacer : homebrew app
alias dp='displayplacer'
