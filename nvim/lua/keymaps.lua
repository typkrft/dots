-- Functional wrapper for mapping custom keybindings
local function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- TODO: Reorganize and test
-- MacOS Editing
-- Normal
map("n", "☀︎", "0", { silent = true }) -- CMD + Left
map("n", "☍", "<c-v>0", { silent = true }) -- CMD + Shift + Left
map("n", "☌", "<c-v>$", { silent = true }) -- CMD + Shift + Right
map("n", "☼", "$", { silent = true }) -- CMD + Right
map("n", "☔︎", "gg0", { silent = true }) -- CMD + Up
map("n", "☂︎", "G$", { silent = true }) -- CMD + Down
map("n", "<M-b>", "b", { silent = true }) -- Alt + Left
map("n", "<M-f>", "w", { silent = true }) -- Alt + Right
-- map("n", "<MS-Left>", "<C-V>b", { silent = true }) -- Alt + Shift + Left
-- map("n", "<MS-Right>", "<C-V>w", { silent = true }) -- Alt + Shift + Left
map("n", "♗", "ggVG", { silent = true }) -- CMD + a

map("n", "<tab>", ":bn<cr>", { silent = true })
map("n", "<tab>", ":bp<cr>", { silent = true })
map("n", "<m-tab>", ">>", { silent = true})
map("n", "<ms-tab>", "<<", { silent = true})
map("v", "<m-tab>", ">")
map("v", "<ms-tab>", "<")

-- Insert
map("i", "☀︎", "<esc>0i", { silent = true }) -- CMD + Left
map("i", "☼", "<esc>$a", { silent = true }) -- CMD + Right
map("i", "â︎", "<esc>gg0i", { silent = true }) -- CMD + Up
map("i", "â︎", "<esc>G$a", { silent = true }) -- CMD + Down
map("i", "<M-Left>", "<esc>bi", { silent = true }) -- Alt + Left
map("i", "<M-Right>", "<esc>wwi", { silent = true }) -- Alt + Right

-- Editing
map("n", "Ã¢¾", "u", { silent = true }) -- CMD + z
map("i", "Ã¢¾", "<esc>ua", { silent = true }) -- CMD + z
map("n", "Ã¢︎", "<C-R>", { silent = true }) -- CMD + Shift + z
map("i", "Ã¢︎", "<esc><C-R>i", { silent = true }) -- CMD + Shift + z

-- TODO: Needs Work
-- https://stackoverflow.com/questions/1373841/vim-deleting-backward-tricks
map("n", "Ã¢½", "d0", { silent = true }) -- CMD + Delete
map("n", "<M-BS>", "a<esc>dvt", { silent = true }) -- Alt + Delete
map("i", "Ã¢½", "<esc>dv0i", { silent = true }) -- CMD + Delete
map("i", "<M-BS>", "<esc>dvbdhi", { silent = true }) -- Alt + Delete
vim.cmd[[nmap Ã¢ gcc]] -- CMD + /
vim.cmd[[imap Ã¢ <esc>gcca]] -- CMD + /
map("v", "♇", "<esc><cmd>lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<CR>") -- CMD + /

-- Walk Through Visual Lines instead of File Lines
map("n", "<Up>", "gk", { silent = true })
map("n", "<Down>", "gj", { silent = true })
map("i", "<Up>", "<C-O>gk", { silent = true })
map("i", "<Down>", "<C-O>gj", { silent = true })

-- Which Key
local wk = require("which-key")
wk.register({
  ["<leader>"] = {
    f = {
      name = "File",
      f = { "<cmd>Telescope find_files<cr>", "Find File" },
      r = { "<cmd>Telescope frecency<cr>", "Recent Files" },
      e = { "<cmd>TreeToggle<cr>", "File Explorer" },
      s = { "<cmd>w<cr>", "Save File" },
      l = { "[[<cmd>lua require('persistence').load({ last = true })<cr>]]", "Load Last Session" },
      w = { "[[<cmd>lua require('persistence').load()<cr>]]", "Load Session from Working Dir" },
      ["."] = { "<cmd>:w | source%<cr> ", "Source File" },
    },
    p = {
      name = "Packer",
      u = { "<cmd>PackerSync<cr>", "Update Plugins" }
    },
    b = {
      name = "Buffer",
      c = { "<cmd>bd<cr>", "Delete Buffer" },
--      t = {
--        name = "test",
--        o = {"test2", "TEST"}
--      }
    },
    ["<Leader>"] = { "<cmd>noh<cr>", "Clear Higlights" },
    s = {
      name = "Splits",
      ["<Left>"] = {"<C-W><C-H>", "Move Left"},
      ["<Right>"] = {"<C-W><C-L>", "Move Right"},
      ["<Up>"] = {"<C-W><C-K>", "Move Up"},
      ["<Down>"] = {"<C-W><C-J>", "Move Down"},
      c = {"<C-W>q", "Close a Split"},
      s = {"<C-W>s", "Horizontal Split"},
      v = {"<C-W>v", "Vertical Split"},
    },
    t = {
      name = "Tools",
      t = {
        name = "Todos",
        c = {"<cmd>lua require('Comment.api').toggle_current_linewise()<cr>$a TODO: ", "Create Todo"},
        t = {"<cmd>TodoTrouble<cr>", "Open Project Todo List"}
      },
      n = {
        name = "Notes",
        c = {"<cmd>lua require('Comment.api').toggle_current_linewise()<cr>$a NOTE: ", "Create NOTE"},
      },
      c = {
        name = "Code",
        r = {"<cmd>Lspsaga rename<cr>", "Rename Variable"},
        d = {"<cmd>Lspsaga hover_doc<cr>", "Show Docs"},
        i = {"<cmd>Lspsaga show_line_diagnostics<cr>", "Line Diags"},
        a = {"<cmd>Lspsaga code_action<cr>", "Code Actions"},
        t = {"<cmd>TroubleToggle document_diagnostics<cr>", "Document Diags"}
      },
    },
   q = {
     name = "Quit",
     q = { "<cmd>wqa<cr>", "Write all buffers and quit" }
   }
  }
})

