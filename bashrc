# Colors
gray='\e[37m'
green='\e[92m'
cyan='\e[96m'
reset='\e[0m'

# export PS1='\u@\h \w $ ' # No color
# export PS1="\u@\h \w\$(__git_ps1) $ " # No color + git
# export PS1="\[$gray\]\u@\h \[$green\]\w \[$cyan\]$\[$reset\] " # Color
export PS1="\[$gray\]\u@\h \[$green\]\w\[$reset\]\$(__git_ps1) \[$cyan\]$\[$reset\] " # Color + git

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

source ~/bash-config/git-prompt.sh # Git branch only
# source ~/bash-config/bash/git-prompt.sh # Git branch + status

source ~/bash-config/git-completion.bash # Git commands and branches auto complete
source ~/bash-config/docker-completion.bash # Docker commands auto complete
