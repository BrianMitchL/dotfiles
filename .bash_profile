export CLICOLOR=1
export TERM="xterm-color"
export LSCOLORS=Exfxcxdxbxegedabagacad
export GREP_OPTIONS='--color=always'

export PS1="\[\e[00;37m\][\u@\h \[\e[0m\]\[\e[00;33m\]\w\[\e[0m\]\[\e[00;37m\]]\\$ \[\e[0m\]"

alias ll='ls -lah'

eval "$(thefuck --alias)"

if [ -f ~/.paths ]; then
    . ~/.paths
fi

if [ -f ~/.aliases ]; then
    . ~/.aliases
fi
