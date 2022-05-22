#!/bin/bash
git pull
cp .zshrc ~
rm -rf ~/.config/nvim && cp -R nvim ~/.config/
