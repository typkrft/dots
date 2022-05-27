-- init.lua
-- setup with all defaults
-- each of these are documented in `:help nvim-tree.OPTION_NAME`

vim.cmd[[
  let g:nvim_tree_git_hl = 1
  let g:nvim_tree_highlight_opened_files = 1
  let g:nvim_tree_respect_buf_cwd = 1
  let g:nvim_tree_create_in_closed_folder = 1
  let g:nvim_tree_icons = { 'default': '', 'symlink': ''}
]]

require'nvim-tree'.setup { -- BEGIN_DEFAULT_OPTS
  renderer = {
    indent_markers = {
      enable = true,
      icons = {
        corner = "└ ",
        edge = "│ ",
        none = "  ",
      },
    },
  },
  auto_reload_on_write = true,
  disable_netrw = false,
  hide_root_folder = false,
  hijack_cursor = false,
  hijack_netrw = true,
  hijack_unnamed_buffer_when_opening = false,
  ignore_buffer_on_setup = false,
  open_on_setup = false,
  open_on_tab = false,
  sort_by = "name",
  update_cwd = true,
  view = {
    width = 32,
    height = 30,
    side = "left",
    preserve_window_proportions = false,
    number = false,
    auto_resize = true,
    relativenumber = false,
    signcolumn = "no",
    mappings = {
      custom_only = false,
      list = {
        -- user mappings go here
      },
    },
  },
  hijack_directories = {
    enable = true,
    auto_open = true,
  },
  update_focused_file = {
    enable = false,
    update_cwd = false,
    ignore_list = {},
  },
  ignore_ft_on_setup = {},
  system_open = {
    cmd = nil,
    args = {},
  },
  diagnostics = {
    enable = false,
    show_on_dirs = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  filters = {
    dotfiles = false,
    custom = {},
    exclude = {},
  },
  git = {
    enable = true,
    ignore = false,
    timeout = 400,
  },
  actions = {
    change_dir = {
      enable = true,
      global = false,
    },
    open_file = {
      quit_on_open = false,
      resize_window = true,
      window_picker = {
        enable = true,
        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
        exclude = {
          filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
          buftype = { "nofile", "terminal", "help" },
        },
      },
    },
  },
  trash = {
    cmd = "trash",
    require_confirm = true,
  },
  log = {
    enable = false,
    truncate = false,
    types = {
      all = false,
      config = false,
      copy_paste = false,
      git = false,
      profile = false,
    },
  },
} -- END_DEFAULT_OPTS

-- Setup NVIM Tree Command
-- Explicitly set the nvim tree width
local tree_toggle_cmd = ":lua local set_bar_offset = require('bufferline.state').set_offset \z
                         local nt = require('nvim-tree') \z
                         local ntv = require('nvim-tree.view') \z
                         if ntv.is_visible() then \z
                         set_bar_offset(0) nt.toggle() else \z
                         nt.toggle(true) set_bar_offset(ntv.View.width + 2, '          NvimTree') end"

vim.cmd ("command TreeToggle " .. tree_toggle_cmd)
