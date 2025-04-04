# This config is a hodgepodge of stuff from all over
export EDITOR="vim"
export VISUAL="vim"
export GPG_TTY=$(tty)
export ZSH="$HOME/.zsh"
export ZSH_CACHE_DIR="$ZSH/cache"

# general configuration
setopt auto_cd
setopt correct
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus

## History file configuration
HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=10000

## History command configuration
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt share_history          # share command history data
setopt inc_append_history     # add commands to HISTFILE in order of execution

# completion
fpath=($ZSH/zsh-completions/src $fpath)

autoload -Uz compinit && compinit

if [[ -f $ZSH/completion.zsh ]]; then
  source $ZSH/completion.zsh
fi

# autosuggestions
if [[ -f $ZSH/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
  source $ZSH/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# key bindings
if [[ -f '$ZSH/key-bindings.zsh' ]]; then
  source '$ZSH/key-bindings.zsh'
fi

alias -- -='cd -'
alias 1='cd -'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'
function d () {
  if [[ -n $1 ]]; then
    dirs "$@"
  else
    dirs -v | head -10
  fi
}
compdef _dirs d

# colorized man pages
function colored() {
  command env \
  LESS_TERMCAP_mb=$(printf "\e[1;31m") \
  LESS_TERMCAP_md=$(printf "\e[1;31m") \
  LESS_TERMCAP_me=$(printf "\e[0m") \
  LESS_TERMCAP_se=$(printf "\e[0m") \
  LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
  LESS_TERMCAP_ue=$(printf "\e[0m") \
  LESS_TERMCAP_us=$(printf "\e[1;32m") \
  PAGER="${commands[less]:-$PAGER}" \
  _NROFF_U=1 \
  PATH="$HOME/bin:$PATH" \
    "$@"
}

function man() {
  colored man "$@"
}

# ls colors
autoload -U colors && colors
# Enable ls colors
export LSCOLORS="Gxfxcxdxbxegedabagacad"

if [[ "$OSTYPE" == (darwin|freebsd)* ]]; then
  # this is a good alias, it works by default just using $LSCOLORS
  ls -G . &>/dev/null && alias ls='ls -G'

  # only use coreutils ls if there is a dircolors customization present ($LS_COLORS or .dircolors file)
  # otherwise, gls will use the default color scheme which is ugly af
  [[ -n "$LS_COLORS" || -f "$HOME/.dircolors" ]] && gls --color -d . &>/dev/null && alias ls='gls --color=tty'
else
  # For GNU ls, we use the default ls color theme. They can later be overwritten by themes.
  if [[ -z "$LS_COLORS" ]]; then
    (( $+commands[dircolors] )) && eval "$(dircolors -b)"
  fi

  ls --color -d . &>/dev/null && alias ls='ls --color=tty' || { ls -G . &>/dev/null && alias ls='ls -G' }

  # Take advantage of $LS_COLORS for completion as well.
  zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
fi

# enable diff color if possible.
if command diff --color . . &>/dev/null; then
  alias diff='diff --color'
fi

# aliases
if [[ -f $ZSH/alias.zsh ]]; then
  source $ZSH/alias.zsh
fi

alias vizsh='vim $HOME/.zshrc'

# PATH config
# ideally, this would be in ~/.zshenv
# on macOS /usr/libexec/path_helper runs after that file, changing the order
if [[ -f /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

export PATH="/opt/homebrew/opt/node@22/bin:$PATH"

# Set an NPM_TOKEN
if [[ -f "${HOME}/.npmrc" ]]; then
  export NPM_TOKEN=$(cat "${HOME}/.npmrc" | grep //registry.npmjs.org/:_authToken | cut -d "=" -f 2)
fi

# Set a FONT_AWESOME_NPM_AUTH_TOKEN
if [[ -f "${HOME}/.farc" ]]; then
  export FONT_AWESOME_NPM_AUTH_TOKEN=$(cat "${HOME}/.farc")
fi

# 🚀 starship
if (( $+commands[starship] )); then
  eval "$(starship init zsh)"
fi

