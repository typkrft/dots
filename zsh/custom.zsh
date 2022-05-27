# Rest of Old Config This should be cleaned up

# TODO: Use bat for fzf
# TODO: Function to search man pages with FZF and Batman https://github.com/eth-p/bat-extras/blob/master/doc/batman.md
# TODO: Setup Prettier maybe alias pretty bat afterwards
# TODO: Alias batdiff
# TODO: Autocomplete suggestion with tab, may mess with fzf menu?
# TODO: Make All Aliases check for programs if not installed by default
# TODO: Create Fast Syntax Highlighting theme for Dracula
# TODO: If the buffers empty set left or right arrow to ctrl + r history search
# FIXME: Undo does one letter at a time unless word is pasted
# FIXME: Subsearch not showing history below
# FIXME: opt + delete kills to next space 


# P A T H S 
# User Binaries
path=("$HOME/.config/bin" $path)
# Rust Binaries
path=("$HOME/.asdf/installs/rust/1.57.0/bin" $path)
# Export Cargo Binaries
path=("$HOME/.cargo/bin" $path)
# export to sub-processes (make it inherited by child processes)
export path

# Zellij Envs
ZELLIJ_CONFIG_DIR=/.config/zellij

# A S D F
## Init ASDF
### NOTE: This has to be initialized before any ruby configurations. 
    ##  Like colorls
. /opt/homebrew/opt/asdf/libexec/asdf.sh

# P Y T H O N 
# export LDFLAGS="-L/opt/homebrew/lib)"
# export CPPFLAGS="-I$(/opt/homebrew/bin/brew --prefix xz)/include  -I$(/opt/homebrew/bin/brew --prefix readline)/include -I$(/opt/homebrew/bin/brew --prefix zlib)/include -I$(xcrun --show-sdk-path)/usr/include"

# B R E W
## Turn off analytics
export HOMEBREW_NO_ANALYTICS=1
## Add to $PATH ** Instructions state this should be in .zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# C O L O R L S
## Enable Completions
source $(dirname $(gem which colorls))/tab_complete.sh

# F Z F
## Add FZF functionality
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# C O M P L E T I O N S
## Path to ZSH Completions
fpath=(/opt/homebrew/share/zsh/site-functions $fpath)
## Load available completions
### NOTE: This has to be initialized after all completion settings
# autoload -Uz compinit
# compinit

# A L I A S E S
alias bat="bat --theme=dracula_italicized --italic-text=always"
if [ -f /opt/homebrew/bin/trash ]; then alias rm="/opt/homebrew/bin/trash"; fi

alias ls="colorls --almost-all --git-status --group-directories-first --hyperlink --report --color=always"

dotpush() {
  sed -i '' -e '1,/\# TODOs/!d' $HOME/.dots/README.md

    rg -g '!dotbot/' -g '!vscode/' -r '- [ ]' --line-number --trim --heading -e '^\s*# TODO:' -e '^\s*-- TODO:' $HOME/.dots | sed -E -e 's/^([0-9]+)\:(.*)/\2 __Line: \1__/g' -e 's/(-.+\])(.*)( __.*)/\1 \(\3\) \-\2/g' -e 's/(\/Users\/brandon\/.dots\/)(.*)/\#\# \[\2\]\(\2\)/g' >> $HOME/.dots/README.md

  git -C $HOME/.dots add -A && git -C $HOME/.dots commit -m \"$1\" && git -C $HOME/.dots push -u origin $2
}

private_dotpush() {

  # Pull New Files
  git pull origin
  
  # Update Readme
  sed -i '' -e '1,/\# TODOs/!d' $HOME/.private_dots/README.md
    rg -g '!dotbot/' -g '!vscode/' -r '- [ ]' --line-number --trim --heading -e '^\s*# TODO:' -e '^\s*-- TODO:' $HOME/.private_dots | sed -E -e 's/^([0-9]+)\:(.*)/\2 __Line: \1__/g' -e 's/(-.+\])(.*)( __.*)/\1 \(\3\) \-\2/g' -e 's/(\/Users\/brandon\/.private_dots\/)(.*)/\#\# \[\2\]\(\2\)/g' >> $HOME/.private_dots/README.md

  # Add any other new files to the secret
  git secret add *

  # Git Secret Hide All Files
  git-secret hide

  # Add New Secret Files, Commit them, and push them
  git -C $HOME/.private_dots add --all && git -C $HOME/.private_dots commit -m \"$1\" && git -C $HOME/.private_dots push -u origin main
}



test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# R A N G E R 
## Dev Icons
export RANGER_DEVICONS_SEPARATOR="  "


# Kitty Env to use latest updates
KITTY_DEVELOP_FROM=~/Code/Git/kitty

# M I S C 
# FIXME: Not passing through Zellij to Kitty Tab
# Sets the shells title to the current process for Kitty (and others)
function set-title-precmd() {
  printf "\e]2;%s\a" "${PWD/#$HOME/~}"
}

function set-title-preexec() {
   printf "\e]2;%s\a" "$1"
}

function unbrew() {
  brew leaves | fzf --multi --cycle --reverse --preview 'brew info {1}' | xargs -r brew uninstall
}

function peruse() {
  brew search '' | fzf --multi --cycle --reverse --preview 'brew info {1}' | xargs -r brew install
}

function cs_spectrum() {
  # Author: crshd
  # Source: http://crunchbang.org/forums/viewtopic.php?pid=128584#p128584
  for f in {0..6}; do
    echo -en "\033[$((f+41))m\033[$((f+30))m██▓▒░"
  done
  echo -en "\033[37m██\n"

  for f in {0..6}; do
    echo -en "\033[$((f+41))m\033[1;$((f+30))m██▓▒░"
  done
  echo -en "\033[1;37m██"

  echo -e "\033[0m"
}


export PATH="$HOME/.stew/bin:$PATH"
