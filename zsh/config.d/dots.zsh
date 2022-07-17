alias dotfiles="cd $HOME/GitProjects/.dotfiles"
dot () {
    cp "$@" $HOME/GitProjects/.dotfiles
}
dots () {
    yes | cp -rf "$@" $HOME/GitProjects/.dotfiles
}
dotall () {
    dotzsh
    dotvim
}
dotzsh () {
    dot $HOME/.zshrc
    dotfiles
    git add .
    git commit -m "Updated .zshrc"
    git push
    dots ~/.config/zsh
    dotfiles
    git add .
    git commit -m "Updated zsh"
    git push
}
dotvim () {
    dots ~/.config/nvim
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
dotww () {
    cd $HOME/GitProjects/vimwiki
    git add .
    git commit -m "Updated wiki"
    git push
}
dotz () {
    cd $HOME/GitProjects/z
    git add .
    git commit -m "Updated z"
    git push
    cd $HOME/GitProjects/z
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
