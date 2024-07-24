#!/usr/bin/env zsh

# https://zsh.sourceforge.io/Doc/Release/Options.html

dir_opts=(
    AUTO_CD
    AUTO_PUSHD
    CDABLE_VARS
    PUSHD_IGNORE_DUPS
)

completion_opts=(
    ALWAYS_TO_END
    AUTO_LIST
    AUTO_PARAM_SLASH
    LIST_TYPES
)

history_opts=(
    APPEND_HISTORY
    HIST_EXPIRE_DUPS_FIRST
    HIST_FCNTL_LOCK
    HIST_FIND_NO_DUPS
    HIST_IGNORE_ALL_DUPS
    HIST_IGNORE_DUPS
    HIST_IGNORE_SPACE
    HIST_LEX_WORDS
    HIST_NO_STORE
    HIST_REDUCE_BLANKS
    HIST_SAVE_NO_DUPS
    HIST_VERIFY
    INC_APPEND_HISTORY
)

io_opts=(
    CORRECT_ALL
    INTERACTIVE_COMMENTS
)

setopt "${dir_opts[@]}" "${completion_opts[@]}" "${history_opts[@]}"

