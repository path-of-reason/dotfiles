# aliases
alias vim='nvim'
alias v='nvim'
alias vrc='nvim ~/.config/nvim/init.lua'
alias lrc='lvim ~/.config/lvim/init.lua'
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

# lad
# unalias ls
alias l='colorls -l'
alias ls='colorls -l' # 폴더만 보기
alias ll='colorls -l' # list
alias lf='colorls -f' # files
alias ld='colorls -d' # directory
alias la='colorls -a' # all
alias lla='colorls -la' # list all
alias lt='colorls --tree'

# python3
alias py='python3'
alias pip='pip3'
alias whichpy='which python3' # 가상환경 뭐쓰는지 확인하기
alias pyenv='python3 -m venv' # 가상환경 생성하기. 뒤에 이름
alias pyrun='source bin/activate' # 가상환경 폴더가서 실행하면 해당 가상환경 진입
# deactivate -- 가상환경 종료
