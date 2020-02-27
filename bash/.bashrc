HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=200000
HISTFILESIZE=200000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

#Set vi mode
set -o vi

if [ -f ~/.aliasrc ]; then
    source ~/.aliasrc
fi
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

git_prompt() {
    local branch
    branch="$(git branch 2>/dev/null | cut -d' ' -f2 | tr -d '\n')"
    if [ -n "${branch}" ]; then
        printf " [%s]" "${branch}"
    else
        printf ""
    fi
}

export PS1='\[\033[01;34m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]$(git_prompt)\$ '

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

mcd() {
    mkdir -p "${1}"
    cd "${1}"
}

upd() {
    local pat='../'
    local course=''
    local i="${1}"
    while ((i > 0)); do
        course="${course}${pat}"
        i=$((i-1))
    done
    cd "${course}"
}

archive() {
    local archive_name="${1}"
    shift
    [ -z "${archive_name##*\.}" ] && archive_name="${archive_name}.tar.gz"
    tar -czvf "${archive_name}" "${@}"
}

extract() {
    for archive in "$@"; do
        if [ -f "${archive}" ]; then
            case "${archive}" in
                *.tar*) tar xvf "${archive}" ;;
                *.rar) rar x "${archive}" ;;
                *.bz2) bunzip  "${archive}" ;;
                *.gz) gunzip "${archive}" ;;
                *.zip) unzip "${archive}" ;;
                *.Z) uncompress "${archive}" ;;
                *.7z)  7z x "${archive}" ;;
                *) printf "don't know now to extract '%s'\n" "${archive}"
            esac
        fi
    done
}

viw() {
    vim "$(which "${1}")"
}

dug() {
    du -hx "${USENET_PATH}" 2>/dev/null | grep -P '[\d.]+G' | sort -h
}

if [ -f ~/.extrarc ]; then
    source ~/.extrarc
fi

cd || printf 'who cares\n'
