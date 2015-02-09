source ~/.common_profile

# Add custom completion directory to fpath
fpath=("${fpath[@]}"  /Users/jwshephe/.zsh-completions )
autoload -U compinit && compinit

unset VIRTUAL_ENV_DISABLE_PROMPT

DISABLE_CORRECTION="false"

COMPLETION_WAITING_DOTS="true"

alias rvm-prompt=$HOME/.rvm/bin/rvm-prompt # must happen before `source`ing oh-my-zsh

####################

source ~/.antigen/antigen/antigen.zsh

antigen bundle robbyrussell/oh-my-zsh plugins/git
antigen bundle robbyrussell/oh-my-zsh plugins/osx
antigen bundle robbyrussell/oh-my-zsh plugins/copyfile
antigen bundle robbyrussell/oh-my-zsh plugins/copydir
antigen bundle robbyrussell/oh-my-zsh plugins/gnu-utils
antigen bundle robbyrussell/oh-my-zsh plugins/brew
antigen bundle robbyrussell/oh-my-zsh plugins/brew-cask
antigen bundle robbyrussell/oh-my-zsh plugins/git-flow
antigen bundle robbyrussell/oh-my-zsh plugins/pip
antigen bundle robbyrussell/oh-my-zsh plugins/tmux
antigen bundle robbyrussell/oh-my-zsh plugins/tmuxinator
antigen bundle robbyrussell/oh-my-zsh plugins/cabal
antigen bundle robbyrussell/oh-my-zsh plugins/fasd

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle kennethreitz/autoenv

antigen theme pure

antigen apply

####################



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
