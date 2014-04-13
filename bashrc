# Bold colors
bldgrn='\e[1;32m' # Green
bldylw='\e[1;33m' # Yellow
bldblu='\e[1;34m' # Blue
bldpur='\e[1;35m' # Purple
txtrst='\e[0m'    # Text Reset
# export PS1='\u@\h \w\n$ ' # No color
# export PS1="\u@\h \w\$(__git_ps1)\n$ " # No color + git
# export PS1="\[$bldgrn\]\u@\h \[$bldblu\]\w\n\[$bldylw\]$\[$txtrst\] " # Color
export PS1="\[$bldgrn\]\u@\h \[$bldblu\]\w\[$bldpur\]\$(__git_ps1)\n\[$bldylw\]$\[$txtrst\] " # Color + git

alias ls='ls --color=auto'
alias ll='ls -l'
alias grep='grep --color'

HISTCONTROL=ignoreboth # Don't put duplicate lines or lines starting with space in the history
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s histappend # Append to the history file, don't overwrite it

# source ~/bash-config/git-prompt.sh # Git branch only
source ~/bash-config/bash/git-prompt.sh # Git branch + status

source ~/bash-config/git-completion.bash # Git commands and branches auto complete

