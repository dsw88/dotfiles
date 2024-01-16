# Turn on vim mode
bindkey -v

# Local bin scripts
export PATH=~/bin:$PATH

# history
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=10000
setopt extended_history
setopt hist_ignore_dups
setopt inc_append_history
setopt share_history

# auto-complete
autoload -Uz compinit && compinit

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

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

# Terraform aliases
alias tfi="terraform init"
alias tfp="terraform plan"
alias tfa="terraform apply"

# Other Aliases
alias la="ls -la"


# Poetry
export PATH="$HOME/.local/bin:$PATH"

# Starship
eval "$(starship init zsh)"

# exa
alias ls='exa'

# bat
alias cat='bat --theme=ansi'

