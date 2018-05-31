export CLICOLOR=1
export TERM="xterm-color"
export LSCOLORS=Exfxcxdxbxegedabagacad
export GREP_OPTIONS='--color=always'

export PS1="[\[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;1m\]\u\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\]@\[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;3m\]\h\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;6m\]\w\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\]]\\$ \[$(tput sgr0)\]"

eval "$(thefuck --alias)"

if [ -f ~/.path ]; then
    . ~/.path
fi

if [ -f ~/.aliases ]; then
    . ~/.aliases
fi
