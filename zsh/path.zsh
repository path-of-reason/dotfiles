# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
export PATH="/opt/homebrew/Cellar/lua-language-server/bin:$PATH"
# jdk
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
# pnpm
export PNPM_HOME="/Users/wistaria/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"

export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"
# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# asdf 자바 홈 만들기
# export PATH="/Users/wistaria/.asdf/shims:$PATH"
# . ~/.asdf/plugins/java/set-java-home.zsh


# e.g. ~/.profile or ~/.zshrc:
. /opt/homebrew/opt/asdf/libexec/asdf.sh
# e.g. ~/.config/fish/config.fish
# source /opt/homebrew/opt/asdf/libexec/asdf.fish
# Restart your terminal for the settings to take effect.

# zsh completions have been installed to:
  # /opt/homebrew/share/zsh/site-functions

