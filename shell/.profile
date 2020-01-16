export LANG="en_US.UTF-8"
export BROWSER="/c/Program Files/Mozilla Firefox/firefox.exe"
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
export STOW_DIR=~/.dotfiles

#The XDG env vars
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CONFIG_DIRS="/etc/xdg"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_DATA_DIRS="/usr/local/share:/usr/share/"
export KEYTIMEOUT=1

for editor in nvim vim vi nano; do
        if command -v "${editor}" >/dev/null; then
                export EDITOR="${editor}"
                export VISUAL="${editor}"
                export GIT_EDITOR="${editor}"
                break;
        fi
done
