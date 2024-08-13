#!/usr/bin/env zsh

function bu() {
    printf 'Updating packages...\n'
    brew update
    brew upgrade
    brew bundle install --file="${HOME}/.config/brewfile/Brewfile"
    printf 'Cleaning up...\n'
    brew autoremove
    brew cleanup
    printf 'Complete.\n'
}


function rm() {
    flags=() files=() reply=""

    for item in "${@}"; do  
        if [[ $item =~ ^-.*  ]]; then
            flags+=$item
        else 
            files+=$item
        fi
    done 

    if [[ ${#files[@]} -eq 0 ]]; then
        printf "No files or folders selected.\n"
        return 1
    fi

    vared -p "Would you like to Delete: [d], Trash: [t], Canx: [c] '$(echo ${files[@]})'? " -c reply
    
    if [[ ${reply:l} == *"d"* ]]; then
        printf "Deleting...\n"
        /bin/rm "${flags[@]}" "${files[@]}"
        return $?
    
    elif [[ ${reply:l} == *"t"* ]]; then
        printf "Moving to Trash...\n"
        if [ -x "$(command -v trash)" ]; then 
            $(brew --prefix)/bin/trash "${files[@]}"
        else
            printf 'trash is not in "$PATH" or not installed\n'
        fi
        return $?
    
    elif [[ ${reply:l} == *"c"* ]]; then
        print "Canceling command.\n"
        return 0
    
    else 
        printf "Unexpected Input.\n"
        return 1
    fi
}


function yank() {
    if [[ $1 == "-f" ]]; then
        printf "Copying ${@:2} file to clipboard...\n"
        text=$(/bin/cat "${@:2}")
        code=$?
    elif [[ $1 == "-u" ]]; then
        user_agent="Mozilla/5.0 (Linux; Android 10; SM-G996U Build/QP1A.190711.020; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Mobile Safari/537.36"
        printf "Copying ${@:2} source to clipboard...\n"
        text=$(/usr/bin/curl -A $user_agent -kLsS "${@:2}")
        code=$?
    else 
        if [[ $# -eq 0 ]]; then 
            text=$(< /dev/stdin)
        else
            text=$(echo -n "${@}")
        fi
        code=$?
    fi
    
    if [[ $code == 0 ]]; then
        echo -n $text | pbcopy
        echo "Copied to clipboard"
        return
    else
        echo "Failed to copy to clipboard."
        return $code
    fi
    
}


function _ls_report() {
    DIRS=$(find . -mindepth 1 -maxdepth 1 -type d | wc -l)
    # HIDDEN_DIRS=$(find . -iname ".*" -mindepth 1 -maxdepth 1 -type d | wc -l)
    # TOTAL_DIRS=$(( $DIRS + $HIDDEN_DIRS ))
    
    FILES=$(find . -mindepth 1 -maxdepth 1 -type f | wc -l)
    # HIDDEN_FILES=$(find . -iname ".*" -mindepth 1 -maxdepth 1 -type f| wc -l)
    # TOTAL_FILES=$(( $FILES + $HIDDEN_FILES ))
    
    DIR_SIZE=$(timeout 0.5s du -sbh  . 2>/dev/null | awk '{print $1}')
    if [[ $? -ne 0 ]]; then 
        DIR_SIZE=""
    fi

    sum=$(($FILES + $DIRS))
    if [[ $sum -eq 0 ]]; then
        echo "The directory is empty...\n"
        (zelda_secret $sum &)
        game_quote $sum
        return 0
    elif [[ $sum -gt 50 ]]; then
        return 0
    fi
    
    KEY_COLOR=$(tput bold; tput setaf 6)
    VALUE_COLOR=$(tput sitm; tput setaf 2)
    RESET_TEXT=$(tput sgr0)

    eza --icons -a --group-directories-first --git -F
    printf "\n"
    printf "${KEY_COLOR}Path:${RESET_TEXT}        ${VALUE_COLOR}$(pwd)${RESET_TEXT}\n"
    printf "${KEY_COLOR}Folders:${RESET_TEXT}     ${VALUE_COLOR}${DIRS}${RESET_TEXT}\n"
    printf "${KEY_COLOR}Files:${RESET_TEXT}       ${VALUE_COLOR}${FILES}${RESET_TEXT}\n"
    if [[ $DIR_SIZE != "" ]]; then 
        printf "${KEY_COLOR}Size:${RESET_TEXT}        ${VALUE_COLOR}${DIR_SIZE}${RESET_TEXT}\n"
    fi
}


function _starship_git_r_prompt() {
    if git rev-parse --git-dir > /dev/null 2>&1; then
        starship config format '''
╭─\( $battery$time\)──\( $sudo$username$hostname$directory$docker_context$container\)$git_branch$git_commit$git_state$git_metrics$git_status$cmd_duration$fill\( $localip$shlvl$singularity$kubernetes$vcsh$fossil_branch$fossil_metrics$hg_branch$pijul_channel$package$c$cmake$cobol$daml$dart$deno$dotnet$elixir$elm$erlang$fennel$gleam$golang$guix_shell$haskell$haxe$helm$java$julia$kotlin$gradle$lua$nim$nodejs$ocaml$opa$perl$php$pulumi$purescript$python$quarto$raku$rlang$red$ruby$rust$scala$solidity$swift$terraform$typst$vlang$vagrant$zig$buf$nix_shell$conda$meson$spack$memory_usage$aws$gcloud$openstack$azure$nats$direnv$env_var$crystal$custom$jobs$shell\)
╰─$character'''
    else 
        starship config format '''
╭─\( $battery$time\)──\( $sudo$username$hostname$directory$docker_context$container\)$git_branch$git_commit$git_state$git_metrics$git_status$cmd_duration
╰─$character'''
    fi 
}

function zelda_secret() {
    tmp=$(mktemp --tmpdir)
    curl -sSo $tmp https://www.myinstants.com/media/sounds/ringtones-zelda-1.mp3
    afplay $tmp 
    /bin/rm $tmp
}

function game_quote() {
    quote_json=$(curl -sSL https://ultima.rest/api/random)
    echo $(echo $quote_json | jq .quote) - $(echo $quote_json | jq -r .character): $(echo $quote_json | jq -r .title)
}


function chpwd() { 
    _ls_report 
    _starship_git_r_prompt
}

function set_win_title(){
    echo -ne "\033]0; $(basename "$PWD") \007"
}

function scroll-and-clear-screen() {
  local i=1
  while read; do ((i++)); done <<< $PS1
  printf '\n%.0s' {$i..$LINES}
  zle clear-screen
}
zle -N scroll-and-clear-screen

function _paste_without_autopair() {
    # Attempt to sanatize
    text=$(printf "%s\n" "$(pbpaste)")
    LBUFFER+="$text"
}
zle -N _paste_without_autopair

function _beginning_of_prompt() {
    CURSOR=0
}
zle -N _beginning_of_prompt

function _end_of_prompt() {
    CURSOR=${#BUFFER}
}
zle -N _end_of_prompt

function clear() {
    lines=$(tput lines)
    printf '\n%.0s' {1..$lines}
    printf "\e[1;1H\e[2J"
    zle && { zle reset-prompt; zle -R}
}

zle -N clear

autoload edit-command-line; zle -N edit-command-line
