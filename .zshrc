export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

if [[ ! -d $HOME/.oh-my-zsh ]]; then
        echo Setting up .oh-my-zsh for the first time....
        sleep 2
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended --skip-chsh --keep-zshrc
        pushd $HOME/.oh-my-zsh/custom/plugins
        git clone https://github.com/zsh-users/zsh-autosuggestions.git
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
        git clone https://github.com/zsh-users/zsh-completions.git
        git clone https://github.com/zsh-users/zsh-history-substring-search.git
        popd
fi
if [[ ! -d  $HOME/.vim/pack/all-paks/start ]]; then
        mkdir -p $HOME/.vim/pack/all-paks/start
        pushd $HOME/.vim/pack/all-paks/start
        git clone https://github.com/jamessan/vim-gnupg.git
        git clone https://github.com/Yggdroot/indentLine.git
        git clone https://github.com/vim-airline/vim-airline
        popd
fi

ZSHRC_DIR=$(dirname $(readlink -f $HOME/.zshrc))
[[ $TERM == "xterm" ]] && TERM=xterm-256color

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="agnoster-latest"
ZSH_THEME="agnoster"
#ZSH_THEME="robbyrussell"
#ZSH_THEME="powerlevel10k/powerlevel10k"


# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git fzf zsh-completions zsh-autosuggestions zsh-syntax-highlighting history-substring-search docker docker-compose toolbox)
#plugins=(zsh-peco-history)
#ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)

source $ZSH/oh-my-zsh.sh

# User configuration
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=white,bg=240"
ZSH_HIGHLIGHT_STYLES[arg0]='fg=46'
ZSH_HIGHLIGHT_STYLES[path]='fg=46'
ZSH_HIGHLIGHT_STYLES[default]='fg=46'
ZSH_HIGHLIGHT_STYLES[comment]='fg=green,bold'
ZSH_FZF_HISTORY_SEARCH_DATES_IN_SEARCH=1

VIRTUAL_ENV_DISABLE_PROMPT=true
#
# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

[[ -f $ZSHRC_DIR/.shellvars ]] && source $ZSHRC_DIR/.shellvars
[[ -f $ZSHRC_DIR/.zsh_funcs ]] && source $ZSHRC_DIR/.zsh_funcs
[[ -f $ZSHRC_DIR/.agnoster-theme.override ]] && source $ZSHRC_DIR/.agnoster-theme.override
[[ -f /usr/local/ibmcloud/autocomplete/zsh_autocomplete ]] && source /usr/local/ibmcloud/autocomplete/zsh_autocomplete

if which kubectl > /dev/null 2>&1; then
    source <(kubectl completion zsh)
    complete -F __start_kubectl k
fi
if which oc >/dev/null 2>&1; then source <(oc completion zsh | sed -e 's/kubectl/oc/g'); fi
#if which crc >/dev/null; then source <(crc completion zsh); fi

#RPROMPT='%D{%a %d %b %Y %H:%M}'  
#RPROMPT='[%F{yellow}%?%f]'

[[ -d $HOME/depot/userconf ]] && HISTFILE=$HOME/depot/userconf/.zsh_history.$(hostname -s)
HISTSIZE=999999999
SAVEHIST=$HISTSIZE

setopt hist_ignore_all_dups

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -s '^s' 'ssha^M'

