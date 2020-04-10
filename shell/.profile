export LANG="en_US.UTF-8"
export TERMINAL="st"
export FILE="vifm"
export BROWSER="lynx"
export PAGER="less"
export EDITOR="nvim"
export VISUAL="${EDITOR}"
export GIT_EDITOR="${EDITOR}"
export STOW_DIR="${HOME}/.dotfiles"
export INPUTRC="${HOME}/.config/inputrc"
export LESSHISTFILE=""
export FZF_DEFAULT_OPTS="-i"

export SUDO_ASKPASS="${HOME}/.local/bin/askpass"

#The XDG env vars
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CONFIG_DIRS="/etc/xdg"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_DATA_DIRS="/usr/local/share:/usr/share/"
export KEYTIMEOUT=1

#Colors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
export BLACK="\e[30m"
export RED="\e[31m"
export GREEN="\e[32m"
export YELLOW="\e[33m"
export BLUE="\e[34m"
export MAGENTA="\e[35m"
export CYAN="\e[36m"
export LGRAY="\e[37m"
export DGRAY="\e[90m"
export LRED="\e[91m"
export LGREEN="\e[92m"
export LYELLOW="\e[93m"
export LBLUE="\e[94m"
export LMAGENTA="\e[95m"
export LCYAN="\e[96m"
export WHITE="\e[97m"
export RESET="\e[0m"

for editor in nvim vim vi nano; do
        if command -v "${editor}" >/dev/null; then
                export EDITOR="${editor}"
                export VISUAL="${editor}"
                export GIT_EDITOR="${editor}"
                break;
        fi
done

if [ -d ~/.local/bin ]; then
    export PATH="${HOME}/.local/bin:${PATH}"
fi

if [ -f ~/.extrarc ]; then
    . ~/.extrarc
fi
