-- TODO: Lazy Load everything and add impatient
-- TODO: Seperate plugins in to Base / Extra / Etc


local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd[[packadd packer.nvim]]
end

return require('packer').startup({function(use)

  -- Packer
  -- https://github.com/wbthomason/packer.nvim
  use 'wbthomason/packer.nvim'

  -- Nightfox
  -- https://github.com/EdenEast/nightfox.nvim
  use {
    'EdenEast/nightfox.nvim',
    config = function () require('plugins/configs/_nightfox') end
  }

  use({
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    module = "persistence",
    config = function()
      require("persistence").setup()
    end,
  })

  -- NeoScroll
  -- https://github.com/karb94/neoscroll.nvim
  use {
    'karb94/neoscroll.nvim',
    opt = true,
    keys = {
      "<c-u>",
      "<c-d>",
    },
    config = function()
      require('neoscroll').setup()
    end
  }


  -- NOTE: Has configurable options
  use "rebelot/kanagawa.nvim"

  use{
    "catppuccin/nvim",
    as = "catppuccin"
  }

  use {
    "ellisonleao/glow.nvim",
    ft = 'markdown'
  }

  -- use({
  --   "themercorp/themer.lua",
  --   config = function()
  --     require("themer").setup({
  --       colorscheme = "rose-pine",
  --       styles = {
  --         ["function"] = { style = 'italic' },
  --         functionbuiltin = { style = 'italic' },
  --         variable = { style = 'italic' },
  --         variableBuiltIn = { style = 'italic' },
  --         parameter  = { style = 'italic' },
  --       },
  --       enable_installer = true
  --     })
  --     require("telescope").load_extension("themes")
  --   end
  -- })

  use {
    'romgrk/barbar.nvim',
    config = function () require('plugins/configs/_barbar') end,
    requires = {'kyazdani42/nvim-web-devicons'}
  }

  use {
    'phaazon/hop.nvim',
    branch = 'v1', -- optional but strongly recommended
    config = function() require'plugins/configs/_hop' end
  }

--  use {
--    'akinsho/bufferline.nvim',
--    config = function () require('plugins/configs/bufferline') end,
--    requires = 'kyazdani42/nvim-web-devicons'
--  }
--
-- use {
--   'typkrft/nvim-cokeline',
--   requires = 'kyazdani42/nvim-web-devicons', -- If you want devicons
--   config = function() require('plugins/configs/cokeline_conf') end
-- }

  use {
    'goolord/alpha-nvim',
    config = function () require('plugins/configs/_dashboard') end,
  }

  -- Colorizer
  -- https://github.com/abosnjakovic/nvim-colorizer.lua
  use {
    'abosnjakovic/nvim-colorizer.lua',
    -- Lazy load on :ColorizerToggle, filetypes
    opt = true,
    cmd = {'ColorizerToggle'},
    ft = {"sh", "markdown", "json", "jsonc", "html", "javascript", "css"},
    config = function() require('plugins/configs/_colorizer') end,
  }

  use {
    'nvim-lualine/lualine.nvim',
    config = function () require('plugins/configs/_lualine') end,
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- use {
  --   'feline-nvim/feline.nvim',
  --   config = function ()
  --     require'plugins/configs/_feline'
  --   end
  -- }

  use {
    'kyazdani42/nvim-tree.lua',
    config = function ()
      require('plugins/configs/_tree')
    end,
    requires = {
      'kyazdani42/nvim-web-devicons',
      'famiu/bufdelete.nvim',
      opt = true
    },
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    config = function () require('plugins/configs/_treesitter') end,
    run = ':TSUpdateSync'
  }

  use {
    'neovim/nvim-lspconfig',
    config = function () require('plugins/configs/_lsp-installer') end,
    requires = { 'williamboman/nvim-lsp-installer' }
  }

  use {
   'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-cmdline',
      'L3MON4D3/LuaSnip',
      'uga-rosa/cmp-dictionary',
      'saadparwaiz1/cmp_luasnip',
      'rafamadriz/friendly-snippets'
    },
    config = function () require('plugins/configs/_cmp') end,
    after = 'nvim-autopairs'
  }

  -- Telescope
  -- https://github.com/nvim-telescope/telescope.nvim
  use {
    'nvim-telescope/telescope.nvim',
    config = function () require('plugins/configs/_telescope') end,
    requires = { 'nvim-lua/plenary.nvim' }
  }


  use({
      "jose-elias-alvarez/null-ls.nvim",
      config = function()
        require('plugins/configs/_null-ls')
      end,
      requires = { "nvim-lua/plenary.nvim" },
  })

  use {
    'tami5/lspsaga.nvim',
    config = function () require('plugins/configs/_lspsaga') end
  }

  use {
    "nvim-telescope/telescope-frecency.nvim",
    config = function()
      require"telescope".load_extension("frecency")
    end,
    requires = {"tami5/sqlite.lua"}
  }

  use {
    "folke/which-key.nvim",
    config = function() require("plugins/configs/_which-key") end
  }

  -- Autopairs
  -- https://github.com/windwp/nvim-autopairs
  use {
    'windwp/nvim-autopairs',
    require = 'windwp/nvim-ts-autotag',
    config = function () require('nvim-autopairs').setup{} end,
  }

  use {
      "akinsho/toggleterm.nvim",
      config = function () require('plugins/configs/_toggleterm') end,
      tag = "main"
  }

--  use {
--    'fedepujol/move.nvim',
--    config = function ()
--      vim.api.nvim_set_keymap('n', '<M-Down>', ":MoveLine(1)<CR>", { noremap = true, silent = true })
--      vim.api.nvim_set_keymap('n', '<M-Up>', ":MoveLine(-1)<CR>", { noremap = true, silent = true })
--      vim.api.nvim_set_keymap('v', '<M-Down>', ":MoveBlock(1)<CR>", { noremap = true, silent = true })
--      vim.api.nvim_set_keymap('v', '<M-Up>', ":MoveBlock(-1)<CR>", { noremap = true, silent = true })
--      vim.api.nvim_set_keymap('n', '<M-Right>', ":MoveHChar(1)<CR>", { noremap = true, silent = true })
--      vim.api.nvim_set_keymap('n', '<M-Left>', ":MoveHChar(-1)<CR>", { noremap = true, silent = true })
--      vim.api.nvim_set_keymap('v', '<M-Right>', ":MoveHBlock(1)<CR>", { noremap = true, silent = true })
--      vim.api.nvim_set_keymap('v', '<M-Left>', ":MoveHBlock(-1)<CR>", { noremap = true, silent = true })
--    end,
--    opt = true,
--    keys = {
--      {'v','<M-Down>'}, {'v', '<M-Up>'}, {'v', '<M-Left>'},
--      {'v', '<M-Right>'}, {'n', '<M-Down>'}, {'n', '<M-Up>'},
--      {'n', '<M-Left>'},
--      -- {'n', '<M-Right>'},
--    }
--  }

  use {
    'matze/vim-move',
    config = function () require('plugins/configs/_vim-move') end
  }

  -- Git Signs
  -- https://github.com/lewis6991/gitsigns.nvim
  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function() require('gitsigns').setup({}) end
  }

  -- Symbols Outline
  -- https://github.com/simrat39/symbols-outline.nvim
  use 'simrat39/symbols-outline.nvim'

  -- Trouble
  -- https://github.com/folke/trouble.nvim
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function() require('plugins/configs/_trouble') end
  }

  use {
    'numToStr/Comment.nvim',
    config = function() require('Comment').setup() end
  }

  -- Todo Comments
  -- https://github.com/folke/todo-comments.nvim
  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function() require("plugins/configs/_todo-comments") end
  }

  use "onsails/lspkind-nvim"

  use {
    "folke/zen-mode.nvim",
    requires = 'folke/twilight.nvim',
    config = function() require("plugins/configs/_zen-mode") end
  }

  use {
    "lukas-reineke/indent-blankline.nvim",
    config = function ()
      require('plugins/configs/_indent-blankline')
    end,
  }


  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end

end,
config = { display = { open_fn = require('packer.util').float }}
})
