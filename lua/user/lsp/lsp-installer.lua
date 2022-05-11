-- mods for deprecation of on_server_ready:
-- https://github.com/williamboman/nvim-lsp-installer/discussions/636
require("nvim-lsp-installer").setup {}
local lspconfig = require("lspconfig")

lspconfig.sumneko_lua.setup {
  on_attach = on_attach,
  settings = require "user.lsp.settings.sumneko_lua"
}

lspconfig.jsonls.setup {
  settings = require "user.lsp.settings.jsonls"
}

-- if server.name == "emmet_ls" then
--   local emmet_ls_opts = require "user.lsp.settings.emmet_ls"
--   opts = vim.tbl_deep_extend("force", emmet_ls_opts, opts)
-- end
