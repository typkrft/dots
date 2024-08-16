# Install Scripts
- [ ] Script to Install Brew, Brewfile Profile, Firefox, asdf, Python, pip 
- [ ] after brew installed and close terminal after initial run sudo chsh -s "$(brew --prefix)/bin/zsh" $USER
- [ ] [Update icon from Terminal](https://superuser.com/questions/618501/changing-an-applications-icon-from-the-terminal-osx)
- [ ] if darwin start yabai skhd etc
- [ ] build-fzf-tab-module after fzf installed

# Configure 
- [ ] Zellij
- [ ] Vault ssh and secrets
- [ ] firefox theme websites from userchrome
- [ ] Sketchybar
- [ ] If headless install docker brewfile lazy docker 
- [ ] FF user.js
- [ ] FF Extensions
- [ ] Sudo Touch ID
- [ ] [Alfred](https://github.com/typkrft/dotfiles-bak/tree/main/Library/Application%20Support/Alfred/Alfred.alfredpreferences)
- [ ] Ansible Scripts
- [ ] [FZF Tab](https://github.com/Aloxaf/fzf-tab/wiki/Preview)

# Fix
- [ ] Sketchybar crashing occasionally, isolate via plugin
- [ ] Right prompt min width or remove from starship
- [ ] Code Icons should be next to git info 
- [ ] Local IP only if ssh on right
- [ ] Wizard hat should be purple
- [ ] zioxide completions not working
- [ ] [try fix
- [ ] ](https://github.com/zsh-users/zsh-autosuggestions/issues/673#issuecomment-1155356102)
- [ ] fzf ls in tmux should act like cd. currently full of escape codes trouble shoot zstyles, fzf, fzf-tab config
- [ ] VIMcmd mode not working zsh
- [ ] ${text_to_add} is black when pasted

# Upgrade
- [ ] chpwd starship detect ssh various extensions 

# Features
- [ ] keybind question mark as a hotkey to open a md in terminal in floating window
- [ ] [ZSH Plugin BW](https://github.com/casonadams/bitwarden-cli)
- [ ] [ZSH Plugin LLM](https://github.com/plutowang/zsh-ollama-command)
- [ ] [ZSH Plugin](https://github.com/Freed-Wu/fzf-tab-source)
- [ ] [look at poetry](https://www.youtube.com/watch?v=Ji2XDxmXSOM)


examples of keybind actions in wezterm
```lua
action = wezterm.action.Multiple {
    -- wezterm.action_callback(function(window,pane)
    --     pane:send_text 'lines=$(tput lines); printf \'\\n%.0s\' {1..$lines}; printf "\\e[1;1H\\e[2J\"'
    -- end),
    -- wezterm.SendKey { key = 'raw:36' }
}
action = wezterm.action.Multiple {
    wezterm.action.SendString 'lines=$(tput lines); printf \'\\n%.0s\' {1..$lines}; printf "\\e[1;1H\\e[2J\"',
    wezterm.action.SendKey {key = '\r'}
}
```