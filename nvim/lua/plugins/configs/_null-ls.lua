-- TODO: Config Builtin Defaults https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTIN_CONFIG.md

local p = require('null-ls')
local d = p.builtins.diagnostics
local f = p.builtins.formatting
local h = p.builtins.hover
p.setup{
  sources = {
    d.zsh,
    d.yamllint,
    d.ansiblelint,
    d.pylint,
    f.black,
    -- f.deno_fmt,
    f.prettier_standard,
    -- f.remark,
    f.shfmt,
    h.dictionary
  },
  on_attach = function(client)

    if client.resolved_capabilities.document_formatting then
        vim.cmd([[
        augroup LspFormatting
            autocmd! * <buffer>
            autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
        augroup END
        ]])
    end
  end,
}
