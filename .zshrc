# Go Lang
export PATH=$PATH:/usr/local/go/bin
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/z/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster"

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

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
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
plugins=(
    git
    zsh-syntax-highlighting
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

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

##########################################
# Editing files
##########################################
alias fn="nvim $HOME/.zshrc"
alias ww="nvim $HOME/GitProjects/vimwiki/index.md"
alias lua="nvim $HOME/.config/nvim/lua/bozilla/settings.lua"

##########################################
# Navigation
##########################################
alias d="cd $HOME/Desktop"
alias doc="cd $HOME/Documents"
alias dn="cd $HOME/Downloads"
alias gp="cd $HOME/GitProjects"
alias gitprojects=gp
alias itermscripts="cd $HOME/Library/Application\ Support/iTerm2/Scripts/itermscripts"
alias dotfiles="cd $HOME/GitProjects/.dotfiles"
alias notes="cd $HOME/GitProjects/notes"
alias wiki="cd $HOME/GitProjects/vimwiki"

##########################################
# removing z@zachs-air from terminal line
##########################################
export DEFAULT_USER="$(whoami)"
prompt_context() {
  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    prompt_segment black default "%(!.%{%F{yellow}%}.)$USER"
  fi
}
get_abs_filename() {
  # $1 : relative filename
  echo "$(cd "$(dirname "$1")" && pwd)/$(basename "$1")"
}

alias p="less -FX"
##########################################
# coding
##########################################
alias example='f() { echo Your arg was $1. };f'
alias gen='f() { mvn archetype:generate -DgroupId=com.bozilla -DartifactId=$1 -DarchetypeArtifactId=maven-archetype-quickstart -DarchetypeVersion=1.4 -DinteractiveMode=false  };f'
alias cbb='f() { git clone git@bitbucket.org:bozilla/$1.git };f'
alias mci="mvn clean install -q"
alias main='f () { mvn exec:java -Dexec.mainClass="com.bozilla.$1" };f'
##########################################
# aws
##########################################
alias gb=GetBuckets

alias gb2=GetBuckets2
alias gb3=GetBuckets3
GetBuckets () {
    aws s3 ls | awk '{print $3}'
}

GetBuckets2 () {
    aws s3 ls s3://$1 | awk '{print $4}'
}

GetBuckets3 () {
    aws s3 cp s3://$1/$2 $2
}

alias fj=FilterJson

FilterJson() {
    jq '.. |."Tags"? | select(. != null)' instances.json
}
##########################################
# .dotfiles
##########################################
dot () {
    cp "$@" $HOME/GitProjects/.dotfiles
    #get_abs_filename "$@" >> $HOME/GitProjects/.dotfiles/history.txt
}
dots () {
    yes | cp -rf "$@" $HOME/GitProjects/.dotfiles
    #get_abs_filename "$@" >> $HOME/GitProjects/.dotfiles/history.txt
}
dotall () {
    dotzsh
    dotvim
}
dotzsh () {
    source $HOME/.zshrc
    dot $HOME/.zshrc
    dotfiles
    git add .
    git commit -m "[AIR] Updated .zshrc"
    git push
    cd $HOME
}
dotvim () {
    dots $HOME/.config/nvim
    dotfiles
    git add .
    git commit -m "[AIR] Updated init.vim"
    git push
    cd $HOME
}

