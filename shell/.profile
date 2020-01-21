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
export LIGHTGRAY="\[\033[38;5;8m\]" 
export WHITE="\[\033[38;5;15\]" 
export BLACK="\[\033[38;5;16m\]" 
export DARKGRAY="\[\033[38;5;239m\]" 
export RED="\[\033[38;5;196m\]" 
export LIGHTRED="\[\033[38;5;163m\]" 
export GREEN="\[\033[38;5;40m\]" 
export LIGHTGREEN="\[\033[38;5;83m\]" 
export BROWN="\[\033[38;5;130m\]" 
export YELLOW="\[\033[38;5;226m\]" 
export BLUE="\[\033[38;5;20m\]" 
export LIGHTBLUE="\[\033[38;5;45m\]" 
export MAGENTA="\[\033[38;5;5m\]" 
export LIGHTMAGENTA="\[\033[38;5;13m\]" 
export CYAN="\[\033[38;5;6m\]" 
export LIGHTCYAN="\[\033[38;5;14m\]" 
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
