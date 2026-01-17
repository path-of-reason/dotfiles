# Zap
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"

plug "zsh-users/zsh-syntax-highlighting"
plug "zsh-users/zsh-autosuggestions"
plug "hlissner/zsh-autopair"

# 슈퍼차지
## cd 키워드 없이 폴더이동 가능, 
## git c등 명령어 이후 탭키 누르면 리스트업됨
plug "zap-zsh/supercharge"

# 단축키 알림 메시지
plug "MichaelAquilina/zsh-you-should-use"

# zoxide
plug "agkozak/zsh-z"

# plug "zap-zsh/exa"
# colorls사용해서 필요없을듯
# exa 를 오버라이드해서 tree ls로 변환, 아이콘 보여줌
# brew install exa 필요

plug "zap-zsh/fzf"
plug "Aloxaf/fzf-tab"
plug "Freed-Wu/fzf-tab-source"
# 퍼지파인더 이거쓰면 Nvimtree 안부러움
# brew install fzf필요
# 기본 파인더 find -> fd
export FZF_DEFAULT_COMMAND="fd"
# 히스토리 사용시 라인넘버 숨기기
export FZF_CTRL_R_OPTS="
--preview 'bat {}'
--preview-window 'down:2:wrap' #보여주기형식
--bind 'ctrl-y:execute-silent(bat -n {2..} | pbcopy)+abort' # Ctrl-y 복사하기
--header '<Ctrl-Y> 커맨드 복사하기'
--exact
--expect=ctrl-x
"
#zshrc 파일


# oh my zsh plugins
plugins=(
	git
	nvm
)



