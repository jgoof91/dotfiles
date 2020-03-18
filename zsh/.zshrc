if [ -f "${HOME}/.zprofile" ]; then
        source ~/.zprofile
fi
if [ -f "${HOME}/.aliasrc" ]; then
        source ~/.aliasrc
fi
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

HYPHEN_INSENSITIVE="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="mm/dd/yyyy"

export PS1="\u@\h"

bindkey -v
bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward
bindkey '^e' edit-command-line

function zle-keymap-select() {
    zle reset-prompt
    zle -R
}
zle -N zle-keymap-select

function vi-mode-prompt_info() {
    echo "${${KEYMAP/vicmd/[% NORMAL]%}/(main|viins)/[% INSERT]%}"
}

RPS1="$(vi-mode-prompt_info)"
RPS2="${RPS1}"

cd "${HOME}"
