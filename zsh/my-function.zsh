function  fzf-find() {
	local  selected_file
	selected_file=$(find . -type f |  fzf  --multi  --no-sort  --cycle  \
		--preview='echo {}' \
		--preview-window down:10% \
		--layout='reverse-list' \
		# --color bg:#222222, preview-bg:#333333\
	) && $EDITOR  "$selected_file"
}

alias fzfind='fzf-find'
