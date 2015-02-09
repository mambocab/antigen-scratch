source ~/.common_profile

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Add custom completion directory to fpath
fpath=("${fpath[@]}"  /Users/jwshephe/.zsh-completions )
autoload -U compinit && compinit

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME=pure
# ZSH_THEME="agnoster"
unset VIRTUAL_ENV_DISABLE_PROMPT

# . /usr/local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh
# export VIRTUAL_ENV_DISABLE_PROMPT=1

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
DISABLE_CORRECTION="false"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git osx copyfile copydir nyan gnu-utils brew brew-cask git-flow gem rvm pip nosetests extract zsh-syntax-highlighting lol tmux tmuxinator npm conda cabal fasd)

alias rvm-prompt=$HOME/.rvm/bin/rvm-prompt # must happen before `source`ing oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Terpsta aliases
alias zp="$EDITOR ~/.zshrc"
## reload your config
alias zpr="source ~/.zshrc"

exp () {
    expurl="http://explainshell.com/explain?cmd="
    expsuffix=$(echo "$*" | sed "s/\s/\+/g")

    openurl="${expurl}${expsuffix}"
    open $openurl

    unset expsuffix
    unset expurl
    unset openurl
}

disable r

mkcd () {
    mkdir -p "$*"
    cd "$*"
}

alias gitjk="history 10 | tail -r | gitjk_cmd"
alias tmux="TERM=screen-256color-bce tmux"

horiz () {
    'printf "%*s\n" "${COLUMNS:-$(tput cols)}" "" | tr " " ─'
}

unalias run-help
autoload run-help
HELPDIR=/usr/local/share/zsh/helpfiles

autoload -U zmv

bindkey '\e[A' history-beginning-search-backward
bindkey '\e[B' history-beginning-search-forward

alias gvim='open -a MacVim'
alias gvi=gvim

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH=~/.local/bin:$PATH # makes pipsi work!
export PATH=$HOME/Library/Haskell/bin:$PATH # add haskell packages to path

function t() {
    TESTFILE='./t.sh'
    if [ -e $TESTFILE ]; then
        $TESTFILE $*
    else
        echo "No $TESTFILE found"
    fi
}

alias pure-no-git="PURE_GIT_UNTRACKED_DIRTY=0"

# added by travis gem
[ -f /Users/jwshephe/.travis/travis.sh ] && source /Users/jwshephe/.travis/travis.sh
