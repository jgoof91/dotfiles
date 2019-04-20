#load my aliases
if [ -f "${HOME}/.aliasrc" ]; then
        . "${HOME}/.aliasrc"
fi

export ZSH="/home/jgoof/.oh-my-zsh"  
ZSH_THEME="darkblood"
ZSH_THEME_RANDOM_CANDIDATES=("3den" "Soliah" "adben" "af-magic" "afowler" "agnoster" "alanpeabody" "amuse" "apple" "arrow" "aussiegeek" "avit" "awesomepanda" "bira" "blinks" "bureau" "candy-kingdom" "candy" "clean" "cloud" "crcandy" "crunch" "cypher" "dallas" "darkblood" "daveverwer" "dieter" "dogenpunk" "dpoggi" "dst" "dstufft" "duellj" "eastwood" "edvardm" "emotty" "essembeh" "evan" "fino-time" "fino" "fishy" "flazz" "fletcherm" "fox" "frisk" "frontcube" "funky" "fwalch" "gallifrey" "gallois" "garyblessington" "gentoo" "geoffgarside" "gianu" "gnzh" "gozilla" "half-life" "humza" "imajes" "intheloop" "itchy" "jaischeema" "jbergantine" "jispwoso" "jnrowe" "jonathan" "josh" "jreese" "jtriley" "juanghurtado" "junkfood" "kafeitu" "kardan" "kennethreitz" "kiwi" "kolo" "kphoen" "lambda" "linuxonly" "lukerandall" "macovsky-ruby" "macovsky" "maran" "mgutz" "mh" "michelebologna" "mikeh" "miloshadzic" "minimal" "mira" "mortalscumbag" "mrtazz" "murilasso" "muse" "nanotech" "nebirhos" "nicoulaj" "norm" "obraun" "peepcode" "philips" "pmcgee" "pure" "pygmalion" "re5et" "refined" "rgm" "risto" "rixius" "rkj-repos" "rkj" "robbyrussell" "sammy" "simonoff" "simple" "skaro" "smt" "sonicradish" "sorin" "sporty_256" "steeef" "strug" "sunaku" "sunrise" "superjarin" "suvash" "takashiyoshida" "terminalparty" "theunraveler" "tjkirch" "tjkirch_mod" "tonotdo" "trapd00r" "wedisagree" "wezm+" "wezm" "wuffers" "xiong-chiamiov-plus" "xiong-chiamiov" "ys" "zhann")
HYPHEN_INSENSITIVE="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="mm/dd/yyyy"
plugins=(git web-search git-extras)
source $ZSH/oh-my-zsh.sh

bindkey -v
bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward
bindkey -M vicmd v edit-command-line
bindkey -M vicmd '^v' edit-command-line

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
