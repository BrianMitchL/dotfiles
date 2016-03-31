export PATH=/usr/local/bin:$PATH
export CLICOLOR=1
export TERM="xterm-color"
export LSCOLORS=Exfxcxdxbxegedabagacad
export GREP_OPTIONS='--color=always'

export PS1="\[\e[00;37m\][\u@\h \[\e[0m\]\[\e[00;33m\]\w\[\e[0m\]\[\e[00;37m\]]\\$ \[\e[0m\]"

alias ll='ls -lah'

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

eval "$(thefuck --alias)"

alias lscleanup="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder"
