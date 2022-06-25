export ZSH="$HOME/.oh-my-zsh"
export PATH="$HOME/.cargo/bin:$PATH"
ZSH_THEME="agnoster"
DISABLE_LS_COLORS="true"

plugins=(
    git
    zsh-syntax-highlighting
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

##########################################
# Colors
##########################################
if [[ -f !/.dircolors ]]; then
    eval $(dircolors -b ~/.dircolors)
elif [[ -f /etc/DIR_COLORS ]]; then
    eval $(dircolors -b /etc/DIR_COLORS)
fi

##########################################
# Editing files
##########################################
alias fn="nvim $HOME/.zshrc"
alias ww="nvim $HOME/GitProjects/vimwiki/index.md"
alias lua="nvim $HOME/.config/nvim/lua/bozilla/settings.lua"
alias settings="nvim /mnt/c/Users/Z/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/localstate/settings.json"
##########################################
# Navigation
##########################################
alias d="cd $HOME/Desktop"
alias doc="cd $HOME/Documents"
alias dn="cd $HOME/Downloads"
alias gp="cd $HOME/GitProjects"
alias gp2="cd /mnt/c/Users/Z/GitProjects/"
alias gitprojects=gp
alias itermscripts="cd $HOME/Library/Application\ Support/iTerm2/Scripts/itermscripts"
alias dotfiles="cd $HOME/GitProjects/.dotfiles"
alias notes="cd $HOME/GitProjects/notes"
alias wiki="cd $HOME/GitProjects/vimwiki"

##########################################
# removing from terminal line
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
#alias gen='f() { mvn archetype:generate -DgroupId=com.bozilla -DartifactId=$1 -DarchetypeArtifactId=maven-archetype-quickstart -DarchetypeVersion=1.4 -DinteractiveMode=false  };f'
alias gen='f() { mvn archetype:generate -DgroupId=com.$1 -DartifactId=$1 -DarchetypeArtifactId=maven-archetype-quickstart -DarchetypeVersion=1.4 -DinteractiveMode=false  };f'
alias clone='f() { git clone git@github.com:zbolin/$1.git };f'
alias clonebb='f() { git clone git@bitbucket.org:bozilla/$1.git };f'
alias clonebbb='f() { git clone git@bitbucket.org:bozilla/$1.git -b $2 };f'
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
    dotww
    dotdrawio
}
dotzsh () {
    dot $HOME/.zshrc
    dotfiles
    git add .
    git commit -m "Updated .zshrc"
    git push
}
dotvim () {
    dots $HOME/.config/nvim
    dotfiles
    git add .
    git commit -m "Updated init.vim"
    git push
}
dotdrawio () {
    cd $HOME/GitProjects/drawio
    git add .
    git commit -m "Updated drawio"
    git push
}
dotdrawio2 () {
    cd /mnt/c/Users/Z/GitProjects/drawio
    git add .
    git commit -m "Updated drawio"
    git push
}
dotww () {
    cd $HOME/GitProjects/vimwiki
    git add .
    git commit -m "Updated wiki"
    git push
}
dotsettings () {
    dot /mnt/c/Users/Z/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/localstate/settings.json
    dotfiles
    git add .
    git commit -m "Updated settings.json"
    git push
}
dotps () {
    dot /mnt/c/Users/Z/Documents/WindowsPowerShell/Microsoft.PowerShell_profile.ps1
    dotfiles
    git add .
    git commit -m "Updated Microsoft.PowerShell_profile.ps1"
    git push
}
myls() {
  for f in *; do
    if [ "${f##*.}" = txt ]; then
      printf '\e[1;31m%s\e[0m\n' "$f"
    elif [ "${f##*.}" = text ]; then
      printf '\e[1;34m%s\e[0m\n' "$f"
    elif [ "${f##*.}" = secret ]; then
      printf '\e[1;32m%s\e[0m\n' "$f"
    else
      printf '%s\n' "$f"
    fi
  done
}
