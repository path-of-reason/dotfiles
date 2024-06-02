function urlencode() {
  local length="${#1}"
  for (( i = 1; i <= length; i++ )); do
    local c="${1[i]}"
    case "$c" in
      [a-zA-Z0-9.~_-]) printf '%s' "$c" ;;
      *) printf '%%%02X' "'$c" ;;
    esac
  done
}

function web_search() {
  emulate -L zsh

  # define search engine URLs
  typeset -A urls
  urls=(
    $ZSH_WEB_SEARCH_ENGINES
    google          "https://www.google.com/search?q="
    bing            "https://www.bing.com/search?q="
    brave           "https://search.brave.com/search?q="
    duckduckgo      "https://www.duckduckgo.com/?q="
    yandex          "https://yandex.ru/yandsearch?text="
    github          "https://github.com/search?q="
    stackoverflow   "https://stackoverflow.com/search?q="
    youtube         "https://www.youtube.com/results?search_query="
  )

  # check whether the search engine is supported
  if [[ -z "$urls[$1]" ]]; then
    echo "Search engine '$1' not supported."
    return 1
  fi

  # search or go to main page depending on number of arguments passed
  if [[ $# -gt 1 ]]; then
    # build search url:
    # join arguments passed with '+', then append to search engine URL
    local query="$(urlencode "${@:2}")"
    url="${urls[$1]}$query"
  else
    # build main page url:
    # split by '/', then rejoin protocol (1) and domain (2) parts with '//'
    url="${(j://:)${(s:/:)urls[$1]}[1,2]}"
  fi

  # Open the URL in the default web browser
  open "$url"
}

alias bing='web_search bing'
alias google='web_search google'
alias ddg='web_search duckduckgo'
alias yandex='web_search yandex'
alias github='web_search github'
alias stackoverflow='web_search stackoverflow'
alias tube='web_search youtube'

#add your own !bang searches here
alias wiki='web_search duckduckgo \!w'
alias news='web_search duckduckgo \!n'
alias map='web_search duckduckgo \!m'
alias image='web_search duckduckgo \!i'
alias ducky='web_search duckduckgo \!'

# other search engine aliases
if [[ ${#ZSH_WEB_SEARCH_ENGINES} -gt 0 ]]; then
  typeset -A engines
  engines=($ZSH_WEB_SEARCH_ENGINES)
  for key in ${(k)engines}; do
    alias "$key"="web_search $key"
  done
  unset engines key
fi
