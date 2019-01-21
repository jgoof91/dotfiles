export LANG="en_US.UTF-8"
export EDITOR="nvim"
export VISUAL="${EDITOR}"
export GIT_EDITOR="${EDITOR}"
export BROWSER="/c/Program Files/Mozilla Firefox/firefox.exe"

#The XDG env vars
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CONFIG_DIRS="/etc/xdg"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_DATA_DIRS="/usr/local/share:/usr/share/"

# if running bash
if [ -n "${BASH_VERSION}" ]; then
    # include .bashrc if it exists
    if [ -f "${HOME}/.bashrc" ]; then
	    . "${HOME}/.bashrc"
    fi
fi
