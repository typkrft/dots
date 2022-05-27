require("indent_blankline").setup {
  -- for example, context is off by default, use this to turn it on
  show_current_context = true,
  show_current_context_start = true,
  context_highlight_list = {
    "IndentBlanklineIndent1",
    "IndentBlanklineIndent2",
    "IndentBlanklineIndent3",
    "IndentBlanklineIndent4",
    "IndentBlanklineIndent5",
    "IndentBlanklineIndent6",
  },
}
	vim.g.indentLine_enabled = 1
	vim.g.indent_blankline_show_trailing_blankline_indent = true
	vim.g.indent_blankline_show_first_indent_level = true
	vim.g.indent_blankline_use_treesitter = true
	vim.g.indent_blankline_show_current_context = true
	vim.g.indent_blankline_char = "▏" -- "┃" 
	vim.g.indent_blankline_buftype_exclude = {
		"nofile",
		"terminal",
		"lsp-installer",
		"lspinfo",
    "No Name"
	}
	vim.g.indent_blankline_filetype_exclude = {
		"help",
		"startify",
		"dashboard",
		"packer",
		"neogitstatus",
		"NvimTree",
		"neo-tree",
		"Trouble",
	}
	vim.g.indent_blankline_context_patterns = {
		"class",
		"return",
		"function",
		"method",
		"^if",
		"^while",
		"jsx_element",
		"^for",
		"^object",
		"^table",
		"block",
		"arguments",
		"if_statement",
		"else_clause",
		"jsx_element",
		"jsx_self_closing_element",
		"try_statement",
		"catch_clause",
		"import_statement",
		"operation_type",
	}
