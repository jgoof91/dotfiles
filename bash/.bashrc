HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

if [ -f ~/.aliasrc ]; then
    . ~/.aliasrc
fi

PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

upd() { 
    local pat='../'; 
    local course=''; 
    local i="${1}"; 
    while ((i > 0)); do 
        course="${course}${pat}"; i=$((i-1)); 
    done; 
    cd "${course}"; 
}

archive() {
    local archive_name="${1}"
    shift
    [ -z "${archive_name##*\.}" ] && archive_name="${archive_name}.tar.gz"
    tar -czvf "${archive_name}" "${@}"
}

dotfiles() {
    action="${1}"
    shift
    if [ ! -d ~/.dotfiles ]; then
        if ! mkdir ~/.dotfiles; then
            printf "Error: creating .dotfiles dir failed\n"
            return
        fi
    fi
    pushd ~/.dotfiles/ >/dev/null
    case "${action}" in
        [pP]ull)
            git pull
            ;;
        [pP]ush)
            git push -u master orgin
            ;;
        [cC]ommit)
            git add .
            git commit -m "${@}"
            ;;
        [cC]lone)
            git clone git://github.com/jgoof91/dotfiles.git ~/.dotfiles
        *)
            printf "dotfiles [pull|push|commit]\n"
            ;;
    esac
    popd >/dev/null
}

cd

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
