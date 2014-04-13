if [ "x$__GIT_PROMPT_DIR" == "x" ]
then
  __GIT_PROMPT_DIR=~/bash-config/bash
fi

# Bold colors
bldgrn='\e[1;32m' # Green
bldylw='\e[1;33m' # Yellow
bldblu='\e[1;34m' # Blue
bldpur='\e[1;35m' # Purple
bldred='\e[1;31m' # Red
bldwht='\e[1;37m' # White
txtrst='\e[0m'    # Text Reset

# Various variables you might want for your PS1 prompt instead
Time12a="\@"
PathShort="\w"

# Default values for the appearance of the prompt. Configure at will.
GIT_PROMPT_PREFIX="("
GIT_PROMPT_SUFFIX=")"
GIT_PROMPT_SEPARATOR="|"
GIT_PROMPT_BRANCH="${bldpur}"
GIT_PROMPT_STAGED="${bldred}● "
GIT_PROMPT_CONFLICTS="${bldred}✖ "
GIT_PROMPT_CHANGED="${bldblu}✚ "
GIT_PROMPT_REMOTE=" "
GIT_PROMPT_UNTRACKED="…"
GIT_PROMPT_CLEAN="${bldgrn}✔"

#PROMPT_START="$bldylw$PathShort$txtrst"
#PROMPT_END=" \n$bldwht$Time12a$txtrst $ "
PROMPT_START="\[$bldgrn\]\u@\h \[$bldblu\]\w\[$txtrst\]"
PROMPT_END="\n\[$bldylw\]$\[$txtrst\] "

function update_current_git_vars() {
    unset __CURRENT_GIT_STATUS
    local gitstatus="${__GIT_PROMPT_DIR}/git-status.py"

    _GIT_STATUS=$(python $gitstatus)
    __CURRENT_GIT_STATUS=($_GIT_STATUS)
	GIT_BRANCH=${__CURRENT_GIT_STATUS[0]}
	GIT_REMOTE=${__CURRENT_GIT_STATUS[1]}
    if [[ "." == "$GIT_REMOTE" ]]; then
		unset GIT_REMOTE
	fi
	GIT_STAGED=${__CURRENT_GIT_STATUS[2]}
	GIT_CONFLICTS=${__CURRENT_GIT_STATUS[3]}
	GIT_CHANGED=${__CURRENT_GIT_STATUS[4]}
	GIT_UNTRACKED=${__CURRENT_GIT_STATUS[5]}
	GIT_CLEAN=${__CURRENT_GIT_STATUS[6]}
}

function setGitPrompt() {
	update_current_git_vars
	set_virtualenv

	if [ -n "$__CURRENT_GIT_STATUS" ]; then
	  STATUS=" $GIT_PROMPT_PREFIX$GIT_PROMPT_BRANCH$GIT_BRANCH$txtrst"

	  if [ -n "$GIT_REMOTE" ]; then
		  STATUS="$STATUS$GIT_PROMPT_REMOTE$GIT_REMOTE$txtrst"
	  fi

	  STATUS="$STATUS$GIT_PROMPT_SEPARATOR"
	  if [ "$GIT_STAGED" -ne "0" ]; then
		  STATUS="$STATUS$GIT_PROMPT_STAGED$GIT_STAGED$txtrst"
	  fi

	  if [ "$GIT_CONFLICTS" -ne "0" ]; then
		  STATUS="$STATUS$GIT_PROMPT_CONFLICTS$GIT_CONFLICTS$txtrst"
	  fi
	  if [ "$GIT_CHANGED" -ne "0" ]; then
		  STATUS="$STATUS$GIT_PROMPT_CHANGED$GIT_CHANGED$txtrst"
	  fi
	  if [ "$GIT_UNTRACKED" -ne "0" ]; then
		  STATUS="$STATUS$GIT_PROMPT_UNTRACKED$GIT_UNTRACKED$txtrst"
	  fi
	  if [ "$GIT_CLEAN" -eq "1" ]; then
		  STATUS="$STATUS$GIT_PROMPT_CLEAN"
	  fi
	  STATUS="$STATUS$txtrst$GIT_PROMPT_SUFFIX"

	  PS1="$PYTHON_VIRTUALENV$PROMPT_START$STATUS$PROMPT_END"
	else
	  PS1="$PROMPT_START$PROMPT_END"
	fi
}

# Determine active Python virtualenv details.
function set_virtualenv () {
  if test -z "$VIRTUAL_ENV" ; then
      PYTHON_VIRTUALENV=""
  else
      PYTHON_VIRTUALENV="${BLUE}(`basename \"$VIRTUAL_ENV\"`)${txtrst} "
  fi
}

PROMPT_COMMAND=setGitPrompt
