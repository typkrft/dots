local o = vim.opt
local wo = vim.wo
local bo = vim.bo
local g = vim.g

-- Leader Key
g.mapleader = ' '

-- Global Statusline
o.laststatus = 3

-- Mouse Integration
o.mouse = 'a'

-- Line Numbers
o.relativenumber = true
o.number = true

-- Don't show modal text
o.showmode = false

-- Highlight Cursorline
o.cursorline = true

-- Keep x lines at top/bottom when scrolling
o.scrolloff = 10

-- Number Column Width
o.numberwidth = 2

-- Faster Completions
o.updatetime = 300

-- Split to the right or below
-- vim.opt.splitright = true Seems to mess with Packer Overlay being in center
o.splitbelow = true

-- Turn on Smart Case
o.smartcase = true

-- Ignore Case in Search
o.ignorecase = true

-- Persistent Undo
o.undofile = true

-- Set 24bit Colors
o.termguicolors = true

-- Tabs
o.expandtab = true      -- use spaces instead of tabs
o.shiftwidth = 2        -- shift 2 spaces when tab
o.tabstop = 2           -- 1 tab == 2 spaces
o.smartindent = true    -- autoindent new lines

o.fillchars:append({
    horiz = '━', -- '━',
    horizup = ' ', -- '┻',
    horizdown = ' ', -- '┳',
    vert = '▎', --' ', -- '┃',
    vertleft = ' ', -- '┨',
    vertright = '▎', -- '┣',
    verthoriz = ' ', -- '╋',
    eob = ' '
})

-- Don't Start Folded
o.foldenable = false

-- Clipboard
o.clipboard = 'unnamed'

-- Set Transparent Menus/Windows
-- NOTE: Telescope Set in its' config
o.pumblend = 10
o.winblend = 10

-- Set Timeout Length (Primarily for Which Key)
o.timeoutlen = 500

-- Set Hidden (For Toggle Term)
o.hidden = true

-- Left and Right Wrap lines
o.whichwrap:append("<,>,h,l,[,]")

-- Set Modelines
o.modeline = true
o.modelines = 1
