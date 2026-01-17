# fif [search text]
function fts() {
  rg --files-with-matches --no-messages $2 "$1" | fzf\
  --border\
  --height 80%\
  --extended\
  --ansi\
  --reverse\
  --cycle\
  --header 'Full Text Search'\
  --bind 'f1:execute(less -f {}),ctrl-y:execute-silent(echo {} | pbcopy)+abort'\
  --bind 'ctrl-k:preview-up,ctrl-j:preview-down'\
  --bind 'ctrl-u:half-page-up,ctrl-d:half-page-down'\
  --bind '?:toggle-preview,alt-w:toggle-preview-wrap'\
  --bind 'ctrl-v:execute(v {} >/dev/tty </dev/tty)'\
  --preview "bat --theme='OneHalfDark' --style=numbers --color=always {} | rg --colors 'match:bg:yellow' --ignore-case --pretty --context 10 '$1' || rg --ignore-case --pretty --context 10 '$1' {}"
}

function sdt() {
  local dir
  dir=$(fd --type d --hidden --follow --exclude .git 2>/dev/null | fzf\
  --header 'Search In Directory'\
  --border\
  --height 80%\
  --extended\
  --ansi\
  --reverse\
  --cycle\
  --header 'Search Directory'\
  --bind 'ctrl-k:preview-up,ctrl-j:preview-down'\
  --bind 'ctrl-u:half-page-up,ctrl-d:half-page-down'\
  --bind "alt-s:execute(lsd {})+abort"\
  --bind '?:toggle-preview,alt-w:toggle-preview-wrap'\
  --bind 'ctrl-v:execute($EDITOR {$FZF_PATH_LOC} >/dev/tty </dev/tty)'\
  --preview 'lsd --color=always --tree --depth=2  {} | head -200 2>/dev/null'\
  --preview-window=right:50%) && cd "$dir"
}



function ktab() {
  # 첫 번째 인자를 받아 탭 이름을 설정
  if [ -z "$1" ]; then
    echo "사용법: ktab <탭 이름>"
    return 1
  fi
  # OSC 0 시퀀스로 탭 이름을 변경
  echo -e "\033]0;$1\007"
}

# 위젯 등록
zle -N ktap
zle -N sdt
zle -N fts

# 키바인딩 컨트롤 o
# bindkey '^p' sdt
# bindkey '^o' fif
