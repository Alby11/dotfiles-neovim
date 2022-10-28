local plugin_name = "null-ls"

if not CheckPlugin(plugin_name) then
  return
end

Lsp = require("lsp-zero")
local null_ls = require(plugin_name)
null_opts = Lsp.build_options(plugin_name, {})
null_ls.setup()

-- null_ls.setup({
--   on_attach = function(client, bufnr)
--     null_opts.on_attach(client, bufnr)
--
--     --- your code goes here...
--   end,
--   sources = {
--     -- code actions
--     null_ls.builtins.code_actions.gitsigns,
--     null_ls.builtins.code_actions.ltrs,
--     null_ls.builtins.code_actions.refactoring,
--     null_ls.builtins.code_actions.shellcheck,
--     -- completions
--     null_ls.builtins.completion.luasnip,
--     null_ls.builtins.completion.tags,
--     -- diagnostics
--     null_ls.builtins.diagnostics.ansiblelint,
--     null_ls.builtins.diagnostics.buf,
--     null_ls.builtins.diagnostics.commitlint,
--     -- null_ls.builtins.diagnostics.cspell,
--     null_ls.builtins.diagnostics.eslint_d,
--     null_ls.builtins.diagnostics.flake8,
--     null_ls.builtins.diagnostics.gitlint,
--     null_ls.builtins.diagnostics.golangci_lint,
--     null_ls.builtins.diagnostics.hadolint,
--     null_ls.builtins.diagnostics.ltrs,
--     null_ls.builtins.diagnostics.luacheck,
--     null_ls.builtins.diagnostics.markdownlint,
--     null_ls.builtins.diagnostics.markdownlint_cli2,
--     -- null_ls.builtins.diagnostics.misspell,
--     null_ls.builtins.diagnostics.pycodestyle,
--     null_ls.builtins.diagnostics.pydocstyle,
--     null_ls.builtins.diagnostics.pylint,
--     null_ls.builtins.diagnostics.revive,
--     null_ls.builtins.diagnostics.shellcheck,
--     null_ls.builtins.diagnostics.sqlfluff.with({
--       extra_args = { "--dialect", "postgres" }, -- change to your dialect
--     }),
--     null_ls.builtins.diagnostics.vint,
--     null_ls.builtins.diagnostics.yamllint,
--     null_ls.builtins.diagnostics.zsh,
--     -- formatting
--     null_ls.builtins.formatting.autopep8,
--     null_ls.builtins.formatting.beautysh,
--     null_ls.builtins.formatting.black,
--     null_ls.builtins.formatting.deno_fmt,
--     null_ls.builtins.formatting.gofumpt,
--     null_ls.builtins.formatting.goimports,
--     null_ls.builtins.formatting.goimports_reviser,
--     null_ls.builtins.formatting.golines,
--     null_ls.builtins.formatting.isort,
--     null_ls.builtins.formatting.lua_format,
--   },
-- })
