#
# Prompt Configuration
#
PROMPT="%F{green}%n@%m%f %B[%~]\$ %b"

# Local bin scripts
export PATH=~/bin:$PATH

#
# fzf methods
#
# fd - cd to selected directory
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# fh - repeat history
fh() {
  eval $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed -E 's/ *[0-9]*\*? *//' | sed -E 's/\\/\\\\/g')
}

#
# Set up Navi
#
_find_all_cheats() {
  unset PATH_CHEATS
  dir=$(pwd -P)
  while [ -n "$dir" ]; do
    if [ -d "$dir/.cheats" ]; then
      if [ -z "$PATH_CHEATS" ]; then
        PATH_CHEATS="$dir/.cheats"
      else
        PATH_CHEATS="$PATH_CHEATS:$dir/.cheats"
      fi
    fi
    dir=${dir%/*}
  done
  PATH_CHEATS="$PATH_CHEATS:$HOME/.navi"
  if [ -z "$PATH_CHEATS" ]; then
    printf ''
  else
    printf '%s:' "$PATH_CHEATS"
  fi
}

_call_navi() {
  local selected
  RELATIVE_CHEATS=$(_find_all_cheats)
  CUSTOM_PATH="$RELATIVE_CHEATS"
  if [ -n "$LBUFFER" ]; then
    if selected="$(printf "%s" "$(navi --path "$CUSTOM_PATH" --print --fzf-overrides '--no-select-1' --query "${LBUFFER}" </dev/tty)")"; then
      LBUFFER="$selected"
    fi
  else
    if selected="$(printf "%s" "$(navi --path "$CUSTOM_PATH" --print </dev/tty)")"; then
      LBUFFER="$selected"
    fi
  fi
  zle redisplay
}
zle -N _call_navi
bindkey '^g' _call_navi

#
# Git Aliases
#
alias gst="git status"
alias gc="git commit"
alias gco="git checkout"
alias gnb="git checkout -b"
alias ggpush="git push origin HEAD"
alias ggpull="git pull origin HEAD"


#
# Other Aliases
#
alias la="ls -la"

