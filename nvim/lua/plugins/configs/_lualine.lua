require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    -- component_separators = { left = '', right = ''},
    -- section_separators = { left = '', right = ''},
    -- component_separators = '|',
    component_separators = '',
    section_separators = { left = '', right = '' },
    -- section_separators = { left = '', right = '' },
    disabled_filetypes = {'alpha'},
    always_divide_middle = true,
    globalstatus = true,
  },

  sections = {
    lualine_a = {
      -- { 'mode', separator = { left = '' }, right_padding = 2 },
      { 'mode' }
    },
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {
      { 'location' }
      -- { 'location', separator = { right = '' }, left_padding = 2 },
    },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {
    -- 'nvim-tree',
    'fzf',
    'symbols-outline',
    'toggleterm',
    'quickfix'
  },

  filetype_names = {
    TelescopePrompt = 'Telescope',
    dashboard = 'Dashboard',
    packer = 'Packer',
    fzf = 'FZF',
    alpha = 'Alpha'
  }, -- Shows specific window name for that filetype ( { `filetype` = `window_name`, ... } )

  disabled_buftypes = { 'quickfix', 'prompt' },
}
