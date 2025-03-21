local M = {
  formatters_by_ft = {
    javascript = {"prettier"},
    json = {"prettier"},
    jsonc = {"prettier"},
    typescript = {"prettier"},
    typescriptreact = {"prettier"},
    markdown = {"prettier" },
    css = {"prettier"},
    astro = {"prettier"},
  },
  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return M
