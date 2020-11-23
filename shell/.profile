export LANG="en_US.UTF-8"
export TERMINAL="alacritty"
export FILE="vifm"
export BROWSER="firefox-bin"
export PAGER="less"
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

#CONFIG
export STOW_DIR="${HOME}/.dotfiles"
export INPUTRC="${XDG_CONFIG_HOME}/inputrc"
export GNUPGHOME="${XDG_CONFIG_HOME}/gnupg"

#Perl
export PATH="/home/jonah/.local/lib/perl5/bin${PATH:+:${PATH}}"
export PERL5LIB="/home/jonah/.local/lib/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"
export PERL_LOCAL_LIB_ROOT="/home/jonah/.local/lib/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"
export PERL_MB_OPT="--install_base \"/home/jonah/.local/lib/perl5\""
export PERL_MM_OPT="INSTALL_BASE=/home/jonah/.local/lib/perl5"

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

for editor in nvim vim emacs vi nano; do
        if command -v "${editor}" >/dev/null; then
                export EDITOR="${editor}"
                export VISUAL="${editor}"
                export GIT_EDITOR="${editor}"
                break;
        fi
done

[ -d ~/.local/bin ] && export PATH="${HOME}/.local/bin:${HOME}/.local/bin/polybar/:${PATH}"
[ -d ~/.cargo/bin ] && export PATH="${HOME}/.cargo/bin:${PATH}"

##AUTOSTART
#gpg-agent with ssh support
# pidof -x "gpg-agent" &>/dev/null || {
    # gpg-agent --daemon --homedir "${GNUPGHOME}" --enable-ssh-support
    # gpg-connect-agent /bye
    # export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
# } &>/dev/null

#syncthing
# pidof -x "syncthing" &>/dev/null || setsid -f syncthing --no-browser &>/dev/null

