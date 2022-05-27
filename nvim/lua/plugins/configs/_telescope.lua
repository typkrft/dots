local telescope = require('telescope')

telescope.setup({
  defaults = {
    vimgrep_arguments = {
       "rg",
       "--color=never",
       "--no-heading",
       "--with-filename",
       "--line-number",
       "--column",
       "--smart-case",
    },
    prompt_prefix = "   ",
    winblend = 10,
    layout_config = {
      horizontal = {
        prompt_position = "top",
      }
    }
  }
})
