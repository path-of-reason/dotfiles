function fzf-find() {
	local  selected_file
	selected_file=$(find . -type f |  fzf  --multi  --no-sort  --cycle  \
		--preview='echo {}' \
		--preview-window down:10% \
		--layout='reverse-list' \
		# --color bg:#222222, preview-bg:#333333\
	) && $EDITOR  "$selected_file"
}

alias fzfind='fzf-find'

function find_and_nvim() {
  local selected_file
  selected_file=$(fzf --preview 'bat --color=always --line-range :500 {}' \
                      --prompt "Search for file to open with Nvim: " \
                      --height=40% \
                      --layout=reverse \
                      --bind "enter:execute(nvim {} &>/dev/tty < /dev/tty)+abort" \
                      --print-query \
                      --ansi) # ANSI 색상 출력을 허용

  # 만약 Enter 대신 Ctrl-C 등으로 fzf를 종료하면 selected_file은 비어있을 수 있습니다.
  # 여기서는 fzf 내에서 nvim이 실행되고 fzf가 종료되므로, 이 스크립트 라인은
  # 거의 실행되지 않거나, 실행되더라도 selected_file이 비어있을 가능성이 높습니다.
  # 핵심은 --bind "enter:execute(nvim {} ...)" 부분입니다.
}

# 이 함수를 `nvf` 처럼 짧은 별칭으로 사용하거나 키 바인딩에 연결할 수 있습니다.
alias vf='find_and_nvim'
