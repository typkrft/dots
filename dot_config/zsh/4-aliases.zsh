#!/usr/bin/env zsh

# Aliases
alias tree='eza -T --icons=always --color=always --hyperlink'
alias ls='eza -a --group-directories-first --icons=always --color=always'
alias lsl='eza -log --no-permissions --git --no-filesize --icons=always --color=always --no-time'
alias sed='gsed'
alias man='batman'
alias ssh="TERM='xterm-256color' ssh"
alias dots="$EDITOR $HOME/.local/share/chezmoi"
alias sudo="sudo -E"