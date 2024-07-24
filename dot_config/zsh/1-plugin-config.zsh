#!/usr/bin/env zsh

# Command not found https://github.com/Homebrew/homebrew-command-not-found
HB_CNF_HANDLER="$(brew --repository)/Library/Taps/homebrew/homebrew-command-not-found/handler.sh"
if [ -f "$HB_CNF_HANDLER" ]; then
    source "$HB_CNF_HANDLER";
fi

ZVM_VI_EDITOR=nvim

zle_highlight=(paste:none)
