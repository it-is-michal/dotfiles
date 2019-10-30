# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

export EDITOR='vim'

# man pages coloring
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# autocomplete when sudoing
if [ "$PS1" ]; then
  complete -cf sudo
fi

# User specific aliases and functions
alias ls='ls --color=auto'
alias ll='ls -hBl --group-directories-first'
alias lla='ls -hAl --group-directories-first'
alias susu='sudo su -'
alias gitka='gitk --all &'

function pgr() {
    ps aux | grep $1 | grep -v "grep $1"
}

function mbb() {
    git co master
    git branch -f bookmark $1
    git co bookmark
}

# git branch in prompt
# source http://www.blog.project13.pl/index.php/fun/1198/terminal-heroes-display-git-branch-in-shell-prompt-ps1/
# TODO: check if it is possible to color prompt without breaking line wrapping
function formattedGitBranch {
    _branch="$(git branch 2>/dev/null | sed -e '/^\s/d' -e 's/^\*\s//')"
    test -n "$_branch" && echo -e "[$_branch]"
}
export PS1="\$(formattedGitBranch)\u@\h:\W"'\$ '

# virtualenv sugar
export VIRTUALENV_HOME=$HOME/Virtualenvs
function create_env() {
    if [ ! -d $VIRTUALENV_HOME ]; then
        echo
        echo "Virtualenv home directory does not exist."
        echo "Creating one in $VIRTUALENV_HOME."
        echo
        mkdir -p $VIRTUALENV_HOME
    fi
    (cd $VIRTUALENV_HOME;
    virtualenv --distribute --no-site-packages --prompt="{$1}" $1.env)
}

function destroy_env() {
    if [ -d $VIRTUALENV_HOME/$1.env ]; then
        echo 
        echo "Deleting $VIRTUALENV_HOME/$1.env."
        rm -rf --interactive=once $VIRTUALENV_HOME/$1.env
        echo
    else
        echo
        echo "There is no such virtual environment as \"$1\""
        echo "in $VIRTUALENV_HOME."
        echo
        echo "Did you mean:"
        ls -1 $VIRTUALENV_HOME | egrep '*env'
        echo
    fi
}

function activate_env() {
    if [ -d $VIRTUALENV_HOME/$1.env ]; then
        source $VIRTUALENV_HOME/$1.env/bin/activate
        eval "`pip completion --bash`"
    else
        echo
        echo "There is no such virtual environment as \"$1\""
        echo "in $VIRTUALENV_HOME."
        echo
        echo "Try one of:"
        ls -1 $VIRTUALENV_HOME | egrep '*env'
        echo "or create a new virutal environment."
    fi
}

alias cdv='cd $VIRTUALENV_HOME'
alias lsv='ll $VIRTUALENV_HOME'

# # setup rvm
# [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
# function _rvm_prompt {
#     [ -n "$(~/.rvm/bin/rvm-prompt)" ] && echo "<$(~/.rvm/bin/rvm-prompt)>" || echo ''
# }
# PS1="\$(_rvm_prompt)$PS1"
# [[ -r ~/.rvm/scripts/completion ]] && . ~/.rvm/scripts/completion
