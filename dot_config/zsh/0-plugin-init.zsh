#!/usr/bin/env zsh
# https://github.com/hlissner/zsh-autopair/issues/33
export ZVM_INIT_MODE=sourcing

# Source Plugins
. $HOME/.config/zsh/plugins/zsh-vi-mode.zsh
. $HOME/.config/zsh/plugins/fzf-tab/fzf-tab.zsh
. $HOME/.config/zsh/plugins/zsh-ssh.zsh
. $HOME/.config/zsh/plugins/fzf-tab-source/fzf-tab-source.plugin.zsh
. $HOME/.config/zsh/plugins/autopair.zsh
. $HOME/.config/zsh/plugins/navi.zsh
. $HOME/.config/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
. $HOME/.config/zsh/plugins/zsh-autosuggestions.zsh

# Addtional Steps Required
autopair-init
