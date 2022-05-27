vim.g.move_key_keys = 0

vim.cmd[[
  vmap <A-Up> <Plug>MoveBlockUp
  nmap <A-Up> <Plug>MoveLineUp
  vmap <A-Down> <Plug>MoveBlockDown
  nmap <A-Down> <Plug>MoveLineDown
]]
