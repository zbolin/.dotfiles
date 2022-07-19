
# Load seperated config files
for conf in "$HOME/.config/zsh/config.d/"*.zsh; do
  source "${conf}"
done
for conf in "$HOME/.config/zsh/config.d/aws/"*.zsh; do
  source "${conf}"
done
unset conf
