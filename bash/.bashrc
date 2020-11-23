HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=200000
HISTFILESIZE=200000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

#Set vi mode
set -o vi

#Source profile, aliasrc and fzf.bash
[[ -f ~/.profile ]] && . ~/.profile
[[ -f ~/.aliasrc ]] && . ~/.aliasrc
[[ -f ~/.fzf.bash ]] && source ~/.fzf.bash

bat_prompt() {
    printf '%s' $(< /sys/class/power_supply/*/capacity)
}

git_prompt() {
    local branch stats
    branch="$(git branch 2>/dev/null | cut -d' ' -f2 | tr -d '\n')"
    if [[ -n "${branch}" ]]; then
        [ -n "$(git status --short)" ] && stats='+' || stats=''
        printf "[%s%s]" "${branch}" "${stats}"
    else
        printf ""
    fi
}

case $(tty) in
    /dev/tty[0-9]*)
        for i in /sys/class/power_supply/*/type; do
            [[ "$(< $i)" = 'Battery' ]] && export PS1="\[${YELLOW}\][\[${GREEN}\]\u\[${YELLOW}\]@\[${GREEN}\]\h\[${YELLOW}\]][\[${LBLUE}\]\w\[${YELLOW}\]][\[${GREEN}\]\$(bat_prompt)\[${YELLOW}\]]\[${RED}\]\$(git_prompt)\[${YELLOW}\]\$\[${RESET}\] "
        done
        ;;
    *)
        export PS1="\[${YELLOW}\][\[${GREEN}\]\u\[${YELLOW}\]@\[${GREEN}\]\h\[${YELLOW}\]][\[${LBLUE}\]\w\[${YELLOW}\]]\[${RED}\]\$(git_prompt)\[${YELLOW}\]\$\[${RESET}\] "
        ;;
esac

if ! shopt -oq posix; then
  if [[ -f /usr/share/bash-completion/bash_completion ]]; then
    . /usr/share/bash-completion/bash_completion
  elif [[ -f /etc/bash_completion ]]; then
    . /etc/bash_completion
  fi
fi

for i in ~/.config/bashrc.d/*; do
    . "${i}"
done
