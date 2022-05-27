local api = vim.api

api.nvim_create_autocmd(
  "UIEnter",
  { command = [[
    execute 'hi VertSplit gui=bold guibg=Normal guifg='.g:terminal_color_8
    execute 'hi BufferOffset guibg='.g:terminal_color_8 'guifg='.g:terminal_color_9

    exec 'hi IndentBlanklineIndent1 gui=nocombine guifg='.g:terminal_color_1
    exec 'hi IndentBlanklineIndent2 gui=nocombine guifg='.g:terminal_color_2
    exec 'hi IndentBlanklineIndent3 gui=nocombine guifg='.g:terminal_color_3
    exec 'hi IndentBlanklineIndent4 gui=nocombine guifg='.g:terminal_color_4
    exec 'hi IndentBlanklineIndent5 gui=nocombine guifg='.g:terminal_color_5
    exec 'hi IndentBlanklineIndent6 gui=nocombine guifg='.g:terminal_color_6
  ]] }
)
