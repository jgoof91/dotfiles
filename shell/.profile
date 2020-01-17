export LANG="en_US.UTF-8"
export BROWSER="lynx"
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
export STOW_DIR=~/.dotfiles
export TERM=xterm-256color

#The XDG env vars
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CONFIG_DIRS="/etc/xdg"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_DATA_DIRS="/usr/local/share:/usr/share/"
export KEYTIMEOUT=1

#Colors
export LIGHTGRAY="\[\033[0;37m\]" 
export WHITE="\[\033[1;37m\]" 
export BLACK="\[\033[0;30m\]" 
export DARKGRAY="\[\033[1;30m\]" 
export RED="\[\033[0;31m\]" 
export LIGHTRED="\[\033[1;31m\]" 
export GREEN="\[\033[0;32m\]" 
export LIGHTGREEN="\[\033[1;32m\]" 
export BROWN="\[\033[0;33m\]" 
export YELLOW="\[\033[1;33m\]" 
export BLUE="\[\033[0;34m\]" 
export LIGHTBLUE="\[\033[1;34m\]" 
export MAGENTA="\[\033[0;35m\]" 
export LIGHTMAGENTA="\[\033[1;35m\]" 
export CYAN="\[\033[0;36m\]" 
export LIGHTCYAN="\[\033[1;36m\]" 
export RESET="\[\033[0m\]"

for editor in nvim vim vi nano; do
        if command -v "${editor}" >/dev/null; then
                export EDITOR="${editor}"
                export VISUAL="${editor}"
                export GIT_EDITOR="${editor}"
                break;
        fi
done

if [ -d "${HOME}/bin" ] ; then
    PATH="${HOME}/bin:$PATH"
fi

if [ -n "${BASH_VERSION}" ]; then
    . ~/.bashrc
fi
