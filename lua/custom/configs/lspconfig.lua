-- [[ Setup LSP ]]
-- We use mason-lspconfig to automatically install required dependencies
-- to run the language server.
local config = require("plugins.configs.lspconfig")
local on_attach = config.on_attach
local capabilities = config.capabilities

local lspconfig = require("lspconfig")

require('mason').setup()
require('mason-lspconfig').setup()

-- Add/remove LSP here
local servers = {
  tsserver = {
    init_options = {
      preferences = {
        disableSuggestions = true
      }
    }
  }
}

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
  function(server_name)
    lspconfig[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      init_options = (servers[server_name] or {}).init_options,
      settings = (servers[server_name] or {}).settings,
      filetypes = (servers[server_name] or {}).filetypes,
    }
  end,
}
