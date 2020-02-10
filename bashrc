OS=`uname -s`

# Colors.
blue='\e[38;5;117m'
green='\e[38;5;10m'
orange='\e[38;5;214m'
red='\e[38;5;196m'
yellow='\e[38;5;229m'
reset='\e[0m'
if [[ "$OS" == 'Linux' ]]; then
    export LS_COLORS='no=00:fi=00:di=38;5;117:ln=38;5;214:ex=38;5;10:';
fi

# Prompt.
# export PS1='\u@\h \w $ ' # No color
# export PS1="\u@\h \w\$(__git_ps1) $ " # No color + git
# export PS1="\[$blue\]\u \[$yellow\]\h \[$green\]\w \[$red\]$\[$reset\] " # Color
export PS1="\[$blue\]\u \[$yellow\]\h \[$green\]\w\[$orange\]\$(__git_ps1) \[$red\]$\[$reset\] " # Color + git

# Alias.
if [[ "$OS" == 'Linux' ]]; then
    alias ls='ls --color=auto'
elif [[ "$OS" == 'Darwin' ]]; then # OSX
    alias ls='ls -G'
fi
alias ll='ls -hl'
alias grep='grep --color'
alias fuck='sudo $(history -p \!\!)'

# History.
HISTCONTROL=ignoreboth # Don't put duplicate lines or lines starting with space in the history
HISTSIZE=1000
HISTFILESIZE=2000
HISTTIMEFORMAT="%d/%m/%y %T "
shopt -s histappend # Append to the history file, don't overwrite it

# Enable bash completion
if [[ -f /etc/bash_completion ]] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# Imports.
source ~/bash-config/git-prompt.sh # Git branch
source ~/bash-config/git-completion.bash # Git commands and branches auto complete
source ~/bash-config/docker-completion.bash # Docker commands auto complete

# Default files and dirs permissions.
umask 002
