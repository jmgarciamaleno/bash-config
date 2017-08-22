# Colors
blue='\e[38;5;117m'
green='\e[38;5;10m'
yellow='\e[38;5;229m'
red='\e[38;5;196m'
reset='\e[0m'

export TERM='xterm-256color'
# export PS1='\u@\h \w $ ' # No color
# export PS1="\u@\h \w\$(__git_ps1) $ " # No color + git
# export PS1="\[$blue\]\u@\h \[$green\]\w \[$red\]$\[$reset\] " # Color
export PS1="\[$blue\]\u@\h \[$green\]\w\[$yellow\]\$(__git_ps1) \[$red\]$\[$reset\] " # Color + git

# alias ls='ls -G' # OSX
alias ls='ls --color=auto' # Ubuntu
alias ll='ls -l'
alias grep='grep --color'
alias fuck='sudo $(history -p \!\!)'

HISTCONTROL=ignoreboth # Don't put duplicate lines or lines starting with space in the history
HISTSIZE=1000
HISTFILESIZE=2000
HISTTIMEFORMAT="%d/%m/%y %T "
shopt -s histappend # Append to the history file, don't overwrite it

# Enable bash completion
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

source ~/bash-config/git-prompt.sh # Git branch
source ~/bash-config/git-completion.bash # Git commands and branches auto complete
source ~/bash-config/docker-completion.bash # Docker commands auto complete
